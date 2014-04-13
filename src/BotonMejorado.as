package
{
	import starling.display.Button;
	import starling.textures.Texture;
	import starling.events.TouchEvent;
	import starling.events.Event;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	
	 //Clase que extiende la de Button, puediendo hacer mouseOver, y pudiendo igualar el estado de otro boton al de este
	public class BotonMejorado extends Button
	{
		var defaultTexture:Texture
		var onMouseOver:Boolean;
		var isOver:Boolean;
		var dependencia:BotonMejorado;
		
		public function BotonMejorado(upState:Texture, text:String = "", downState:Texture = null, onMouseOver:Boolean = false, dependencia:BotonMejorado = null)
		{
			defaultTexture = upState;
			this.dependencia = dependencia;
			isOver = false;
			this.onMouseOver = onMouseOver;
			super(upState, text, downState);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			removeEventListener(Event.ADDED, onAddedToStage);
			if (onMouseOver)
			{
				this.addEventListener(TouchEvent.TOUCH, onTouch);
			}
		}
		
		protected function onTouch(e:TouchEvent):void
		{
			var touchHover:Touch = e.getTouch(this, TouchPhase.HOVER);
			
			if (touchHover)
			{
				//Si existe algun boton que queramos activar a la vez que este, lo activamos
				if (dependencia != null)
				{
					dependencia.setOver(true);
				}
				
				isOver = true;
				trace("show");
				this.setOver(true);
			}
			else
			{
				//Si existe algun boton que queramos desactivar a la vez que este, lo desactivamos
				if (dependencia != null)
				{
					dependencia.setOver(false);
				}
				
				isOver = false;
				trace("hide");
				this.setOver(false);
			}
		
		}
		
		//Devuelve el estado en el que se encuentra el boton, es decir, si tiene el cursor por encima o no
		public function getOverState():Boolean
		{
			return isOver;
		}
		
		//Se activa manualemente el estado en el que se encuentra el cursor
		public function setOver(state:Boolean):void
		{
			if (state)
			{
				isOver = true;
				upState = downState;
			}
			else
			{
				isOver = false;
				upState = defaultTexture;
			}
		}
	
	}

}