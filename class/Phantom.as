package {
	import flash.display.MovieClip;

	public class Phantom extends MovieClip {
		private var current_room:World_Room;
		private var next_room:World_Room;
		private var prev_room:World_Room;

		public var box:Bounding_Box = new Bounding_Box();

		private var vx:int;
		private var vy:int;
		private var speed:int = 20;


		public function Phantom(world:World) {

			box.w = width;
			box.h = height;

			// move player to a one-exit room
			if (world.one_exit_room_list.length > 0) {
				var n:int = world.one_exit_room_list.length/2;

				n = (int(Math.random() * 100) % n);
				var i:int = world.one_exit_room_list[int(2*n)];
				var j:int = world.one_exit_room_list[int(2*n)+1];

				box.cx = world.map[i][j].xloc + int(world.room_size/2);
				box.cy = world.map[i][j].yloc + int(world.room_size/2);

				current_room = World_Room(world.map[i][j]);

				current_room.phantom_frequency += 1;

				newDest();
			}
		}
		public function randomPathing() {
			if ( destReached() ) {
				prev_room = current_room;

				current_room = next_room;

				switch (current_room.number_of_exits) {
					case 1 :
						current_room.phantom_frequency += 5;
						break;
					default :
						current_room.phantom_frequency += 1;
						break;
				}
				while (1) {
					newDest();

					if (next_room.id_i == prev_room.id_i && next_room.id_j == prev_room.id_j) {
						if (Math.random() < 0.8) {
							continue;
						}
					}
					break;
				}
			}
			goto(next_room.cx, next_room.cy);
		}
		public function updateai() {
			randomPathing();
		}
		private function newDest() {
			var m:int=-1;
			var n:int;

			if (current_room.up != null) {
				if (current_room.up.safe_room == false) {
					m = current_room.up.phantom_frequency;
					next_room = current_room.up;
				}
			}
			if (current_room.down != null) {
				if (current_room.down.safe_room == false) {
					if (current_room.down.phantom_frequency < m || m==-1) {
						m = current_room.down.phantom_frequency;
						next_room = current_room.down;
					}
				}
			}
			if (current_room.left != null) {
				if (current_room.left.safe_room == false) {
					if (current_room.left.phantom_frequency < m || m==-1) {
						m = current_room.left.phantom_frequency;
						next_room = current_room.left;
					}
				}
			}
			if (current_room.right != null) {
				if (current_room.right.safe_room == false) {
					if (current_room.right.phantom_frequency < m || m==-1) {
						m = current_room.right.phantom_frequency;
						next_room = current_room.right;
					}
				}
			}
		}
		private function destReached():Boolean {
			if ( Math.abs(next_room.cx - box.cx) <= speed) {

				return (Math.abs(next_room.cy - box.cy) <= speed);
			}
			return false;
		}
		public function collisionTest(player:Player):Boolean {
			if ( Math.abs(player.box.cx - box.cx) <= box.w/2) {

				return Math.abs(player.box.cy - box.cy) <= box.h / 2;
			}
			return false;
		}
		private function goto(dest_x:int, dest_y:int) {
			if (dest_x - box.cx >= speed) {
				box.cx += speed;
			} else if (box.cx - dest_x >= speed) {
				box.cx -= speed;
			}
			if (dest_y - box.cy >= speed) {
				box.cy += speed;
			} else if (box.cy - dest_y >= speed) {
				box.cy -= speed;
			}
		}
		public function render(v:View) {
			if (box.insideView(v)) {
				x = box.cx - v.x0;
				y = box.cy - v.y0;
				visible = true;

			} else {
				visible = false;
			}
		}
	}
}