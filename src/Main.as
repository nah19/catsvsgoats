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
	[SWF(frameRate="60", width="600", height="800", backgroundColor="0x333333")]
	public class Main extends Sprite 
	{
		private var stats:Stats;
		private var myStarling:Starling;
		public function Main():void 
		{
			stats = new Stats();
			this.addChild(stats);
			
			myStarling = new Starling(Game, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}		
	}
	
}