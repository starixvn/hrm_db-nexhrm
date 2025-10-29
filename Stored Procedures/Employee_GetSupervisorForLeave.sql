/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

ALTER PROCEDURE [dbo].[Employee_GetSupervisorForLeave]
(
    @employeeId INT
    ,@IsManagementApprove BIT
)
AS
/*
	Created: 20240329@Quinn
	Task: Get Supervisors for notification check leave request.
	DB: NexHR

	Revisions:
		20250327@Henry: Update MGT Code -> MGT/COR code
        20250819@Tim: restructure [Redmine: #235678]
		20251028@Henry: Add department ID
	Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;

	DECLARE @IsSupReadOnly BIT = 0
	DECLARE @CoreTeamId INT = 0
	DECLARE @PICDisplayName NVARCHAR(50) = ''
	
	SELECT @CoreTeamId = g.Id
	FROM dbo.SystemSetting ss WITH (NOLOCK)
	    INNER JOIN dbo.[EmployeeGroup] g WITH (NOLOCK) ON g.GroupTeamId = ss.Value
	WHERE ss.Name = 'CoreTeamId'

	CREATE TABLE #tempSupIds(SupervisorId INT, IsReadOnly BIT)

	IF @IsManagementApprove = 1
	BEGIN
		INSERT INTO #tempSupIds(SupervisorId, IsReadOnly)
		SELECT e.Id, 0
		FROM dbo.Employee AS e WITH (NOLOCK)
		    INNER JOIN dbo.EmployeeGroup AS eg ON e.GroupId = eg.Id
		    LEFT JOIN dbo.EmployeeConversation AS con WITH (NOLOCK) ON e.Id = con.EmpId
		WHERE e.GroupId = @CoreTeamId
		    AND ISNULL(e.isDeleted, 0) = 0

		SET @IsSupReadOnly = 1
	END

	IF EXISTS (SELECT 1 FROM dbo.EmployeeSupervisor WITH (NOLOCK) WHERE EmpId = @employeeId)
	BEGIN
		INSERT INTO #tempSupIds(SupervisorId, IsReadOnly)
		SELECT DISTINCT sup.EmpId, @IsSupReadOnly
		FROM dbo.EmployeeSupervisor AS es WITH (NOLOCK)
		    INNER JOIN bodb_HRM.dbo.CompanyEmployee AS sup WITH (NOLOCK) ON sup.EmpId = es.ApproverId
		WHERE es.EmpId = @employeeId 
			AND ISNULL(es.IsDeleted, 0) = 0
			AND es.ApproverId <> @employeeId
            AND ISNULL(sup.isDeleted, 0) = 0 AND ISNULL(sup.Enabled, 0) = 1
		    AND NOT EXISTS (
				SELECT 1 FROM #tempSupIds WHERE SupervisorId = es.ApproverId
		    )
	END
	ELSE
	BEGIN
		INSERT INTO #tempSupIds(SupervisorId, IsReadOnly)
		SELECT DISTINCT gs.ApproverId, @IsSupReadOnly
		FROM dbo.Employee AS e WITH (NOLOCK)
		    INNER JOIN dbo.GroupSupervisor AS gs WITH (NOLOCK) ON e.GroupId = gs.GroupId
		    INNER JOIN bodb_HRM.dbo.CompanyEmployee AS sup WITH (NOLOCK) ON sup.EmpId = gs.ApproverId 
			    AND ISNULL(sup.isDeleted, 0) = 0 
			    AND ISNULL(sup.Enabled, 0) = 1
			    AND ISNULL(gs.IsDeleted, 0) = 0
		WHERE e.Id = @employeeId
			AND gs.ApproverId <> @employeeId
			AND NOT EXISTS (
				SELECT 1 FROM #tempSupIds WHERE SupervisorId = gs.ApproverId
			)
	END

	-- Get PIC Display Name
	SELECT @PICDisplayName = CASE 
		WHEN epic.EmpId IS NOT NULL 
		THEN epic.Nickname + ' (' + epic.Code + ')'
		ELSE '' END
	FROM bodb_HRM.dbo.CompanyEmployee AS ce WITH (NOLOCK)
	    INNER JOIN dbo.SystemSetting AS sc WITH (NOLOCK) ON ce.CompanyId = sc.Value AND sc.[Name] = 'CompanyId'
	    LEFT JOIN bodb_HRM.dbo.[Group] AS g WITH (NOLOCK) ON ce.GroupId = g.GroupId
	    LEFT JOIN bodb_HRM.dbo.CompanyEmployee AS epic WITH (NOLOCK) ON g.PICEmpId = epic.EmpId
	WHERE ce.EmpId = @employeeId

	SELECT DISTINCT e.EmpId
		,e.NickName
		,e.FullName
		,e.Code
		,e.DepartmentId
		,sup.SupervisorId
        ,sup.SupervisorNickName
        ,sup.SupervisorFullName
        ,sup.SupervisorEmail
		,sup.SupervisorConversationId
		,sup.SupervisorLetstalkId
		,sup.IsReadOnly
		,@PICDisplayName AS PICDisplayName
    FROM (
			SELECT ce.EmpId
			    ,ce.Nickname
			    ,e.FullName
			    ,ce.Code
				,g.DepartmentId
			FROM bodb_HRM.dbo.Employee AS e WITH (NOLOCK)
                INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ce WITH (NOLOCK) ON e.UserId = ce.UserId
                LEFT JOIN bodb_HRM.dbo.[Group] AS g WITH (NOLOCK) ON ce.GroupId = g.GroupId
			WHERE ce.EmpId = @employeeId
		) AS e
		INNER JOIN
		(
			SELECT ca.EmpId AS SupervisorId
				,ca.Nickname AS SupervisorNickName
				,a.FullName AS SupervisorFullName
				,ca.Email AS SupervisorEmail 
				,CASE
					WHEN sc.Value = 'true' THEN a.Letstalk 
					ELSE NULL END AS SupervisorLetstalkId
				,con.ConversationId AS SupervisorConversationId
				,tsup.IsReadOnly
			FROM bodb_HRM.dbo.Employee AS a WITH (NOLOCK)
                INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ca WITH (NOLOCK) ON a.UserId = ca.UserId 
			    INNER JOIN #tempSupIds tsup ON ca.EmpId = tsup.SupervisorId
			    LEFT JOIN dbo.EmployeeConversation AS con WITH (NOLOCK) ON ca.EmpId = con.EmpId
			    LEFT JOIN bodb_HRM.dbo.CompanyEmployee ce WITH (NOLOCK) ON ca.EmpId = ce.EmpId
			    LEFT JOIN bodb_HRM.dbo.SystemConfigs sc WITH (NOLOCK) ON ce.CompanyId = sc.CompanyId AND sc.[Key] = 'EnableLetstalk'
		) AS sup ON 1 = 1
		WHERE e.EmpId <> sup.SupervisorId

	DROP TABLE #tempSupIds
END