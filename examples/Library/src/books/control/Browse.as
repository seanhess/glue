package books.control
{
	import books.adapt.AuthorBooks;
	import books.model.Author;
	import books.model.Book;
	import books.model.NavHistoryItem;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.IList;
	
	[Bindable]
	public class Browse extends EventDispatcher
	{
		public var books:IList;
		
		public var currentAuthor:Author;
		public var currentBook:Book;
		
		private var history:Array = [];
		
		public var backEnabled:Boolean = false;
		
		public function showAuthor(value:Author):void
		{
			var authorBooks:AuthorBooks = new AuthorBooks();
				authorBooks.author = value;
				authorBooks.books = books;
				
			value.books = authorBooks;
			currentAuthor = value;
			
			addHistoryItem(currentAuthor);
			
			dispatchEvent(new Event("showAuthor"));
		}
		
		public function showBook(value:Book):void
		{
			currentBook = value;
			addHistoryItem(currentBook);
			dispatchEvent(new Event("showBook"));
		}
		
		public function goBack():void
		{
			restoreHistoryItem();
			dispatchEvent(new Event("goBack"));
		}
		
		public function showSearch():void
		{
			resetHistory();
			dispatchEvent(new Event("showSearch"));			
		}
		
		public function showBrowse():void
		{
			resetHistory();
			dispatchEvent(new Event("showBrowse"));			
		}
		
		public function addHistoryItem(value:*):void
		{
			var item:NavHistoryItem = new NavHistoryItem();
				item.type = (value is Book) ? NavHistoryItem.BOOK : NavHistoryItem.AUTHOR;
				item.book = value as Book;
				item.author = value as Author;
				
			history.push(item);
			backEnabled = (history.length > 0);
		}
		
		public function restoreHistoryItem():void
		{
			history.pop(); // just ditch the last one
			
			if (history.length > 0)
			{
				var item:NavHistoryItem = history[history.length-1];
				currentBook = item.book;
				currentAuthor = item.author;
			}
			
			backEnabled = (history.length > 0);
		}
		
		public function resetHistory():void
		{
			history = new Array();
			backEnabled = false;
		}
	}
}