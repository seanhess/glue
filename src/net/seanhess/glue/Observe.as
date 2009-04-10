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
		public var subject:IEventDispatcher;
		public var event:String;
		public var method:String;
		public var arguments:Array;
		public var scope:Scope;
		
		public function set target(value:*):void
		{
			scope = new Scope();
			scope.target = value;
			
			var observe:Observe = this;
			
			subject.addEventListener(event, function(event:Event):void {
				// SCOPE // 
				scope.event = event;
				scope.subject = observe.subject;
				Smart.setScope(scope);
				
//				var func:Function = value[method] as Function;
//				func.apply(value, observe.arguments);
				dispatchEvent(new Event("call"));
			});	
		}
	}
}