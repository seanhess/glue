package net.seanhess.glue
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import net.seanhess.bifff.scope.IScopeable;
	import net.seanhess.bifff.scope.Scope;
	import net.seanhess.bifff.utils.Invalidator;
	import net.seanhess.bifff.utils.TargetRegistry;
	
	/**
	 * Sets styles (setStyle) and properties. 
	 * 
	 * Can be used for setter-based Dependency Injection
	 * 
	 * If the property is updated on the setter, it will update all the views  
	 */
	dynamic public class Inject extends Proxy implements IGlueAction, IScopeable
	{
		protected var values:Object = {};
		protected var updates:Object = {};
		protected var invalidator:Invalidator = new Invalidator(commit);
		protected var _to:*;
		[Bindable] public var parent:Scope;
		
		public var enableDebug:Boolean = true;

		public var registry:TargetRegistry = new TargetRegistry(actuallyApply);
		
		public function apply(target:*):void
		{
			if (_to) target = _to;
			registry.applyTargets(target);
		}
		
		public function actuallyApply(target:*):void
		{
			if (enableDebug) debug.log("[ √ ] Inject - " + target);
			
			for (var property:String in values)
			{
				var value:* = values[property];
				updateProperty(target, property, value);
			}
		}
		
		public function set target(value:*):void
		{
			_to = value;
		}
		
		protected function updateProperty(target:*, property:String, value:*):void
		{
			try 
			{
				target[property] = value;
				if (enableDebug) debug.log("[ -> ] Inject("+property+":"+value+") -> " + target);
			}
			
			catch (e:Error)
			{
				throw new Error("Could not inject property: '" + property + "' with value: '" + value + "' on target: '" + target + "'");
			}
		}
		
		override flash_proxy function setProperty(name:*, value:*):void {
	        values[name] = value;
	        updates[name] = true;
	        invalidator.invalidate("updates");
	    }
	    
	    protected function commit():void
	    {
    		for (var target:* in registry.map)
    			for (var property:String in updates)
    				updateProperty(target, property, values[property]);
	    }
	    
	    public function get debug():Debug
		{
			return Debug.instance;
		}
	}
}