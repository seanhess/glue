package books.adapt
{
	import books.model.Author;
	import books.model.Book;
	
	import mx.collections.IList;
	import mx.collections.ListCollectionView;

	public class AuthorBooks extends ListCollectionView
	{
		public var author:Author;
		
		public function AuthorBooks()
		{
			this.filterFunction = filterByAuthor;
		}
		
		public function set books(value:IList):void
		{
			this.list = value;
			this.refresh();
		}
				
		public function filterByAuthor(book:Book):Boolean
		{
			return (book.author == author);
		}		
	}
}