package login.model
{
	import flash.events.EventDispatcher;
	
	[Bindable]
	public class Navigation extends EventDispatcher
	{
		public static const LOGGED_OUT:String = "loggedOut";
		public static const LOGGED_IN:String = "loggedIn";
		
		public var showLogin:Boolean = true;
		
		public function loggedIn():void
		{
			showLogin = false;
			dispatchEvent(new Event(LOGGED_IN));
		}
		
		public function loggedOut():void
		{
			showLogin = true;
			dispatchEvent(new Event(LOGGED_OUT));
		}
	}
}