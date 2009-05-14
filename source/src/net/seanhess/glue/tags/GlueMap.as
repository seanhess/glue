package net.seanhess.glue.tags
{
	import flash.events.Event;
	
	import net.seanhess.bifff.core.BehaviorMap;
	import net.seanhess.bifff.core.ISelector;
	import net.seanhess.bifff.utils.Debug;
	import net.seanhess.glue.core.GlueExecutor;

	/**
	 * So, how do I know when to actually execute? (Timer .... )
	 */
	public class GlueMap extends BehaviorMap
	{
		public function get view():*
		{
			return scope.target;
		}
		
		override protected function initializeSelector(selector:ISelector):void
		{
			super.initializeSelector(selector);
			
			if (selector is Glue)
			{
				var glue:Glue = selector as Glue;
				glue.addEventListener(Glue.INITIALIZED, onGlueInitialized, false, 0, true);
				glue.addEventListener(Glue.INSTANCE_CHANGE, onGlueInstanceChanged, false, 0, true);
			}
		}
		
		private function onGlueInitialized(event:Event):void
		{
			var glue:Glue = event.target as Glue;
			matchedSelector(glue.target, glue);	
		}
		
		private function onGlueInstanceChanged(event:Event):void
		{
			var glue:Glue = event.target as Glue;
			setCurrentInstance(glue.viewID, glue.currentInstance);
		}
		
		public function setCurrentInstance(viewID:String, view:*):void
		{
			if (this.hasOwnProperty(viewID))
				this[viewID] = view;
				
			else
				throw new Error("Could not set current view instance: " + viewID + " to " + view + " on " + this);
		}
		
		override protected function commit():void
		{			
			super.commit();
			this.executor = new GlueExecutor();
			Debug.instance.log("[ √ ] Project on " + target);
		}
	}
}