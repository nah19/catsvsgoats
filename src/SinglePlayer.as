package  
{
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
			cat.y = (stage.stageHeight / 2) - 100;
			cat.scaleX = 0.8;
			cat.scaleY = 0.8;
			this.addChild(cat);
			
			goat = new Goat();
			goat.x = 150
			goat.y = (stage.stageHeight / 2) + 75;
			goat.scaleX = 0.45;
			goat.scaleY = -0.45;
			
			this.addChild(goat);
			
		}
		
		private function onTouch(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touch)
			{
				var localPos:Point = touch.getLocation(this);
				
				if (localPos.y>360)
				{
					
					var tweenGoat:Tween = new Tween(goat, 0.4, Transitions.EASE_IN_OUT);
					tweenGoat.reverse = true;
					tweenGoat.moveTo( goat.x, goat.y + 100);
					tweenGoat.repeatCount = 2;
					Starling.juggler.add(tweenGoat); 
					
				} 
				else
				{
					var tweenCat:Tween = new Tween(cat, 0.4, Transitions.EASE_IN_OUT);
					tweenCat.reverse = true;
					tweenCat.moveTo(cat.x, cat.y - 110);
					tweenCat.repeatCount = 2;
					Starling.juggler.add(tweenCat);
					
					//var tween:Tween = new Tween(cat, 2.0, Transitions.EASE_IN_OUT);
				    //tween.animate("y", cat.y - 110);
					//Starling.juggler.add(tween);
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
		}
		
	}

}