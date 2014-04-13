package
{
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	import starling.animation.Juggler;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class Menu extends Sprite
	{
		var ciudadArriba:Image;
		var ciudadAbajo:Image;
		
		var ciudadArribaBlanco:Image;
		var ciudadAbajoBlanco:Image;
		
		var botonAbajo:BotonMejorado;
		var botonArriba:BotonMejorado;
		var botonSingle:BotonMejorado;
		var botonMultiplayer:BotonMejorado;
		
		var ambientParticlesUp:PDParticleSystem;
		var ambientParticlesDown:PDParticleSystem;
		
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
			//Se declaran y se situan la ciudades que saldran en el fondo del menu
			ciudadArriba = new Image(Assets.getAtlas().getTexture("Ciudad2-01"));
			ciudadArriba.x = 0;
			ciudadArriba.y = 0;
			ciudadArriba.touchable = false;
			
			ciudadAbajo = new Image(Assets.getAtlas().getTexture("Ciudad3-01"));
			ciudadAbajo.x = 1280;
			ciudadAbajo.y = 720;
			ciudadAbajo.rotation = Math.PI;
			ciudadAbajo.touchable = false;
			
			//Como las ciudades anteriormente declaradas tienen transparencia se declaran las mismas imagenes de ciudadades pero en blanco
			//Que tendran la funcion de bloquear la visibilidad por detras de las ciudades, para que asi las particulas no se vean por detras de la ciudad
			ciudadArribaBlanco = new Image(Assets.getTexture("Ciudad2Blanco"));
			ciudadArribaBlanco.x = 0;
			ciudadArribaBlanco.y = 0;
			ciudadArribaBlanco.touchable = false;
			
			
			ciudadAbajoBlanco = new Image(Assets.getTexture("Ciudad3Blanco"));
			ciudadAbajoBlanco.x = 1280;
			ciudadAbajoBlanco.y = 720;
			ciudadAbajoBlanco.rotation = Math.PI;
			ciudadAbajoBlanco.touchable = false;
			
			
			//Se declaran y se situan unos sistemas de particulas que dan ambiente y estetica al fondo
			ambientParticlesUp = new PDParticleSystem(XML(new Assets.particleXML()), Texture.fromBitmap(new Assets.particle()));
			Starling.juggler.add(ambientParticlesUp);
			ambientParticlesUp.x = 640;
			ambientParticlesUp.y = 300;
			ambientParticlesUp.scaleX = 1;
			ambientParticlesUp.scaleY = 1;
			
			
			
			ambientParticlesDown = new PDParticleSystem(XML(new Assets.particleXML()), Texture.fromBitmap(new Assets.particle()));
			Starling.juggler.add(ambientParticlesDown);
			ambientParticlesDown.x = 640;
			ambientParticlesDown.y = 420;
			ambientParticlesDown.scaleX = 1;
			ambientParticlesDown.scaleY = 1;
			ambientParticlesDown.emitAngle = 90
			
			//Se declaran los botones de single player y multiplayer, estos solo tienen una funcion estetica ya que tienen su tocabilidad desactivada
			//ya que los botones que verdaderamente manejan el estado del boton son los declarados mas abajo.
			//Esto esta hecho para independizar el comportamiento del boton  del fondo y que se puedan ejecutar funciones como "mouseOver" o "Scale" con independencia
			botonSingle = new BotonMejorado(Assets.getAtlas().getTexture("UnJugadorDesac"), "", Assets.getAtlas().getTexture("UnJugadorActivo"), true);
			botonSingle.x = 270;
			botonSingle.y = 0;
			botonSingle.touchable = false;
			
			botonMultiplayer = new BotonMejorado(Assets.getAtlas().getTexture("MultijugadorDesac"), "", Assets.getAtlas().getTexture("MultijugadorActivo"), true);
			botonMultiplayer.x = 270;
			botonMultiplayer.y = 380;
			botonMultiplayer.touchable = false;
			
			
			//Estos son los botones que controlan basicamente el menu, asi como el comportamiento y el stado de los botones superiores (botonSingle y botonMultiplayer)
			//Para ello se ha creado la clase BotonMejorado, que permite, hacer "mouseOver" al pasar el raton y ademas permite igualar el estado de dicho boton con
			//otro que queramos
			botonAbajo = new BotonMejorado(Assets.getTexture("FondoDesactivado"), "", Assets.getTexture("FondoActivado"), true, botonMultiplayer);
			botonAbajo.x = 1280;
			botonAbajo.y = 720;
			botonAbajo.rotation = Math.PI;
			botonAbajo.alpha = 0.7;
			
			botonArriba = new BotonMejorado(Assets.getTexture("FondoDesactivado"), "", Assets.getTexture("FondoActivado"), true, botonSingle);
			botonArriba.x = 0;
			botonArriba.y = 0;
			botonArriba.alpha = 0.7;
			
			
			//Se añade a la escena primero las particulas para que estas se situen al fondo del todo
			this.addChild(ambientParticlesUp);
			this.addChild(ambientParticlesDown);
			
			//Se inician las particulas
			ambientParticlesUp.start();
			ambientParticlesDown.start();
			
			//Se añade la capa con forma de ciudad que bloqueara la visibilidad de las particulas por detras de la ciudad
			this.addChild(ciudadArribaBlanco);
			this.addChild(ciudadAbajoBlanco);
			
			// Se añaden los botones que controlan el menu
			this.addChild(botonAbajo);
			this.addChild(botonArriba);

			//Se añade la ciudad
			this.addChild(ciudadArriba);
			this.addChild(ciudadAbajo);
			
			//Se añade los botones de selecion de juego
			this.addChild(botonMultiplayer);
			this.addChild(botonSingle);
			
			
		}
	
	}

}