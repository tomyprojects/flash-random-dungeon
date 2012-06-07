package
{
	import flash.display.Sprite
	
	public class Tiles extends Sprite
	{
		// upper left world coordinate
		public var vx:int;
		public var vy:int;
		
		// bottom right world coordinate
		public var vxf:int;
		public var vyf:int;
		
		// nine tiles
		
		private var Tile0:Tileset0 = new Tileset0();
		private var Tile1:Tileset0 = new Tileset0();
		private var Tile2:Tileset0 = new Tileset0();
		private var Tile3:Tileset0 = new Tileset0();
		private var Tile4:Tileset0 = new Tileset0();
		private var Tile5:Tileset0 = new Tileset0();
		private var Tile6:Tileset0 = new Tileset0();
		private var Tile7:Tileset0 = new Tileset0();
		private var Tile8:Tileset0 = new Tileset0();
		
		// tile size
		var dx:int;
		var dy:int;
		
		public function Tiles(room:Room, worldx:int, worldy:int, tileSize:int)
		{
			
			// 012
			// 345
			// 678
				
				
			vx = worldx;
			vy = worldy;
			
			vxf = worldx+int(3*tileSize);
			vyf = worldy+int(3*tileSize);
			
			dx = tileSize;
			dy = tileSize;
			
			Tile0.x = 0;
			Tile1.x = dx;
			Tile2.x = int(2*dx);
			
			Tile3.x = 0;
			Tile4.x = dx;
			Tile5.x = int(2*dx);
			
			Tile6.x = 0;
			Tile7.x = dx;
			Tile8.x = int(2*dx);
			
			Tile0.y = 0;
			Tile1.y = 0;
			Tile2.y = 0;
			
			Tile3.y = dy;
			Tile4.y = dy;
			Tile5.y = dy;
			
			Tile6.y = int(2*dy);
			Tile7.y = int(2*dy);
			Tile8.y = int(2*dy);
			
			if (room.exist())
			{
				// 012
				// 345
				// 678
				
				Tile0.setFrame(false,room.left,false,room.up);
				Tile2.setFrame(false,room.right,room.up,false);
				Tile6.setFrame(room.left,false,false,room.down);
				Tile8.setFrame(room.right,false,room.down,false);
				
				addChild(Tile0);
				addChild(Tile2);
				addChild(Tile6);
				addChild(Tile8);
				
				Tile1.setFrame(false,!room.up,false,false);
				if (!room.up)
				{
					addChild(Tile1);
				}
				Tile3.setFrame(false,false,false,!room.left);
				if (!room.left)
				{
					addChild(Tile3);
				}
				Tile5.setFrame(false,false,!room.right,false);
				if (!room.right)
				{
					addChild(Tile5);
				}
				Tile7.setFrame(!room.down,false,false,false);
				if (!room.down)
				{
					addChild(Tile7);
				}
				
				Tile4.setFrame(false,false,false,false);
			}
			else
			{
				Tile0.setFrame(false,false,false,false);
				Tile1.setFrame(false,false,false,false);
				Tile2.setFrame(false,false,false,false);
				Tile3.setFrame(false,false,false,false);
				Tile4.setFrame(false,false,false,false);
				Tile5.setFrame(false,false,false,false);
				Tile6.setFrame(false,false,false,false);
				Tile7.setFrame(false,false,false,false);
				Tile8.setFrame(false,false,false,false);
				
				addChild(Tile0);
				addChild(Tile1);
				addChild(Tile2);
				addChild(Tile3);
				addChild(Tile4);
				addChild(Tile5);
				addChild(Tile6);
				addChild(Tile7);
				addChild(Tile8);
			}
			
			
		}
		
		public function clip(x0:int, y0:int, xf:int, yf:int)
		{
			var i:int;
			var j:int;
			
			
			
			j = (xf - vx)/dx;
			i = (yf - vy)/dy;
			
			if (i < 2 || j < 2)
			{
				Tile0.visible = !((i<0) || (j<0));
				Tile1.visible = !((i<0) || (j<1));
				Tile2.visible = !((i<0) || (j<2));
				Tile3.visible = !((i<1) || (j<0));
				Tile4.visible = !((i<1) || (j<1));
				Tile5.visible = !((i<1) || (j<2));
				Tile6.visible = !((i<2) || (j<0));
				Tile7.visible = !((i<2) || (j<1));
				Tile8.visible = !((i<2) || (j<2));
			}
			
			j = (x0 - vx)/dx;
			i = (y0 - vy)/dy;
			
			if (i>0 || j>0)
			{
				Tile0.visible = !((i > 0) || (j > 0));
				Tile1.visible = !((i > 0) || (j > 1));
				Tile2.visible = !((i > 0) || (j > 2));
				Tile3.visible = !((i > 1) || (j > 0));
				Tile4.visible = !((i > 1) || (j > 1));
				Tile5.visible = !((i > 1) || (j > 2));
				Tile6.visible = !((i > 2) || (j > 0));
				Tile7.visible = !((i > 2) || (j > 1));
				Tile8.visible = !((i > 2) || (j > 2));
			}
			
			/*Tile0.visible = true;
				Tile1.visible= true;
				Tile2.visible = true;
				Tile3.visible = true;
				Tile4.visible = true;
				Tile5.visible = true;
				Tile6.visible = true;
				Tile7.visible = true;
				Tile8.visible = true;*/
		}
	}
}