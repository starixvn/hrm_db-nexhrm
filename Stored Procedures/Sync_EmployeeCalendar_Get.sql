/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/
ALTER PROCEDURE [dbo].[Sync_EmployeeCalendar_Get] @LastModifiedDate DATETIME
AS
/*
	Created: Jay.Do@20250610
	Task: Get employee calendar
	DB: NexHR
	Original: 
	Revisions:    
		- 20251208@Henry.Dinh: migrate data transfer feature id: #233310 
	Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON
	
	SELECT cl.Id,
		e.Id AS EmpId, 
		cl.WorkDate, 
		cl.IsOffDay, 
		cl.IsHoliday,
		cl.IsLeaveDay, 
		cl.LeaveDay,
		cl.ModifiedDate
	FROM dbo.EmployeeCalendar AS cl WITH (NOLOCK)
	INNER JOIN dbo.Employee AS e WITH (NOLOCK) ON e.Id = cl.EmpId
	WHERE cl.ModifiedDate > @LastModifiedDate
END