package stocks.service
{
	import mx.rpc.http.HTTPService;

	public class QuoteService extends HTTPService implements IQuoteService
	{
		private const URL:String = "http://judstephenson.com/api/Quotes/Realtime/";
		
		public function getQuote(symbol:String):void
		{
			this.url = URL + symbol;	
			send();
		}
	}
}