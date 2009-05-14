package net.seanhess.glue.tags
{
	import net.seanhess.bifff.behaviors.Inject;
	import net.seanhess.glue.core.IGlueAction;

	/**
	 * See online docs
	 */
	dynamic public class Inject extends net.seanhess.bifff.behaviors.Inject implements IGlueAction
	{
		public function applyAction(target:*):void
		{
			this.target = target;
		}
	}
}