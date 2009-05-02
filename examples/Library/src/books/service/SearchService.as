package books.service
{
	import books.model.Author;
	import books.model.Book;
	import books.model.Library;
	import books.model.Search;
	
	import mx.collections.ListCollectionView;
	
	public class SearchService
	{
		public var library:Library;
		public var search:Search;
		
		/**
		 * For now, just do an exact regex match on any part of the name or title
		 */
		public function doSearch(term:String):void
		{
			search.searchTerm = term;
			
			var authors:ListCollectionView = new ListCollectionView(library.authors);
				authors.filterFunction = searchAuthor;
				authors.refresh();
				
			var books:ListCollectionView = new ListCollectionView(library.books);
				books.filterFunction = searchBook;
				books.refresh();
				
			search.authorResults = authors;
			search.bookResults = books;
			search.search();
		}
		
		private function searchAuthor(author:Author):Boolean
		{
			return author.name.match(search.searchTerm) != null;
		}
		
		private function searchBook(book:Book):Boolean
		{
			return book.title.match(search.searchTerm) != null;
		}

	}
}