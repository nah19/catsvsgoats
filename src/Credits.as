package
{
	import starling.animation.Transitions;
	import starling.animation.Tween;
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
	public class Credits extends Sprite
	{
		var fondo:Image;
		var back:Button;
		var marco:Image;
		var david:Image;
		
		
		public function Credits()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			trace("Menu principal");
			drawScreen();
		}
		
		private function drawScreen():void
		{
			fondo = new Image(Assets.getTexture("FondoCreditos"));
			this.addChild(fondo);
			
			back = new Button(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTexture("Back"));
			back.x = -20;
			back.y = 550;
			this.addChild(back);
			
			marco = new Image(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTexture("Marco"));
			marco.x = -35;
			marco.y = -250;
			this.addChild(marco);
			
			david = new Image(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTexture("David"));
			david.x = 515;
			david.y = -250;
			this.addChild(david);
			
			
			
			this.addEventListener(Event.TRIGGERED, sceneManager);
		}
		
		public function sceneManager(event:Event):void
		{
			var botonClicado:Button = event.target as Button;
			if (botonClicado == back)
			{
				trace("Enviando evento");
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "backMenu"}, true));
			}
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
	
	}

}