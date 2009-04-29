package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
	 */
	[Event(name="result",type="net.seanhess.glue.RespondEvent")]
	[Event(name="fault", type="net.seanhess.glue.RespondEvent")]
	public class Respond extends EventDispatcher
	{
		public var resultEvent:String = ResultEvent.RESULT;
		public var faultEvent:String  = FaultEvent.FAULT;
		public var autoFinish:Boolean = true;
		
		public var instance:IEventDispatcher;
		
		public function start(instance:IEventDispatcher):void
		{
			this.instance = instance;
			instance.addEventListener(resultEvent, onResult);
			instance.addEventListener(faultEvent, onFault);
		}
		
		public function finish():void
		{
			instance.removeEventListener(resultEvent, onResult);
			instance.removeEventListener(faultEvent, onFault);
		}
		
		private function onResult(event:Event):void
		{
			if (autoFinish) finish();
			dispatchEvent(new RespondEvent(RespondEvent.RESULT, event));
		}
		
		private function onFault(event:Event):void
		{
			if (autoFinish) finish();
			dispatchEvent(new RespondEvent(RespondEvent.FAULT, event));
		}
		
		
	}
}