
CREATE VIEW [dbo].[Employee2]
AS
SELECT e.Id, e.Code, e.DomainUsername, e.FullName, e.NickName, e.DOB, e.Email, e.JobTitleId, jt.[Name] AS JobTitleName, e.[Enabled], e.Phone, e.Gender, e.GroupId, e.JoinedDate, 
    e.ConfirmedDate, e.ResignedDate, e.Skype, e.Yahoo, e.Marriage, e.CreatedDate, e.CreatedBy, e.ModifiedDate, e.ModifiedBy, e.IsDeleted, e.EmployeeCard,
    e.IsSpecialUser, e.GroupDate, e.PlaceOfBirth, e.EducationBackground, e.Telegram
FROM dbo.Employee AS e WITH (NOLOCK)
    LEFT JOIN HRM.dbo.JobTitle AS jt WITH (NOLOCK) ON e.JobTitleId = jt.JobTitleId
WHERE e.IsSpecialUser = 0
GO