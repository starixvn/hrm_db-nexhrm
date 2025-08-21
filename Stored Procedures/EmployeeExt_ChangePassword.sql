
ALTER   PROCEDURE [dbo].[EmployeeExt_ChangePassword] @Id INT
    ,@Password NVARCHAR(100)
    ,@ErrCode INT = 0 OUTPUT
    ,@ErrMsg VARCHAR(200) = '' OUTPUT
AS
/*
    Created: 20250507@Henry.Dinh
    Task: change password
    DB: NexHRM
    Original: 

    Revisions:    
        20250507@Henry.Dinh: change password
		20250819@Jay: restructure [Redmine: #235678]
    Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM bodb_HRM_bk.dbo.CompanyEmployee WHERE EmpId = @Id)
    BEGIN
        SET @ErrCode = 1
        SET @ErrMsg = 'Employee not found'
        RETURN
    END

    UPDATE e
    SET Password = @Password
	FROM bodb_HRM_bk.dbo.Employee e
		INNER JOIN bodb_HRM_bk.dbo.CompanyEmployee ce ON e.UserId = ce.UserId
    WHERE ce.EmpId = @Id
END

SET ANSI_NULLS ON