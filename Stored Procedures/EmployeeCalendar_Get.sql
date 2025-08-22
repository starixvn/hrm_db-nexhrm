/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/
ALTER PROCEDURE [dbo].[EmployeeCalendar_Get] -- '2022-01-04 11:20:25.000'
    @FromDate DATETIME = NULL
AS
/*
    Created: 20141002@Quinn.Vo
    Task: Get employee calendar from change date
    DB: NexEPA
    Original: 

    Revisions:  
        - 20251208@Henry.Dinh: migrate data transfer feature id: #233310 
    Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;

    SELECT 
      cl.[WorkDate]
      ,e.Id AS UserId
      ,CASE WHEN ISNULL(IsWorkFromHome, 0) = 1 THEN NULL ELSE [ShiftId] END [ShiftId]
	  --,[ShiftId]
      ,cl.[IsHoliday]
      ,CAST(CASE WHEN cl.[IsOffDay] = 1 OR ISNULL(cl.IsWorkFromHome, 0) = 1 THEN 1 ELSE 0 END AS BIT) AS [IsOffDay]
       ,cl.[IsLeaveDay]
      ,cl.[LeaveTypeId]
      ,cl.[LeaveDay]
      ,cl.ModifiedDate
    FROM dbo.EmployeeCalendar AS cl WITH (NOLOCK)
	INNER JOIN dbo.Employee AS e WITH (NOLOCK) ON e.Id = cl.EmpId
    WHERE @FromDate IS NULL
    OR cl.ModifiedDate > @FromDate
    ORDER BY cl.ModifiedDate
END


