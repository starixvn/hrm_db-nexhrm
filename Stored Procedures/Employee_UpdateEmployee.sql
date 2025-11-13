/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

ALTER PROCEDURE [dbo].[Employee_UpdateEmployee]
(
    @employeeId INT
    ,@code VARCHAR(20) = NULL
    ,@domainUsername VARCHAR(50) = NULL
    ,@fullName NVARCHAR(50) = NULL
    ,@nickName NVARCHAR(20) = NULL
    ,@EducationBackground NVARCHAR(500) = NULL
    ,@EmployeeCard VARCHAR(11) = ''
    ,@dob DATETIME = NULL
    ,@email VARCHAR(50) = NULL
    ,@jobTitleId INT = NULL
    ,@enabled BIT = NULL
    ,@isSpecialUser BIT = NULL
    ,@autoApproveRequest BIT = NULL
    ,@phone VARCHAR(50) = NULL
    ,@gender TINYINT = NULL
    ,@mainGroupID INT = NULL
    ,@subGroups VARCHAR(50) = NULL
    ,@Roles VARCHAR(20) = NULL
    ,@joinedDate DATETIME = NULL
    ,@confirmedDate DATETIME = NULL
    ,@resignedDate DATETIME = NULL
    ,@skype VARCHAR(100) = NULL
    ,@yahoo VARCHAR(100) = NULL
    ,@marriage BIT = NULL
    ,@address NVARCHAR(250) = NULL
    ,@currAddress NVARCHAR(250) = NULL
    ,@idCardNo NVARCHAR(20) = NULL
    ,@issuedDate DATETIME = NULL
    ,@issuedPlace NVARCHAR(250) = NULL
    ,@passportNo NVARCHAR(35) = NULL
    ,@passportExp DATETIME = NULL
    ,@socialInsuranceNo VARCHAR(50) = NULL
    ,@geoMapLatitude VARCHAR(50) = ''
    ,@geoMapLongtitude VARCHAR(50) = ''
    ,@distanceToCompany VARCHAR(11) = ''
    ,@modifiedBy INT = NULL
    ,@placeOfBirth NVARCHAR(20) = NULL
    ,@contactName NVARCHAR(50) = NULL
    ,@userRelationship NVARCHAR(11) = NULL
    ,@contactPhone VARCHAR(50) = NULL
    ,@contactAddress NVARCHAR(250) = NULL
    ,@groupDate DATE = NULL
	,@salaryGroupId INT = NULL
	,@payrollCompanyId INT = NULL
	,@isLocal BIT = NULL
    ,@ErrCode INT = 0 OUTPUT
    ,@ErrMsg VARCHAR(MAX) = '' OUTPUT
)
AS
/*
    Created: 20160218@Quinn.Vo
    Task: update employee
    DB: NexHRM

    Revisions:
        20250819@Tim: restructure [Redmine: #235678]
		20250919@Mira: Get Payroll 
		20251113@Henry: Add isLocal parameter
    Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;

	DECLARE @logData NVARCHAR(MAX)
		,@xml XML
		,@Groups VARCHAR(50)

    BEGIN TRY
        BEGIN TRANSACTION;

		SELECT @Groups = COALESCE(@Groups + ', ' + CAST(GroupId AS VARCHAR(10)), CAST(GroupId AS VARCHAR(10)))
		FROM dbo.EmployeeGroup_Employee 
		WHERE EmpID = @employeeId

		SELECT @logData = '<Employee_Old Code="'+ COALESCE(CAST(Code AS VARCHAR(50)),SPACE(1)) + '" ' +
		    'DomainUsername="'+ COALESCE(DomainUsername,SPACE(1)) + '" ' +
		    'FullName="'+ COALESCE(FullName,SPACE(1)) + '" ' +
		    'NickName="'+ COALESCE(NickName,SPACE(1)) + '" ' +
		    'EducationBackground="'+ COALESCE(EducationBackground,SPACE(1)) + '" ' +
		    'DOB="'+ COALESCE(CAST(DOB AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'Email="'+ COALESCE(Email,SPACE(1)) + '" ' +
		    'JobTitleId="'+ COALESCE(CAST(JobTitleId AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'Enabled="'+ COALESCE(CAST([Enabled] AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'IsSpecialUser="'+ COALESCE(CAST(IsSpecialUser AS VARCHAR(4)),SPACE(1)) + '" ' +
		    'AutoApproveRequest="'+ COALESCE(CAST(AutoApproveRequest AS VARCHAR(4)),SPACE(1)) + '" ' +
		    'Phone="'+ COALESCE(Phone,SPACE(1)) + '" ' +
		    'Gender="'+ COALESCE(CAST(Gender AS VARCHAR(4)),SPACE(1)) + '" ' +
		    'GroupId="'+ COALESCE(CAST(GroupId AS VARCHAR(50)),SPACE(1)) + '" ' +
		    'Roles="'+ COALESCE([Roles],SPACE(1)) + '" ' +
		    'JoinedDate="'+ COALESCE(CAST(JoinedDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'GroupDate="'+ COALESCE(CAST(GroupDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'ConfirmedDate="'+ COALESCE(CAST(ConfirmedDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'ResignedDate="'+ COALESCE(CAST(ResignedDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'Skype="'+ COALESCE(Skype,SPACE(1)) + '" ' +
		    'Yahoo="'+ COALESCE(Yahoo,SPACE(1)) + '" ' +
		    'Marriage="'+ COALESCE(CAST(Marriage AS VARCHAR(4)),SPACE(1)) + '" ' +
		    'PermanentAddress="'+ COALESCE(PermanentAddress,SPACE(1)) + '" ' +
		    'CurrentAddress="'+ COALESCE(CurrentAddress,SPACE(1)) + '" ' +
		    'IdCardNumber="'+ COALESCE(IdCardNumber,SPACE(1)) + '" ' +
		    'IssuedDate="'+ COALESCE(CAST(IssuedDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'IssuedPlace="'+ COALESCE(IssuedPlace,SPACE(1)) + '" ' +
		    'PassportNo="'+ COALESCE(PassportNo,SPACE(1)) + '" ' +
		    'PassportExp="'+ COALESCE(CAST(PassportExp AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'SocialInsuranceNo="'+ COALESCE(SocialInsuranceNo,SPACE(1)) + '" ' +
		    'PlaceOfBirth="'+ COALESCE(PlaceOfBirth,SPACE(1)) + '" ' +
		    'ContactName="'+ COALESCE(ContactName,SPACE(1)) + '" ' +
		    'UserRelationship="'+ COALESCE(UserRelationship,SPACE(1)) + '" ' +
		    'ContactPhone="'+ COALESCE(ContactPhone,SPACE(1)) + '" ' +
		    'ContactAddress="'+ COALESCE(ContactAddress,SPACE(1)) + '" ' +
		    'ModifiedBy="'+ COALESCE(CAST(ModifiedBy AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'Groups="'+ COALESCE(@Groups,SPACE(1)) + '" />' + 

		    '<Employee_new Code="'+ COALESCE(CAST(@code AS VARCHAR(50)),SPACE(1)) + '" ' +
		    'DomainUsername="'+ COALESCE(@domainUsername,SPACE(1)) + '" ' +
		    'FullName="'+ COALESCE(@fullName,SPACE(1)) + '" ' +
		    'NickName="'+ COALESCE(@nickName,SPACE(1)) + '" ' +
		    'EducationBackground="'+ COALESCE(@EducationBackground,SPACE(1)) + '" ' +
		    'EmployeeCard="'+ COALESCE(@EmployeeCard,SPACE(1)) + '" ' +
		    'DOB="'+ COALESCE(CAST(@dob AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'Email="'+ COALESCE(@email,SPACE(1)) + '" ' +
		    'JobTitleId="'+ COALESCE(CAST(@jobTitleId AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'Enabled="'+ COALESCE(CAST(@enabled AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'IsSpecialUser="'+ COALESCE(CAST(@isSpecialUser AS VARCHAR(4)),SPACE(1)) + '" ' +
		    'AutoApproveRequest="'+ COALESCE(CAST(@autoApproveRequest AS VARCHAR(4)),SPACE(1)) + '" ' +
			'IsLocal="'+ COALESCE(CAST(@isLocal AS VARCHAR(4)),SPACE(1)) + '" ' +
		    'Phone="'+ COALESCE(@phone,SPACE(1)) + '" ' +
		    'Gender="'+ COALESCE(CAST(@gender AS VARCHAR(4)),SPACE(1)) + '" ' +
		    'GroupId="'+ COALESCE(CAST(@mainGroupID AS VARCHAR(50)),SPACE(1)) + '" ' +
			'PayrollCompanyId="'+ COALESCE(CAST(@payrollCompanyId AS VARCHAR(50)),SPACE(1)) + '" ' +
			'SalaryGroupId="'+ COALESCE(CAST(@salaryGroupId AS VARCHAR(50)),SPACE(1)) + '" ' +
		    'Roles="'+ COALESCE(@Roles,SPACE(1)) + '" ' +
		    'JoinedDate="'+ COALESCE(CAST(@joinedDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'GroupDate="'+ COALESCE(CAST(@groupDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'ConfirmedDate="'+ COALESCE(CAST(@confirmedDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'ResignedDate="'+ COALESCE(CAST(@resignedDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'Skype="'+ COALESCE(@skype,SPACE(1)) + '" ' +
		    'Yahoo="'+ COALESCE(@yahoo,SPACE(1)) + '" ' +
		    'Marriage="'+ COALESCE(CAST(@marriage AS VARCHAR(4)),SPACE(1)) + '" ' +
		    'PermanentAddress="'+ COALESCE(@address,SPACE(1)) + '" ' +
		    'CurrentAddress="'+ COALESCE(@currAddress,SPACE(1)) + '" ' +
		    'IdCardNumber="'+ COALESCE(@idCardNo,SPACE(1)) + '" ' +
		    'IssuedDate="'+ COALESCE(CAST(@issuedDate AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'IssuedPlace="'+ COALESCE(@issuedPlace,SPACE(1)) + '" ' +
		    'PassportNo="'+ COALESCE(@passportNo,SPACE(1)) + '" ' +
		    'PassportExp="'+ COALESCE(CAST(@passportExp AS VARCHAR(11)),SPACE(1)) + '" ' +
		    'SocialInsuranceNo="'+ COALESCE(@socialInsuranceNo,SPACE(1)) + '" ' +
		    'PlaceOfBirth="'+ COALESCE(@placeOfBirth,SPACE(1)) + '" ' +
		    'ContactName="'+ COALESCE(@contactName,SPACE(1)) + '" ' +
		    'UserRelationship="'+ COALESCE(@userRelationship,SPACE(1)) + '" ' +
		    'ContactPhone="'+ COALESCE(@contactPhone,SPACE(1)) + '" ' +
		    'ContactAddress="'+ COALESCE(@contactAddress,SPACE(1)) + '" ' +
		    'ModifiedBy="'+ COALESCE(CAST(@modifiedBy AS VARCHAR(11)),SPACE(1)) + '" />'
		FROM dbo.Employee WITH (NOLOCK)
		WHERE Id = @employeeId

        UPDATE e
        SET e.FullName = @fullName
            ,e.DOB = @dob
            ,e.Phone = @phone
            ,e.Gender = @gender
            ,e.Skype = @skype
            ,e.Yahoo = @yahoo
            ,e.Marriage = @marriage
            ,e.PermanentAddress = @address
            ,e.CurrentAddress = @currAddress
            ,e.IdCardNumber = @idCardNo
            ,e.DateOfIDCard = @issuedDate
            ,e.PlaceOfIDCard = @issuedPlace
            ,e.PassportNo = @passportNo
            ,e.PassportExp = @passportExp
			,e.SocialInsuranceNo = @socialInsuranceNo
            ,e.GeoMapLatitude = @geoMapLatitude
            ,e.GeoMapLongtitude = @geoMapLongtitude
			,e.PlaceOfBirth = @placeOfBirth
			,e.ContactName = @contactName
			,e.UserRelationship = @userRelationship
			,e.ContactPhone = @contactPhone
			,e.ContactAddress = @contactAddress
			,e.JoinedDate = @groupDate
			,e.EducationBackground = @EducationBackground
            ,e.ConfirmedDate = @confirmedDate
            ,e.ResignedDate = @resignedDate
        FROM bodb_HRM.dbo.Employee AS e WITH (ROWLOCK)
            INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ce WITH (NOLOCK) ON e.UserId = ce.UserId
        WHERE ce.EmpId = @employeeId

		UPDATE bodb_HRM.dbo.CompanyEmployee
		SET Code = @code
            ,Nickname = @Nickname
            ,DomainUsername = @domainUsername
            ,Email = @Email
			,IsSpecialUser = @isSpecialUser
			,[Enabled] = @enabled
            ,GroupId = @mainGroupID
            ,JobTitleId = @jobTitleId
            ,Roles = @roles
            ,CompanyDate = @joinedDate
            ,EmployeeCard = @EmployeeCard
			,AutoApproveRequest = @autoApproveRequest
            ,DistanceToCompany = @distanceToCompany
			,SalaryGroupId = @salaryGroupId
			,PayrollCompanyId = @payrollCompanyId
            ,ModifiedBy = @modifiedBy
            ,ModifiedDate = GETDATE()
		WHERE EmpId = @employeeId

		IF EXISTS (SELECT 1 FROM [bodb_HRM].[dbo].[EmployeeSummary] WHERE EmpId = @employeeId)
		BEGIN
			UPDATE [bodb_HRM].[dbo].[EmployeeSummary]
			SET IsLocal = @isLocal
			WHERE EmpId = @employeeId
		END
		ELSE
		BEGIN
			INSERT INTO [bodb_HRM].[dbo].[EmployeeSummary] (EmpId, IsLocal)
			VALUES (@employeeId, @isLocal)
		END

		INSERT INTO dbo.[Log](LogActionID, LogDate, Description, TrackingValue, UserID)
		VALUES(5, GETDATE(), 'Update Employee', @logData, @employeeId)

        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION

        SELECT @ErrCode = 1
            ,@ErrMsg = N'Update Employee unsuccessfully.'
    END CATCH;
END