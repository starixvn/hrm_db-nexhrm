
CREATE   PROCEDURE [dbo].[LeaveType_GetAll]
    @ExcludeNotShown bit = null
AS
BEGIN
    SET NOCOUNT ON;

    select * from LeaveType
    where (@ExcludeNotShown is null or isShown=1)
    order by [name] 
END