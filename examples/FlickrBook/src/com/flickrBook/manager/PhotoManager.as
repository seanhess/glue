package com.flickrBook.manager
{	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	public class PhotoManager extends EventDispatcher
	{	
		private var _currentSet:ArrayCollection;
		
		[Bindable (event="currentSetChange")]
		public function get currentSet():ArrayCollection
		{
			return _currentSet;
		}
		
		public function setPhotos(photos:Array):void
		{
			_currentSet = new ArrayCollection(photos);
			dispatchEvent( new Event('currentSetChange'))
		}
		
	}
}