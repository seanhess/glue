package net.seanhess.glue
{
	import flash.events.IEventDispatcher;
	
	import mx.core.UIComponent;
	
	import net.seanhess.bifff.core.BehaviorMap;
	import net.seanhess.bifff.core.Selector;
	import net.seanhess.bifff.events.CreationComplete;
	import net.seanhess.bifff.scope.Scope;
	import net.seanhess.bifff.utils.Invalidator;
	
	public class Glue extends Selector
	{
		public var _controller:*;
		private var mapTarget:IEventDispatcher;
		private var map:BehaviorMap;
		private var invalidator:Invalidator = new Invalidator(commit);
		private var _view:UIComponent;
		private var _viewID:String;
		
		public function set find(value:String):void
		{
			this.match = value;
		}
		
		public function set controller(value:*):void
		{
			_controller = value;
		}
		
		public function set view(value:UIComponent):void
		{
			_view = value;
			_viewID = value.id;
			this.match = value.className;
			// all I have to do is get map[value.id] set // 
		}
		
		override public function matches(target:*, root:*=null):Boolean
		{
			if (_controller)
			{
				return (target == _controller);
			}
			else
			{
				var matches:Boolean = super.matches(target, root);
				
				if (_view && matches)
				{
					if (map.hasOwnProperty(_viewID))
						map[_viewID] = target;
						
					else
						throw new Error("Could not set " + target.id + " on " + map);
				}
				
				return matches;
			}
		}
		
		override public function set parent(value:Scope):void
		{
			super.parent = value;
			mapTarget = value.mapTarget; // woot! // 
			map = value.map;
			invalidator.invalidate("parent");
		}
		
		protected function commit():void
		{
			if (_controller)
			{
				var event:CreationComplete = new CreationComplete(_controller);
				mapTarget.dispatchEvent(event);
			}
		}
	}
}