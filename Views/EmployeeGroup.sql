
CREATE   VIEW [dbo].[EmployeeGroup]

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
  FROM bodb_HRM.dbo.[Group] g
	INNER JOIN dbo.SystemSetting AS st WITH (NOLOCK) ON g.CompanyId = st.[Value] AND st.Id = 4