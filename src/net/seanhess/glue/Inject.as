package net.seanhess.glue
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import net.seanhess.bifff.behaviors.IBehavior;
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
	dynamic public class Inject extends Proxy implements IBehavior
	{
		protected var values:Object = {};
		protected var updates:Object = {};
		protected var invalidator:Invalidator = new Invalidator(commit);
		protected var _find:Find;

		public var registry:TargetRegistry = new TargetRegistry(apply);
		
		public function set target(value:*):void
		{
			if (_find)
			{
				for each (var target:* in _find.findAll(value))
					registry.applyTargets(target);
			}
			else
			{
				registry.applyTargets(value);
			}
		}
		
		public function apply(target:*):void
		{
			for (var property:String in values)
			{
				var value:* = values[property];
				updateProperty(target, property, value);
			}
		}
		
		public function set find(value:String):void
		{
			_find = new Find();
			_find.match = value;
		}
		
		protected function updateProperty(target:*, property:String, value:*):void
		{
			try 
			{
				target[property] = value;
			}
			
			catch (e:Error)
			{
				throw new Error("Could not inject property " + property + " to " + value + " on " + target);
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
	}
}