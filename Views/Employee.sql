
ALTER   VIEW [dbo].[Employee]
AS

SELECT ec.EmpId as Id, e.OldEmpId as OldId, ec.Code, ec.DomainUsername, e.FullName, (CASE WHEN ec.NickName2 IS NULL THEN ec.NickName ELSE ec.NickName2 END) AS NickName
    ,e.DOB, ec.Email, ec.JobTitleId, ec.[Enabled], e.Phone, e.Gender, ec.GroupId, ec.Roles
    ,ec.CompanyDate as JoinedDate, e.ConfirmedDate, e.ResignedDate, e.Skype, e.Yahoo, e.Marriage
    ,ec.CreatedDate, ec.CreatedBy, ec.ModifiedDate, ec.ModifiedBy, ec.IsDeleted, e.PermanentAddress, e.CurrentAddress, e.IdCardNumber, e.PassportNo
    ,e.PassportExp, e.GeoMapLatitude, e.GeoMapLongtitude, ec.DistanceToCompany, ec.EmployeeCard, e.DateOfIDCard as IssuedDate, e.PlaceOfIDCard as IssuedPlace, ec.IsSpecialUser, e.JoinedDate as GroupDate
    ,e.PlaceOfBirth, e.ContactName, e.UserRelationship, e.ContactPhone
    ,e.ContactAddress, e.EducationBackground, e.Telegram, e.SocialInsuranceNo, ec.CompanyId, ec.SalaryGroupId, ec.AutoApproveRequest
	,ce.PayrollCompanyId
FROM bodb_HRM.dbo.Employee AS e WITH (NOLOCK)
    INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ec WITH (NOLOCK) ON e.EmpId = ec.EmpId 
    INNER JOIN dbo.SystemSetting AS st WITH (NOLOCK) ON ec.CompanyId = st.[Value] AND st.Id = 4