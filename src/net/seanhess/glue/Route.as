package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Event(name="call", type="flash.events.Event")] 
	public class Route extends EventDispatcher
	{		
		public var event:String;
		
		public function set targets(value:Array):void
		{
			for each (var target:IEventDispatcher in value)
				target.addEventListener(event, handler);
		}
		
		protected function handler(event:Event):void
		{
			Smart.setSource("event", event);
			dispatchEvent(new Event("call"));
		}
	}
}