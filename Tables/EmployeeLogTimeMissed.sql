CREATE TABLE [dbo].[EmployeeLogTimeMissed] (
    [Id]    INT  IDENTITY (1, 1) NOT NULL,
    [EmpID] INT  NOT NULL,
    [Date]  DATE NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

