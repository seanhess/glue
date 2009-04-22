package net.seanhess.glue
{
	import flash.events.IEventDispatcher;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.UIComponent;
	
	import net.seanhess.bifff.core.BehaviorMap;
	import net.seanhess.bifff.core.Selector;
	import net.seanhess.bifff.events.CreationComplete;
	import net.seanhess.bifff.scope.Scope;
	import net.seanhess.bifff.utils.Invalidator;
	
	[DefaultProperty("stuff")]
	public class Glue extends Selector
	{
		public var _controller:*;
		private var _controllerClass:String; 
		private var mapTarget:IEventDispatcher;
		private var map:BehaviorMap;
		private var invalidator:Invalidator = new Invalidator(commit);
		private var viewID:String
		
		public function set find(value:String):void
		{
			this.match = value;
		}
		
		public function set controller(value:*):void
		{
			_controller = value;
			var name:String = getQualifiedClassName(value);
			_controllerClass = name;
		}
		
		/**
		 * If you set the view, Glue will replace the instance in the map
		 * with the current one. It also sets "match" to grab that view
		 * when it finds it, unless it is already set
		 */
		public function set view(value:UIComponent):void
		{
			viewID = value.id;
			this.match = this.match || value.className;
		}
		
		public function set target(value:*):void
		{
			if (value.hasOwnProperty("id") && value.hasOwnProperty("className")) // dynamic UIComponent...
				view = value;
			else
				controller = value;	
		}
		
		public function setCurrentInstance(view:*):void
		{
			if (viewID)
				(map as GlueMap).setCurrentInstance(viewID, view);
		}
		
		override public function matches(target:*, root:*=null):Boolean
		{
			if (_controller)
			{
				var targetClass:String = getQualifiedClassName(target);
				return (targetClass == _controllerClass);
			}
			else if (match)
			{
				var matches:Boolean = super.matches(target, root);
				
				if (matches)
					setCurrentInstance(target);
				return matches;
			}
			else
			{
				throw new Error("Could not find target for glue: "+this+". Make sure target is set as an attribute, or as the first child");
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
		
		[ArrayElementType("Object")]
		public function set stuff(value:Array):void
		{
			if (value.length > 0 && !(value[0] is IGlueAction))
			{
				target = value.shift();
			}			
			
			actions = value;
		}
	}
}