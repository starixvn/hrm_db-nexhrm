
CREATE   VIEW [dbo].[EmployeeSupervisor]
AS
SELECT 
    [OwnerId] AS ApproverId,
    es.[EmpId],
    es.[ModifiedBy],
    es.[ModifiedDate],
    es.[IsDeleted],
    c.Name AS OuterCompanyName
FROM [bodb_HRM].[dbo].[EmployeeSupervisor] AS es WITH (NOLOCK)
INNER JOIN [bodb_HRM].[dbo].[CompanyEmployee] AS cea WITH (NOLOCK) 
    ON cea.EmpId = es.OwnerId AND ISNULL(cea.IsSpecialUser, 0) = 0 AND ISNULL(cea.IsDeleted, 0) = 0 AND ISNULL(cea.Enabled, 1) = 1
INNER JOIN [bodb_HRM].[dbo].[CompanyEmployee] AS cee WITH (NOLOCK) 
    ON cee.EmpId = es.EmpId AND ISNULL(cee.IsSpecialUser, 0) = 0 AND ISNULL(cee.IsDeleted, 0) = 0 AND ISNULL(cee.Enabled, 1) = 1
LEFT JOIN [bodb_HRM].[dbo].[Company] AS c WITH (NOLOCK) 
    ON c.CompanyId = cea.CompanyId 
    AND c.CompanyId != (SELECT [Value] FROM [dbo].[SystemSetting] WHERE [Name] = 'CompanyId')
WHERE es.ActionType = 3 AND es.RequestType = 6 
AND cee.CompanyId = (SELECT [Value] FROM [dbo].[SystemSetting] WHERE [Name] = 'CompanyId')