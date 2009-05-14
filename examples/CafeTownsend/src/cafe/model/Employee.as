package cafe.model
{
	
	/**
	 * An object representing an employee
	 */
	[Bindable]
	public class Employee 
	{
		public var emp_id : uint;
		public var firstname : String;
		public var lastname : String;
		public var email : String;
		public var startdate : Date;
	}
}