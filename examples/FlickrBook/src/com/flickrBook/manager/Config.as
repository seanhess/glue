package com.flickrBook.manager
{
	[Bindable]
	public class Config
	{
		public var url:String = 'http://api.flickr.com/services/rest/';
		public var key:String = '';
		
		public function readConfig(xml:XML):void
		{
			key = xml..api_key;
			url = xml..url;
		}
	}
}