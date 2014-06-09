package
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.animation.Juggler;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Objects extends Sprite
	{
		private var _type:int;
		private var _speed:int;
		private var _alreadyHit:Boolean;
		private var _position:String;
		private var _obstacleID:int;
		private var obstacleImage:Image;
		private var obstacleCrashImage:Image;
		private var obstacleAnimation:MovieClip;
		private var aleatorio:int;
		private var arrayObjetos:Array;
		private var altoImagen:int;
		private var anchoImagen:int;
		
		public function Objects(_type:int, _speed:int = 0, _obstacleID:int = 0)
		{
			super();
			
			this._type = _type;
			this._speed = _speed;
			this._obstacleID = _obstacleID;
			
			_alreadyHit = false;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function get alreadyHit():Boolean
		{
			return _alreadyHit;
		}
		
		public function set alreadyHit(value:Boolean):void
		{
			_alreadyHit = value;
			
			if (value)
			{
				obstacleCrashImage.visible = true;
				if (_type == 4)
					obstacleAnimation.visible = false;
				else
					obstacleImage.visible = false;
			}
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			if (_type == 3)
			{
				createObstacleArt(_obstacleID);
				alignPivot(HAlign.LEFT, VAlign.BOTTOM);
				x = 1300;
				y = 390;
				scaleY = -1;
			} 
			else if (_type == 2)
			{
				createObstacleArt();
				alignPivot(HAlign.LEFT, VAlign.BOTTOM);
				x = 1300;
				y = 390;
				scaleY = -1;
			}
			else
			{
				createObstacleArt();
				alignPivot(HAlign.LEFT, VAlign.BOTTOM);
				x = 1300;
				y = 335;	
			}
		}
		
		
		private function createObstacleArt(obstacle:int = 999):void
		{
			arrayObjetos = new Array("Object_Avestruz1", "Object_Bart1", "Object_Bici1", "Object_Bici2", "Object_Bici3", "Object_Bici4", "Object_Cabina1", "Object_Carrito1", "Object_Coche1", "Object_Coche2");
			aleatorio = Math.ceil(Math.random() * arrayObjetos.length);
			
			
			if (_type == 4)
			{
				//obstacleAnimation = new MovieClip(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTexture("Object_"));
				Starling.juggler.add(obstacleAnimation);
				obstacleAnimation.x = 0;
				obstacleAnimation.y = 0;
				this.addChild(obstacleAnimation);
			}
			else
			{
				var obstacleKey:int = (obstacle == 999 ? aleatorio - 1 : obstacle);
				this._obstacleID = obstacleKey;
				obstacleImage = new Image(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTexture(arrayObjetos[obstacleKey]));
				
				obstacleImage.x = 0;
				obstacleImage.y = 0;
				anchoImagen = obstacleImage.texture.width;
				altoImagen = obstacleImage.texture.height;
				this.addChild(obstacleImage);
			}
			
		}
		
		public function get obstacleID():int
		{
			return _obstacleID;
		}
		
		public function get speed():int
		{
			return _speed;
		}
		
		public function set speed(value:int):void
		{
			_speed = value;
		}
		
		public function get position():String
		{
			return _position;
		}
		
		public function set position(value:String):void
		{
			_position = value;
		}
		
		public function alto():Number
		{
		
			return altoImagen;
			
		}
		
		public function ancho():Number
		{
		
			return anchoImagen;
			
		}
		
	}
}