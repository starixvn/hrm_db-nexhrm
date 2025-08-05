

CREATE   VIEW [dbo].[EmployeeSupDetail]
AS
SELECT 
    esup.EmpId, 
    esup.NickName, 
    esup.FullName, 
    esup.ApproverId, 
    CASE 
        WHEN c.Name IS NOT NULL THEN sup.NickName + ' (' + c.Name + ')'
        ELSE sup.NickName
    END AS ApproverNickName,
    sup.FullName AS ApproverFullName, 
    esup.IsPrivateSetting
FROM 
(
    SELECT 
        e.Id AS EmpId, 
        e.NickName, 
        e.FullName, 
        CASE 
            WHEN es.ApproverId IS NULL THEN gs.ApproverId 
            ELSE es.ApproverId 
        END AS ApproverId, 
        CAST(
            CASE 
                WHEN es.ApproverId IS NOT NULL THEN 1 
                ELSE 0 
            END AS BIT
        ) AS IsPrivateSetting
    FROM dbo.Employee AS e WITH (NOLOCK)
    LEFT OUTER JOIN dbo.GroupSupervisor AS gs WITH (NOLOCK)
        ON e.GroupId = gs.GroupId 
        AND gs.IsDeleted = 0 
        AND e.Id <> gs.ApproverId
    LEFT OUTER JOIN dbo.EmployeeSupervisor AS es WITH (NOLOCK)
        ON e.Id = es.EmpId 
        AND es.IsDeleted = 0 
        AND e.Id <> es.ApproverId
    WHERE 
        e.isDeleted = 0 AND (
            gs.ApproverId IS NOT NULL OR 
            es.ApproverId IS NOT NULL
        )
) AS esup
INNER JOIN bodb_HRM.dbo.Employee AS sup WITH (NOLOCK) ON esup.ApproverId = sup.EmpId AND ISNULL(sup.isDeleted, 0) = 0
INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ce WITH (NOLOCK) ON ce.EmpId = sup.EmpId AND ISNULL(ce.IsSpecialUser, 0) = 0 AND ISNULL(ce.IsDeleted, 0) = 0 AND ISNULL(ce.Enabled, 1) = 1
LEFT JOIN bodb_HRM.dbo.Company AS c WITH (NOLOCK) ON c.CompanyId = ce.CompanyId AND c.CompanyId != (SELECT [Value] FROM [dbo].[SystemSetting] WHERE [Name] = 'CompanyId')
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'EmployeeSupDetail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sup"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 530
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "esup"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2304
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'EmployeeSupDetail';

