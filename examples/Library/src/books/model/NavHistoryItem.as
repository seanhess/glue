package books.model
{
	public class NavHistoryItem
	{
		public static const AUTHOR:String = "author";
		public static const BOOK:String = "book";
		
		public var type:String;
		public var book:Book;
		public var author:Author;
	}
}