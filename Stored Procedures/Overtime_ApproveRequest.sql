/*<info serverAlias="HRM-NexHRM,HRM-LumiHRM,HRM-NexVisionHRM" executers="wsv_hrm" isFunction="0"></info>*/

CREATE PROCEDURE [dbo].[Overtime_ApproveRequest]
(
	@Id INT
    ,@ModifiedBy INT
    ,@ErrCode INT = 0 OUTPUT
    ,@ErrMsg VARCHAR(200) = '' OUTPUT
)
AS
/*
Created: 20160129@Razor.Nguyen
Task: OT Feature.
DB: NexHRM

Revisions:  
	- 20200316Merlin.Le: Enhance NEX balance request
	- 20200731Dwight.Tran: Enhance NEX Request  
	- 20250327@Henry: Update MGT Code -> MGT/COR code
Param's Explanation:
*/
BEGIN
    SET NOCOUNT ON;
	DECLARE @CoreTeamId INT = 0;

	SELECT @CoreTeamId = g.GroupId
	FROM bodb_HRM.dbo.[Group] AS g WITH (NOLOCK)
	    INNER JOIN dbo.SystemSetting AS ss WITH (NOLOCK) ON g.GroupTeamId = ss.[Value]
	    AND ss.[Name] = 'CoreTeamId'

    DECLARE @PendingStatus INT = 1
		,@ApprovedStatus INT = 2;

	IF NOT EXISTS (
			SELECT 1
			FROM [dbo].[Overtime] WITH (NOLOCK)
			WHERE [OvertimeId] = @Id
		)
	BEGIN
		SELECT
			@ErrCode = 1
			,@ErrMsg = 'NEX request is not exist';

		RETURN
	END

	IF NOT EXISTS (
			SELECT 1
			FROM [dbo].[Overtime] WITH (NOLOCK)
			WHERE [OvertimeId] = @Id
				AND [Status] = @PendingStatus
		)
	BEGIN
		SELECT
			@ErrCode = 2
			,@ErrMsg = 'You only can approve the pending NEX request';

		RETURN
	END

    IF NOT EXISTS (
            SELECT 1
            FROM [dbo].[Employee] e WITH (NOLOCK)
			INNER JOIN bodb_HRM.dbo.[Group] AS g WITH (NOLOCK) ON e.[GroupId] = g.[GroupId]
			WHERE e.[Id] = @ModifiedBy
				AND g.[GroupId] = @CoreTeamId
        )
	BEGIN
		SELECT
			@ErrCode = 3
			,@ErrMsg = 'Only managers have a permisson to aprove NEX request'

		RETURN
	END

    BEGIN TRY
        BEGIN TRANSACTION

        UPDATE [dbo].[Overtime] WITH (ROWLOCK, UPDLOCK)
        SET [Status] = @ApprovedStatus
            ,[ModifiedBy] = @ModifiedBy
            ,[ModifiedDate] = dbo.fnc_GetClientDateTime()
        WHERE [OvertimeId] = @Id AND [Status]=1 -- pending;

		COMMIT TRANSACTION
    END TRY

    BEGIN CATCH
        SELECT @ErrCode = 1000
            ,@ErrMsg = 'Approve NEX request failed';

		ROLLBACK TRANSACTION
    END CATCH
END