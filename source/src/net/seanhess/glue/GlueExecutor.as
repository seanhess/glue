package net.seanhess.glue
{
	import net.seanhess.bifff.core.Executor;
	
	public class GlueExecutor extends Executor
	{
		override public function executeActions(target:*, actions:Array):void
		{
			for each (var action:Object in actions)
			{
				if (action is IGlueAction)
				{
					(action as IGlueAction).apply(target);
				}
			}
		}
	}
}