package net.seanhess.glue
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import net.seanhess.bifff.behaviors.IBehavior;
	
	dynamic public class Inject extends Proxy implements IBehavior
	{
		protected var values:Object = {};
		protected var _targets:Array;
		
		protected var subTarget:String;
		
		/**
		 * If it is used for multiple
		public function set target(value:*):void
		{
			
		}
		
		public function set find(value:String):void
		{
			
		}
		
		public function set targets(value:Array):void
		{
			_targets = value;
			updateTargetsAll();
		}
		
		public function get targets():Array
		{
			return _targets;
		}
		
		public function set target(value:String):void
		{
			subTarget = value;
		}
		
		override flash_proxy function setProperty(name:*, value:*):void 
		{
			values[name] = value;
			
			if (targets)
			{
				updateTargets(name);
			}
	    }
	    
	    protected function updateTargetsAll():void
	    {
	    	for (var name:String in values)
	    		updateTargets(name);
	    }
	    
	    protected function updateTargets(name:String):void
	    {
	    	if (targets == null || targets.length == 0)
	    		throw new Error("Targets were empty or null " + targets); 
	    	
	    	for each (var target:* in targets)
	    		updateTarget(target, name);
	    }
	    
	    protected function updateTarget(target:*, name:String):void
	    {
	    	try {
//	    		target = findSubTarget(target);
	    		target[name] = values[name];
	    	}
	    	catch (e:Error)
	    	{
	    		throw new Error("Could not set property ("+name+") on target ("+target+")");
	    	}
	    }
	    
	    /** 
	    * Only supports one dot syntax ... use Bifff's selectors later... wait to add this :)
	    */
//	    protected function findSubTarget(target:*):*
//	    {
//	    	var source:* = target;
//	    	
//	    	if (subTarget == null)
//	    		return source;
//	    	
//	    	try {
//	    		source = target[subTarget];
//	    	}
//	    	catch (e:Error)
//	    	{
//	    		throw new Error("Could not find subTarget ("+subTarget+") on target ("+target+")");
//	    	}
//	    	
//	    	return source;
//	    }
	}
}