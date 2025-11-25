/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

ALTER VIEW [dbo].[EmployeeSupDetail]
AS
SELECT 
    esup.EmpId,
    esup.NickName,
    esup.FullName,
    esup.ApproverId,
    CASE 
        WHEN c.Name IS NOT NULL THEN ce.NickName + ' (' + c.Name + ')'
        ELSE ce.NickName
    END AS ApproverNickName,
    sup.FullName AS ApproverFullName,
    esup.IsPrivateSetting
FROM 
(
    SELECT 
        e.Id AS EmpId,
        e.NickName,
        e.FullName,
        CASE 
            WHEN es.ApproverId IS NULL THEN gs.ApproverId 
            ELSE es.ApproverId 
        END AS ApproverId,
        CAST(
            CASE 
                WHEN es.ApproverId IS NOT NULL THEN 1 
                ELSE 0
            END AS BIT
        ) AS IsPrivateSetting
    FROM dbo.Employee AS e WITH (NOLOCK)
    LEFT OUTER JOIN dbo.GroupSupervisor AS gs WITH (NOLOCK)
        ON e.GroupId = gs.GroupId 
        AND gs.IsDeleted = 0
        AND e.Id <> gs.ApproverId
    LEFT OUTER JOIN dbo.EmployeeSupervisor AS es WITH (NOLOCK)
        ON e.Id = es.EmpId
        AND es.IsDeleted = 0
        AND e.Id <> es.ApproverId
    WHERE
        e.isDeleted = 0 AND (
            gs.ApproverId IS NOT NULL OR
            es.ApproverId IS NOT NULL
        )
) AS esup
INNER JOIN bodb_HRM.dbo.CompanyEmployee AS ce WITH (NOLOCK) ON ce.EmpId = esup.ApproverId
	AND ISNULL(ce.IsDeleted, 0) = 0
	AND ISNULL(ce.Enabled, 1) = 1
INNER JOIN bodb_HRM.dbo.Employee AS sup WITH (NOLOCK) ON ce.UserId = sup.UserId
LEFT JOIN bodb_HRM.dbo.Company AS c WITH (NOLOCK) ON c.CompanyId = ce.CompanyId
	AND c.CompanyId != (SELECT [Value] FROM [dbo].[SystemSetting] WHERE [Name] = 'CompanyId')