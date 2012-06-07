package 
{
	import flash.display.Sprite;

	public class Random_Map_Renderer extends Sprite 
	{
		public var map:Array = new Array();
		public var map_size:int;
		public var tile_size_pixel:int;
		public var map_size_pixels:int;
		public var room_size:int;
		
		public function Random_Map_Renderer()
		{
			
		}
		
		
		public function addMap(random_map:Random_Map_Generator, tile_width:int)
		{
			map_size = random_map.map_size;
			
			tile_size_pixel = tile_width;
			
			room_size = 3*tile_size_pixel;
			
			map_size_pixels = map_size*room_size;
			
			init_array(random_map);
		}
		
		private function init_array(random_map:Random_Map_Generator)
		{
			for (var i:int=0; i<map_size; i++)
			{
				map[i] = new Array(map_size);
				
				for (var j:int=0; j<map_size; j++)
				{
					map[i][j] = new Tiles(Room(random_map.map[i][j]),int(j*room_size),int(i*room_size),tile_size_pixel);
					addChild(Tiles(map[i][j]));
					Tiles(map[i][j]).visible = false;
				}
			}
		}
		
		// world coordinates
		public function render(x0:int,y0:int,xf:int,yf:int) 
		{
			
			var i:int;
			var j:int;
			var tile:Tiles;

			j = Math.max(x0/room_size, 0);
			i = Math.max(y0/room_size, 0);
			
			tile = map[i][j] as Tiles;
			
			tile.visible = true;
			
			tile.x =  tile.vx - x0;
			tile.y = tile.vy - y0;
			
			if (i > 0) {
					Tiles(map[i-1][j]).visible = false;
				}
				if (j > 0) {
					Tiles(map[i][j-1]).visible = false;
				}
			if (i > 0 && j > 0) {
				Tiles(map[i-1][j-1]).visible = false;
			}
			
			j = Math.max(xf/room_size, 0);
			i = Math.max(yf/room_size, 0);

			tile = map[i][j] as Tiles;
			
			tile.visible = true;
			
			tile.x =  tile.vx - x0;
			tile.y = tile.vy - y0;


			
				if (i < map_size-1) {
					Tiles(map[i+1][j]).visible = false;
				}
				if (j < map_size-1) {
					Tiles(map[i][j+1]).visible = false;
				}
				if (i < map_size-1 && j < map_size-1) {
				Tiles(map[i+1][j+1]).visible = false;
			}
			
			
			j = Math.max(xf/room_size, 0);
			i = Math.max(y0/room_size, 0);
			
			tile = map[i][j] as Tiles;
			
			tile.visible = true;
			
			tile.x =  tile.vx - x0;
			tile.y = tile.vy - y0;

			
				if (j < map_size-1) {
					Tiles(map[i][j+1]).visible = false;
				}
				if (i > 0) {
					Tiles(map[i-1][j]).visible = false;
				}
				if (j < map_size-1 && i > 0) {
				Tiles(map[i-1][j+1]).visible = false;
			}
			
			
			j = Math.max(x0/room_size, 0);
			i = Math.max(yf/room_size, 0);
			
			tile = map[i][j] as Tiles;
			
			tile.visible = true;
			
			tile.x =  tile.vx - x0;
			tile.y = tile.vy - y0;

			
				if (i < map_size-1) {
					Tiles(map[i+1][j]).visible = false;
				}
				if (j > 0) {
					Tiles(map[i][j-1]).visible = false;
				}
				if (i < map_size-1 && j > 0) {
				Tiles(map[i+1][j-1]).visible = false;
			}
		}
	}
}