package  
{
	import flash.display.Bitmap;
	import flash.display3D.textures.Texture;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class Assets 
	{
		//embed todos los documentos aqui
		//p.ej: 	[Embed(source="../ruta.jpg")]
		//			public static const nombre:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		/*
		 * Devuelve una textura dada. En el caso de que no exista, crea la textura desde la fuente
		 * @param name -> nombre de la constante que hemos embebido 
		 * */
		public static function getTexture(name:String):Texture {
			if (gameTextures[name] == undefined) {
					var bitmap:Bitmap = new Assets[name]();
					gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
	}

}