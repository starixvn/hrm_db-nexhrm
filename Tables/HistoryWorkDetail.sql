CREATE TABLE [dbo].[HistoryWorkDetail] (
    [HistoryWorkId]       INT            NOT NULL,
    [GroupId]             INT            NULL,
    [GroupName]           NVARCHAR (50)  NULL,
    [JobTitleId]          INT            NULL,
    [JobTitleName]        NVARCHAR (100) NULL,
    [JobGradeId]          INT            NULL,
    [JobGradeName]        NVARCHAR (100) NULL,
    [ManagementGradeId]   INT            NULL,
    [ManagementGradeName] NVARCHAR (100) NULL
);

