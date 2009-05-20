package com.flickrBook.vos
{
	import flash.events.EventDispatcher;
	
	[Bindable]		
	public class Photo extends EventDispatcher
	{
		public var id:uint = 0;
		public var title:String = '';
		public var url:String = '';	
		public var farmId:uint = 0;
		public var description:String = '';
		public var secret:String = '';
		public var isPublic:Boolean = false;
		public var serverId:uint = 0;
		public var sizes:Array = new Array();
		
		
		[Bindable (event="photoChange")]
		public function get urlSmallSquare():String {
			return 'http://farm' + farmId + '.static.flickr.com/' + serverId + '/' + id + '_' + secret + '_s.jpg';
		}
		
		[Bindable (event="photoChange")]
		public function get urlMedium():String {
			return 'http://farm' + farmId + '.static.flickr.com/' + serverId + '/' + id + '_' + secret + '.jpg';
		}
		
		[Bindable (event="photoChange")]
		public function get urlSmall():String {
			return 'http://farm' + farmId + '.static.flickr.com/' + serverId + '/' + id + '_' + secret + '_m.jpg';
		}

	}
}