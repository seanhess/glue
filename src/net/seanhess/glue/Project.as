package net.seanhess.glue
{
	import net.seanhess.bifff.core.BehaviorMap;
	
	/**
	 * So, how do I know when to actually execute? (Timer .... )
	 */
	public class Project extends BehaviorMap
	{
		public var subject:Smart = new Smart("subject");
		public var event:Smart = new Smart("event");
		public var currentTarget:Smart = new Smart("target");
	}
}