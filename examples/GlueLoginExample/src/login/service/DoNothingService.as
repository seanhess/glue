package login.service
{
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class DoNothingService extends HTTPService
	{
		override public function send(parameters:Object=null):AsyncToken
		{
			dispatchEvent(ResultEvent.createEvent(true));
			return null;
		}
	}
}