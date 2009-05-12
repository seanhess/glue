package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	/**
	 * Usage: See online docs
	 */
	public class Observe extends GlueListen
	{		
		public function set model(value:IEventDispatcher):void
		{
			on = value;
		}
		
		public function set service(value:IEventDispatcher):void
		{
			on = value;
		}
	}
}