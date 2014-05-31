package;


import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.BlurFilter;
import flash.filters.DropShadowFilter;
import flash.geom.Point;
import flash.media.Sound;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.Lib;
import motion.Actuate;
import motion.easing.Quad;
import openfl.Assets;


class SnakeGame extends Sprite {
	
	
	private static var NUM_COLUMNS = 8;
	private static var NUM_ROWS = 8;
	
	
	private var Background:Sprite;
	private var SnakePart:Bitmap;
	private var IntroSound:Sound;
	private var Logo:Bitmap;
	private var Score:TextField;
	private var Sound3:Sound;
	private var Sound4:Sound;
	private var Sound5:Sound;
	
	
	public var currentScale:Float;
	public var currentScore:Int;
	
	private var cacheMouse:Point;
	private var needToCheckMatches:Bool;
	
	
	
	public function new () {
		
		super ();
		
		initialize ();
		construct ();
		
		newGame ();
		
	}
	
	private function construct ():Void {
		
		
		var font = Assets.getFont ("fonts/FreebooterUpdated.ttf");
		var defaultFormat = new TextFormat (font.fontName, 60, 0x000000);
		defaultFormat.align = TextFormatAlign.RIGHT;
		
		#if (js && !openfl_html5)
		defaultFormat.align = TextFormatAlign.LEFT;
		#end
		
		var contentWidth = 75 * NUM_COLUMNS;
		
		Score.x = contentWidth - 200;
		Score.width = 200;
		Score.y = 12;
		Score.selectable = false;
		Score.defaultTextFormat = defaultFormat;
		
		#if (!js || openfl_html5)
		Score.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
		#else
		Score.y = 0;
		Score.x += 90;
		#end
		
		Score.embedFonts = true;
		addChild (Score);
		
		Background.y = 85;
		Background.graphics.beginFill (0xFFFFFF, 0.4);
		Background.graphics.drawRect (0, 0, contentWidth, 75 * NUM_ROWS);
		
		#if (!js || openfl_html5)
		Background.filters = [ new BlurFilter (10, 10) ];
		addChild (Background);
		#end
		Background.addEventListener (MouseEvent.MOUSE_MOVE, stage_onMouseMove);
		
		SnakePart = new Bitmap (Assets.getBitmapData ("images/snakePart.png"));
		Background.addChild(SnakePart);

	}
	
	
	
	private function getPosition (row:Int, column:Int):Point {
		
		return new Point (column * (57 + 16), row * (57 + 16));
		
	}
	
	
	private function initialize ():Void {
		
		currentScale = 1;
		currentScore = 0;
		
		Background = new Sprite ();
		Score = new TextField ();
		
	}
	
	
	public function newGame ():Void {
		
		currentScore = 0;
		Score.text = "0";
		
	
		removeEventListener (Event.ENTER_FRAME, this_onEnterFrame);
		addEventListener (Event.ENTER_FRAME, this_onEnterFrame);
		
	}
	
	
	
	public function resize (newWidth:Int, newHeight:Int):Void {
		
		var maxWidth = newWidth * 0.90;
		var maxHeight = newHeight * 0.86;
		
		currentScale = 1;
		scaleX = 1;
		scaleY = 1;
		
		#if (js || !openfl_html5)
		
		var currentWidth = 75 * NUM_COLUMNS;
		var currentHeight = 75 * NUM_ROWS + 85;
		
		#else
		
		var currentWidth = width;
		var currentHeight = height;
		
		#end
		
		if (currentWidth > maxWidth || currentHeight > maxHeight) {
			
			var maxScaleX = maxWidth / currentWidth;
			var maxScaleY = maxHeight / currentHeight;
			
			if (maxScaleX < maxScaleY) {
				
				currentScale = maxScaleX;
				
			} else {
				
				currentScale = maxScaleY;
				
			}
			
			scaleX = currentScale;
			scaleY = currentScale;
			
		}
		
		x = newWidth / 2 - (currentWidth * currentScale) / 2;
		
	}
	
	
	
	// Event Handlers
	
	
	
	

	private function stage_onMouseMove (event:MouseEvent):Void {
		
		currentScore +=1;
		Score.text = event.localX + '';
		SnakePart.y = event.localY;

		SnakePart.x = event.localX;
		
	}
	
	
	private function this_onEnterFrame (event:Event):Void {
		
	
		
	}
	
	
	
}