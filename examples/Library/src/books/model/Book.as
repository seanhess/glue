package books.model
{
	[Bindable]
	public class Book
	{
		public var title:String = "";
		public var author:Author;
		
		public function toString():String
		{
			return title;
		}
	}
}