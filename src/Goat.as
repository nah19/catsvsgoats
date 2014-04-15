package  
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.animation.Juggler;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class Goat extends Sprite 
	{
		private var goat:MovieClip;
		
		public function Goat() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			trace("Menu principal");
			createGoat();
		}
		
		private function createGoat():void
		{
			goat = new MovieClip(Assets.getAtlas("AnimacionGoat", Assets.AnimacionGoatXML, Assets.AnimacionGoatAtlas).getTextures("sprites_goat"), 24);
			goat.x = Math.ceil(-goat.width/2);
			goat.y = Math.ceil(-goat.height/2);
			Starling.juggler.add(goat);
			this.addChild(goat);
		}
		
		public function jumpingGoat():void
		{
			
		}
	}

}