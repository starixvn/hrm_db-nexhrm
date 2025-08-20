USE NexHRM;
--USE LumiHRM;
--USE NexVisionHRM;
GO

ALTER VIEW [dbo].[Employee]
AS
SELECT ce.EmpId as Id, ce.OldEmpId as OldId, ce.Code, ce.DomainUsername, e.FullName, (CASE WHEN ce.NickName2 IS NULL THEN ce.NickName ELSE ce.NickName2 END) AS NickName
    ,e.DOB, ce.Email, ce.JobTitleId, ce.[Enabled], e.Phone, e.Gender, ce.GroupId, ce.Roles
    ,ce.CompanyDate as JoinedDate, e.ConfirmedDate, e.ResignedDate, e.Skype, e.Yahoo, e.Marriage
    ,ce.CreatedDate, ce.CreatedBy, ce.ModifiedDate, ce.ModifiedBy, ce.IsDeleted, e.PermanentAddress, e.CurrentAddress, e.IdCardNumber, e.PassportNo
    ,e.PassportExp, e.GeoMapLatitude, e.GeoMapLongtitude, ce.DistanceToCompany, ce.EmployeeCard, e.DateOfIDCard as IssuedDate, e.PlaceOfIDCard as IssuedPlace, ce.IsSpecialUser
    ,e.JoinedDate as GroupDate, e.PlaceOfBirth, e.ContactName, e.UserRelationship, e.ContactPhone
    ,e.ContactAddress, e.EducationBackground, e.Telegram, e.SocialInsuranceNo, ce.CompanyId, ce.SalaryGroupId, ce.AutoApproveRequest
FROM bodb_HRM.dbo.Employee AS e WITH (NOLOCK)
    INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ce WITH (NOLOCK) ON e.UserId = ce.UserId 
    INNER JOIN dbo.SystemSetting AS st WITH (NOLOCK) ON ce.CompanyId = st.[Value] AND st.Id = 4
GO

declare @companyId smallint = 1
    ,@newRangeEmpId int = 7000
declare @tmpEmployee table (UserId int, EmpId int)

insert into @tmpEmployee (UserId, EmpId)
select UserId, EmpId
from bodb_HRM.dbo.CompanyEmployee
where CompanyId = @companyId and EmpId > @newRangeEmpId

UPDATE c
SET c.CreatedBy = e.EmpId
FROM dbo.CompanyEvent c
    INNER JOIN @tmpEmployee e ON c.CreatedBy = e.UserId;

UPDATE att
SET att.EmpId = e.EmpId
FROM dbo.EmployeeAttendance att
    INNER JOIN @tmpEmployee e ON att.EmpId = e.UserId;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EmployeeAttendance_bk')
BEGIN
    UPDATE att
    SET att.EmpId = e.EmpId
    FROM dbo.EmployeeAttendance_bk att
        INNER JOIN @tmpEmployee e ON att.EmpId = e.UserId;
END

UPDATE empca
SET empca.EmpId = e.EmpId
FROM dbo.EmployeeCalendar empca
    INNER JOIN @tmpEmployee e ON empca.EmpId = e.UserId;

UPDATE empca
SET empca.ModifiedBy = e.EmpId
FROM dbo.EmployeeCalendar empca
    INNER JOIN @tmpEmployee e ON empca.ModifiedBy = e.UserId;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'EmployeeCalendar_bk')
BEGIN
    UPDATE empca
    SET empca.EmpId = e.EmpId
    FROM dbo.EmployeeCalendar_bk empca
        INNER JOIN @tmpEmployee e ON empca.EmpId = e.UserId;

    UPDATE empca
    SET empca.ModifiedBy = e.EmpId
    FROM dbo.EmployeeCalendar_bk empca
        INNER JOIN @tmpEmployee e ON empca.ModifiedBy = e.UserId;
END

UPDATE ec
SET ec.EmpId = e.EmpId
FROM dbo.EmployeeConversation ec
    INNER JOIN @tmpEmployee e ON ec.EmpId = e.UserId;

UPDATE eg
SET eg.EmpId = e.EmpId
FROM dbo.EmployeeGroup_Employee eg
    INNER JOIN @tmpEmployee e ON eg.EmpId = e.UserId;

UPDATE em
SET em.EmpId = e.EmpId
FROM dbo.EmployeeLogTimeMissed em
    INNER JOIN @tmpEmployee e ON em.EmpId = e.UserId;

UPDATE ep
SET ep.EmpId = e.EmpId
FROM dbo.EmployeePostnatal ep
    INNER JOIN @tmpEmployee e ON ep.EmpId = e.UserId;

UPDATE ep
SET ep.ModifiedBy = e.EmpId
FROM dbo.EmployeePostnatal ep
    INNER JOIN @tmpEmployee e ON ep.ModifiedBy = e.UserId;

UPDATE es
SET es.EmpId = e.EmpId
FROM dbo.EmployeeSetting es
    INNER JOIN @tmpEmployee e ON es.EmpId = e.UserId;

UPDATE es
SET es.EmpId = e.EmpId
FROM dbo.EmployeeShift es
    INNER JOIN @tmpEmployee e ON es.EmpId = e.UserId;

