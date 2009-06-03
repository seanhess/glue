package books.manager
{
	import books.model.Author;
	import books.model.Book;
	
	import mx.collections.IList;
	import mx.collections.ListCollectionView;

	[Bindable]
	public class SearchManager
	{
		public var allBooks:IList;
		public var allAuthors:IList;
		
		public var authorResults:IList;
		public var bookResults:IList;
		
		public var searchTerm:String;
		
		/**
		 * For now, just do an exact regex match on any part of the name or title
		 */
		public function doSearch(term:String):void
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