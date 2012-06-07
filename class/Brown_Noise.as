package {
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;
	import flash.events.Event;

	public class Brown_Noise extends Sound {
		public var st:SoundTransform = new SoundTransform(0);
		public var sc:SoundChannel;

		public var vol:Number = 0;

		public var isPlaying:Boolean = false;

		public var startTime:Number = 0083;
		public var endTime:Number = 10088;

		public function Brown_Noise() {
			//soundTransform.volume = 0;

		}
		public function playsound(i:Number) {
			if (isPlaying) {


				if (sc) {
					if (sc.position >= endTime) {
					
					//sc.stop();
					
					//sc = play(startTime);
					}

					vol = i;

					st = new SoundTransform(vol);

					sc.soundTransform = st;
				}
			} else {

				//st = new SoundTransform();

				vol = i;

				playsound2();
			}
		}
		public function playsound2() {
			sc = this.play(startTime);

			st = new SoundTransform(vol);

			sc.soundTransform = st;

			isPlaying = true;

			sc.addEventListener(Event.SOUND_COMPLETE, soundcomplete);
		}
		public function soundcomplete(e:Event) {
			if (sc) {
				sc.removeEventListener(Event.SOUND_COMPLETE, soundcomplete);


				playsound2();
			}
		}
		public function stopsound() {
			//sc.stop();
			//sc.soundTransform.volume = 0;
			//sc.stop();
			//sc.stop();


			if (isPlaying) {
				//if ( vol < 0.1) {


				isPlaying = false;
				if (sc)
				{
				sc.stop();
				
				sc.removeEventListener(Event.SOUND_COMPLETE, soundcomplete);
				}

				/*} else {
				if (sc.position >= endTime) {
				
				sc.stop();
				
				sc = play(startTime);
				}
				st = new SoundTransform(vol);
				
				sc.soundTransform = st;
				}*/
			}
		}
	}
}