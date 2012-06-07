package {
	import flash.display.MovieClip;

	public class myObject extends MovieClip {
		public var xloc:int;
		public var yloc:int;

		public var w:int;
		public var h:int;

		public function insideView(v:View):Boolean {
			if ((Math.abs(xloc - v.cx) << 1) < (v.w + w)) {
				return Math.abs(yloc - v.cy) << 1 < (v.h + h);
			}
			return false;
		}
		public function playerCollision(p:Player):Boolean
		{
			if ((Math.abs(xloc - p.box.cx) << 1) < (p.box.w + w)) {
				return Math.abs(yloc - p.box.cy) << 1 < (p.box.h + h);
			}
			return false;
		}
		public function render(v:View):void {
			if (insideView(v)) {
				visible = true;
				x = xloc - v.x0;
				y = yloc - v.y0;;
			} else {
				visible = false;
			}
		}
	}
}