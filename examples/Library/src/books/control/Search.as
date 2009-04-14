package books.control
{
	import books.model.Author;
	import books.model.Book;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.IList;
	import mx.collections.ListCollectionView;

	[Bindable]	
	public class Search extends EventDispatcher
	{
		public var authorResults:IList;
		public var bookResults:IList;
		
		public var allAuthors:IList;
		public var allBooks:IList;
		
		private var searchTerm:String;
		
		/**
		 * For now, just do an exact regex match on any part of the name or title
		 */
		public function search(term:String):void
		{
			searchTerm = term;
			
			var authors:ListCollectionView = new ListCollectionView(allAuthors);
				authors.filterFunction = searchAuthor;
				authors.refresh();
				
			var books:ListCollectionView = new ListCollectionView(allBooks);
				books.filterFunction = searchBook;
				books.refresh();
				
			authorResults = authors;
			bookResults = books;
			dispatchEvent(new Event('search'));
		}
		
		private function searchAuthor(author:Author):Boolean
		{
			return author.name.match(searchTerm) != null;
		}
		
		private function searchBook(book:Book):Boolean
		{
			return book.title.match(searchTerm) != null;
		}
	}
}