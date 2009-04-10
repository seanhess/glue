package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.behaviors.IBehavior;
	
	[Event(name="call", type="flash.events.Event")] 
	public class Route extends EventDispatcher implements IBehavior
	{		
		public var event:String;
		private var _find:Find;
		
		public function set target(value:*):void
		{
			if (_find)
			{
				for each (var target:* in _find.findAll(value))
					apply(target);
			}
			else
			{
				apply(value);
			}
		}
		
		public function set find(value:String):void
		{
			_find = new Find();
			_find.match = value;
		}
		
		protected function apply(target:IEventDispatcher):void
		{
			target.addEventListener(event, handler);
		}
		
		protected function handler(event:Event):void
		{
			Smart.setSource("event", event);
			dispatchEvent(new Event("call"));
		}
	}
}