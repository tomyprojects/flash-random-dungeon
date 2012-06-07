package {
	import flash.display.Sprite;
	public class Player extends Sprite {

		public var viewW:int;
		public var viewH:int;

		public var map_min_x:int;
		public var map_min_y:int;
		public var map_max_x:int;
		public var map_max_y:int;
		
		private var sp:StickFigure;

		public var current_room:World_Room;
		
		public var box:Bounding_Box;
		

		public function Player(world:World, viewWidth:int, viewHeight:int) {
			
			box = new Bounding_Box();
			
			box.w = 1;
			
			box.h = 1;
			
			sp = new StickFigure();
			
			addChild(sp);
			
			sp.y = -12;
			
			viewW = viewWidth;
			viewH = viewHeight;

			map_min_x = world.map_min_x;
			map_min_y = world.map_min_y;
			map_max_x = world.map_max_x;
			map_max_y = world.map_max_y;

			// move player to a one-exit room
			if (world.one_exit_room_list.length > 0) {
				var n:int = world.one_exit_room_list.length/2;

				n = (int(Math.random() * 100) % n);
				var i:int = world.one_exit_room_list[int(2*n)];
				var j:int = world.one_exit_room_list[int(2*n)+1];

				box.cx = world.map[i][j].cx;
				box.cy = world.map[i][j].cy;

				current_room = World_Room(world.map[i][j]);
			}
		}
		
		public function die(cam:View, darkness:Darkness)
		{
			cam.follow(1); // follow phantom
			visible = false;
			darkness.alpha = 1;
		}
		
		public function move(movx:int, movy:int, world:World) {
			var k:int = current_room.pointTestCollision(box.cx+int(movx), box.cy+int(movy));

			if (k == 0) {
				sp.stand();
				return;
			}
			if (k == -1) {
				var room:World_Room = world.getRoom(box.cx+int(movx), box.cy+int(movy));

				k = room.pointTestCollision(box.cx+movx, box.cy+movy);

				if (k == 0) {
					sp.stand();
					return;
				}
				
				current_room = room;
			}
			if (box.cy < map_min_y + viewH/2) {
				y += movy;
				//return;
			}
			if (box.cy > map_max_y - viewH/2) {
				y += movy;
				//return;
			}
			if (box.cx < map_min_x + viewW/2) {
				x += movx;
				//return;
			}
			if (box.cx > map_max_x - viewW/2) {
				x += movx;
				//return;
			}
			box.cx += movx;
			box.cy += movy;

			if (movx > 0) {
				sp.runRight();
			} else if (movx < 0) {
				sp.runLeft();
			} else if (movy > 0) {
				sp.runDown();
			} else if (movy < 0) {
				sp.runDown();
			} else {
				sp.stand();
			}
		}
	}
}