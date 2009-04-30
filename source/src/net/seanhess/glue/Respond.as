package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class Respond
	{
		public var service:IEventDispatcher;
		public var data:*;
		public var handlers:Dictionary;
		public var autoClean:Boolean = true;
		public var uid:String = Math.random().toString(); 
		
		public function Respond(service:IEventDispatcher, data:*=null, autoClean:Boolean = true)
		{
			this.service = service;
			this.data = data;
			this.autoClean = autoClean;
			handlers = new Dictionary(true);
		}
		
		public function listen(type:String, handler:Function):void
		{
			service.addEventListener(type, this.callback);
			handlers[type] = handler;
		}
		
		public function result(handler:Function):void
		{
			listen(ResultEvent.RESULT, handler);
		}
		
		public function fault(handler:Function):void
		{
			listen(FaultEvent.FAULT, handler);
		}
		
		protected function callback(event:Event):void
		{
			var handler:Function = handlers[event.type];
		
			try 
			{
				handler(event, this);
			}
			
			catch (mainError:ArgumentError) 
			{
				try 
				{
					handler(event);
				}
				catch (subError:ArgumentError) 
				{
					throw new Error("Could not determine how to call handler for event " + event.type);	
				}
			}
			
			if (autoClean)
				clean();
				
			else
				remove(event.type);
		}
		
		public function clean():void
		{			
			for (var type:String in handlers)
				remove(type);
				
			service = null;
			data = null;
			handlers = null; 
		}
		
		public function remove(type:String):void
		{
			delete handlers[type];
			service.removeEventListener(type, this.callback);
		}
		
	}
}