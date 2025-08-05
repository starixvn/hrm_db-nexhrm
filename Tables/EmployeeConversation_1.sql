CREATE TABLE [dbo].[EmployeeConversation] (
    [EmpId]          INT           NOT NULL,
    [ConversationId] VARCHAR (255) NULL,
    [ModifiedDate]   DATETIME      NULL,
    [IsActive]       BIT           NULL,
    CONSTRAINT [PK_EmployeeConversation] PRIMARY KEY CLUSTERED ([EmpId] ASC)
);

