
CREATE   PROCEDURE [dbo].[EmployeeCalendar_GetWeekWorking]
	@id int,
	@date datetime
AS
BEGIN
	SET NOCOUNT ON;

	select * from EmployeeCalendar
	where EmpId = @id and datediff(week,WorkDate,@date)=0
	order by WorkDate
END