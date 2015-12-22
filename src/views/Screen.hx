package views;

import openfl.events.Event;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.filters.DropShadowFilter;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import models.Fonts;

import motion.Actuate;

class Screen extends Sprite
{
	// events that get dispatched after stuff happens
	public inline static var OPENED:String = "screen_opened";
	public inline static var CLOSED:String = "screen_closed";
	
	// Linked List
	public var previousScreen:Screen;
	public var nextScreen:Screen;
	private var wallColour:Int;
	
	
	public function new( backgroundColour:UInt=0xffffff ) 
	{
		super();
		wallColour = backgroundColour;
		drawBackground( wallColour );
	}
	
	private function drawBackground( backgroundColour:UInt=0xffffff ):Void
	{
		// draw background graphic
		graphics.clear();
		graphics.beginFill( backgroundColour, 1 );
		graphics.drawRect( 0, 0, Lib.current.stage.stageWidth, Lib.current.stage.stageHeight );
	}
	
	public function open():Void
	{
		onResized(null);
		Actuate.apply( this, {alpha:0} );
		Actuate.tween( this, 1, {alpha:1} ).onComplete( onOpened );
		//onOpened();
	}
	
	public function onOpened():Void
	{
		Lib.current.stage.addEventListener(Event.RESIZE, onResized );
		dispatchEvent( new Event( Screen.OPENED ) );
	}
	
	private function onResized(e:Event):Void 
	{
		// make magic...
		drawBackground( wallColour );
	}
	
	public function close():Void
	{
		Actuate.tween( this, 0.1, {alpha:0} ).onComplete( onClosed );
		//onClosed();
	}
	
	public function onClosed():Void
	{
		Lib.current.stage.removeEventListener(Event.RESIZE, onResized );
		dispatchEvent( new Event( Screen.CLOSED ) );
	}
	
	public function createField( fontSize:Int=18, colour:Int=0x000000 ):TextField
	{
		var f:TextFormat = new TextFormat( Fonts.PARISIENNE, fontSize, colour);
		//var f:TextFormat = new TextFormat("Verdana", fontSize, colour);
		f.align = TextFormatAlign.CENTER;
		
		var t:TextField = new TextField();
		t.defaultTextFormat = f;
		t.width = Lib.current.stage.stageWidth;
		t.height = 600;
		t.selectable = false;
		t.mouseEnabled = false;
		t.embedFonts = true;
		//t.filters = [new DropShadowFilter(1, 45, 0x0, 1, 0, 0), new DropShadowFilter(1, 45+180, 0x0, 1, 0, 0)];
	
		return t;
	}
	
}