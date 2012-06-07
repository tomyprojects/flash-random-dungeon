package
{
	
	public class Bounding_Box
	{
		public var cx:int;
		public var cy:int;
		
		public var w:int;
		public var h:int;
		
		public function insideView(v:View):Boolean
		{
			if ((Math.abs(cx - v.cx) << 1) < (v.w + w))
			{
				return ((Math.abs(cy - v.cy) << 1) < (v.h + h))
			}
			
			return false;
		}
		
		
	}
}