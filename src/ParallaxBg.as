package  
{
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class ParallaxBg extends Sprite
	{
		private var parallaxLayer1:ParallaxLayer;
		
		private var _speed:Number = 0;
		public function ParallaxBg() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			parallaxLayer1 = new ParallaxLayer(1);
			parallaxLayer1.parallax = 0.02;
			this.addChild(parallaxLayer1);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			
			parallaxLayer1.x -= Math.ceil(_speed * parallaxLayer1.parallax);
			if (parallaxLayer1.x < -stage.stageWidth) parallaxLayer1.x = 0;
			
		}
		
		public function get speed():Number 
		{
			return _speed;
		}
		
		public function set speed(value:Number):void 
		{
			_speed = value;
		}
		
		
	}

}