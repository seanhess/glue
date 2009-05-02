package stocks.service
{
	import flash.events.IEventDispatcher;

	public interface IQuoteHTTPService extends IEventDispatcher
	{
		function getQuote(symbol:String):void;
	}
}