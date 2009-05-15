package net.seanhess.glue.tags
{
	import flash.events.Event;
	
	import net.seanhess.bifff.core.BehaviorMap;
	import net.seanhess.bifff.core.ISelector;
	import net.seanhess.bifff.utils.Debug;

	public class GlueMap extends BehaviorMap
	{
		public function get view():*
		{
			return scope.target;
		}
	}
}