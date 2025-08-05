CREATE TABLE [dbo].[WorkFromHomeRequest] (
    [Id]            INT             IDENTITY (1, 1) NOT NULL,
    [EmpId]         INT             NOT NULL,
    [Status]        TINYINT         NOT NULL,
    [Remark]        NVARCHAR (2000) NULL,
    [ProcessedDate] DATETIME        NULL,
    [ProcessedBy]   INT             NULL,
    [FromDate]      DATE            NOT NULL,
    [ToDate]        DATE            NULL,
    [CreatedDate]   DATETIME        NOT NULL,
    [CreatedBy]     INT             NULL,
    [ModifiedDate]  DATETIME        NULL,
    [ModifiedBy]    INT             NULL,
    [HRRemark]      NVARCHAR (2000) NULL,
    CONSTRAINT [PK_WorkFromHomeRequest] PRIMARY KEY CLUSTERED ([Id] ASC)
);

