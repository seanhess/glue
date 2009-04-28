package login.model
{
	[Bindable]
	public class Login
	{
		public static const LOGIN:String = "login";
		public static const LOGOUT:String = "logout";
		public static const FAIL:String = "fail";
		
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
		}
	}
}