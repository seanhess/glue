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
	}
}