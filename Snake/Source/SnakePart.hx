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


class SnakePart extends Sprite {
	
	
	
	private var Image:Bitmap;
	
	public var nIndex:Int;
	
	public var nPreviousX:Int;	
	public var nPreviousY:Int;

	private var nCurrentX:Int;	
	private var nCurrentY:Int;
	
	
	public function new (index) {
		
		super ();
		
		
		construct (index);
		
		
	}
	
	private function construct (index):Void {
	
		
		Image = new Bitmap (Assets.getBitmapData ("images/fedora.png"));
		
		Image.width = 50;

		Image.height = 30;
		addChild(Image);

		nIndex = index;

		
	}
	public function updatePosition (nX, nY):Void {
	
		nPreviousX = nCurrentX;
		nPreviousY = nCurrentY;
		nCurrentX = nX;
		nCurrentY = nY;
		

		
	}
	
	
	
	
	// Event Handlers
	
	
	
	
	
	
}