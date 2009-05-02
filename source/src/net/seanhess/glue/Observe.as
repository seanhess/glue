package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.behaviors.Listen;
	
	/**
	 * Usage: <Observe controller="{myController}" event="eventType" call="me.doAction()"/>
	 * 
	 * Use this tag to listen to events fired from a controller, and respond to them with 
	 * your current view or controller.
	 */
	[Event(name="call", type="flash.events.Event")] 
	public class Observe extends Listen implements IGlueAction
	{		
		protected var on:IEventDispatcher;
		
		public function applyAction(target:*):void
		{
			this.target = target;
		}

		public function set model(value:IEventDispatcher):void
		{
			on = value;
		}
		
		public function set service(value:IEventDispatcher):void
		{
			on = value;
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