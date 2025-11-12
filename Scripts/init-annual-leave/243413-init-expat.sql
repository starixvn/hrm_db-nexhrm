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
VALUES (6081, 0),
       (6596, 0);

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


ALTER VIEW [dbo].[EmployeeGroup]

AS 
SELECT 
		g.GroupId as Id
    ,g.OldGroupId as OldId
    ,g.GroupTeamId
    ,g.Code
    ,g.Name
    ,g.DepartmentId
    ,g.PICEmpId as LeaderId
    ,g.PICEmpId as AssistantLeaderId
    ,g.[Rank]
    ,g.CreatedDate
    ,g.CreatedBy
    ,g.ModifiedDate
    ,g.ModifiedBy
    ,g.IsDeleted as Deleted
    ,0 as ParentId
    ,0 as IsSpecialTeam
    ,g.[LocalBasicAnnualLeaveBalance]
    ,g.[LocalWorkingDays]
    ,g.[LocalWorkingHours]
    ,g.[LocalOffDaysbyWeek]
    ,g.[ExpatBasicAnnualLeaveBalance]
    ,g.[ExpatWorkingDays]
    ,g.[ExpatWorkingHours]
    ,g.[ExpatOffDaysbyWeek]
    ,g.[LocalWorkingHoursbyWeek]
    ,g.[ExpatWorkingHoursbyWeek]
    ,g.[LocalYearsOfServiceForExtraLeave]
    ,g.[ExpatYearsOfServiceForExtraLeave]
  FROM bodb_HRM.dbo.[Group] g
	INNER JOIN dbo.SystemSetting AS st WITH (NOLOCK) ON g.CompanyId = st.[Value] AND st.Id = 4
GO