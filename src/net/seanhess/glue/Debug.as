package net.seanhess.glue
{
	/**
	 * TODO: Add logging targets 
	 */
	public class Debug
	{
		public var enabled:Boolean = true;
		public static var instance:Debug = new Debug();
		
		/**
		 * If you create an instance of debug, it becomes the static instance 
		 */
		public function Debug():void
		{
			if (instance) // only replace
				Debug.instance = this;
		}
		
		public function log(message:String):void
		{
			if (enabled) trace(message);
		}
	}
}