
CREATE VIEW [dbo].[Employee_bk]
AS
SELECT e.Id, e.Code, ext.DomainUsername, e.FullName, (CASE WHEN ext.NickName2 IS NULL THEN e.NickName ELSE ext.NickName2 END) AS NickName
    ,e.DOB, ext.Email, e.JobTitleId, ext.[Enabled], e.Phone, e.Gender, ext.GroupId, ext.Roles
    ,ext.JoinedDate, ext.ConfirmedDate, ext.ResignedDate, e.Skype, e.Yahoo, e.Marriage
    ,e.CreatedDate, e.CreatedBy, e.ModifiedDate, e.ModifiedBy, ext.IsDeleted, e.PermanentAddress, e.CurrentAddress, e.IdCardNumber, e.PassportNo
    ,e.PassportExp, e.GeoMapLatitude, e.GeoMapLongtitude, e.DistanceToCompany, e.EmployeeCard, e.IssuedDate, e.IssuedPlace, ext.IsSpecialUser, e.GroupDate
    ,e.PlaceOfBirth, e.ContactName, e.UserRelationship, e.ContactPhone
    ,e.ContactAddress, e.EducationBackground, e.Telegram, e.SocialInsuranceNo, ec.CompanyId, ext.SalaryGroupId
FROM HRM.dbo.Employee AS e WITH (NOLOCK)
    INNER JOIN HRM.dbo.EmployeeCompany AS ec WITH (NOLOCK) ON e.Id = ec.EmpId
    INNER JOIN dbo.SystemSetting AS st WITH (NOLOCK) ON ec.CompanyId = st.[Value] AND st.Id = 4
    INNER JOIN dbo.EmployeeExt AS ext WITH (NOLOCK) ON e.Id = ext.Id
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Employee_bk';


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
         Begin Table = "e"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ec"
            Begin Extent = 
               Top = 7
               Left = 336
               Bottom = 126
               Right = 530
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "st"
            Begin Extent = 
               Top = 7
               Left = 578
               Bottom = 148
               Right = 772
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ext"
            Begin Extent = 
               Top = 7
               Left = 820
               Bottom = 170
               Right = 1034
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
         Alias = 900
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Employee_bk';

