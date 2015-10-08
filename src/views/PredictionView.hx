package views;

import models.PredictionModel;
import openfl.text.TextField;

class PredictionView extends Screen
{
	var textElement:TextField;
	
	public function new() 
	{
		super( 0xff0000 );
		
		textElement = createField( 17 );
		textElement.x = 25;
		textElement.y = 25;
		
		addChild( textElement );
	}
	
	public function setPrediction( prediction:PredictionModel ):Void
	{
		textElement.text = prediction.prediction;
	}
}