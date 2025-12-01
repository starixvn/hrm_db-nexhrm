/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

ALTER PROCEDURE [dbo].[Employee_Insert]
(
    @UserId INT
    ,@FullName NVARCHAR(50)
    ,@Nickname NVARCHAR(20)
    ,@DomainUsername VARCHAR(50)
    ,@Code VARCHAR(20)
    ,@Password NVARCHAR(100)
    ,@monShift INT = NULL
    ,@tueShift INT = NULL
    ,@wedShift INT = NULL
    ,@thuShift INT = NULL
    ,@friShift INT = NULL
    ,@satShift INT = NULL
    ,@sunShift INT = NULL
    ,@GroupId INT
    ,@createBy INT
    ,@EmpId INT OUTPUT
    ,@ErrCode INT = 0 OUTPUT
    ,@ErrMsg VARCHAR(200) = '' OUTPUT
)
AS
/*
    Created: 20160218@Quinn.Vo
    Task: insert an employee
    DB: NexHRM

    Revisions:    
        20250507@Henry: insert password
        20250819@Tim: restructure [Redmine: #235678]
        20251114@Henry: init employee summary - islocal = 1
        20251126@Tim: auto-generate CtrID [Redmine: #245211]
    Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
            SELECT 1
            FROM dbo.Employee WITH (NOLOCK)
            WHERE Code = @code
            )
    BEGIN
        SELECT @ErrCode = 1
            ,@ErrMsg = 'This user has already existed!'

        RETURN
    END

	DECLARE @CompanyId INT
        ,@MaxCtrId INT

	SELECT @CompanyId = [Value]
    FROM dbo.SystemSetting WITH (NOLOCK)
    WHERE [Name] = 'CompanyId'

    SELECT @EmpId = MAX(EmpId)
    FROM bodb_HRM.dbo.CompanyEmployee WITH (NOLOCK)

    SET @EmpId = ISNULL(@EmpId, 0) + 1

    SELECT @MaxCtrId = MAX(CtrId)
    FROM bodb_HRM.dbo.Employee WITH (NOLOCK)

    SET @MaxCtrId = ISNULL(@MaxCtrId, 0) + 1

    INSERT INTO bodb_HRM.dbo.Employee (UserId, FullName, DOB, [Password], CtrId)
    VALUES (@UserId, @FullName, '1990-01-01', @Password, @MaxCtrId)

	INSERT INTO bodb_HRM.dbo.CompanyEmployee (CompanyId, EmpId, UserId, Code, Nickname, DomainUsername, GroupId, [Enabled], IsDeleted, IsSpecialUser, CreatedDate, CreatedBy)
	VALUES (@CompanyId, @EmpId, @UserId, @Code, @Nickname, @DomainUsername, @GroupId, 1, 0, 0, GETDATE(), @createBy)

    INSERT INTO [bodb_HRM].[dbo].[EmployeeSummary] (EmpId, IsLocal)
    VALUES (@EmpId, 1)
    
    INSERT INTO dbo.EmployeeShift ([EmpId], [MonShift], [TueShift], [WedShift], [ThuShift], [FriShift], [SatShift], [SunShift])
    VALUES (@EmpId, @monShift, @tueShift, @wedShift, @thuShift, @friShift, @satShift, @sunShift)

    INSERT INTO dbo.EmployeeGroup_Employee (GroupId, EmpId, isMainGroup)
    VALUES (@groupId, @EmpId, 1)

    DECLARE @fromdate DATETIME
        ,@todate DATETIME

    SET @fromdate = dbo.fnc_GetClientDateTime()

	SELECT @todate = MAX(WorkDate)
    FROM dbo.EmployeeCalendar WITH (NOLOCK)

    EXECUTE dbo.EmployeeCalendar_Insert @EmpId
        ,@fromdate
        ,@todate
END