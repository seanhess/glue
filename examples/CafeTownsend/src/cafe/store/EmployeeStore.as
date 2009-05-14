package cafe.store
{
	import cafe.model.Employee;
	
	import mx.collections.IList;

	[Bindable]
	public class EmployeeStore
	{
		public var employeeList:IList;
		public var employee:Employee;
	}
}