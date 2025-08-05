CREATE TABLE [dbo].[tmpEmployeeNexcel] (
    [Nickname] NVARCHAR (20)  NULL,
    [Code]     VARCHAR (20)   NULL,
    [TeamName] NVARCHAR (50)  NULL,
    [JobTitle] NVARCHAR (100) NULL,
    [RowIndex] INT            IDENTITY (1, 1) NOT NULL
);

