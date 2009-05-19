package cafe.manager
{
	import cafe.vo.Authentication;
	
	[Bindable]
	public class AuthorizationManager
	{
		public var state:String = Authentication.LOGOUT;
		
		public function login(username:String, password:String):void 
		{
			//check hardcoded username and password
			if (username == 'Flex' && password == 'Glue') 
			{
				state = Authentication.AUTHENTICATED;
			}
			else
			{
				state = Authentication.FAILED;
			}
		}
		
		public function logout():void
		{
			state = Authentication.LOGOUT;
		}
	}
}