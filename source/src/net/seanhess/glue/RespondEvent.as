package net.seanhess.glue
{
	import flash.events.Event;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class RespondEvent extends Event
	{
		public static const RESULT:String = ResultEvent.RESULT;
		public static const FAULT:String = FaultEvent.FAULT;
		
		public var source:*;
		
		public function RespondEvent(type:String, source:*):void
		{
			this.source = source;
			super(type);
		}
	}
}