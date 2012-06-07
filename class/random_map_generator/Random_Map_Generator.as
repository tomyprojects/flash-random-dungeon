package
{
	import flash.display.Sprite;
	
	public class Random_Map_Generator extends Sprite
	{
		//2d array
		// elements = class room
		public var map:Array = new Array();
		
		private var total_rooms:int;
		public var map_size:int;
		
		private var new_room_probability:Number; // between 0  and 1
		private var minimap:Sprite;
		private var dot1:Sprite = new Sprite();
		private var dot2:Sprite = new Sprite();
		
		public var total_four_exit_rooms:int;
		public var total_three_exit_rooms:int;
		public var total_two_exit_rooms:int;
		public var total_one_exit_rooms:int;
		
		private var min:int;
		private var max:int;
		
		
		private var stack:Array = new Array();
		
		public function Random_Map_Generator(size:int = 10)
		{
			map_size = size; // 10 x 10 == 100 rooms
			
			min = 1;
			
			max = map_size -1;
			
			total_rooms = 0;
			
			new_room_probability = 0.5;
			
			minimap = new Sprite();
			
			addChild(minimap);
			addChild(dot1);
			addChild(dot2);
			
			init_array();
			
			gen_map();
		}
		
		public function totalRooms():int
		{
			
			if (total_rooms == 0)
			{
				var i:int;
				var j:int;
				var n:int;
				var room:Room;
				
				for (i=0; i<map_size; i++) // row
				{
					for (j=0; j<map_size; j++) // column
					{
						room = map[i][j] as Room;
						
						if (room.exist())
						{
							n = int(room.up) + int(room.down) + int(room.left) + int(room.right);
							
							switch (n)
							{
								case 1:
								total_one_exit_rooms++;
								break;
								case 2:
								total_two_exit_rooms++;
								break;
								case 3:
								total_three_exit_rooms++;
								break;
								case 4:
								total_four_exit_rooms++;
								break;
							}
							
							total_rooms++;
						}
					}
				}
			}
			
			return total_rooms;
		}
		
		public function beginDraw()
		{
			minimap.graphics.clear();
			
		}
		
		public function drawMiniMap(x0:int=0, y0:int=0, 
									  minimap_tile_size:int=20)
		{
			var i:int;
			var j:int;
			
			var cx:int = x0;
			var cy:int = y0;
			
			var room:Room;
			
			minimap.graphics.lineStyle(minimap_tile_size/3, 0x444444);
			
			dot1.graphics.lineStyle(minimap_tile_size/6, 0xff0000);
			dot1.graphics.drawCircle(0,0,minimap_tile_size/8);
			
			dot2.graphics.lineStyle(minimap_tile_size/6, 0x00ff00);
			dot2.graphics.drawCircle(0,0,minimap_tile_size/8);
			
			for (i=0; i<map_size; i++) // row
			{
				for (j=0; j<map_size; j++) // column
				{
					room = map[i][j] as Room;
					
					if (room.up)
					{
						
						minimap.graphics.moveTo(cx+minimap_tile_size/2, cy+minimap_tile_size/2);
						minimap.graphics.lineTo(cx+minimap_tile_size/2, cy);
					}
					if (room.down)
					{
						minimap.graphics.moveTo(cx+minimap_tile_size/2, cy+minimap_tile_size/2);
						minimap.graphics.lineTo(cx+minimap_tile_size/2, cy+minimap_tile_size);
					}
					if (room.left)
					{
						minimap.graphics.moveTo(cx+minimap_tile_size/2, cy+minimap_tile_size/2);
						minimap.graphics.lineTo(cx, cy+minimap_tile_size/2);
					}
					if (room.right)
					{
						minimap.graphics.moveTo(cx+minimap_tile_size/2, cy+minimap_tile_size/2);
						minimap.graphics.lineTo(cx+minimap_tile_size, cy+minimap_tile_size/2);
					}
					
					cx += minimap_tile_size;
				}
				
				cx = x0;
				cy += minimap_tile_size;
			}
			
			
			
		}
		
		public function drawDot1(world:World,xloc:int, yloc:int,minimap_tile_size:int=20)
			{
				dot1.visible = true;
				dot1.x = (xloc/world.room_size)*minimap_tile_size;
				dot1.y = (yloc/world.room_size)*minimap_tile_size;
				
			}
			
			public function drawDot2(world:World,xloc:int, yloc:int,minimap_tile_size:int=20)
			{
				dot2.visible = true;
				dot2.x = (xloc/world.room_size)*minimap_tile_size;
				dot2.y = (yloc/world.room_size)*minimap_tile_size;
				
			}
			
		
		private function init_array()
		{
			for (var i:int=0; i<map_size; i++)
			{
				map[i] = new Array(map_size);
				
				for (var j:int=0; j<map_size; j++)
				{
					map[i][j] = new Room();
				}
			}
		}
		
		private function gen_map()
		{
			// start at middle
			var i:int = (map_size+1)/2;
			var j:int = (map_size+1)/2;
			
			map[i][j].up = true;
			map[i][j].down = true;
			map[i][j].left = true;
			map[i][j].right = true;
			
			gen_room(i+1, j);
			gen_room(i-1, j);
			gen_room(i, j+1);
			gen_room(i, j-1);
			
			while (stack.length > 0)
			{
				j = stack.pop();
				i = stack.pop();
				
				
				if (Room(map[i][j]).exist())
				{
					continue;
				}
				
				root_gen_room(i, j);
			}
		}
		
		private function gen_room(i:int, j:int):void
		{
			if (Room(map[i][j]).exist())
			{
				return;
			}
			
			stack.push(i); 
			stack.push(j);
		}
		
		private function root_gen_room(i:int, j:int):void
		{
			if (i < min || i >= max || j < min || j >= max)
			{
				return;
			}
			
			// Examine surrounding rooms
			if (i - 1 >=min) 	// Examine up room
			{
				if (map[i-1][j].exist())
				{
					if (map[i-1][j].down)
					{
						map[i][j].up = true;
					}
				}
			}
			if (i + 1 <max) 				// Examine down room
			{
				if (map[i+1][j].exist())
				{
					if (map[i+1][j].up)
					{
						map[i][j].down = true;
					}
				}
				
			}
			if (j + 1 <max) 	// Examine right
			{
				if (map[i][j+1].exist())
				{
					if (map[i][j+1].left)
					{
						map[i][j].right = true;
					}
				}
			}
			if (j - 1 >=min) 				// Examine left
			{
				if (map[i][j-1].exist())
				{
					if (map[i][j-1].right)
					{
						map[i][j].left = true;
					}
				}
			}
			
			// Create new rooms
			if (i - 1 >=min) 	// Examine up room
			{
				if (map[i-1][j].exist())
				{
				}
				else
				{
					if (Math.random() < new_room_probability)
					{
						map[i][j].up = true;
						gen_room(i-1, j);
					}
				}
			}
			if (i + 1 <max) 				// Examine down room
			{
				if (map[i+1][j].exist())
				{
				}
				else
				{
					if (Math.random() < new_room_probability)
					{
						map[i][j].down = true;
						gen_room(i+1, j);
					}
				}
				
			}
			if (j + 1 <max) 	// Examine right
			{
				if (map[i][j+1].exist())
				{
				}
				else
				{
					
					if (Math.random() < new_room_probability)
					{
						map[i][j].right = true;
						gen_room(i, j+1);
					}
				}
			}
			if (j - 1 >=min) 				// Examine left
			{
				if (map[i][j-1].exist())
				{
				}
				else
				{
					if (Math.random() < new_room_probability)
					{
						Room(map[i][j]).left = true;
						gen_room(i, j-1);
					}
				}
			}
		}
	}
}