package net.seanhess.glue
{
	import flash.events.EventDispatcher;
	
	import net.seanhess.bifff.core.DirectMatcher;
	import net.seanhess.bifff.core.IParser;
	import net.seanhess.bifff.core.Parser;
	
	public class Find extends EventDispatcher
	{
		public var matcher:DirectMatcher = new DirectMatcher();
		public var parser:IParser = new Parser();
		
		private var nodes:Array;
		private var matchString:String;

		public function findAll(target:*):Array
		{
			var targets:Array;
						
//			if (nodes == null)
//				nodes = parser.parseMatch(matchString);
//				
//			targets = matcher.descendants(target, nodes);

			if (target.hasOwnProperty(matchString))
			{
				var value:* = target[matchString];
				
				if (value)
					targets = [value];
				else
					throw new Error("Value was undefined: " + matchString + " on " + target);
			}
			
			return targets;				
		}

		public function set match(value:String):void
		{
			matchString = value;
		}
		
		public function get match():String
		{
			return matchString;
		}
	}
}