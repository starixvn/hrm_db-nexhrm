/*
    Created: Henry@20251110
    Task: init expat employee summary and extra year for team
    DB: NexHRM,LumiHRM,NexVisionHRM
    Original:
    Revisions:
        - 20251110@Henry: init expat employee summary and extra year for team
*/

-- Init expat employee summary
INSERT INTO [bodb_HRM].[dbo].[EmployeeSummary] ([EmpId], [IsLocal])
SELECT ce.EmpId,
       CASE WHEN ce.EmpId IN (6081, 6596) THEN 0 ELSE 1 END AS IsLocal
FROM [bodb_HRM].[dbo].[CompanyEmployee] ce
LEFT JOIN [bodb_HRM].[dbo].[EmployeeSummary] es ON ce.EmpId = es.EmpId
WHERE ce.CompanyId IN (1, 2, 34)
  AND es.EmpId IS NULL;

-- Init extra year for SD team
UPDATE [bodb_HRM].[dbo].[Group]
SET [ExpatYearsOfServiceForExtraLeave] = 2, 
    [LocalYearsOfServiceForExtraLeave] = 1, 
    [ExpatBasicAnnualLeaveBalance] = 19, 
    [LocalBasicAnnualLeaveBalance] = 12
WHERE CompanyId IN (1,2,34)

-- Init extra year for GO team
UPDATE [bodb_HRM].[dbo].[Group]
SET [LocalYearsOfServiceForExtraLeave] = 2
WHERE CompanyId IN (1,2,34) AND GroupId IN 
-- (567, 534, 525); -- Production (HR,ITNW,FA)
(553, 519, 509); -- Local (HR,ITNW,FA)
