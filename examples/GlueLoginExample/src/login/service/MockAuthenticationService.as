package login.service
{
	import flash.events.EventDispatcher;
	
	import login.model.event.LoginExample;
	
	[Bindable]
	public class MockAuthenticationService extends EventDispatcher implements IAuthenticationService
	{
		public var email:String;
		public var authenticated:Boolean;
		
		public function login(username:String, password:String):void
		{
			if (username == "bob" && password == "bob")
			{
				authenticated = true;
				email = "bob@bob.com";
			}
			
			else
			{
				authenticated = false;
			}

			dispatchEvent(new Event(LoginExample.LOGIN));
		}
		
		public function logout():void
		{
			dispatchEvent(new Event(LoginExample.LOGOUT));
		}
	}
}