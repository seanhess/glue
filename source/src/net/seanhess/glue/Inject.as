package net.seanhess.glue
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import net.seanhess.bifff.scope.IScopeable;
	import net.seanhess.bifff.scope.Scope;
	import net.seanhess.bifff.utils.Debug;
	import net.seanhess.bifff.utils.Invalidator;
	import net.seanhess.bifff.utils.TargetRegistry;
	
	/**
	 * Injects properties into controllers and views from a controller. 
	 * 
	 * Usage: <Inject myProperty="{mycontroller.value}"/>
	 * Usage: <Inject child="{myView.list}" dataProvider="{mycontroller.list}"/>
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
		
		/**
		 * The child property will have the inject tag target some
		 * component within your view. It should only ever be set 
		 * to something within the view you are currently gluing. 
		 * 
		 * You should usually NOT set this property, but make 
		 * public properties or setters on your view that your 
		 * sub components can bind to. 
		 */
		public function set child(value:*):void
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