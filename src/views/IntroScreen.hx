package views;

import openfl.text.TextField;
import openfl.Assets;

class IntroScreen extends Screen
{
	var textElement:TextField;

	public function new() 
	{
		super( 0xffffff );
		
		var raw:String = Assets.getText('txt/intro.txt');
		
		textElement = createField( 17 );
		textElement.x = 25;
		textElement.y = 25;
		
		textElement.text = Assets.getText('txt/intro.txt');
		
		addChild( textElement );
	}
	
}