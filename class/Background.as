package
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	
	class Background extends Sprite
	{
		private var sp:Sprite;
		
		public function Background()
		{
			sp = new Sprite();
			
			addChild(sp);
		}
		
		public function Draw()
		{
			sp.graphics.clear();
			
			sp.graphics.lineStyle(6);
			
			drawPoly4(0,0, 50,20, 90,60, 10,40);
		}
		
		/*
		01
		32
		
		0 - upper left
		1 - upper right
		2 - bottom right
		3 - bottom left
		*/
		public function drawPoly4(x0:Number,y0:Number,x1:Number,y1:Number,
								  x2:Number,y2:Number,x3:Number,y3:Number,color:uint=0xFF0000)
		{
			//sp.graphics.beginFill(color);
			sp.graphics.moveTo(x0,y0);
			sp.graphics.lineTo(x1,y1);
			sp.graphics.lineTo(x2,y2);
			sp.graphics.lineTo(x3,y3);
			//sp.graphics.endFill();
		}
	}
}