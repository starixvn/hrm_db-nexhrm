/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/
ALTER PROCEDURE [dbo].[Sync_Employee_Get] @LastModifiedDate DATETIME
AS
/*
	Created: Jay.Do@20250610
	Task: Get employee by last modified date
	DB: NexHR
	Original: 
	Revisions:    
		- 20251208@Henry.Dinh: migrate data transfer feature id: #233310 
	Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON
	
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
		e.ModifiedDate
	FROM dbo.Employee AS e WITH (NOLOCK) 
	LEFT OUTER JOIN dbo.EmployeeConversation AS ec WITH (NOLOCK) ON e.Id = ec.EmpId
	WHERE e.ModifiedDate > @LastModifiedDate
END