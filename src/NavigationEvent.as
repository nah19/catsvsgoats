package
{
	
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Marco Domingo & David Rodriguez
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_SCREEN:String = "changeScreen";
		
		var params:Object;
		
		public function NavigationEvent(type:String, _params:Object = null ,bubbles:Boolean=false) 
		{
			super(type, bubbles, data);
			this.params = _params;
		}
		
	}

}