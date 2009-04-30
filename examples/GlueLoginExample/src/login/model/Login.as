package login.model
{
	import flash.events.Event;
	
	[Bindable]
	[Event(name="reset", type="flash.events.Event")]
	public class Login
	{
		public static const LOGIN:String = "login"; 
		public static const LOGOUT:String = "logout"; 
		public static const RESET:String = "reset"; 
		
		public var username:String;
		public var password:String;
		
		public var waiting:Boolean = false;
		public var failed:Boolean = false;
		
		public function reset():void
		{
			username = "";
			password = "";
			waiting = false;
			failed = false;
			dispatchEvent(new Event(RESET));
		}
		
		public function start():void
		{
			waiting = true;
			failed = false;
		}
	}
}