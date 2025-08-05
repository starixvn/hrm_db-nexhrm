

CREATE VIEW [dbo].[EmployeeGroup2]
AS
SELECT  [Id]
      ,[Code]
      ,[Name]
      ,[DepartmentId]
      ,[LeaderId]
      ,[AssistantLeaderId]
      ,[Rank]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[Deleted]
      ,[ParentId]
      ,[IsSpecialTeam]
FROM dbo.EmployeeGroup WITH (NOLOCK)