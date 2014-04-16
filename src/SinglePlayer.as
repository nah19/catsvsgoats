package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import starling.animation.Tween;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event; 
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.BlurFilter;
	import starling.animation.Juggler;
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.Quad;
	import flash.utils.Timer
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class SinglePlayer extends Sprite
	{
		private var parallaxUp:ParallaxBg;
		private var parallaxDown:ParallaxBg;
		private var bg1:Image;
		private var bg2:Image;
		private var aleatorio:int;
		private var nombreFondo:String;
		private var cat:Cat;
		private var goat:Goat;
		private var touch:Touch;
		private var aleatorioObjetos:int;
		private var timePrevious:Number;
		private var timeCurrent:Number;
		private var elapsed:int;
		private var tiempoAcumulado:Number;
		private var queueObjetos:Array = new Array();
	
		
		public function SinglePlayer() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawGame();
		}
		
		private function drawGame():void
		{
			aleatorio = Math.ceil(Math.random() * 15);
			nombreFondo = "Fondo" + aleatorio;
			bg1 = new Image(Assets.getTexture(nombreFondo));
			this.addChild(bg1);
			
			aleatorio = Math.ceil(Math.random() * 15);
			nombreFondo = "Fondo" + aleatorio;
			bg2 = new Image(Assets.getTexture(nombreFondo));
			bg2.y = 360;
			this.addChild(bg2);
			
			parallaxUp = new ParallaxBg();
			parallaxUp.speed = 10;
			parallaxUp.y = -360;
			parallaxUp.filter = BlurFilter.createDropShadow();
			this.addChild(parallaxUp);
			
			parallaxDown = new ParallaxBg();
			parallaxDown.speed = 10;
			parallaxDown.y = 0;
			parallaxDown.filter = BlurFilter.createDropShadow();
			this.addChild(parallaxDown);
			
			cat = new Cat();
			cat.x = 150
			cat.y = (stage.stageHeight / 2) - 80;
			cat.scaleX = 0.8;
			cat.scaleY = 0.8;
			this.addChild(cat);
			
			goat = new Goat();
			goat.x = 150
			goat.y = (stage.stageHeight / 2) + 75;
			goat.scaleX = 0.45;
			goat.scaleY = -0.45;
			this.addChild(goat);
			
			var quad:Quad = new Quad(stage.stageWidth,60,0x000000);
			quad.x = 0;
			quad.y = (stage.stageHeight/2)-30;
			addChild(quad);
		}
		
		private function onTouch(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touch)
			{
				var localPos:Point = touch.getLocation(this);
				
				if (localPos.y>360)
				{
					goat.jumpingGoat(true);
					var tweenGoat:Tween = new Tween(goat, 0.45, Transitions.EASE_IN_OUT);
					tweenGoat.reverse = true;
					tweenGoat.moveTo( goat.x, goat.y + 140);
					tweenGoat.repeatCount = 2;
					tweenGoat.onComplete = goat.jumpingGoat;
					Starling.juggler.add(tweenGoat); 
					
					
					
				} 
				else
				{
					cat.jumpingCat(true);
					var tweenCat:Tween = new Tween(cat, 0.45, Transitions.EASE_IN_OUT);
					tweenCat.reverse = true;
					tweenCat.animate("y", cat.y - 140);
					tweenCat.repeatCount = 2;
					tweenCat.onComplete = cat.jumpingCat; 
					Starling.juggler.add(tweenCat);
				}
			}	
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
			this.addEventListener(TouchEvent.TOUCH, onTouch);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			aleatorioObjetos = Math.ceil(Math.random() * 12);
			tiempoAcumulado = 100000;
			
			
		}
		
		private function onEnterFrame(event:Event):void
		{
			tiempoAcumulado += checkElapsed(); 
			
			if (tiempoAcumulado/1000 >= aleatorioObjetos) {
				tiempoAcumulado = 0;
				aleatorioObjetos = Math.ceil(Math.random() * 6);
				
				var objetoNuevo:Objects = new Objects(1, 800);
				
				this.addChild(objetoNuevo);
				queueObjetos.push(objetoNuevo);
				
				}
			
			queueObjetos.forEach(MoverObjeto);
			
		}
		
		private function MoverObjeto(element:*, index:int, arr:Array):void {
			element.x -= Math.ceil(element.speed * 0.01);
			//trace(element);
			//trace(Math.ceil(element.speed * 0.01));
			if (element.x < -200) {
					//this.removeChild(element);
					//queueObjetos.pop();
				}
        }
		
		private function checkElapsed():Number
		{
			
			timePrevious = timeCurrent;
			timeCurrent = getTimer();
			elapsed = (timeCurrent - timePrevious);
			//trace(elapsed);
			
			return elapsed;
		}
	}

}