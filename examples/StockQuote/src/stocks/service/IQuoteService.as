package stocks.service
{
	import flash.events.IEventDispatcher;

	public interface IQuoteService extends IEventDispatcher
	{
		function getQuote(symbol:String):void;
	}
}