UPDATE es
SET es.EmpId = e.EmpId
FROM dbo.EmployeeSupervisor es
    INNER JOIN @tmpEmployee e ON es.EmpId = e.UserId;

UPDATE es
SET es.ApproverId = e.EmpId
FROM dbo.EmployeeSupervisor es
    INNER JOIN @tmpEmployee e ON es.ApproverId = e.UserId;

UPDATE es
SET es.ModifiedBy = e.EmpId
FROM dbo.EmployeeSupervisor es
    INNER JOIN @tmpEmployee e ON es.ModifiedBy = e.UserId;

UPDATE wfh
SET wfh.EmpId = e.EmpId
FROM dbo.EmployeeWorkFromHome wfh
    INNER JOIN @tmpEmployee e ON wfh.EmpId = e.UserId;

UPDATE wfh
SET wfh.ModifiedBy = e.EmpId
FROM dbo.EmployeeWorkFromHome wfh
    INNER JOIN @tmpEmployee e ON wfh.ModifiedBy = e.UserId;

UPDATE enu
SET enu.EmpId = e.EmpId
FROM dbo.ExtensionNumbers enu
    INNER JOIN @tmpEmployee e ON enu.EmpId = e.UserId;

UPDATE gs
SET gs.ModifiedBy = e.EmpId
FROM dbo.GroupSupervisor gs
    INNER JOIN @tmpEmployee e ON gs.ModifiedBy = e.UserId;

UPDATE gs
SET gs.ApproverId = e.EmpId
FROM dbo.GroupSupervisor gs
    INNER JOIN @tmpEmployee e ON gs.ApproverId = e.UserId;

UPDATE hw
SET hw.EmpId = e.EmpId
FROM dbo.HistoryWork hw
    INNER JOIN @tmpEmployee e ON hw.EmpId = e.UserId;

UPDATE hw
SET hw.ModifiedBy = e.EmpId
FROM dbo.HistoryWork hw
    INNER JOIN @tmpEmployee e ON hw.ModifiedBy = e.UserId;

UPDATE li
SET li.EmpId = e.EmpId
FROM dbo.LateInEarlyOut li
    INNER JOIN @tmpEmployee e ON li.EmpId = e.UserId;

UPDATE li
SET li.ModifiedBy = e.EmpId
FROM dbo.LateInEarlyOut li
    INNER JOIN @tmpEmployee e ON li.ModifiedBy = e.UserId;

UPDATE li
SET li.EmpId = e.EmpId
FROM dbo.LateInEarlyOutTrans li
    INNER JOIN @tmpEmployee e ON li.EmpId = e.UserId;

UPDATE li
SET li.ModifiedBy = e.EmpId
FROM dbo.LateInEarlyOutTrans li
    INNER JOIN @tmpEmployee e ON li.ModifiedBy = e.UserId;

UPDATE li
SET li.EmpId = e.EmpId
FROM dbo.LateInEarlyOutYearly li
    INNER JOIN @tmpEmployee e ON li.EmpId = e.UserId;

UPDATE li
SET li.ModifiedBy = e.EmpId
FROM dbo.LateInEarlyOutYearly li
    INNER JOIN @tmpEmployee e ON li.ModifiedBy = e.UserId;

UPDATE lc
SET lc.EmpId = e.EmpId
FROM dbo.LeaveConversion lc
    INNER JOIN @tmpEmployee e ON lc.EmpId = e.UserId;

UPDATE lc
SET lc.ModifiedBy = e.EmpId
FROM dbo.LeaveConversion lc
    INNER JOIN @tmpEmployee e ON lc.ModifiedBy = e.UserId;

UPDATE lt
SET lt.EmpId = e.EmpId
FROM dbo.LeaveTrans lt
    INNER JOIN @tmpEmployee e ON lt.EmpId = e.UserId;

UPDATE lt
SET lt.CreatedBy = e.EmpId
FROM dbo.LeaveTrans lt
    INNER JOIN @tmpEmployee e ON lt.CreatedBy = e.UserId;

UPDATE lt
SET lt.ModifiedBy = e.EmpId
FROM dbo.LeaveTrans lt
    INNER JOIN @tmpEmployee e ON lt.ModifiedBy = e.UserId;

UPDATE lt
SET lt.EmpId = e.EmpId
FROM dbo.LogReachedWorkingTime lt
    INNER JOIN @tmpEmployee e ON lt.EmpId = e.UserId;

UPDATE ot
SET ot.CreatedBy = e.EmpId
FROM dbo.Overtime ot
    INNER JOIN @tmpEmployee e ON ot.CreatedBy = e.UserId;

UPDATE ot
SET ot.ModifiedBy = e.EmpId
FROM dbo.Overtime ot
    INNER JOIN @tmpEmployee e ON ot.ModifiedBy = e.UserId;

UPDATE ot
SET ot.EmpId = e.EmpId
FROM dbo.OvertimeConversion ot
    INNER JOIN @tmpEmployee e ON ot.EmpId = e.UserId;

