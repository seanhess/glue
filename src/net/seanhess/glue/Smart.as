package net.seanhess.glue
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import mx.core.IMXMLObject;


	/**	
	 * I'm not sure I even need these any more, now that I'm using strong references 
	 * everywhere!
	 */
	[Bindable]
	dynamic public class Smart extends Proxy implements IMXMLObject
	{
		protected var _source:*;
	
		protected static var scope:Object;		
		
		public var type:String;
		
		public function Smart(type:String=null)
		{
			this.type = type;
		}
		
		public static function setScope(scope:Object):void
		{
			Smart.scope = scope;
		}
		
		public static function getScope():Object
		{
			return Smart.scope;
		}
		
		public function initialized(document:Object, id:String):void
		{
			type = id;	
		}
		
		public function set source(value:*):void
		{
			_source = value;	
		}
		
		public function get source():*
		{
			return (_source) ? _source : Smart.scope[type];	
		}
		
		override flash_proxy function getProperty(name:*):* 
		{
			return source[name];
	    }
	    
	    override flash_proxy function callProperty(name:*, ... rest):*
	    {
	    	var source:* = this.source;
	    	return (source[name] as Function).apply(source, rest);
	    }
	}
}