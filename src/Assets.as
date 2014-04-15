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
		
		[Embed(source = "../Assets/ImagenesSinAtlas/Fondo-01.jpg")]
		public static const FondoCreditos:Class;
		
		//Se incrusta la textura que se usara para el fondo que se usara para los botones de seleccion
		
		[Embed(source = "../Assets/ImagenesSinAtlas/Fondo12-01.jpg")]
		public static const FondoDesactivado:Class;
		
		[Embed(source = "../Assets/ImagenesSinAtlas/FondoActivo-01.jpg")]
		public static const FondoActivado:Class;
		
		//Textura para el fondo parallax
		[Embed(source = "../Assets/ImagenesSinAtlas/FondoArribaActivo-01.jpg")]
		public static const TopBg:Class;
		
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
		
		[Embed(source="../Assets/Ciudades2.png")]
		public static const Ciudades2:Class;
		
		[Embed(source="../Assets/Ciudades2.xml",mimeType="application/octet-stream")]
		public static const Ciudades2XML:Class;
		
		[Embed(source="../Assets/Sprites.png")]
		public static const Sprites:Class;
		
		[Embed(source="../Assets/Sprites.xml",mimeType="application/octet-stream")]
		public static const SpritesXML:Class;
		
		[Embed(source="../Assets/AnimacionGato.png")]
		public static const AnimacionGato:Class;
		
		[Embed(source="../Assets/AnimacionGato.xml",mimeType="application/octet-stream")]
		public static const AnimacionGatoXML:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		public static var CiudadesYTituloAtlas:TextureAtlas;
		public static var SpritesAtlas:TextureAtlas;
		public static var AnimacionGatoAtlas:TextureAtlas;
		
		
		/*
		 * Devuelve una textura dada. En el caso de que no exista, crea la textura desde la fuente
		 * @param name -> nombre de la constante que hemos embebido
		 * */
		
		public static function getAtlas(name:String, archivoXML:Class, atlas:TextureAtlas):TextureAtlas
		{
			if (atlas == null)
			{
				var texture:Texture = getTexture(name);
				var xml:XML = XML(new archivoXML);
				atlas = new TextureAtlas(texture, xml);
			}
			return atlas;
		}
		
		//public static function getAtlas():TextureAtlas
		//{
			//if (gameTextureAtlas == null)
			//{
				//var texture:Texture = getTexture("CiudadesYTitulo");
				//var xml:XML = XML(new CiudadesYTituloXML());
				//gameTextureAtlas = new TextureAtlas(texture, xml);
			//}
			//return gameTextureAtlas;
		//}
		
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