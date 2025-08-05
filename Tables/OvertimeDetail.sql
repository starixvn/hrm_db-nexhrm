CREATE TABLE [dbo].[OvertimeDetail] (
    [OvertimeId] INT             NOT NULL,
    [EmployeeId] INT             NOT NULL,
    [Hour]       NUMERIC (18, 1) NOT NULL,
    [Date]       DATETIME        NOT NULL,
    [NexHour]    NUMERIC (18, 1) NOT NULL,
    [Note]       NVARCHAR (250)  NULL,
    CONSTRAINT [PK_OvertimeDetail] PRIMARY KEY CLUSTERED ([OvertimeId] ASC, [EmployeeId] ASC, [Date] ASC)
);

