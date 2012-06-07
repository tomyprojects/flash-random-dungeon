package {


	public class View {
		public var x0:int;
		public var y0:int;
		public var xf:int;
		public var yf:int;
		
		public var cx:int;
		public var cy:int;

		private var minX:int;
		private var minY:int;
		private var maxX:int;
		private var maxY:int;

		public var w:int;
		public var h:int;
		
		public var target:Array = new Array();


		public var wDiv2:int;
		public var hDiv2:int;
		
		public var index:int;
		
		public function View(_x0:int, _y0:int, viewWidth:int, viewHeight:int, max_x:int, max_y:int,
		min_x:int=0, min_y:int=0) {
			
			x0 = _x0;
			y0 = _y0;
			xf = x0+viewWidth;
			yf = y0+viewHeight;

			w = viewWidth;
			h = viewHeight;
			wDiv2 = viewWidth/2;
			hDiv2 = viewHeight/2;
			 
			cx = x0 + wDiv2;
			cy = y0 + hDiv2;

			minX = min_x;
			minY = min_y;
			maxX = max_x;
			maxY = max_y;


		}
		
		public function init(world:World)
		{
			addPlayer(world.player);
			addPhantom(world.phantom);
		}
		
		private function addPlayer(t:Player)
		{
			target.push(t);
		}
		private function addPhantom(t:Phantom)
		{
			target.push(t);
		}
		
		public function follow(i:int) {
			index = i;
		}
		
		public function render() {
			
			var xloc:int = target[index].box.cx;
			var yloc:int = target[index].box.cy;
			
			x0 = xloc - wDiv2;
			y0 = yloc - hDiv2;

			xf = x0 + w;
			yf = y0 + h;
			
			cx = x0 + wDiv2;
			cy = y0 + hDiv2;

			if (x0 < minX+1) {
				x0 = minX+1;
				xf =x0+w;
			}
			if (y0 < minY+1) {
				y0 = minY+1;
				yf = y0+h;
			}
			if (xf >= maxX-1) {
				xf = maxX-1;
				x0 = xf - w;
			}
			if (yf >= maxY-1) {
				yf = maxY-1;
				y0 = yf - h;
			}
		}
	}
}