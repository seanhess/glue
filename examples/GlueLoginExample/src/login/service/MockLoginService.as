package login.service
{
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	/**
	 * can swap this out for the actual php services to get it to 
	 * work without an internet connection.
	 * 
	 * You should override the parsers too?
	 */
	[Bindable]
	public class MockLoginService extends HTTPService
	{
		public var result:Object = {
			response: {
				email: "henry@mydomain.com",
				authenticated: true
			}
		}
		
		override public function send(parameters:Object=null):AsyncToken
		{
			dispatchEvent(ResultEvent.createEvent(result));
			return null;
		}
	}
}