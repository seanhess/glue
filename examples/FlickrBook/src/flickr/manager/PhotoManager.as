package flickr.manager
{
	import mx.rpc.events.ResultEvent;
	import flickr.model.Photos;
	import flickr.model.Search;

	public class PhotoManager
	{
		public var photos:Photos;
		private var currentSearch:Search;
	
		public function getInterestingness():void
		{
			interestingness.send();
		}
		
		public function search(value:Search):void
		{
			currentSearch = value;
			searching.send();
		}
		
		private function onResult(event:ResultEvent):void
		{
			var list:Array = parser.parseXML(event.result as XML);
			this.photos.storePhotos(list);
		}
	
	
	}
}