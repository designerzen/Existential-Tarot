package views;

import openfl.display.Sprite;
import openfl.filters.DropShadowFilter;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Lib;
import openfl.text.TextFormatAlign;

class Screen extends Sprite
{
	// static....
	
	public function new( backgroundColour:UInt=0xffffff ) 
	{
		super();
		// draw background graphic
		
		graphics.clear();
		graphics.beginFill( backgroundColour, 1 );
		graphics.drawRect( 0, 0, Lib.current.stage.stageWidth, Lib.current.stage.stageHeight );
	}
	
	public function createField( fontSize:Int=18, colour:Int=0x000000 ):TextField
	{
		var f:TextFormat = new TextFormat("Verdana", fontSize, colour);
		f.align = TextFormatAlign.LEFT;
		
		var t:TextField = new TextField();
		t.defaultTextFormat = f;
		t.width = 1000;
		t.height = 200;
		t.selectable = false;
		t.mouseEnabled = false;
		t.filters = [new DropShadowFilter(1, 45, 0x0, 1, 0, 0), new DropShadowFilter(1, 45+180, 0x0, 1, 0, 0)];
	
		return t;
	}
	
}