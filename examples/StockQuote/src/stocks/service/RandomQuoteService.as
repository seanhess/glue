package stocks.service
{
	import flash.events.EventDispatcher;
	
	import mx.rpc.events.ResultEvent;

	public class RandomQuoteService extends EventDispatcher implements IQuoteService
	{
		public function getQuote(symbol:String):void
		{
			var price:String = (Math.random() * 1000).toFixed(2);
			var result:Object = {quote:{stock:{price:{current:price}}}}
			dispatchEvent(ResultEvent.createEvent(result));
		}		
	}
}