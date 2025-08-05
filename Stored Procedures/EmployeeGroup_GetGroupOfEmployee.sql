
CREATE   PROCEDURE [dbo].[EmployeeGroup_GetGroupOfEmployee]
	@employeeId int
AS
BEGIN
	SET NOCOUNT ON;

	select * from EmployeeGroup
	where Id= (	select top(1) GroupId from Employee 
				where Id = @employeeId)
END