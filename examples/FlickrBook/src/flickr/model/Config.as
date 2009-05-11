package flickr.model
{
	import flash.events.EventDispatcher;

	[Bindable]
	public class Config extends EventDispatcher
	{
		public static const LOADED:String = "loaded";
		
		public var url:String = 'http://api.flickr.com/services/rest/';
		public var key:String = '';		
		
		public function setValues(url:String, key:String):void
		{
			this.url = url;
			this.key = key;
			dispatchEvent(new Event(LOADED));	
		}
	}
}