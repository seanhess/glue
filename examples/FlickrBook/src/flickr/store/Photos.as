package flickr.store
{	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class Photos extends EventDispatcher
	{	
		public var currentSet:ArrayCollection;
	}
}