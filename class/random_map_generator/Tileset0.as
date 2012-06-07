package
{
	import flash.display.MovieClip;
	
	public class Tileset0 extends MovieClip
	{
		public function Tileset0()
		{
		}
		
		public function setFrame(upborder:Boolean,downborder:Boolean,leftborder:Boolean,rightborder:Boolean)
		{
			var n:int;
			
			n = int(upborder) + int(downborder) + int(rightborder) + int(leftborder);
			
			switch(n)
			{
				case 0:
				gotoAndStop(10);
				break;
				case 1:
				case 2:
				if (upborder)
				{
					if (leftborder)
					{
						gotoAndStop(9);
					}
					else if(rightborder)
					{
						gotoAndStop(8);
					}
					else
					{
						gotoAndStop(4);
					}
				}
				else if (downborder)
				{
					if (leftborder)
					{
						gotoAndStop(6);
					}
					else if(rightborder)
					{
						gotoAndStop(7);
					}
					else
					{
						gotoAndStop(2);
					}
				}
				else if (leftborder)
				{
					gotoAndStop(5);
				}
				else if (rightborder)
				{
					gotoAndStop(3);
				}
				else
				{
					// error
					gotoAndStop(1);
				}
				break;
				default: // error
					gotoAndStop(1);
				break;
			}
		}
	}
}