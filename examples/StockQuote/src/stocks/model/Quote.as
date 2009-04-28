package stocks.model
{
	/**
	 * The model object gets passed around to everybody. These should be global
	 * models? Or at least pass
	 */
	[Bindable]
	public class Quote
	{
		public var symbol:String;
		public var price:Number;
	}
}