/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

CREATE OR ALTER   PROCEDURE [dbo].[Nex_WorkingTimeRequest_Get]
(
    @SupervisorId INT = NULL
    ,@empid INT = NULL
    ,@fromdate DATETIME
    ,@todate DATETIME
    ,@status VARCHAR(MAX) = NULL
    ,@requestType INT = NULL
    ,@leaveTypeId INT = NULL
	,@IsQueryByCreatedDate BIT = 1
)
AS
/*
    Created: Jay.Do@20250703
    Task: Get Request cross company
    DB: bodb_HRM
	Revisions: 
		20250821@Jay: restructure [Redmine: #235678]
	Original: 
*/
BEGIN
		
	DECLARE @AnnualLeave INT = 2,
			@WeddingLeave INT = 6,
			@BusinessTrip INT = 9,
			@MaternityLeave INT = 12,
			@PaternityLeave INT = 14,
			@BereavementLeave INT = 21,
			@UnpaidLeave INT = 25,
			@CompanyEvent INT = 38
			
	DECLARE @AllRequestType INT = 0,
			@CheckInOut INT = 1,
			@LateInOut INT = 2,
			@ChangeShift INT = 3,
			@Leave INT = 4

	DECLARE @Pending VARCHAR = '%1%',
			@Approved VARCHAR = '4',
			@Reject VARCHAR = '5'

	---- Get CompanyIds ----
	DECLARE @CompanyId INT = (SELECT [Value] FROM NexHRM.dbo.SystemSetting WHERE [Name] = 'CompanyId')
	DECLARE @LumiCompanyId INT = (SELECT [Value] FROM LumiHRM.dbo.SystemSetting WHERE [Name] = 'CompanyId')
	DECLARE @NexVisionCompanyId INT = (SELECT [Value] FROM NexVisionHRM.dbo.SystemSetting WHERE [Name] = 'CompanyId')

	SELECT * FROM (
		SELECT wtr.Id AS RequestId,
			u.Code AS UnitCode,
			d.[Name] AS DepartmentName,
			eg.[Name] AS TeamName,
			wtr.RequestType,
			e.[NickName],
			wtr.FromDate,
			wtr.ToDate,
			wtr.TotalDays,
			wtr.CreatedDate,
			wtr.ModifiedDate,
			wtr.Remark,
			wtr.LeaveTypeID,
			wtr.IsCrossDate AS CrossDay,
			CASE 
				WHEN wtr.TotalDays = 0.5 THEN 1
				ELSE 0
			END IsHalfDay,
			CASE 
				WHEN wtr.[Status] = 1 THEN 1
				WHEN wtr.[Status] = 2 THEN 4
				WHEN wtr.[Status] = 3 THEN 5
			END [Status],
			lt.[Name] AS LeaveTypeName,
			CASE 
				WHEN LateInMins IS NULL and EarlyOutMins IS NULL THEN NULL
				WHEN LateInMins > 0 THEN LateInMins
				WHEN EarlyOutMins > 0 THEN EarlyOutMins
			END TotalMinutes,
			wtr.EmpId AS RequesterId,
			e.FullName AS RequesterFullName,
			e.NickName AS RequesterNickName,
			ape.EmpId AS ApproverId,
			ape.NickName AS ApproverNickName,
			@CompanyId AS CompanyId
		FROM NexHRM.dbo.WorkingTimeRequest wtr
			INNER JOIN NexHRM.dbo.Employee e ON wtr.EmpId = e.Id
			INNER JOIN NexHRM.dbo.EmployeeGroup eg ON eg.Id = e.GroupId
			LEFT JOIN NEXHRM.dbo.LeaveType lt ON lt.Id = wtr.LeaveTypeID
			INNER JOIN bodb_HRM.dbo.CompanyEmployee ape ON ape.EmpId = eg.LeaderId
			INNER JOIN bodb_HRM.dbo.Department d ON d.DepartmentId = eg.DepartmentId
			INNER JOIN bodb_HRM.dbo.Unit u ON u.UnitId = d.UnitId
		WHERE 
			(@requestType = @AllRequestType
				OR (@requestType = @CheckInOut AND wtr.RequestType IN (1, 2))
				OR (@requestType = @LateInOut AND wtr.RequestType IN (3, 4))
				OR (@requestType = @ChangeShift AND wtr.RequestType = 5)
				OR (@requestType = @Leave AND wtr.RequestType = 6)
				)
			AND (@empid = -1 OR @empid = wtr.EmpId)
			AND @SupervisorId = eg.LeaderId
			AND ((@IsQueryByCreatedDate = 1 AND wtr.CreatedDate BETWEEN @fromdate AND @todate)
				OR (@IsQueryByCreatedDate = 0 AND wtr.FromDate BETWEEN @fromdate AND @todate))
			AND (
				@leaveTypeId IS NULL
				OR (@leaveTypeId = @AnnualLeave AND wtr.LeaveTypeID = 2)
				OR (@leaveTypeId = @WeddingLeave AND wtr.LeaveTypeID = 6)
				OR (@leaveTypeId = @BusinessTrip AND wtr.LeaveTypeID = 9)
				OR (@leaveTypeId = @MaternityLeave AND wtr.LeaveTypeID = 13)
				OR (@leaveTypeId = @PaternityLeave AND wtr.LeaveTypeID = 27)
				OR (@leaveTypeId = @BereavementLeave AND wtr.LeaveTypeID = 22)
				OR (@leaveTypeId = @UnpaidLeave AND wtr.LeaveTypeID = 26)
				OR (@leaveTypeId = @CompanyEvent AND wtr.LeaveTypeID = 33)
				)
			AND (
				ISNULL(@status, '') = ''
				OR (@status LIKE @Pending AND wtr.[Status] = 1)
				OR (@status = @Approved AND wtr.[Status] = 2)
				OR (@status = @Reject AND wtr.[Status] = 3)
				)
			AND e.isDeleted = 0
		UNION ALL
		SELECT wtr.Id AS RequestId,
			u.Code AS UnitCode,
			d.[Name] AS DepartmentName,
			eg.[Name] AS TeamName,
			wtr.RequestType,
			e.[NickName],
			wtr.FromDate,
			wtr.ToDate,
			wtr.TotalDays,
			wtr.CreatedDate,
			wtr.ModifiedDate,
			wtr.Remark,
			wtr.LeaveTypeID,
			wtr.IsCrossDate AS CrossDay,
			CASE 
				WHEN wtr.TotalDays = 0.5 THEN 1
				ELSE 0
			END IsHalfDay,
			CASE 
				WHEN wtr.[Status] = 1 THEN 1
				WHEN wtr.[Status] = 2 THEN 4
				WHEN wtr.[Status] = 3 THEN 5
			END [Status],
			lt.[Name] AS LeaveTypeName,
			CASE 
				WHEN LateInMins IS NULL and EarlyOutMins IS NULL THEN NULL
				WHEN LateInMins > 0 THEN LateInMins
				WHEN EarlyOutMins > 0 THEN EarlyOutMins
			END TotalMinutes,
			wtr.EmpId AS RequesterId,
			e.FullName AS RequesterFullName,
			e.NickName AS RequesterNickName,
			ape.EmpId AS ApproverId,
			ape.NickName AS ApproverNickName,
			@LumiCompanyId AS CompanyId
		FROM LumiHRM.dbo.WorkingTimeRequest wtr
			INNER JOIN LumiHRM.dbo.Employee e ON wtr.EmpId = e.Id
			INNER JOIN LumiHRM.dbo.EmployeeGroup eg ON eg.Id = e.GroupId
			LEFT JOIN LumiHRM.dbo.LeaveType lt ON lt.Id = wtr.LeaveTypeID
			INNER JOIN bodb_HRM.dbo.CompanyEmployee ape ON ape.EmpId = eg.LeaderId
			INNER JOIN bodb_HRM.dbo.Department d ON d.DepartmentId = eg.DepartmentId
			INNER JOIN bodb_HRM.dbo.Unit u ON u.UnitId = d.UnitId
		WHERE 
			(@requestType = @AllRequestType
				OR (@requestType = @CheckInOut AND wtr.RequestType IN (1, 2))
				OR (@requestType = @LateInOut AND wtr.RequestType IN (3, 4))
				OR (@requestType = @ChangeShift AND wtr.RequestType = 5)
				OR (@requestType = @Leave AND wtr.RequestType = 6)
				)
			AND (@empid = -1 OR @empid = wtr.EmpId)
			AND @SupervisorId = eg.LeaderId
			AND ((@IsQueryByCreatedDate = 1 AND wtr.CreatedDate BETWEEN @fromdate AND @todate)
				OR (@IsQueryByCreatedDate = 0 AND wtr.FromDate BETWEEN @fromdate AND @todate))
			AND (
				@leaveTypeId IS NULL
				OR (@leaveTypeId = @AnnualLeave AND wtr.LeaveTypeID = 2)
				OR (@leaveTypeId = @WeddingLeave AND wtr.LeaveTypeID = 6)
				OR (@leaveTypeId = @BusinessTrip AND wtr.LeaveTypeID = 9)
				OR (@leaveTypeId = @MaternityLeave AND wtr.LeaveTypeID = 13)
				OR (@leaveTypeId = @PaternityLeave AND wtr.LeaveTypeID = 27)
				OR (@leaveTypeId = @BereavementLeave AND wtr.LeaveTypeID = 22)
				OR (@leaveTypeId = @UnpaidLeave AND wtr.LeaveTypeID = 26)
				OR (@leaveTypeId = @CompanyEvent AND wtr.LeaveTypeID = 33)
				)
			AND (
				ISNULL(@status, '') = ''
				OR (@status LIKE @Pending AND wtr.[Status] = 1)
				OR (@status = @Approved AND wtr.[Status] = 2)
				OR (@status = @Reject AND wtr.[Status] = 3)
				)
			AND e.isDeleted = 0
		UNION ALL
		SELECT wtr.Id AS RequestId,
			u.Code AS UnitCode,
			d.[Name] AS DepartmentName,
			eg.[Name] AS TeamName,
			wtr.RequestType,
			e.[NickName],
			wtr.FromDate,
			wtr.ToDate,
			wtr.TotalDays,
			wtr.CreatedDate,
			wtr.ModifiedDate,
			wtr.Remark,
			wtr.LeaveTypeID,
			wtr.IsCrossDate AS CrossDay,
			CASE 
				WHEN wtr.TotalDays = 0.5 THEN 1
				ELSE 0
			END IsHalfDay,
			CASE 
				WHEN wtr.[Status] = 1 THEN 1
				WHEN wtr.[Status] = 2 THEN 4
				WHEN wtr.[Status] = 3 THEN 5
			END [Status],
			lt.[Name] AS LeaveTypeName,
			CASE 
				WHEN LateInMins IS NULL and EarlyOutMins IS NULL THEN NULL
				WHEN LateInMins > 0 THEN LateInMins
				WHEN EarlyOutMins > 0 THEN EarlyOutMins
			END TotalMinutes,
			wtr.EmpId AS RequesterId,
			e.FullName AS RequesterFullName,
			e.NickName AS RequesterNickName,
			ape.EmpId AS ApproverId,
			ape.NickName AS ApproverNickName,
			@NexVisionCompanyId AS CompanyId
		FROM NexVisionHRM.dbo.WorkingTimeRequest wtr
			INNER JOIN NexVisionHRM.dbo.Employee e ON wtr.EmpId = e.Id
			INNER JOIN NexVisionHRM.dbo.EmployeeGroup eg ON eg.Id = e.GroupId
			LEFT JOIN NexVisionHRM.dbo.LeaveType lt ON lt.Id = wtr.LeaveTypeID
			INNER JOIN bodb_HRM.dbo.CompanyEmployee ape ON ape.EmpId = eg.LeaderId
			INNER JOIN bodb_HRM.dbo.Department d ON d.DepartmentId = eg.DepartmentId
			INNER JOIN bodb_HRM.dbo.Unit u ON u.UnitId = d.UnitId
		WHERE 
			(@requestType = @AllRequestType
				OR (@requestType = @CheckInOut AND wtr.RequestType IN (1, 2))
				OR (@requestType = @LateInOut AND wtr.RequestType IN (3, 4))
				OR (@requestType = @ChangeShift AND wtr.RequestType = 5)
				OR (@requestType = @Leave AND wtr.RequestType = 6)
				)
			AND 
			(@empid = -1 OR @empid = wtr.EmpId)
			AND @SupervisorId = eg.LeaderId
			AND ((@IsQueryByCreatedDate = 1 AND wtr.CreatedDate BETWEEN @fromdate AND @todate)
				OR (@IsQueryByCreatedDate = 0 AND wtr.FromDate BETWEEN @fromdate AND @todate))
			AND (
				@leaveTypeId IS NULL
				OR (@leaveTypeId = @AnnualLeave AND wtr.LeaveTypeID = 2)
				OR (@leaveTypeId = @WeddingLeave AND wtr.LeaveTypeID = 6)
				OR (@leaveTypeId = @BusinessTrip AND wtr.LeaveTypeID = 9)
				OR (@leaveTypeId = @MaternityLeave AND wtr.LeaveTypeID = 13)
				OR (@leaveTypeId = @PaternityLeave AND wtr.LeaveTypeID = 27)
				OR (@leaveTypeId = @BereavementLeave AND wtr.LeaveTypeID = 22)
				OR (@leaveTypeId = @UnpaidLeave AND wtr.LeaveTypeID = 26)
				OR (@leaveTypeId = @CompanyEvent AND wtr.LeaveTypeID = 33)
				)
			AND (
				ISNULL(@status, '') = ''
				OR (@status LIKE @Pending AND wtr.[Status] = 1)
				OR (@status = @Approved AND wtr.[Status] = 2)
				OR (@status = @Reject AND wtr.[Status] = 3)
				)
			AND e.isDeleted = 0
	) AS AllRequests
END