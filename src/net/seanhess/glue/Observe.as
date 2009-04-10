package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.scope.IScopeable;
	import net.seanhess.bifff.scope.Scope;
	
	[Event(name="call", type="flash.events.Event")] 
	public class Observe extends EventDispatcher implements IGlueAction, IScopeable
	{		
		private var _on:IEventDispatcher;
		public var event:String;
		[Bindable] public var parent:Scope;
		
		public function apply(target:*):void
		{			
			var dispatcher:IEventDispatcher = target;
			
			if (on) 
			{
				(parent.selector as Glue).setCurrentInstance(target);
				dispatcher = on;
			}
			
			debug.log("[ √ ] Observe("+event+") - " + dispatcher);
			
			dispatcher.addEventListener(event, function(event:Event):void {

				(parent.selector as Glue).setCurrentInstance(target);
				
				var message:String = "[ -> ] Observe("+event.type+") - " + event.target;
				
				if (on)
					message += " -> " + (parent.selector as Glue);
					
				debug.log(message);

				var scope:Scope = new Scope();
				scope.item = target;
				scope.event = event;
				Smart.setScope(scope);
				
				dispatchEvent(new Event("call"));
				
			});
		}
		
		public function set target(value:IEventDispatcher):void
		{
			_on = value;
		}
		
		public function get on():IEventDispatcher
		{
			return _on;
		}
		
		public function get debug():Debug
		{
			return Debug.instance;
		}
	}
}