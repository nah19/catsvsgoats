package
{
	
	import NavigationEvent;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class Game extends Sprite
	{
		private var menuInicio:Menu;
		private var creditos:Credits;
		private var singlePlayer:SinglePlayer;
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("starling framework initialized!");
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, cambioEscena);
			
			singlePlayer = new SinglePlayer();
			singlePlayer.disposeTemporarily();
			this.addChild(singlePlayer);
			
			creditos = new Credits();
			creditos.disposeTemporarily();
			this.addChild(creditos);
			
			menuInicio = new Menu();
			this.addChild(menuInicio);
			menuInicio.initialize();
		}
		
		public function cambioEscena(event:NavigationEvent):void
		{
			trace("EntraEvento");
			switch (event.params.id)
			{
				case"singlePlayer":
					menuInicio.disposeTemporarily();
					singlePlayer.initialize();
					break;
					
				case "Creditos":
					
					menuInicio.disposeTemporarily();
					creditos.initialize();
					
					break;
				
				case "backMenu": 
					creditos.disposeTemporarily();
					menuInicio.initialize();
					
					break;
			}
		
		}
	
	}

}