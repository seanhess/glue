package net.seanhess.glue
{
	import flash.events.IEventDispatcher;
	
	import net.seanhess.bifff.core.Selector;
	import net.seanhess.bifff.events.CreationComplete;
	import net.seanhess.bifff.scope.Scope;
	import net.seanhess.bifff.utils.Invalidator;
	
	public class Glue extends Selector
	{
		public var _instance:*;
		private var mapTarget:IEventDispatcher;
		private var invalidator:Invalidator = new Invalidator(commit);
		
		public function set find(value:String):void
		{
			this.match = value;
		}
		
		public function set instance(value:*):void
		{
			_instance = value;
		}
		
		override public function matches(target:*, root:*=null):Boolean
		{
			return _instance ? (target == _instance) : super.matches(target, root);
		}
		
		override public function set parent(value:Scope):void
		{
			super.parent = value;
			mapTarget = value.mapTarget; // woot! // 
			invalidator.invalidate("parent");
		}
		
		protected function commit():void
		{
			if (_instance)
			{
				var event:CreationComplete = new CreationComplete(_instance);
				mapTarget.dispatchEvent(event);
			}
		}
	}
}