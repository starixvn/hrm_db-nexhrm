CREATE TABLE [dbo].[EmployeeCalendar_bk] (
    [Id]                    BIGINT          NOT NULL,
    [EmpId]                 INT             NOT NULL,
    [WorkDate]              DATETIME        NOT NULL,
    [ShiftId]               INT             NULL,
    [IsHoliday]             BIT             NULL,
    [IsOffDay]              BIT             NULL,
    [IsLeaveDay]            BIT             NULL,
    [LeaveTypeId]           INT             NULL,
    [LateIn]                INT             NULL,
    [EarlyOut]              INT             NULL,
    [RequestedCheckinTime]  DATETIME        NULL,
    [RequestedCheckoutTime] DATETIME        NULL,
    [ChangeShiftId]         BIGINT          NULL,
    [LeaveDay]              DECIMAL (18, 1) NULL,
    [ModifiedDate]          DATETIME        NULL,
    [ModifiedBy]            INT             NULL,
    [LeaveTypeId2]          INT             NULL,
    [IsWorkFromHome]        BIT             NULL
);

