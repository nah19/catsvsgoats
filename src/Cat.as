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
	public class Cat extends Sprite 
	{
		private var cat:MovieClip;
		
		public function Cat() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			trace("Menu principal");
			createCat();
		}
		
		private function createCat():void
		{
			cat = new MovieClip(Assets.getAtlas("AnimacionGato", Assets.AnimacionGatoXML, Assets.AnimacionGatoAtlas).getTextures("cat_"), 24);
			cat.x = Math.ceil(-cat.width/2);
			cat.y = Math.ceil(-cat.height/2);
			Starling.juggler.add(cat);
			this.addChild(cat);
		}
		
	}

}