package books.model
{
	import mx.collections.IList;
	
	[Bindable]
	public class Author
	{
		public var name:String;
		public var books:IList;
		
		public function toString():String
		{
			return name;
		}
	}
}