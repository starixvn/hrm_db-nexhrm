
ALTER   PROCEDURE [dbo].[EmployeeExt_GetLoginEmployee] @DomainUsername VARCHAR(50)
AS
/*
    Created: 20250507@Henry.Dinh
    Task: log in
    DB: HRM
    Original: 
    Revisions:    
		20250819@Jay: restructure [Redmine: #235678]
    Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;
    SELECT ce.EmpId AS Id, 
		ce.DomainUsername, 
		e.Password, 
		ce.IsDeleted, 
		ce.Enabled
    FROM bodb_HRM_bk.dbo.CompanyEmployee ce
		INNER JOIN bodb_HRM_bk.dbo.Employee e ON e.UserId = ce.UserId
	WHERE ce.DomainUsername = @DomainUsername
END