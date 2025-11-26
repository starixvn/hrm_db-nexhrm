/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

ALTER PROCEDURE [dbo].[Employee_Delete]
(
    @empId INT
    ,@ModifiedBy INT = NULL
    ,@ErrCode INT = 0 OUTPUT
    ,@ErrMsg VARCHAR(200) = '' OUTPUT
)
AS
/*
    Created: 20160218@Quinn.Vo
    Task: Delete employee
    DB: NexHRM

    Revisions:
        20250819@Tim: restructure [Redmine: #235678]
        20251126@Tim: remove update ResignedDate
    Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;

    UPDATE bodb_HRM.dbo.CompanyEmployee WITH (ROWLOCK)
    SET isDeleted = 1
        ,[Enabled] = 0
        ,ModifiedBy = @ModifiedBy
        ,ModifiedDate = GETDATE()
    WHERE EmpId = @empId
END