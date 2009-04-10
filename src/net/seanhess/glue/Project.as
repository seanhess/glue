package net.seanhess.glue
{
	import net.seanhess.bifff.core.BehaviorMap;
	
	/**
	 * So, how do I know when to actually execute? (Timer .... )
	 */
	public class Project extends BehaviorMap
	{
		public var event:Smart = new Smart("event");
		public var item:Smart = new Smart("item");
		
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
		}
		
	}
}