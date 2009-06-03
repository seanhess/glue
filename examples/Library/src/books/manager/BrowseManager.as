package books.manager
{
	import books.adapt.AuthorBooks;
	import books.model.Author;
	import books.model.Book;
	import books.model.Browse;
	import books.model.NavHistoryItem;
	
	import mx.collections.IList;

	[Bindable]
	public class BrowseManager
	{
		public var allBooks:IList;
		public var allAuthors:IList;
		
		public var currentAuthor:Author;
		public var currentBook:Book;
		
		public var history:Array = [];
		
		public var backEnabled:Boolean = false;
		
		public var state:String = Browse.BROWSE;
		
		public function showAuthor(value:Author):void
		{
			var authorBooks:AuthorBooks = new AuthorBooks();
				authorBooks.author = value;
				authorBooks.books = allBooks;
				
			value.books = authorBooks;
			currentAuthor = value;
			
			addHistoryItem(currentAuthor);
			state = Browse.AUTHOR;
		}
		
		public function showBook(value:Book):void
		{
			currentBook = value;
			addHistoryItem(value);
			state = Browse.BOOK;
		}
		
		public function goBack():void
		{
			restoreHistoryItem();
//			browse.goBack();
		}
		
		public function showSearch():void
		{
			resetHistory();
			state = Browse.SEARCH;
		}
		
		public function showBrowse():void
		{
			resetHistory();
			state = Browse.BROWSE;
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