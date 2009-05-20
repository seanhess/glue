package com.flickrBook.service
{
	import com.flickrBook.vos.Photo;
	
	public class FlickrParser
	{
		
		/*-............................Methods......................*/
		public function parseUser(xml:XML):String 
		{
			if (xml.@stat == 'ok'){
				return xml.user.@id.toString();
			}
			
			return ""; 
		}
		
		public function parseXML(xmlPhotos:XML):Array 
		{
			var photos:Array = new Array();
			
			for each( var photo:XML in xmlPhotos..photo ) 
			{
				var photoObj:Photo = new Photo();
				photoObj.id = photo.@id;
				photoObj.farmId = photo.@farm;
				photoObj.secret = photo.@secret;
				photoObj.serverId = photo.@server;
				photoObj.title = photo.@title;
				photoObj.isPublic = photo.@ispublic;
				photos.push(photoObj);
			}
			
			return photos;
		}
	}
}