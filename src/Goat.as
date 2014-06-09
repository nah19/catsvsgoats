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
		public var goatStatus:String; //estados: jumping, doubleJumping, idle, charging, running
		
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
				
		public function switchStatus (newstatus:String = "running"):void
		{
			switch (newstatus) {
				case "jumping" :
				  goat.pause();
				  //TODO: crear animacion de salto
				  break;
				case "doubleJumping" :
				  goat.pause();
				  //TODO: reload animacion de salto
				  break;
				case "charging" :
				  goat.pause();
				  //TODO: crear animacion de carga
				  break;
			  case "falling":
				  goat.pause();
				  break;
				case "running" :
				  goat.play();
				  break;
				default :
				  trace("estado no reconocido"+newstatus);
				  break;
				}
				goatStatus = newstatus;
		}
		
		public function isJumping ():Boolean
		{
			return (goatStatus == "jumping") ? true : false;
		}
		
		public function isDoubleJumping ():Boolean
		{
			return (goatStatus == "doubleJumping") ? true : false;
		}
		
		public function isRunning ():Boolean
		{
			return (goatStatus == "running") ? true : false;
		}
		
		public function isFalling ():Boolean
		{
			return (goatStatus == "falling") ? true : false;
		}
		
		public function getstatus ():String
		{
			return goatStatus;
		}
	}

}