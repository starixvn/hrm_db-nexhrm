/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

ALTER PROCEDURE [dbo].[Employee_Delete]
(
    @employeeId INT
    ,@ResignedDate SMALLDATETIME
    ,@ModifiedBy INT = NULL
    ,@ErrCode INT = 0 OUTPUT
    ,@ErrMsg VARCHAR(200) = '' OUTPUT
)
AS
/*
    Created: 20160218@Quinn.Vo
    Task: Delete employee
    DB: NexHRM

    Revisions:
        20250819@Tim: restructure [Redmine: #235678]
    Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON

    IF @ResignedDate IS NULL
    BEGIN
        SELECT @ErrCode = 1
            ,@ErrMsg = 'The user cannot be deleted without resigned date.'

        RETURN
    END

    UPDATE bodb_HRM.dbo.CompanyEmployee WITH (ROWLOCK)
    SET isDeleted = 1
        ,ModifiedBy = @ModifiedBy
        ,ModifiedDate = GETDATE()
    WHERE EmpId = @employeeId

	UPDATE e
    SET e.ResignedDate = @ResignedDate
    FROM bodb_HRM.dbo.Employee AS e WITH (ROWLOCK)
        INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ce WITH (NOLOCK) ON e.UserId = ce.UserId
    WHERE ce.EmpId = @employeeId

    DELETE dbo.EmployeeCalendar
    WHERE WorkDate > @ResignedDate
        AND empid = @employeeId

    DELETE dbo.EmployeeAttendance
    WHERE AttendanceDate > @ResignedDate
        AND empid = @employeeId
END