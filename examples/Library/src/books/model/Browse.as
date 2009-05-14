package books.model
{
	import flash.events.EventDispatcher;
	
	[Bindable]
	public class Browse extends EventDispatcher
	{
		public static const BROWSE:String = "browse";
		public static const SEARCH:String = "search";
		public static const BOOK:String = "book";
		public static const AUTHOR:String = "author";

		public var currentAuthor:Author;
		public var currentBook:Book;
		
		public var history:Array = [];
		
		public var backEnabled:Boolean = false;
		
		public var state:String = BROWSE;
		
		public function addHistoryItem(item:NavHistoryItem):void
		{
			history.push(item);
		}
	}
}