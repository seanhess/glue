package net.seanhess.glue
{
	import net.seanhess.bifff.behaviors.Set;
	
	/**
	 * Injects properties into controllers and views from a controller. 
	 * 
	 * Usage: <Inject myProperty="{mycontroller.value}"/>
	 * Usage: <Inject child="{myView.list}" dataProvider="{mycontroller.list}"/>
	 */
	dynamic public class Inject extends Set implements IGlueAction
	{
		protected var _to:*;
		
		/**
		 * Don't set the style, just throw an error. this is for injection
		 * not for looks, dangit!
		 */
		override protected function setStyleOnTarget(target:*, property:String, value:*):void
		{
			throw new Error("Could not set property '"+property+"' on target '"+target+"' to value '"+value+"'");
		}
		
		public function applyAction(target:*):void
		{
			this.target = _to || target;
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
	}
}