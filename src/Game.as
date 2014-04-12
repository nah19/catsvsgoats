package  
{
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class Game extends Sprite
	{		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("starling framework initialized!");
		}
	}

}