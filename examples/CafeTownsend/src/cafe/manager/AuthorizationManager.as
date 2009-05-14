package cafe.manager
{
	import cafe.store.NavigationStore;
	
	public class AuthorizationManager
	{
		public var navigation:NavigationStore;
		
		public function login(username:String, password:String):Boolean 
		{
			if (username == 'Flex' && password == 'Glue') 
			{
				navigation.mainPage = NavigationStore.EMPLOYEE_LIST;
				navigation.authState = NavigationStore.LOGGED_IN;
			}
			else
			{
				navigation.authState = NavigationStore.LOGIN_FAILED;
			}
			
			return false;
		}
		
		public function logout():void
		{
			navigation.mainPage = NavigationStore.LOGIN_SCREEN;
			navigation.authState = NavigationStore.LOGGED_OUT;
		}
	}
}