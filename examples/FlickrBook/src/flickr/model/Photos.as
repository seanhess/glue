package flickr.model
{	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class Photos
	{	
		public var currentSet:ArrayCollection;
		
		public function storePhotos(value:Array):void
		{
			currentSet = new ArrayCollection(value);
		}
	}
}