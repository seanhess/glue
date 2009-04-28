package stocks.view
{
	[Bindable]
	public class PriceFormatter
	{
		public var display:String;
		
		public function set price(value:Number):void
		{
			display = (value) ? value.toString() : "Not Available";
		}
	}
}