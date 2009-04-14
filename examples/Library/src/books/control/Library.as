package books.control
{
	import books.model.mock.MockData;
	
	import mx.collections.IList;
	
	[Bindable]
	public class Library
	{
		public var books:IList;
		public var authors:IList;
		
		public function mock():void
		{
			var mock:MockData = new MockData();
			books = mock.books;
			authors = mock.authors;
		}
	}
}