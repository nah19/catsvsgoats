package  
{
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class SinglePlayer extends Sprite
	{
		private var parallax:ParallaxBg;
		
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
			
			parallax = new ParallaxBg();
			parallax.speed = 10;
			this.addChild(parallax);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
	}

}