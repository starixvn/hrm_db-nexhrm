
CREATE   PROCEDURE [dbo].[Employee_GetGroupHandleRequest]	
	@id int
AS
/*
Created: 2012/05/22@Dan
Task: get group that handle request of an employee
DB: NexHR
Original: 

Revisions:    
Param's Explanation:
*/
BEGIN
	SELECT g.*
	FROM dbo.EmployeeGroup_Employee eg 
			LEFT JOIN dbo.EmployeeGroup g ON eg.Groupid=g.ID 					
	WHERE eg.EmpID=@id AND ISNULL(HandleRequest,0) = 1		
END