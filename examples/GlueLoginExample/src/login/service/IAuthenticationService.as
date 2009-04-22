package login.service
{
	import flash.events.IEventDispatcher;
	
	/**
	 * There are two problems with this approach. 
	 * 
	 */ 
	public interface IAuthenticationService extends IEventDispatcher
	{
		function login(username:String, password:String):void;
		function logout():void;
		function get email():String;
		function get authenticated():Boolean;
	}
}