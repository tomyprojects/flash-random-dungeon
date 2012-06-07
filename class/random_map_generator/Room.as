package
{
	//import flash.display.Sprite
	
	public class Room //extends Sprite
	{
		public function Room()
		{
			up = false;
			down = false;
			left = false;
			right = false;
		}
		
		public var up:Boolean;
		public var down:Boolean;
		public var left:Boolean;
		public var right:Boolean;
		
		public function exist():Boolean
		{
			return (up || left || down || right);
		}
	}
}