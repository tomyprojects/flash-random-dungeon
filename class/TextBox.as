

/*

Description:
Creates a textbox

*/

package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	
	public class TextBox extends Sprite
	{
		private var t:TextField;
		private var box:Sprite;
		private var format:TextFormat;
		
		public function TextBox(box_x:int=0, box_y:int=0,box_width:int=100, box_height:int=100, 
								box_text:String="")
		{
			t = new TextField();
			box = new Sprite();
			format = new TextFormat();
			
			// box border
			box.graphics.lineStyle(10);
			box.graphics.drawRect(box_x,box_y,box_width,box_height);
			
			// font style
			format.size = 20; // text size
			
			// textfield
			t.defaultTextFormat = format;
			t.x = box_x;
			t.y = box_y;
			t.width = box_width;
			t.height = box_height;
			t.background = true;
			t.backgroundColor = 0xFF0000;
			t.text = box_text;
			t.wordWrap = true;
			
			
			addChild(box);
			addChild(t);
		}
		
		public function modify(box_x:int=0, box_y:int=0,box_width:int=100, box_height:int=100, 
								box_text:String="")
		{
			box.graphics.clear();
			
			// box border
			box.graphics.lineStyle(10);
			box.graphics.drawRect(box_x,box_y,box_width,box_height);
			
			// textfield
			t.x = box_x;
			t.y = box_y;
			t.width = box_width;
			t.height = box_height;
			t.text = box_text;
		}
	}
}