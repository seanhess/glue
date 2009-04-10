package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.behaviors.IBehavior;
	import net.seanhess.bifff.scope.IScopeable;
	import net.seanhess.bifff.scope.Scope;
	
	[Event(name="call", type="flash.events.Event")] 
	public class Observe extends EventDispatcher implements IBehavior, IScopeable
	{		
		private var _on:IEventDispatcher;
		public var event:String;
		[Bindable] public var parent:Scope;
		
		public function set target(value:*):void
		{
			apply(value);
		}
		
		protected function apply(target:IEventDispatcher):void
		{
			var dispatcher:IEventDispatcher = target;
			
			if (on) 
			{
				(parent.selector as Glue).setCurrentInstance(target);
				dispatcher = on;
			}
			
			dispatcher.addEventListener(event, function(event:Event):void {

				(parent.selector as Glue).setCurrentInstance(target);

				var scope:Scope = new Scope();
				scope.item = target;
				scope.event = event;
				Smart.setScope(scope);
				
				dispatchEvent(new Event("call"));
				
			});
		}
		
		public function set on(value:IEventDispatcher):void
		{
			_on = value;
		}
		
		public function get on():IEventDispatcher
		{
			return _on;
		}
	}
}