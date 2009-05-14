package net.seanhess.glue.tags
{
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.UIComponent;
	
	import net.seanhess.bifff.core.Node;
	import net.seanhess.bifff.core.Selector;
	import net.seanhess.bifff.utils.Invalidator;
	import net.seanhess.glue.core.IGlueAction;

	[DefaultProperty("stuff")]
	public class Glue extends Selector
	{
		public static const INITIALIZED:String = "initialized";
		public static const INSTANCE_CHANGE:String = "currentInstanceChange";
		
		private var _target:*;
		private var _targetClass:String; 
		private var invalidator:Invalidator = new Invalidator(commit);
		public var viewID:String
		
		public var currentInstance:*;
		
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
		
		/**
		 * You can set to a view class or a non-view class. This acts very
		 * differently depending on which one it is. If it is a view class 
		 * (determined by whether it has properties similar to UIComponent)
		 * then it will set the match values appropriately and wait for it
		 * to show up in the behavior map
		 */
		public function set target(value:*):void
		{
			if (value.hasOwnProperty("id") && value.hasOwnProperty("className")) // dynamic UIComponent...
				view = value;
				
			else
			{
				_target = value;
				var name:String = getQualifiedClassName(value);
				_targetClass = name;
				invalidator.invalidate("target");
				nodes = [new Node(Node.NONE)];
			}
		}
		
		public function get target():*
		{
			return _target;
		}
		
		public function setCurrentInstance(view:*):void
		{
			if (viewID)
			{
				currentInstance = view;
				dispatchEvent(new Event(INSTANCE_CHANGE));
			}
		}
		
		override public function matches(target:*, root:*=null):Boolean
		{
			var matches:Boolean = super.matches(target, root);
			
			if (matches)
				setCurrentInstance(target);
				
			return matches;
		}
		
		/**
		 * Dispatch an initialized event, saying all our properties are set
		 */
		protected function commit():void
		{
			if (_target && actions && invalidator.invalid("target"))
				dispatchEvent(new Event(INITIALIZED));
		}
		
		[ArrayElementType("Object")]
		public function set stuff(value:Array):void
		{
			if (value.length > 0 && !(value[0] is IGlueAction))
			{
				target = value.shift();
			}
			
			actions = value;
			invalidator.invalidate("target");
		}
	}
}