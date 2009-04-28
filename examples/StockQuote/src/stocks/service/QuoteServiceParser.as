package stocks.service
{    
    
    // --------------------------------------------
    // This helper class parses data coming from the
    // stock quotes web service and converts it into 
    // an object
    
    public class QuoteServiceParser
    {        
        // --------------------------------------------
        // The webservice returns a string representation
        // of an xml object. We first convert to xml 
        // and then get the properties from it
        public function getPrice(info:Object):Number {
        	try {
    	    	var price:Number = info.quote.stock.price.current;
	        	return price;
        	}
        	catch (e:Error)
        	{
        	}
    		return 0;
        }
        
    }
}