package books.model
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
		
		public var searchTerm:String;
		
		public function search():void
		{
			dispatchEvent(new Event("search"));
		}
	}
}