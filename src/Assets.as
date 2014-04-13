package
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.utils.AssetManager;
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import flash.text.Font;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class Assets
	{
		//Se incrustan la texturas de las particulas y el xml (pex) que se usaran en el fondo del menu
		
		[Embed(source = "../Assets/Particles/particle.pex", mimeType = "application/octet-stream")]
		public static const particleXML:Class;
		
		[Embed(source = "../Assets/Particles/particleTexture.png")]
		public static const particle:Class;
		
		//Se incrusta la textura que se usara para el fondo que se usara para los botones de seleccion
		
		[Embed(source = "../Assets/ImagenesSinAtlas/Fondo12-01.jpg")]
		public static const FondoDesactivado:Class;
		
		[Embed(source = "../Assets/ImagenesSinAtlas/FondoActivo-01.jpg")]
		public static const FondoActivado:Class;
		
		//Se incrustan la texturas que bloquean la visibilidad de las particulas
		
		[Embed(source = "../Assets/ImagenesSinAtlas/Ciudad2-01-Blanco.png")]
		public static const Ciudad2Blanco:Class;
		
		[Embed(source = "../Assets/ImagenesSinAtlas/Ciudad3-01-Blanco.png")]
		public static const Ciudad3Blanco:Class;
		
		//Se incrusta el atlas con algunas ciudades y los titulos del menu principal
		
		[Embed(source="../Assets/CiudadesYTitulo.png")]
		public static const CiudadesYTitulo:Class;
		
		[Embed(source="../Assets/CiudadesYTitulo.xml",mimeType="application/octet-stream")]
		public static const CiudadesYTituloXML:Class;
		
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		/*
		 * Devuelve una textura dada. En el caso de que no exista, crea la textura desde la fuente
		 * @param name -> nombre de la constante que hemos embebido
		 * */
		
		public static function getAtlas():TextureAtlas
		{
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("CiudadesYTitulo");
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