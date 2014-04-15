package 
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Objects extends Sprite
	{
		private var _type:int;
		private var _speed:int;
		private var _alreadyHit:Boolean;
		private var _position:String;
		private var obstacleImage:Image;
		private var obstacleCrashImage:Image;
		private var obstacleAnimation:MovieClip;
		
		
		public function Objects(_type:int, _speed:int = 0)
		{
			super();
			
			this._type = _type;
			this._speed = _speed;
			
			_alreadyHit = false;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
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
				if (_type == 4) obstacleAnimation.visible = false;
				else obstacleImage.visible = false;
			}
		}

		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			createObstacleArt();
			createObstacleCrashArt();
			createWatchOutAnimation();
		}
		
		private function createObstacleCrashArt():void
		{
			obstacleCrashImage = new Image(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTextures("obstacle_"));
			obstacleCrashImage.visible = false;
			this.addChild(obstacleCrashImage);
		}
		
		private function createObstacleArt():void
		{
			if (_type == 4)
			{
				obstacleAnimation = new MovieClip(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTextures("obstacle_"), 10);
				Starling.juggler.add(obstacleAnimation);
				obstacleAnimation.x = 0;
				obstacleAnimation.y = 0;
				this.addChild(obstacleAnimation);
			}
			else
			{			
				obstacleImage = new Image(Assets.getAtlas("Sprites", Assets.SpritesXML, Assets.SpritesAtlas).getTextures("obstacle_"));
				obstacleImage.x = 0;
				obstacleImage.y = 0;
				this.addChild(obstacleImage);
			}
		}
	}
}