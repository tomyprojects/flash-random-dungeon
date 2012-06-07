package {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.events.KeyboardEvent;


	public class Test extends MovieClip {
		public var gameTimer:Timer;
		public var dungeon:Random_Map_Generator;
		public var renderer:Random_Map_Renderer;                                                                
		public var world:World;
		public var phantom:Phantom;
		public var darkness:Darkness;
		public var safe_room:Blue_shield;
		
		public var moveX:int =0;
		public var moveY:int =0;

		public var player:Player;
		
		public var playerSpeed:int = 10;

		public var cam:View;

		public var upPressed:Boolean = false;
		public var downPressed:Boolean = false;
		public var leftPressed:Boolean = false;
		public var rightPressed:Boolean = false;

		//keycodes
		var left:uint = 37;
		var up:uint = 38;
		var right:uint = 39;
		var down:uint = 40;
		
		public function Test() {
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownListener);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpListener);

			gameTimer = new Timer(35);
			gameTimer.addEventListener(TimerEvent.TIMER, run);
			gameTimer.start();
			
			dungeon = new Random_Map_Generator(10);
			dungeon.drawMiniMap();
			
			
			world = new World();
			world.addMap(dungeon,int(192*3));
			world.createPlayer(stage.stageWidth,stage.stageHeight);
			world.createPhantom();
			world.init();

			cam = new View(int(192*5),int(192*5),stage.stageWidth,stage.stageHeight,int(10*192*3),int(10*192*3));
			
			cam.init(world);
			
			cam.follow(0);
			
			init_safe_room(world);
			
			addChild(world);
			addChild(dungeon);
		}
		public function run(timerEvent:TimerEvent):void {
			world.player.move(moveX,moveY,world);
			
			cam.render();
			
			world.update(cam);
			
			//dungeon.drawDot1(world,phantom.box.cx,phantom.box.cy);
			//dungeon.drawDot2(world,player.box.cx,player.box.cy);
			
			
			
		}
		public function init_safe_room(w:World)
		{
			var room:World_Room = w.getRoom(w.player.box.cx, w.player.box.cy);
			
			safe_room = new Blue_shield();
			
			room.safe_room = true;
		}
		
		
		function keyUpListener(e:KeyboardEvent) {
			if (e.keyCode==left) {
				leftPressed = false;
				moveX = 0;
			}
			if (e.keyCode==up) {
				upPressed = false;
				moveY = 0;
			}
			if (e.keyCode==right) {
				rightPressed = false;
				moveX = 0;
			}
			if (e.keyCode==down) {
				downPressed = false;
				moveY = 0;

			}
			if (upPressed) {
				moveY = -playerSpeed;
			}
			if (downPressed) {
				moveY = playerSpeed;
			}
			if (rightPressed) {
				moveX = playerSpeed;
			}
			if (leftPressed) {
				moveX = -playerSpeed;
			}
			if (!(leftPressed || rightPressed || downPressed || upPressed)) {
				moveX = 0;
				moveY = 0;
			}
		}
		function keyDownListener(e:KeyboardEvent) {

			if (e.keyCode==up) {
				moveY = -playerSpeed;
				upPressed = true;
			}
			if (e.keyCode==down) {
				moveY = playerSpeed;
				downPressed = true;
			}
			if (e.keyCode==left) {
				moveX = -playerSpeed;
				leftPressed = true;
			}
			if (e.keyCode==right) {
				moveX = playerSpeed;
				rightPressed = true;
			}
		}
	}
}