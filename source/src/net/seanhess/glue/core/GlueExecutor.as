package net.seanhess.glue.core
{
	import net.seanhess.bifff.core.Executor;
	import net.seanhess.bifff.core.Scope;
	
	public class GlueExecutor extends Executor
	{
		override public function executeBehaviors(target:*, behaviors:Array, scope:Scope):void
		{
			for each (var behavior:* in behaviors)
			{
				if (behavior is IGlueAction)
				{
					setBehaviorParent(behavior, scope);
					(behavior as IGlueAction).applyAction(target);
				}
			}
		}
	}
}