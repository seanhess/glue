package net.seanhess.glue.tags
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import net.seanhess.bifff.core.Scope;

	[DefaultProperty("actions")]
	dynamic public class Command extends Proxy
	{
		private var defaults:Object = {};
		private var _actions:Array; 
		
		[ArrayElementType("Object")]
		public function set actions(value:Array):void
		{
			_actions = value;	
		}
		
		public function execute(parameters:Object=null):void
		{
			var scope:Scope = Scope.current;
			
			if (parameters)
			{
				for (var paramName:String in parameters)
				{
					if (defaults[paramName])
					{
						scope[paramName] = parameters[paramName];
					}
					else
					{
						throw new Error("Could not find parameter " + paramName);
					}
				}				
			}
			
			for (var defaultName:String in defaults)
				if (!scope.defined(defaultName))
					scope[defaultName] = defaults[defaultName];
			
			for each (var action:Action in _actions)
				action.execute();
		}
		
		override flash_proxy function setProperty(name:*, value:*):void
		{
			defaults[name] = value;
		}
	}
}