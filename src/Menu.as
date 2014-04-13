package  
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class Menu extends Sprite 
	{
		
		var botonAbajo:BotonMejorado;
		var botonArriba:BotonMejorado;
		var botonSingle:BotonMejorado;
		var botonMultiplayer:BotonMejorado;
	
		
		public function Menu() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("Menu principal");
			drawScreen();
		}
			
			private function drawScreen():void
			{
				
				botonSingle = new BotonMejorado(Assets.getAtlas().getTexture("UnJugadorDesac"), "", Assets.getAtlas().getTexture("UnJugadorActivo"), true);
				botonSingle.x = 270;
				botonSingle.y = 0;
				botonSingle.touchable = false;
				
				
				botonMultiplayer = new BotonMejorado(Assets.getAtlas().getTexture("MultijugadorDesac"), "", Assets.getAtlas().getTexture("MultijugadorActivo"), true);
				botonMultiplayer.x = 270;
				botonMultiplayer.y = 380;
				botonMultiplayer.touchable = false;
				
				
				botonAbajo = new BotonMejorado(Assets.getTexture("FondoAbajoDesac"), "", Assets.getTexture("FondoAbajoActivo"), true, botonMultiplayer);
				botonAbajo.x = 1280;
				botonAbajo.y = 720;
				botonAbajo.rotation = Math.PI;
				
				
				botonArriba = new BotonMejorado(Assets.getTexture("FondoArribaDesac"), "", Assets.getTexture("FondoArribaActivo"), true, botonSingle);
				botonArriba.x = 0;
				botonArriba.y = 0;
				
				
				
				this.addChild(botonAbajo);
				this.addChild(botonArriba);
				this.addChild(botonMultiplayer);
				this.addChild(botonSingle);
				}
				
		
	}

}