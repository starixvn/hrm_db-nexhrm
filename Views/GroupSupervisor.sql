
CREATE   VIEW [dbo].[GroupSupervisor]
AS
SELECT 
    [OwnerId] AS ApproverId,
    g.[GroupId],
    g.[ModifiedBy],
    g.[ModifiedDate],
    g.[IsDeleted],
    c.Name AS OuterCompanyName
FROM [bodb_HRM].[dbo].[GroupSupervisor] AS g WITH (NOLOCK)
INNER JOIN [bodb_HRM].[dbo].[CompanyEmployee] AS ce WITH (NOLOCK) 
    ON ce.EmpId = g.OwnerId AND ISNULL(ce.IsSpecialUser, 0) = 0 AND ISNULL(ce.IsDeleted, 0) = 0 AND ISNULL(ce.Enabled, 1) = 1
LEFT JOIN [bodb_HRM].[dbo].[Company] AS c WITH (NOLOCK) 
    ON c.CompanyId = ce.CompanyId 
    AND c.CompanyId != (SELECT [Value] FROM [NexHRM].[dbo].[SystemSetting] WHERE [Name] = 'CompanyId')
WHERE g.ActionType = 3 AND g.RequestType = 6