package net.seanhess.glue
{
	import flash.utils.Dictionary;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import mx.core.IMXMLObject;
	
	dynamic public class Smart extends Proxy implements IMXMLObject
	{
		protected var _source:*;
		
		protected static var sources:Dictionary = new Dictionary(true);
		
		public var type:String;
		
		public static function setSource(type:String, value:*):void
		{
			sources[type] = value;
		}
		
		public static function getSource(type:String):*
		{
			return sources[type];
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
			return (_source) ? _source : Smart.getSource(this.type);	
		}
		
		override flash_proxy function getProperty(name:*):* 
		{
			return source[name];
	    }
	    
	    override flash_proxy function callProperty(name:*, ... rest):*
	    {
	    	return (source[name] as Function).apply(source, rest);
	    }
	}
}