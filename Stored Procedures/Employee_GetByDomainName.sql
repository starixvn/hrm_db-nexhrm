
/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/
CREATE OR ALTER PROCEDURE [dbo].[Employee_GetByDomainName] @DomainUsername VARCHAR(50)
AS
/*
	Created: 20160205@Quinn.Vo
	Task: Get employee info by domain username.
	DB: NexHRM
	Original: 

	Revisions: 
		20250805@Henry.Dinh: Update Group table to bodb_HRM.dbo.[Group] and LeaderHR
	Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;

	SELECT e.[Id]
	,e.[Code]
	,e.[FullName]
	,e.[NickName]
	,e.[Email]
	,e.[Enabled]
	,e.[IsDeleted]
	,e.[Roles]
	,ISNULL(g.GroupId, 0) AS TeamId
	,g.Code AS TeamCode
	,g.GroupTeamId
	,CAST(CASE WHEN e.Id = 6089 OR e.Id = 6264 THEN 1 ELSE 0 END AS BIT) AS IsLeaderHR
	FROM dbo.Employee AS e WITH (NOLOCK) 
		LEFT JOIN bodb_HRM.dbo.[Group] AS g WITH (NOLOCK) ON e.GroupId = g.GroupId
	WHERE e.DomainUsername = @DomainUsername
	AND e.isDeleted = 0
END
