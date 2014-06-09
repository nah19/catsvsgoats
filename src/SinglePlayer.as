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
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
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
		private var timeRandomCat:int;
		private var timeRandomGoat:int;
		private var timePrevious:Number;
		private var timeCurrent:Number;
		private var elapsed:int;
		private var tiempoCatAcumulado:Number;
		private var tiempoGoatAcumulado:Number;
		private var queueObjetos:Array = new Array();
		private var colision:int;
		private var paused:Boolean;
		private var botonExit:BotonMejorado;
		private var botonRestart:BotonMejorado;
		private var botonHome:BotonMejorado;
		private var scores:Puntuaciones;
		private var display_timer:TextField;
		private var score_top:TextField;
		private var score_bot:TextField;
		
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
			scores = new Puntuaciones();
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
			parallaxDown.y = 1080;
			parallaxDown.scaleY = -1;
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
			
			var suelo:Quad = new Quad(stage.stageWidth,60,0x000000);
			suelo.x = 0;
			suelo.y = (stage.stageHeight/2)-30;
			addChild(suelo);
			
			var score:Quad = new Quad(160,160,0x000000);
			score.x = 1120;
			score.y = (stage.stageHeight/2)-85;
			addChild(score);
			
			score_top = new TextField(100, 20, "Cat: 0 m.", "Arial", 12, 0xffffff);
			score_top.x = 1125;
			score_top.y = (stage.stageHeight/2)-75;
			addChild(score_top);
			
			score_bot = new TextField(100, 20, "Goat: 0 m.", "Arial", 12, 0xffffff);
			score_bot.x = 1125;
			score_bot.y = (stage.stageHeight / 2) + 40;			
			addChild(score_bot);
			
			display_timer = new TextField(100, 20, "Time: 0 CG's", "Arial", 12, 0xffffff);
			display_timer.x = 1125;
			display_timer.y = (stage.stageHeight / 2) -10;			
			addChild(display_timer);
			
		}
		
		private function onTouch(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touch)
			{
				var localPos:Point = touch.getLocation(this);
				
				//salto de la cabra
				if (localPos.y>360 && !paused)
				{
					if ((goat.isJumping() || goat.isFalling() || goat.isRunning()) && !goat.isDoubleJumping())
					{
							goat.switchStatus("doubleJumping");
							var tweenGoat:Tween = new Tween(goat, 0.45, Transitions.EASE_IN_OUT);
							//tweenGoat.reverse = true;
							tweenGoat.moveTo( goat.x, goat.y + 140);
							tweenGoat.onComplete = goat.switchStatus;
							Starling.juggler.add(tweenGoat); 
					}
					else if (goat.isRunning())
					{
						goat.switchStatus("jumping");
						var tweenGoat:Tween = new Tween(goat, 0.45, Transitions.EASE_IN_OUT);
						//tweenGoat.reverse = true;
						tweenGoat.moveTo( goat.x, goat.y + 140);
						//tweenGoat.repeatCount = 2;
						tweenGoat.onComplete = goat.switchStatus;
						Starling.juggler.add(tweenGoat); 
					}
				} 
				else if(!paused)
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
			scores = new Puntuaciones();
			timeRandomCat = Math.ceil(Math.random() * 12);
			timeRandomGoat = Math.ceil(Math.random() * 12);
			tiempoCatAcumulado = 100000;
			tiempoGoatAcumulado = 100000;
			
			goat.switchStatus();
			
		}
		
		private function onEnterFrame(event:Event):void
		{
			if (paused) 
			{
				return;
			}
			Starling.juggler.delayCall(realTimer, 1.0);
			var time:int = checkElapsed();
			tiempoGoatAcumulado += time;
			tiempoCatAcumulado += time;
			
			if (tiempoCatAcumulado/1000 >= timeRandomCat) {
				tiempoCatAcumulado = 0;
				timeRandomCat = Math.ceil(Math.random() * 6);
				
				var objetoNuevo:Objects = new Objects(1, 700 + 150 * scores.velocidad );
				this.addChild(objetoNuevo);
				queueObjetos.push(objetoNuevo);				
			}
			
			if (tiempoGoatAcumulado/1000 >= timeRandomGoat) {
				tiempoGoatAcumulado = 0;
				timeRandomGoat = Math.ceil(Math.random() * 6);
				
				var objetoNuevo:Objects = new Objects(2, 700 + 150 * scores.velocidad);
				this.addChild(objetoNuevo);
				queueObjetos.push(objetoNuevo);				
			}
			
			
			if (goat.isRunning() && goat.y>435)
			{
				goat.switchStatus("falling");
				var tweenGoat:Tween = new Tween(goat, 0.45, Transitions.EASE_IN_OUT);
				tweenGoat.moveTo( goat.x, 435);
				//tweenGoat.onComplete = goat.switchStatus; 
				Starling.juggler.add(tweenGoat); 
				
			}
			if (goat.y > 435 && goat.y < 440 && goat.isFalling()) 
				{
					goat.switchStatus();
				}
			
			if (colision > 1)
			{
				colision--;
			}
			else if (colision == 1) 
			{
				this.x = 0;
				Starling.juggler.purge();
				paused = true;
				parallaxUp.speed = 0;
				parallaxDown.speed = 0;
				endGame();
			}
			else
			{
				queueObjetos.forEach(CollisionAssist);
			}
			
			queueObjetos.forEach(MoverObjeto);
			
		}
		
		private function MoverObjeto(element:*, index:int, arr:Array):void {
			element.x -= Math.ceil(element.speed * 0.01);
			//trace(element);
			//trace(Math.ceil(element.speed * 0.01));
			if (element.x < -350) {
					this.removeChild(element);
				}
        }
		
		private function CollisionAssist(element:*, index:int, arr:Array):void {
			if (cat.bounds.intersects(element.bounds))
			{
				//colision = 55;
			}
			if (goat.bounds.intersects(element.bounds))
			{
				//colision = 55;
			}
        }
		
		private function endGame():void
		{
			botonExit = new BotonMejorado(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTexture("Exit"));
			botonExit.x = 440;
			botonExit.y = 280;
			this.addChild(botonExit);
			
			botonRestart = new BotonMejorado(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTexture("Exit"));
			botonRestart.x = 590;
			botonRestart.y = 280;
			this.addChild(botonRestart);
			
			botonHome = new BotonMejorado(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTexture("Exit"));
			botonHome.x = 740;
			botonHome.y = 280;
			this.addChild(botonHome);
			
			this.addEventListener(Event.TRIGGERED, sceneManager);
		}
		
		public function sceneManager(event:Event):void
		{
			var botonClicado:BotonMejorado = event.target as BotonMejorado;
			
			switch (botonClicado) 
			{
				case botonExit:
					trace("exit");
					break;
				case botonRestart:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "restartSinglePlayer"}, true));
					trace("restart");
					break;
				case botonHome:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "mainMenu"}, true));
					trace("home");
					break;	
			}
		}
		
		private function realTimer():void
		{
			scores.tiempo++;
			if ((scores.tiempo/100)%5 == 0)
			{
				scores.velocidad++;
			}
			if ((scores.tiempo/100)%0.5 == 0)
			{
				scores.metros += 5 * scores.velocidad;
				score_bot.text =  "Goat: "+ scores.metros +" m.";
				score_top.text =  "Cat: "+ scores.metros +" m.";
			}
			display_timer.text = "Time :" + scores.tiempo/100 + " CG's";
		}
		
		private function checkElapsed():Number
		{
			
			timePrevious = timeCurrent;
			timeCurrent = getTimer();
			elapsed = (timeCurrent - timePrevious);
			
			return elapsed;
		}
	}

}