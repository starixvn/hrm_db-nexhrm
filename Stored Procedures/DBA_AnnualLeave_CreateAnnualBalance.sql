/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/
ALTER PROCEDURE [dbo].[DBA_AnnualLeave_CreateAnnualBalance] @Year INT
    ,@EmpID INT = NULL
    ,@Description NVARCHAR(1000) = ''
    ,@ErrCode INT = 0 OUTPUT
    ,@ErrMsg VARCHAR(200) = '' OUTPUT
AS
/*
Created: Quinn.Vo@2014.12.26
Task: Add annual balance leave for new year.
DB: HRM_SMS
Original: 

Revisions:    
	- 20241231@Oliver: change to new rule of AL credit
	- 20251110@Henry: update to new rule of AL credit
Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF LEN(ISNULL(@Description, '')) = 0
        SET @Description = 'Add annual leave days for ' + CONVERT(NVARCHAR(10), @Year) + '.'

    DECLARE @CreditDays NUMERIC(18, 1)
		,@EndDate DATETIME
        ,@FromDate DATETIME
        ,@ToDate DATETIME
        ,@CalDate_Annual DATETIME

    SELECT @FromDate = CONVERT(NVARCHAR(10), @Year) + '/01/01'
        ,@ToDate = CONVERT(NVARCHAR(10), @Year) + '/12/31'
        ,@CalDate_Annual = CONVERT(NVARCHAR(10), @Year) + '/07/01'
		,@EndDate =  CONVERT(NVARCHAR(10), @Year) + '/12/31'

    SET @CreditDays = 12

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO dbo.LeaveTrans (
            EmpId
            ,[Description]
            ,FromDate
            ,ToDate
            ,DeductDays
            ,CreditDays
            ,CreatedDate
            ,CreatedBy
            ,Deleted
            ,IsOpenBalance
            )
        SELECT e.Id
            ,@Description Description
            ,@FromDate FromDate
            ,@ToDate ToDate
            ,0 AS DeductDays
            ,CASE
                WHEN ISNULL(calc.BaseDays, 0) + ISNULL(FLOOR(ISNULL(calc.YearsAll, 0) / NULLIF(calc.YearsPerExtra, 0)), 0) > calc.MaxDays
                     THEN calc.MaxDays
                ELSE ISNULL(calc.BaseDays, 0) + ISNULL(FLOOR(ISNULL(calc.YearsAll, 0) / NULLIF(calc.YearsPerExtra, 0)), 0)
            END AS CreditDays
            ,dbo.fnc_GetClientDateTime()
            ,NULL CreatedBy
            ,0 Deleted
            ,1 as IsOpenBalance
        FROM dbo.Employee e WITH (NOLOCK)
		INNER JOIN dbo.EmployeeGroup eg WITH (NOLOCK) ON e.GroupId = eg.Id
		LEFT JOIN bodb_HRM.dbo.EmployeeSummary es WITH (NOLOCK) ON e.Id = es.EmpId
        CROSS APPLY (
            SELECT
                CASE
                    WHEN ISNULL(es.IsLocal, 1) = 0
                        THEN eg.ExpatBasicAnnualLeaveBalance
                    ELSE eg.LocalBasicAnnualLeaveBalance
                END AS BaseDays,
                CASE
                    WHEN ISNULL(es.IsLocal, 1) = 0
                        THEN eg.ExpatYearsOfServiceForExtraLeave
                    ELSE eg.LocalYearsOfServiceForExtraLeave
                END AS YearsPerExtra,
                DATEDIFF(YEAR, e.GroupDate, @FromDate)
                - CASE 
                    WHEN DATEFROMPARTS(YEAR(@FromDate), MONTH(e.GroupDate), DAY(e.GroupDate)) > @FromDate 
                        THEN 1 
                    ELSE 0 
                END AS YearsAll,
                CASE
                    WHEN ISNULL(es.IsLocal, 1) = 0 THEN 37 -- Expat max
                    ELSE 30 -- Local max
                END AS MaxDays
        ) AS calc
        LEFT JOIN (
            SELECT MAX(FromDate) FromDate
                ,EmpId
            FROM dbo.LeaveTrans lt
            WHERE lt.FromDate >= @FromDate
                AND lt.CreditDays > 0
                AND ISNULL(Deleted, 0) = 0
            GROUP BY EmpId
            ) lt ON e.Id = lt.EmpId
        WHERE ISNULL(isdeleted, 0) = 0
            AND e.[Enabled] = 1
            AND e.GroupDate <= @FromDate
            AND e.ResignedDate IS NULL
            AND (
                e.Id = @EmpID
                OR @EmpID IS NULL
                )
            AND lt.EmpId IS NULL

        COMMIT TRANSACTION;

        SELECT @ErrCode = 0
            ,@ErrCode = ''
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;

        SELECT @ErrCode = 100
            ,@ErrMsg = N'Add annual balance failed.'

        RETURN
    END CATCH;
END