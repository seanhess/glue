package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.behaviors.IBehavior;
	import net.seanhess.bifff.scope.Scope;
	
	[Event(name="call", type="flash.events.Event")] 
	public class Observe extends EventDispatcher implements IBehavior
	{		
		public var on:IEventDispatcher;
		public var event:String;
		
		public function set target(value:*):void
		{
			apply(value);
		}
		
		protected function apply(target:IEventDispatcher):void
		{
			var dispatcher:IEventDispatcher = target;
			
			if (on) dispatcher = on;
			
			dispatcher.addEventListener(event, function(event:Event):void {

				var scope:Scope = new Scope();
				scope.item = target;
				scope.event = event;
				Smart.setScope(scope);
				
				dispatchEvent(new Event("call"));
				
			});
		}
	}
}