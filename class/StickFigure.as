package
{
	import flash.display.Sprite
	
	public class StickFigure extends Sprite
	{
		private var color1:uint = 0x111111;
		private var color2:uint = 0x222222; // back limb color
		
		// reference
		private var ref:Sprite = new Sprite();
		private var ref2:Sprite = new Sprite();
		// body
		private var body:Sprite = new Sprite();
		// leg 1
		private var legb1:Sprite = new Sprite();
		private var legb2:Sprite = new Sprite();
		// leg 2
		private var leg1:Sprite = new Sprite();
		private var leg2:Sprite = new Sprite();
		// arm 1
		private var armb1:Sprite = new Sprite();
		private var armb2:Sprite = new Sprite();
		// arm 2
		private var arm1:Sprite = new Sprite();
		private var arm2:Sprite = new Sprite();
		// head
		private var head:Sprite = new Sprite();
		
		// animation speed
		private var t:Number = 0;
		private var step:Number = Math.PI/10;
		
		
		private var i:int;
		private var j:int;
		
		public function StickFigure()
		{
			
			scaleX = 0.3;
			scaleY = 0.3;
			
			addChild(ref);
			ref.addChild(ref2);
			ref.addChild(legb1);
			ref.addChild(leg1);
			//body.graphics.lineStyle(10, color1);
			
			ref2.addChild(armb1);
			ref2.addChild(head);
			ref2.addChild(body);
			ref2.addChild(arm1);
			
			setColor(color1, color1);
			
			body.graphics.lineTo(0,-30);
			
			head.y = -49;
			//head.graphics.lineStyle(10, color1);
			head.graphics.drawCircle(0,0,10);
			
			armb1.y = -30;
			//armb1.graphics.lineStyle(10, color2);
			armb1.graphics.lineTo(0,20);
			armb1.rotation = 15;
			armb1.addChild(armb2);
								  
			armb2.y = 20;
			//armb2.graphics.lineStyle(10, color2);
			armb2.graphics.lineTo(0,20);
			
			arm1.y = -30;
			//arm1.graphics.lineStyle(10, color1);
			arm1.graphics.lineTo(0,20);
			arm1.rotation = 15;
			arm1.addChild(arm2);
								  
			arm2.y = 20;
			//arm2.graphics.lineStyle(10, color1);
			arm2.graphics.lineTo(0,20);
			
			legb1.addChild(legb2);
			//legb1.graphics.lineStyle(10, color2);
			legb1.graphics.lineTo(0,20);
			
			//legb1.rotation = 45;
			
			legb2.y = 20;
			//legb2.graphics.lineStyle(10,color2);
			legb2.graphics.lineTo(0,20);
			
			//legb2.rotation = 45;
			
			leg1.addChild(leg2);
			//leg1.graphics.lineStyle(10, color1);
			leg1.graphics.lineTo(0,20);
			
			//legb1.rotation = 45;
			
			leg2.y = 20;
			//leg2.graphics.lineStyle(10,color1);
			leg2.graphics.lineTo(0,20);
			
			//legb2.rotation = 45;
			
			
			stand();
		}
		
		public function setColor(c1:uint, c2:uint)
		{
			body.graphics.lineStyle(10, c1);
			head.graphics.lineStyle(10, c1);
			armb1.graphics.lineStyle(10, c2);
			armb2.graphics.lineStyle(10, c2);
			arm1.graphics.lineStyle(10, c1);
			arm2.graphics.lineStyle(10, c1);
			legb1.graphics.lineStyle(10, c2);
			legb2.graphics.lineStyle(10,c2);
			leg1.graphics.lineStyle(10, c1);
			leg2.graphics.lineStyle(10,c1);
		}
		
		
		public function stand()
		{
			ref2.rotation = 0;
			
			armb1.rotation = 25;
			armb2.rotation = 0;
			
			arm1.rotation = -25;
			arm2.rotation = 0;
			
			legb1.rotation = 15
			legb2.rotation = 0;
			
			leg1.rotation = -15;
			leg2.rotation = 0;
			
			arm1.scaleY = 1;
			arm2.scaleY = 1;
			
			armb1.scaleY = 1;
			armb2.scaleY = 1;
			
			leg1.scaleY = 1;
			leg2.scaleY = 1;
			
			legb1.scaleY = 1;
			legb2.scaleY = 1;
		}
		
		public function runDown()
		{
			var sin:Number;
			var cos:Number;
			var sin2:Number;
			var cos2:Number;
			
			t+= step;
			
			sin = Math.sin(t);
			cos = Math.cos(t);
			
			sin2 = Math.sin(t + Math.PI);
			cos2 = Math.cos(t + Math.PI);
			
			ref2.rotation = 0;
			
			arm1.rotation = 25;
			arm2.rotation = 160;
			
			armb1.rotation = -25;
			armb2.rotation = -160;
			
			legb1.rotation = 10;
			legb2.rotation = -5;
			
			leg1.rotation = -10;
			leg2.rotation = 5;
			
			
			
			arm1.scaleY = 0.2*sin + 1;
			arm2.scaleY = 0.2*sin2 + 0.5;
			//armb2.rotation = 5*sin2 + 160;
			
			armb1.scaleY = 0.2*sin2 + 1;
			armb2.scaleY = 0.2*sin + 0.5;
			//arm2.rotation = -5*sin - 160;
			
			leg1.scaleY = 0.1*sin + 0.9;
			leg2.scaleY = 0.5*cos2 + 0.9;
			
			legb1.scaleY = 0.1*sin2 + 0.9;
			legb2.scaleY = 0.5*cos + 0.9;
		}
		
		public function pose1()
		{
			ref2.rotation = 0;
			
			armb1.rotation = 25;
			armb2.rotation = 145;
			
			arm1.rotation = -25;
			arm2.rotation = 0;
			
			legb1.rotation = 25
			legb2.rotation = -20;
			
			leg1.rotation = -25;
			leg2.rotation = 20;
		}
		
		public function runRight()
		{
			var sin:Number;
			var sin2:Number;
			var sin_2:Number;
			var sin2_2:Number;
			
			var t2:Number;
			
			t += step;
			
			if (t > 2*Math.PI)
			{
				t -= 2*Math.PI;
			}
			
			t2 = t+Math.PI;
			
			ref2.rotation = 10;
			
			sin = Math.sin(t);
			sin2 = Math.sin(t/2);
			
			sin_2 = Math.sin(t2);
			sin2_2 = Math.sin((t2)/2);
			
			/* run left
			legb1.rotation = -60*sin;
			
			legb2.rotation = -100*sin2*sin2;*/
			legb1.rotation = 60*sin;
			legb2.rotation = 90*sin2*sin2;
			
			leg1.rotation = 60*sin_2;
			leg2.rotation = 90*sin2_2*sin2_2;
			
			
			armb1.rotation = legb1.rotation;
			armb2.rotation = -15*sin - 115;
			armb2.scaleY = 0.2*Math.cos(t) + 0.7;
			
			
			arm1.rotation = leg1.rotation;
			arm2.rotation = -15*sin_2 - 115;
			arm2.scaleY = 0.2*Math.cos(t2) + 0.7;
			
			leg1.scaleY = 1;
			leg2.scaleY = 1;
			
			legb1.scaleY = 1;
			legb2.scaleY = 1;
		}
		
		public function runLeft()
		{
			var sin:Number;
			var sin2:Number;
			var sin_2:Number;
			var sin2_2:Number;
			
			var t2:Number;
			
			t += step;
			
			if (t > 2*Math.PI)
			{
				t -= 2*Math.PI;
			}
			
			t2 = t+Math.PI;
			
			ref2.rotation = -10;
			
			sin = Math.sin(t);
			sin2 = Math.sin(t/2);
			
			sin_2 = Math.sin(t2);
			sin2_2 = Math.sin((t2)/2);
			
			/* run left
			legb1.rotation = -60*sin;
			
			legb2.rotation = -100*sin2*sin2;*/
			
			
			legb1.rotation = -60*sin;
			legb2.rotation = -90*sin2*sin2;
			
			leg1.rotation = -60*sin_2;
			leg2.rotation = -90*sin2_2*sin2_2;
			
			
			armb1.rotation = legb1.rotation;
			armb2.rotation = 15*sin + 115;
			armb2.scaleY = 0.2*Math.cos(t) + 0.7;
			
			
			arm1.rotation = leg1.rotation;
			arm2.rotation = 15*sin_2 + 115;
			arm2.scaleY = 0.2*Math.cos(t2) + 0.7;
			
			leg1.scaleY = 1;
			leg2.scaleY = 1;
			
			legb1.scaleY = 1;
			legb2.scaleY = 1;
		}
		
		public function animate(n:int)
		{
			switch (n)
			{
				case 0:
				stand();
				break;
				case 1:
				case 2:
				runDown();
				break;
				case 3:
				runLeft()
				break;
				case 4:
				runRight();
				break;
			}
			//runLeft();
			//stand();
			//runDown();
		}
	}
}