CREATE TABLE [dbo].[TimeRecordExt] (
    [ID]                     INT           NOT NULL,
    [IPAddress]              VARCHAR (50)  NULL,
    [Platform]               VARCHAR (255) NULL,
    [Status]                 TINYINT       NULL,
    [IsEditCheckInOutOnline] BIT           NULL
);

