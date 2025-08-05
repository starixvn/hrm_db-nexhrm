CREATE TABLE [dbo].[EmployeeExt] (
    [Id]             INT            NOT NULL,
    [DomainUsername] VARCHAR (50)   NULL,
    [Email]          VARCHAR (50)   NULL,
    [GroupId]        INT            NULL,
    [Roles]          VARCHAR (20)   NULL,
    [JoinedDate]     SMALLDATETIME  NULL,
    [ConfirmedDate]  SMALLDATETIME  NULL,
    [ResignedDate]   SMALLDATETIME  NULL,
    [NickName2]      NVARCHAR (20)  NULL,
    [IsSpecialUser]  BIT            NOT NULL,
    [IsDeleted]      BIT            CONSTRAINT [DF_EmployeeExt_IsDeleted] DEFAULT ((0)) NOT NULL,
    [Enabled]        BIT            CONSTRAINT [DF_EmployeeExt_Enabled] DEFAULT ((1)) NOT NULL,
    [SalaryGroupId]  SMALLINT       NULL,
    [Password]       NVARCHAR (100) NULL
);

