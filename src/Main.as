package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Sprite;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	[SWF(frameRate="60", width="1280", height="720", backgroundColor="0x333333")]
	public class Main extends Sprite 
	{
		private var stats:Stats;
		private var myStarling:Starling;
		public function Main():void 
		{
			stats = new Stats();
			this.addChild(stats);
			
			Starling.multitouchEnabled = true;
			
			myStarling = new Starling(Game, stage);
			myStarling.simulateMultitouch = true;
			myStarling.antiAliasing = 1;
			myStarling.start();
			
		}		
	}
	
}