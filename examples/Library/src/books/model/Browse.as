package books.model
{
	import books.model.Author;
	import books.model.Book;
	import books.model.NavHistoryItem;
	
	import flash.events.EventDispatcher;
	
	[Bindable]
	public class Browse extends EventDispatcher
	{
		public var currentAuthor:Author;
		public var currentBook:Book;
		
		public var history:Array = [];
		
		public var backEnabled:Boolean = false;
		
		public function showAuthor():void
		{
			dispatchEvent(new Event("showAuthor"));
		}
		
		public function showBook():void
		{
			dispatchEvent(new Event("showBook"));
		}
		
		public function goBack():void
		{
			dispatchEvent(new Event("goBack"));
		}
		
		public function showSearch():void
		{
			dispatchEvent(new Event("showSearch"));			
		}
		
		public function showBrowse():void
		{
			dispatchEvent(new Event("showBrowse"));			
		}
		
		public function addHistoryItem(item:NavHistoryItem):void
		{
			history.push(item);
		}
		
	}
}