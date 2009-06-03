package net.seanhess.glue.tags
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import net.seanhess.bifff.core.Scope;

	[Event(name="call", type="flash.events.Event")]
	dynamic public class Action extends Proxy implements IEventDispatcher
	{
		public var watch:IEventDispatcher;
		protected var dispatcher:IEventDispatcher = new EventDispatcher();
		protected var listeners:Dictionary = new Dictionary();

		public function execute():void 
		{
			addListeners();
			dispatchEvent(new Event("call"));
		}
		
		protected function addListeners():void
		{			
			for (var event:String in listeners)
				listen(event, listeners[event]);
		}
		
		protected function removeListeners():void
		{
			if (watch == null) return;
			
			for (var event:String in listeners)
				watch.removeEventListener(event, handler);
		}
		
		override flash_proxy function setProperty(name:*, value:*):void
		{
			if (value is Action)
				value = [value];
				
			if (value is String)
				return;
			
			if (!(value is Array))
				throw new Error("Use <eventName> to specify a list of actions to perform");
			
			listeners[name] = value;
		}
		
		protected function listen(name:*, value:*):void
		{
			if (watch == null)
				throw new Error("Set watch in order to listen to events");
				
			watch.addEventListener(name, handler);
		}
		
		protected function handler(event:Event):void
		{
			removeListeners();
			updateScope(event);
			runActions(event);
		}
		
		protected function updateScope(event:Event):void
		{
			var scope:Scope = new Scope();
				scope.parent = Scope.current;
				scope.event = event;
				scope.target = watch;
				
			Scope.current = scope;	
		}
		
		protected function runActions(event:Event):void
		{
			for each (var action:Action in listeners[event.type])
				action.execute(); 
		}
			
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		public function dispatchEvent(event:Event):Boolean
		{
			return dispatcher.dispatchEvent(event);
		}
 	 	
		public function hasEventListener(type:String):Boolean
		{
			return dispatcher.hasEventListener(type);	
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			dispatcher.removeEventListener(type, listener, useCapture);
		}
 	 	
		public function willTrigger(type:String):Boolean
		{
			return dispatcher.willTrigger(type);
		}
	}
}