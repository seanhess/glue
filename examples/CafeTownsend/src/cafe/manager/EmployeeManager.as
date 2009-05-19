package cafe.manager
{
	import cafe.vo.Employee;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;

	public class EmployeeManager extends EventDispatcher 
	{	
		/*-.........................................Properties..........................................*/
		
		private var _employeeList:ArrayCollection;
		
		/*-.........................................Setters and Getters..........................................*/
		
		[Bindable (event="employeeListChanged")]
		public function get employeeList():ArrayCollection
		{
			return _employeeList;
		}
		
		private var _employee:Employee;
		
		[Bindable (event="employeeChanged")]
		public function get employee():Employee
		{
			return _employee;
		}
		
		/*-.........................................Methods..........................................*/
		
		// -----------------------------------------------------------
		public function saveEmpoyeeList(employees:Array):void {
			_employeeList = new ArrayCollection(employees);
			dispatchEvent(new Event('employeeListChanged'));
		}
		
		// -----------------------------------------------------------
		public function selectEmployee(employee:Employee):void {
			_employee = employee;
			dispatchEvent(new Event('employeeChanged'));
		}
		
		// -----------------------------------------------------------
		public function deleteEmployee (employee:Employee) : void {
			
			_employeeList.removeItemAt(_employeeList.getItemIndex(employee));

			// clear out the selected employee just in case
			selectEmployee(null);
		}

		// -----------------------------------------------------------
		public function saveEmployee (employee:Employee) : void {

			// assume the edited fields are not an existing employee, but a new employee
			// and set the ArrayCollection index to -1, which means this employee is not in our existing
			// employee list anywhere
			var dpIndex : int = -1;
			
			// loop thru the employee list
			for ( var i : uint = 0; i < employeeList.length; i++ ) {
				// if the emp_id of the incoming employee matches an employee already in the list
				if ( employeeList[i].emp_id == employee.emp_id ) {
					// set our ArrayCollection index to that employee position
					dpIndex = i;
				}
			}

			// if it was an existing employee already in the ArrayCollection
			if ( dpIndex >= 0 ) {
				// update that employee's values
				(employeeList.getItemAt(dpIndex) as Employee).copyFrom(employee);
			}
			// otherwise, if it didn't match any existing employees
			else {
				// add the temp employee to the ArrayCollection
				var tempEmployee:Employee = new Employee();
					tempEmployee.copyFrom(employee);
				employeeList.addItem(tempEmployee);
			}
			
			// clear out the selected employee
			selectEmployee(null);
			
		}
	}
}