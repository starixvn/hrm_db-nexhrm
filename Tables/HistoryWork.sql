CREATE TABLE [dbo].[HistoryWork] (
    [Id]           INT      IDENTITY (1, 1) NOT NULL,
    [EmpId]        INT      NOT NULL,
    [AffectedDate] DATETIME NULL,
    [ModifiedBy]   INT      NULL,
    [ModifiedDate] DATETIME NULL,
    CONSTRAINT [PK_HistoryWork] PRIMARY KEY CLUSTERED ([Id] ASC)
);

