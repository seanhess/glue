package net.seanhess.glue
{
	import flash.utils.Dictionary;
	
	import net.seanhess.bifff.core.Selector;
	
	public class Glue extends Selector
	{
		public var _instance:*;
		
		public function set find(value:String):void
		{
			this.match = value;
		}
		
		public function set instance(value:*):void
		{
			_instance = value;
		}
		
		override public function matches(target:*, root:*=null):Boolean
		{
			return _instance ? (target == _instance) : super.matches(target, root);
		}
	}
}