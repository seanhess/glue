package cafe.manager
{
	import cafe.model.Employee;
	import cafe.service.EmployeeUtils;
	import cafe.store.EmployeeStore;
	import cafe.store.NavigationStore;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class EmployeeManager
	{
		public var employees:EmployeeStore;
		public var navigation:NavigationStore;
		
		public var utils:EmployeeUtils;
		public var loadEmployeeService:HTTPService;
		
		public function loadEmployees():void
		{
			loadEmployeeService.addEventListener(ResultEvent.RESULT, onEmployeesLoaded);
			loadEmployeeService.addEventListener(FaultEvent.FAULT, onFault);
			loadEmployeeService.send();
		}
		
		private function onFault(event:FaultEvent):void
		{
			throw new Error("Fault: "+ event.fault);
		}
		
		private function onEmployeesLoaded(event:ResultEvent):void
		{
			loadEmployeeService.removeEventListener(ResultEvent.RESULT, onEmployeesLoaded);
			var employees:Array = utils.loadFromXML(event.result as XML);
			saveEmpoyeeList(employees);
		}
		
		public function goBack():void
		{
			navigation.mainPage = NavigationStore.EMPLOYEE_LIST;
		}
		
		public function saveEmpoyeeList(value:Array):void 
		{
			employees.employeeList = new ArrayCollection(value);
		}

		public function selectEmployee(value:Employee):void 
		{
			employees.employee = value;
			navigation.mainPage = NavigationStore.EMPLOYEE_DETAIL;
		}
		
		public function deleteEmployee (employee:Employee) : void 
		{
			employees.employeeList.removeItemAt(employees.employeeList.getItemIndex(employee));
			selectEmployee(null);
			navigation.mainPage = NavigationStore.EMPLOYEE_LIST;
		}
		
		public function newEmployee():void
		{
			saveEmployee(new Employee());
			navigation.mainPage = NavigationStore.EMPLOYEE_DETAIL;
		}

		public function saveEmployee (employee:Employee) : void {

			// assume the edited fields are not an existing employee, but a new employee
			// and set the ArrayCollection index to -1, which means this employee is not in our existing
			// employee list anywhere
			var dpIndex : int = -1;
			var employeeList:IList = employees.employeeList;
			
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
				utils.copyFrom(employeeList.getItemAt(dpIndex) as Employee, employee);
			}
			// otherwise, if it didn't match any existing employees
			else {
				// add the temp employee to the ArrayCollection
				var tempEmployee:Employee = new Employee();
					utils.copyFrom(tempEmployee,employee);
					
				employeeList.addItem(tempEmployee);
			}
			
			// clear out the selected employee
			selectEmployee(null);
			navigation.mainPage = NavigationStore.EMPLOYEE_LIST;
			
		}
	}
}