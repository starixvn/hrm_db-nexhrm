
CREATE   PROCEDURE [dbo].[EmployeeCalendar_GetShiftByDate]
	@employeeId int,
	@date datetime
AS
BEGIN
	SET NOCOUNT ON;

	select * from Shift
	where Id = (select top(1) ShiftId from EmployeeCalendar
				where	EmpId = @employeeId and
						DATEDIFF(day,WorkDate,@date)=0)
END