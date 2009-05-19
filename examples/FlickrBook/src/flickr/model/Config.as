package flickr.models
{
	import flash.events.EventDispatcher;

	[Bindable]
	public class Config
	{
		public var url:String = 'http://api.flickr.com/services/rest/';
		public var key:String = '';		
		
		public function setValues(url:String, key:String):void
		{
			this.url = url;
			this.key = key;
		}
	}
}