package {
	import flash.display.Sprite;

	public class mySprite extends Sprite {
		public var xloc:int;
		public var yloc:int;

		public var w:int;
		public var h:int;

		public function insideView(v:View):Boolean {
			if ((Math.abs(xloc - v.cx) << 1) < (v.w + w)) {
				return Math.abs(yloc - v.cy) << 1 < v.h + h;
			}
			return false;
		}
		public function render(v:View):void {
			if (insideView(v)) {
				visible = true;
				x = xloc - v.cx;
				y = yloc- v.cy;
			} else {
				visible = false;
			}
		}
	}
}