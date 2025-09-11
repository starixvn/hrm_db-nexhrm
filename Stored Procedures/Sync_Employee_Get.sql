/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

ALTER PROCEDURE [dbo].[Sync_Employee_Get] @LastModifiedDate DATETIME
AS
/*
	Created: Jay.Do@20250610
	Task: Get employee by last modified date
	DB: NexHR

	Revisions:    
		- 20251208@Henry.Dinh: migrate data transfer [Redmine: #233310]
        - 20250911@Tim: get Password [Redmine: #238246]
	Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;
	
	SELECT e.Id AS EmployeeId, 
        e.DomainUsername, 
        e.Code, 
        e.FullName, 
        e.NickName, 
        e.GroupId, 
        e.[Enabled], 
        e.isDeleted, 
        CAST(e.JoinedDate AS DATE) AS JoinedDate, 
        CAST(e.ConfirmedDate AS DATE) 
        AS ConfirmedDate,
        e.JobTitleId,
        e.Email,
        ec.ConversationId,
        e.ModifiedDate,
        u.[Password]
	FROM dbo.Employee AS e WITH (NOLOCK)
        INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ce WITH (NOLOCK) ON e.Id = ce.EmpId
        INNER JOIN bodb_HRM.dbo.Employee AS u ON u.UserId = ce.UserId
	    LEFT JOIN dbo.EmployeeConversation AS ec WITH (NOLOCK) ON e.Id = ec.EmpId
	WHERE e.ModifiedDate > @LastModifiedDate
END