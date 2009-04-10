package net.seanhess.glue
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Proxy;
	
	import net.seanhess.bifff.behaviors.IBehavior;
	import net.seanhess.bifff.behaviors.Select;
	import net.seanhess.bifff.utils.TargetRegistry;
	
	dynamic public class Material extends Proxy implements IBehavior, IEventDispatcher
	{
		protected var select:Select;
				
		public var registry:TargetRegistry = new TargetRegistry(apply);

		public function set target(value:*):void
		{
			if (select)
			{
				select.actions = [this.clone()];
				select.target = value;
			}
			else
			{
				registry.applyTargets(value);
			}
		}
		
		public function apply(target:*):void
		{
		}
		
		public function set find(value:String):void
		{
			select = new Select();
			select.direction = Select.SEARCH_CHILDREN;
			select.match = value;
		}
		
		public function clone():Material
	    {
	    	return new Material();
	    }
	    
	    
	    
	    
	    
	    ///////// IEVENTIDSPATCHER ////////////
	    
	    protected var dispatcher:IEventDispatcher = new EventDispatcher();
	    
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