package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.behaviors.IBehavior;
	import net.seanhess.bifff.scope.Scope;
	
	[Event(name="call", type="flash.events.Event")] 
	public class Route extends EventDispatcher implements IBehavior
	{		
		public var event:String;
		private var _find:Find;
		public var scope:Scope;
		
		public function set target(value:*):void
		{
			if (_find)
			{
				var targets:Array = _find.findAll(value);
				
				if (targets.length == 0)
					throw new Error("Could not find " + _find.match + " on " + value);
					
				for each (var target:* in targets)
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
			// SMART // 
			scope = new Scope();
			scope.target = event.target;
			scope.event = event;
			Smart.setScope(scope);
			
			dispatchEvent(new Event("call"));
		}
	}
}