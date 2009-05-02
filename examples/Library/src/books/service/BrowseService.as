package books.service
{
	import books.adapt.AuthorBooks;
	import books.model.Author;
	import books.model.Book;
	import books.model.Browse;
	import books.model.Library;
	import books.model.NavHistoryItem;
	
	public class BrowseService
	{
		public var browse:Browse;
		public var library:Library;
		
		public function showAuthor(value:Author):void
		{
			var authorBooks:AuthorBooks = new AuthorBooks();
				authorBooks.author = value;
				authorBooks.books = library.books;
				
			value.books = authorBooks;
			browse.currentAuthor = value;
			
			addHistoryItem(browse.currentAuthor);
			browse.showAuthor();
		}
		
		public function showBook(value:Book):void
		{
			browse.currentBook = value;
			addHistoryItem(value);
			browse.showBook();
		}
		
		public function goBack():void
		{
			restoreHistoryItem();
			browse.goBack();
		}
		
		public function showSearch():void
		{
			resetHistory();
			browse.showSearch();
		}
		
		public function showBrowse():void
		{
			resetHistory();
			browse.showBrowse();
		}
		
		public function addHistoryItem(value:*):void
		{
			var item:NavHistoryItem = new NavHistoryItem();
				item.type = (value is Book) ? NavHistoryItem.BOOK : NavHistoryItem.AUTHOR;
				item.book = value as Book;
				item.author = value as Author;
				
			browse.addHistoryItem(item);
			browse.backEnabled = (browse.history.length > 0);
		}
		
		public function restoreHistoryItem():void
		{
			browse.history.pop(); // just ditch the last one
			
			if (browse.history.length > 0)
			{
				var item:NavHistoryItem = browse.history[browse.history.length-1];
				browse.currentBook = item.book;
				browse.currentAuthor = item.author;
			}
			
			browse.backEnabled = (browse.history.length > 0);
		}
		
		public function resetHistory():void
		{
			browse.history = new Array();
			browse.backEnabled = false;
		}

	}
}