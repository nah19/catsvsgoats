package  
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class ParallaxLayer extends Sprite
	{
		private var image1:Image;
		private var image2:Image;
		private var aleatorio:int;
		private var nombreImagen:String;
		
		private var _layer:int;
		private var _parallax:Number;
		
		public function ParallaxLayer(layer:int) 
		{
			super();
			this._layer = layer;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			aleatorio = Math.ceil(Math.random() * 12);
			nombreImagen = "Ciudad" + aleatorio + "-01";
			
			if(aleatorio > 0 && aleatorio < 7){
			image1 = new Image(Assets.getAtlas("CiudadesYTitulo", Assets.CiudadesYTituloXML, Assets.CiudadesYTituloAtlas).getTexture(nombreImagen));
			image2 = new Image(Assets.getAtlas("CiudadesYTitulo", Assets.CiudadesYTituloXML, Assets.CiudadesYTituloAtlas).getTexture(nombreImagen));
			}
			else
			{
			image1 = new Image(Assets.getAtlas("Ciudades2", Assets.Ciudades2XML, Assets.Ciudades2Atlas).getTexture(nombreImagen));
			image2 = new Image(Assets.getAtlas("Ciudades2", Assets.Ciudades2XML, Assets.Ciudades2Atlas).getTexture(nombreImagen));
				
				}
			
			image1.x = 0;
			image1.y = stage.stageHeight - image1.height;
			
			image2.x = image2.width;
			image2.y = image1.y;
			
			this.addChild(image1);
			this.addChild(image2);
		}
		
		public function get parallax():Number
		{
			return _parallax;
		}

		public function set parallax(value:Number):void
		{
			_parallax = value;
		}
	}

}