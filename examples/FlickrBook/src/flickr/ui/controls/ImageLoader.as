package com.flickrBook.ui.controls
{
	import mx.core.UIComponent;
	
	import qs.controls.SuperImage;

	public class ImageLoader extends UIComponent
	{
		/*-.........................................Properties..................................*/	
		private var sourceChanged:Boolean;
		private var image:SuperImage;
		
		
		/*-......................................Getters and Setters.........................*/	
		private var _source:String;
		public function set source(value:String):void
		{
			if(_source !== value)
			{
				_source = value;
				sourceChanged = true;
				invalidateProperties();
			}
		}
		public function get source():String
		{
			return _source;
		}
		
		
		/*-.........................................Methods..................................*/	
		override protected function commitProperties():void
		{
			if(sourceChanged)
			{
				image.source = source;
			}
		}
		
		override protected function createChildren():void
		{
			image = new SuperImage();
			addChild(image);
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			image.setActualSize(unscaledWidth, unscaledHeight);
		}
		
		override protected function measure():void
		{
			var imageWidth:uint = image.getExplicitOrMeasuredWidth();
			var imageHeight:uint = image.getExplicitOrMeasuredHeight();
			measuredWidth = imageWidth;
			measuredHeight = imageHeight;
		}
		
	}
}