UPDATE ot
SET ot.ModifiedBy = e.EmpId
FROM dbo.OvertimeConversion ot
    INNER JOIN @tmpEmployee e ON ot.ModifiedBy = e.UserId;

UPDATE ot
SET ot.EmployeeId = e.EmpId
FROM dbo.OvertimeDetail ot
    INNER JOIN @tmpEmployee e ON ot.EmployeeId = e.UserId;

UPDATE ot
SET ot.EmpId = e.EmpId
FROM dbo.OvertimeTrans ot
    INNER JOIN @tmpEmployee e ON ot.EmpId = e.UserId;

UPDATE ot
SET ot.ModifiedBy = e.EmpId
FROM dbo.OvertimeTrans ot
    INNER JOIN @tmpEmployee e ON ot.ModifiedBy = e.UserId;

UPDATE ot
SET ot.EmpId = e.EmpId
FROM dbo.OvertimeYearly ot
    INNER JOIN @tmpEmployee e ON ot.EmpId = e.UserId;

UPDATE ot
SET ot.ModifiedBy = e.EmpId
FROM dbo.OvertimeYearly ot
    INNER JOIN @tmpEmployee e ON ot.ModifiedBy = e.UserId;

UPDATE rst
SET rst.EmpId = e.EmpId
FROM dbo.RedmineSpendTimeLog rst
    INNER JOIN @tmpEmployee e ON rst.EmpId = e.UserId;

UPDATE tr
SET tr.EmpId = e.EmpId
FROM dbo.TimeRecord tr
    INNER JOIN @tmpEmployee e ON tr.EmpId = e.UserId;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TimeRecordOld')
BEGIN
    UPDATE tr
    SET tr.EmpId = e.EmpId
    FROM dbo.TimeRecordOld tr
        INNER JOIN @tmpEmployee e ON tr.EmpId = e.UserId;
END

UPDATE tr
SET tr.EmpId = e.EmpId
FROM dbo.tmpEmployeeAttendance tr
    INNER JOIN @tmpEmployee e ON tr.EmpId = e.UserId;

UPDATE wfh
SET wfh.EmpId = e.EmpId
FROM dbo.WorkFromHomeRequest wfh
    INNER JOIN @tmpEmployee e ON wfh.EmpId = e.UserId;

UPDATE wfh
SET wfh.ProcessedBy = e.EmpId
FROM dbo.WorkFromHomeRequest wfh
    INNER JOIN @tmpEmployee e ON wfh.ProcessedBy = e.UserId;

UPDATE wfh
SET wfh.CreatedBy = e.EmpId
FROM dbo.WorkFromHomeRequest wfh
    INNER JOIN @tmpEmployee e ON wfh.CreatedBy = e.UserId;

UPDATE wfh
SET wfh.ModifiedBy = e.EmpId
FROM dbo.WorkFromHomeRequest wfh
    INNER JOIN @tmpEmployee e ON wfh.ModifiedBy = e.UserId;

/*WorkingTimeRequest*/

UPDATE r
SET r.EmpId = e.EmpId
FROM dbo.WorkingTimeRequest r
    INNER JOIN @tmpEmployee e ON r.EmpId = e.UserId;

UPDATE r
SET r.ProcessedBy = e.EmpId
FROM dbo.WorkingTimeRequest r
    INNER JOIN @tmpEmployee e ON r.ProcessedBy = e.UserId;

UPDATE r
SET r.CreatedBy = e.EmpId
FROM dbo.WorkingTimeRequest r
    INNER JOIN @tmpEmployee e ON r.CreatedBy = e.UserId;

UPDATE r
SET r.ModifiedBy = e.EmpId
FROM dbo.WorkingTimeRequest r
    INNER JOIN @tmpEmployee e ON r.ModifiedBy = e.UserId;

UPDATE r
SET r.EmpId = e.EmpId
FROM dbo.WorkingTimeRequest_history r
    INNER JOIN @tmpEmployee e ON r.EmpId = e.UserId;

UPDATE r
SET r.ProcessedBy = e.EmpId
FROM dbo.WorkingTimeRequest_history r
    INNER JOIN @tmpEmployee e ON r.ProcessedBy = e.UserId;

UPDATE r
SET r.CreatedBy = e.EmpId
FROM dbo.WorkingTimeRequest_history r
    INNER JOIN @tmpEmployee e ON r.CreatedBy = e.UserId;

UPDATE r
SET r.ModifiedBy = e.EmpId
FROM dbo.WorkingTimeRequest_history r
    INNER JOIN @tmpEmployee e ON r.ModifiedBy = e.UserId;

/*MessageCategoryLog*/
UPDATE mcl
SET mcl.JsonObject = REPLACE(mcl.JsonObject, CONCAT('"EmpId":', CAST(e.UserId AS VARCHAR(10)), ','), CONCAT('"EmpId":', CAST(e.EmpId AS VARCHAR(10)), ','))
FROM dbo.MessageCategoryLog mcl
INNER JOIN @tmpEmployee e ON mcl.JsonObject LIKE CONCAT('%"EmpId":', CAST(e.UserId AS VARCHAR(10)), ',%');
GO