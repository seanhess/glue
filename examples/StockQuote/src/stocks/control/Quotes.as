package stocks.control
{
	import flash.events.Event;
	
	import mx.rpc.events.ResultEvent;
	
	import net.seanhess.glue.Respond;
	
	import stocks.model.Quote;
	import stocks.service.IQuoteService;
	import stocks.service.QuoteServiceParser;

	public class Quotes
	{
		public var quoteService:IQuoteService;
		public var parser:QuoteServiceParser; // not an interface, but you could extend it to mock it
		
		public function getQuote(quote:Quote):void
		{
			var respond:Respond = new Respond(quoteService, quote);
				respond.result(onResult);
				respond.fault(onFault);
				
			quoteService.getQuote(quote.symbol);
		}
		
		private function onResult(event:ResultEvent, respond:Respond):void
		{
			var quote:Quote = respond.data as Quote;
			quote.price = parser.getPrice(event.result);
		}
		
		private function onFault(event:Event):void
		{
			trace("There was an error");
		}
	}
}