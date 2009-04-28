package login.control
{
	import flash.events.Event;
	
	import login.model.event.LoginExample;
	import login.service.IAuthenticationService;
	
	
	/**
	 * Controllers responsible for providing application-level
	 * functionality. They provide a set of funtions that can
	 * be called to do anything in the system. 
	 * 
	 * They then manipulate the data.
	 * 
	 * I have the logic for the services in a separate file, 
	 * because I want to be able to swap out service 
	 * implementations and still test this one.  
	 */
	
	[Bindable]
	public class Authentication
	{	
		public var authenticated:Boolean = false;
		public var email:String;
		
		/**
		 * implementation is injected from the map
		 */
		public var authService:IAuthenticationService;
		
		public function login(username:String, password:String):void
		{
			authService.addEventListener(LoginExample.LOGIN, onLogin);
			authService.login(username, password);
		}
		
		private function onLogin(event:Event):void
		{
			authenticated = authService.authenticated;
			email = authService.email; // or in the result or something...
			
			if (authenticated)
				dispatchEvent(new Event(LoginExample.LOGIN));
			
			else
				dispatchEvent(new Event(LoginExample.FAIL)); 
		}
		
		public function logout():void
		{
			authService.addEventListener(LoginExample.LOGOUT, onLogout);
			authService.logout();
		}
		
		private function onLogout(event:Event):void
		{
			authenticated = false;
			email = null;
			dispatchEvent(new Event(LoginExample.LOGOUT));
		}
		
	}
}