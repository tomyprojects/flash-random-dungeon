package
{
	import flash.display.MovieClip;
	
	public class Darkness extends MovieClip
	{
		public var a:int;
		public var b:int;
		public var c:int;
		
		public var sound:Brown_Noise = new Brown_Noise();
		
		public function Darkness(room_size:int)
		{
			x = 0;
			y = 0;
			alpha = 0;
			
			a = room_size*room_size;
			
			//sound.playsound();
			
		}
		
		public function render(pm:Phantom, pr:Player)
		{
			if (pr.visible)
			{
				b = (pm.box.cx - pr.box.cx)*(pm.box.cx - pr.box.cx);
				c = (pm.box.cy - pr.box.cy)*(pm.box.cy - pr.box.cy);
				
				//if (b + c > int(8*a))
				//{
				//	alpha = 0;
				//}
				//else
				{
					alpha = Math.min(0.95, a/(b+c));
					
					
					if (alpha > 0.25)
					{
						//sound.setvolume(alpha);
						sound.playsound(alpha*alpha*alpha);
						
					}
					else
					{
						sound.stopsound();
					}
				}
			}
		}
	}
}