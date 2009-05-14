package cafe.service
{
	import cafe.model.Employee;

	public class EmployeeUtils
	{
		public function loadFromXML(employees:XML):Array 
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
		
		public function copyFrom(employee:Employee, newEmployee:Employee):void 
		{
			employee.emp_id = newEmployee.emp_id;
			employee.email = newEmployee.email;
			employee.firstname = newEmployee.firstname;
			employee.lastname = newEmployee.lastname;
			employee.startdate = newEmployee.startdate;
		}

	}
}