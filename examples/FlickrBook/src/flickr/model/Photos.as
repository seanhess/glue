package flickr.model
{	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class Photos extends EventDispatcher
	{	
		public var currentSet:ArrayCollection;

		public function storePhotos(photos:Array):void
		{	
			currentSet = new ArrayCollection(photos);
		}
	}
}