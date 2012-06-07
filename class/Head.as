package
{
	import flash.display.MovieClip;
	
	public class Head extends MovieClip
	{
		public var bobamt:Number;
		
		public function Head()
		{
			x = 100;
			y = 30;
			
			bobamt = 1;
		}
		
		public function bob():void
		{
			if (y > 50)
			{
				bobamt = -1;
			}
			else if (y < 30)
			{
				bobamt = 1;
			}
			
			y += bobamt;
		}
	}
}