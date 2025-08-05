
CREATE   PROCEDURE [dbo].[Employee_GetSubTeam]
	@empId int
AS
BEGIN
	SET NOCOUNT ON;

	select g.* 
	from dbo.EmployeeGroup_Employee eg WITH (NOLOCK)
		JOIN dbo.EmployeeGroup g WITH (NOLOCK) ON eg.GroupID = g.ID AND isMaingroup=0
	where EmpID=@empId 
END