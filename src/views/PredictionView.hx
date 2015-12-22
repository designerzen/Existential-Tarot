package views;

import openfl.Lib;
import openfl.text.TextField;
import openfl.events.Event;
import motion.Actuate;
import motion.easing.*;
import models.PredictionModel;

class PredictionView extends Screen
{
	var textElement:TextField;
	
	public function new() 
	{
		super( 0x000000 );
		
		textElement = createField( 37, 0xffffff );
		//textElement.x = 25;
		textElement.y = 25;
		
		addChild( textElement );
	}
	
	// create new text fields for each line...
	public function setPrediction( prediction:PredictionModel ):Void
	{
		// animate...
		var lines:Array<String> = prediction.getMessage().split(', ');
		// var textFields = 
		// Actuate.tween();
		Actuate.apply( textElement, {alpha:0} );
		
		textElement.text = lines.join(',\n');
		// centralise vertically
		var newY = ( Lib.current.stage.stageHeight - textElement.textHeight) * 0.5;
		//textElement.y = newY;
		Actuate.apply( textElement, { y:newY+8 } );
		Actuate.tween( textElement, 1.5, {alpha:1, y:newY} ).ease( Sine.easeOut );
	}
	
	override public function open():Void 
	{
		super.open();
		
	}
	
	override function onResized(e:Event):Void 
	{
		textElement.width = Lib.current.stage.stageWidth;
	}
}