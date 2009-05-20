package com.flickrBook.service
{
	import com.flickrBook.events.SearchEvent;
	import flash.events.IEventDispatcher;
	
	public class FlickrHelper 
	{
		
		/*-.........................................Properties..................................*/
		public var dispatcher:IEventDispatcher;
		
		
		/*-.........................................Methods..................................*/
		public function prepareSearch(user:String, tags:String):void
		{
			var event:SearchEvent;
			if(user && user.length > 0)
			{
				event = new SearchEvent(SearchEvent.FIND_USER);
				
			}
			else if(tags)
			{
				event = new SearchEvent(SearchEvent.SEARCH);
			}
			else
			{
				event = new SearchEvent(SearchEvent.INTERESTINGNESS);
			}
			
			event.user = user;
			event.tags = tags;
			dispatcher.dispatchEvent(event);
		}
		
	
	}
}