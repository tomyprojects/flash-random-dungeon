package {
	
	import flash.display.Sprite;
	public class World extends Sprite{
		public var map:Array = new Array();
		public var map_size:int;
		public var room_size:int;

		public var one_exit_room_list:Array = new Array();
		public var two_exit_room_list:Array = new Array();
		public var three_exit_room_list:Array = new Array();
		public var four_exit_room_list:Array = new Array();
		
		public var map_min_x:int;
		public var map_min_y:int;
		public var map_max_x:int;
		public var map_max_y:int;
		
		public var renderer:Random_Map_Renderer = new Random_Map_Renderer();
		
		public var darkness:Darkness;
		
		public var player:Player;
		
		public var phantom:Phantom;
		
		public function World()
		{
			
		}
		
		public function init()
		{
			darkness = new Darkness(room_size);
			
			addChild(renderer);
			addChild(darkness);
			addChild(phantom);
			addChild(player);
		}
		
		public function createPlayer(viewWidth:int, viewHeight:int):Player
		{
			player = new Player(this,viewWidth,viewHeight);
			
			player.x = viewWidth/2;
			player.y = viewHeight/2;
			
			return player;
		}
		
		public function createPhantom():Phantom
		{
			phantom = new Phantom(this);
			
			return phantom;
		}
		
		public function update(v:View)
		{
			if (phantom)
			{
				if (phantom.collisionTest(player))
				{
					player.die(v,darkness);
				}
				phantom.updateai();
				phantom.render(v);
			}
			
			renderer.render(v.x0, v.y0, v.xf, v.yf);
			
			darkness.render(phantom, player);
		}
		
		public function getRoom(px:int, py:int):World_Room
		{
			var i:int = py/room_size;
			var j:int = px/room_size;
			
			return World_Room(map[i][j]);
		}

		public function addMap(random_map:Random_Map_Generator, roomSize:int) {
			var i:int;
			var j:int;
			var n:int;
			var room:Room;
			var tileSize:int;
			var wroom:World_Room;
			
			renderer.addMap(random_map, roomSize/3);

			map_size = random_map.map_size;

			room_size = roomSize;
			
			tileSize = roomSize/3;
			
			map_min_x = 0;
			map_min_y = 0;
			map_max_x = room_size*random_map.map_size;
			map_max_y = room_size*random_map.map_size;

			for (i=0; i<map_size; i++) {
				map[i] = new Array(map_size);

				for (j=0; j<map_size; j++) {
					room = random_map.map[i][j] as Room;

					map[i][j] = new World_Room(room, tileSize);
					map[i][j].xloc = j*room_size;
					map[i][j].yloc = i*room_size;

					n = int(room.up) + int(room.down) + int(room.left) + int(room.right);
					
					if (room.up)
					{
						World_Room(map[i][j]).up = map[i-1][j];
					}

					switch (n) {
						case 1 :
							one_exit_room_list.push(i);
							one_exit_room_list.push(j);
							break;
						case 2 :
							two_exit_room_list.push(i);
							two_exit_room_list.push(j);
							break;
						case 3 :
							three_exit_room_list.push(i);
							three_exit_room_list.push(j);
							break;
						case 4 :
							four_exit_room_list.push(i);
							four_exit_room_list.push(j);
							break;
					}
				}
			}
			
			for (i=0; i<map_size; i++) {

				for (j=0; j<map_size; j++) {
					wroom = map[i][j] as World_Room;
					
					wroom.cx = wroom.xloc + room_size/2;
					wroom.cy = wroom.yloc + room_size/2;
					
					wroom.id_i = i;
					wroom.id_j = j;
					
					if (wroom.exit.up)
					{
						wroom.up = World_Room(map[i-1][j]);
					}
					if (wroom.exit.down)
					{
						wroom.down = map[i+1][j];
					}
					if (wroom.exit.left)
					{
						wroom.left = map[i][j-1];
					}
					if (wroom.exit.right)
					{
						wroom.right = map[i][j+1];
					}
				}
			}
		}
	}
}