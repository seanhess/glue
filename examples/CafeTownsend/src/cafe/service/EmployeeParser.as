package cafe.service
{
	import com.cafetownsend.vos.Employee;
	
	public class EmployeeParser
	{
		
		/*-.........................................Methods..........................................*/
		
		public function loadEmployeesFromXML(employees:XML):Array 
		{
			var employeeList:Array = new Array();
				
			for each( var thisEmployee:XML in employees..employee ) 
			{
				var employee:Employee = new Employee();
				employee.email = thisEmployee.email;
				employee.emp_id = thisEmployee.emp_id;
				employee.firstname = thisEmployee.firstname;
				employee.lastname = thisEmployee.lastname;
				employee.startdate = new Date(Date.parse(thisEmployee.startdate));
			
				employeeList.push(employee);
			}
			
			return employeeList;
		}

	}
}