CREATE TABLE [dbo].[SystemSetting] (
    [Id]    INT            NOT NULL,
    [Name]  VARCHAR (50)   NOT NULL,
    [Value] NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_SystemSetting] PRIMARY KEY CLUSTERED ([Id] ASC)
);

