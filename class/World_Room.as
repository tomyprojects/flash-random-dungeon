package {
	public class World_Room {
		public var exit:Room;
		public var xloc:int;
		public var yloc:int;
		public var dx:int;
		public var dy:int;
		
		public var cx:int;
		public var cy:int;
		
		public var up:World_Room;
		public var down:World_Room;
		public var left:World_Room;
		public var right:World_Room;
		
		public var safe_room:Boolean=false;
		
		public var safe_room_obj:Blue_shield;
		
		public var number_of_exits:int;
		
		public var id_i:int;
		public var id_j:int;
		
		public var phantom_frequency:int = 0;
		
		

		public function create_safe_room()
		{
			if (safe_room == false)
			{
				if (safe_room_obj == null)
				{
					safe_room_obj = new Blue_shield();
				}
				
				safe_room = true;
			}
		}
		
		public function World_Room(room:Room, tileSize:int) {
			exit = room;
			dx = tileSize;
			dy = tileSize;
			
			number_of_exits = int(room.up) + int(room.down) + int(room.left) + int(room.right);
		}
		public function pointTestCollision(px:int, py:int):int {
			var i:int = (py-yloc)/dy;
			var j:int = (px-xloc)/dx;

			if (i < 0 || j < 0 || i > 2 || j > 2) {
				return -1;
			}
			if (i == 0 || i == 2) {
				if (j == 0 || j == 2) {
					return 0;
				}
			}
			if (i == 1 && j == 1) {
				return 1;
			}
			if (i == 0 && j == 1) {
				return int(exit.up);
			}
			if (i == 2 && j == 1) {
				return int(exit.down);
			}
			if (i == 1 && j == 0) {
				return int(exit.left);
			}
			if (i == 1 && j == 2) {
				return int(exit.right);
			}
			
			return -1;
		}
	}
}