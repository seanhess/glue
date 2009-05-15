package net.seanhess.glue.tags
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.behaviors.Listen;
	import net.seanhess.glue.core.IGlueAction;

	public class Route extends Listen implements IGlueAction
	{
//		public var from:IEventDispatcher;
		
		public function applyAction(target:*):void
		{
			this.target = target;
		}
		
//		override protected function getDispatcher(target:*):IEventDispatcher
//		{
//			var dispatcher:IEventDispatcher;
//			
//			if (from) 
//				dispatcher = from;
//
//			else
//				dispatcher = super.getDispatcher(target);
//			
//			return dispatcher;
//		}
		
//		override protected function eventFiring(target:*, event:Event):void
//		{
//			super.eventFiring(target, event);
//			(parent.selector as Glue).setCurrentInstance(target);
//		}
	}
}