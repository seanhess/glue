package net.seanhess.glue
{
	import net.seanhess.bifff.behaviors.Inject;
	
	/**
	 * Injects properties into controllers and views from a controller. 
	 * 
	 * Usage: <Inject myProperty="{mycontroller.value}"/>
	 * Usage: <Inject child="{myView.list}" dataProvider="{mycontroller.list}"/>
	 */
	dynamic public class Inject extends net.seanhess.bifff.behaviors.Inject implements IGlueAction
	{
		protected var _to:*;
		
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