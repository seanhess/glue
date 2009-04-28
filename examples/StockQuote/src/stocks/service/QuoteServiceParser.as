package stocks.service
{    
    

	/**    
	 * Services are helper classes. In this case, a parser
	 * 
	 * You could also have a separate class with your actual
	 * web services
	 */
    public class QuoteServiceParser
    {        
        public function getPrice(info:Object):Number {
        	try {
    	    	var price:Number = info.quote.stock.price.current;
	        	return price;
        	}
        	catch (e:Error)
        	{
        	}
    		return NaN;
        }
        
    }
}