

CREATE PROCEDURE [dbo].[HistoryWork_GetJobtitleAndTeam] @Id INT
AS
/*
Created: 
Task: get employee job title and team info
DB: NexHR
Original: 

Revisions:    
Param's Explanation:
*/
BEGIN
	SET NOCOUNT ON;

	SELECT Id
		,EmpId
		,AffectedDate
		,GroupId
		,JobTitleId
				
	FROM HistoryWork(NOLOCK)
	WHERE Id = @Id
END