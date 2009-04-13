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
		
		public var enableDebug:Boolean = true;
		
		public function apply(target:*):void
		{			
			var dispatcher:IEventDispatcher = target as IEventDispatcher;
			
			if (on) 
			{
				(parent.selector as Glue).setCurrentInstance(target);
				dispatcher = on;
			}
			
			if (enableDebug) debug.log("[ √ ] Observe("+event+") - " + dispatcher);
			
			if (dispatcher == null)
				throw new Error("Target was not IEventDispatcher: " + target);
			
			dispatcher.addEventListener(event, function(event:Event):void {

				(parent.selector as Glue).setCurrentInstance(target);
				
				var message:String = "[ -> ] Observe("+event.type+") - " + event.target;
				
				if (on)
					message += " -> " + (parent.selector as Glue);
					
				if (enableDebug) debug.log(message);

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