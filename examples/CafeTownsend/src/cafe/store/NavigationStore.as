package cafe.store
{
	[Bindable]
	public class NavigationStore
	{
		public static const LOGIN_SCREEN:int = 0;
		public static const EMPLOYEE_LIST:int = 1;
		public static const EMPLOYEE_DETAIL:int = 2;
		
		public static const LOGGED_OUT:int = 0;
		public static const LOGGED_IN:int = 1;
		public static const LOGIN_FAILED:int = 2;
		
		public var mainPage:int = LOGIN_SCREEN;
		public var authState:int = LOGGED_OUT;
	}
}