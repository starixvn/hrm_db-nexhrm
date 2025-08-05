

CREATE   VIEW [dbo].[Department]

AS
SELECT DISTINCT d.DepartmentId
      ,d.Code
      ,d.[Name]
      ,0 as ParentId
      ,d.PICEmpId as ManagerId
	  ,NULL as [DepartmentLevel]
      ,NULL as [DisplayOrder]
      ,(
			CASE 
				WHEN ISNULL(d.IsActive, 1) = 0
					THEN 1
				ELSE 0
				END
			) AS  IsDisabled
      ,d.ModifiedBy as CreatedBy
      ,d.ModifiedDate as CreatedDate
      ,d.ModifiedBy
      ,d.ModifiedDate
      ,0 as IsSpecial
  FROM bodb_HRM.dbo.Department d
  INNER JOIN bodb_HRM.dbo.[Group] g WITH (NOLOCK) ON d.DepartmentId = g.DepartmentId
  INNER JOIN dbo.SystemSetting AS st WITH (NOLOCK) ON g.CompanyId = st.[Value] AND st.Id = 4