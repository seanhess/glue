package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.behaviors.Listen;

	[Event(name="call", type="flash.events.Event")] 
	public class GlueListen extends Listen implements IGlueAction
	{
		protected var on:IEventDispatcher;
		
		public function applyAction(target:*):void
		{
			this.target = target;
		}
		
		override protected function getDispatcher(target:*):IEventDispatcher
		{
			var dispatcher:IEventDispatcher;
			
			if (on) 
				dispatcher = on;

			else
				dispatcher = super.getDispatcher(target);
			
			return dispatcher;
		}
		
		override protected function eventFiring(target:*, event:Event):void
		{
			super.eventFiring(target, event);
			(parent.selector as Glue).setCurrentInstance(target);
		}
	}
}