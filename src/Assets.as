package
{
	//comentairo pa marcot
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

    import starling.utils.AssetManager;
	import flash.display.Bitmap;
	
	import flash.utils.Dictionary;
	
	import flash.text.Font;

	
	import starling.text.BitmapFont;
	import starling.text.TextField;

	
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class Assets
	{
		
		[Embed(source="../Assets/ImagenesSinAtlas/FondoArribaActivo-01.jpg")]
		public static const FondoArribaActivo:Class;
		
		[Embed(source="../Assets/ImagenesSinAtlas/FondoArribaDesac-01.jpg")]
		public static const FondoArribaDesac:Class;
		
		[Embed(source="../Assets/ImagenesSinAtlas/FondoAbajoActivo-01.jpg")]
		public static const FondoAbajoActivo:Class;
		
		[Embed(source="../Assets/ImagenesSinAtlas/FondoAbajoDesac-01.jpg")]
		public static const FondoAbajoDesac:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		[Embed(source="../Assets/CiudadesYTitulo.png")]
		public static const CiudadesYTitulo:Class;
		
		[Embed(source="../Assets/CiudadesYTitulo.xml",mimeType="application/octet-stream")]
		public static const CiudadesYTituloXML:Class;
		
		/*
		 * Devuelve una textura dada. En el caso de que no exista, crea la textura desde la fuente
		 * @param name -> nombre de la constante que hemos embebido
		 * */
		
		 public static function getAtlas(name:String):TextureAtlas
		{
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture(name);
				var xml:XML = XML(new CiudadesYTituloXML());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}
		
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	
	}

}