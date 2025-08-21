ALTER   PROCEDURE [dbo].[GroupSupervisor_Get]
AS
/*
Created: 20240423@Lilac.Nguyen
Task: Get group supervisor.
DB: NexHRM
Original: 

Revisions:  
        20250819@Jay: restructure [Redmine: #235678]
Param's Explanation:

*/
BEGIN
    SET NOCOUNT ON;

	SELECT
		eg.Id AS GroupId,
		eg.Code AS GroupCode,
		eg.[Name] AS GroupName,
		STRING_AGG(
			ce.NickName + 
			CASE 
				WHEN gs.OuterCompanyName IS NOT NULL THEN ' (' + gs.OuterCompanyName + ')'
				ELSE ''
			END,
			', '
		) AS Approvers
	FROM dbo.EmployeeGroup AS eg WITH (NOLOCK)
	LEFT JOIN dbo.GroupSupervisor AS gs WITH (NOLOCK) 
		ON eg.Id = gs.GroupId AND ISNULL(gs.IsDeleted, 0) = 0
	LEFT JOIN bodb_HRM_bk.dbo.CompanyEmployee AS ce 
		ON ce.EmpId = gs.ApproverId
	WHERE ISNULL(eg.Deleted, 0) = 0
	AND eg.IsSpecialTeam = 0
	GROUP BY eg.Id, eg.Code, eg.[Name];
END
