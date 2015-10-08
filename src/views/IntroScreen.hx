package views;
import openfl.text.TextField;


class IntroScreen extends Screen
{
	var textElement:TextField;

	public function new() 
	{
		super( 0xffffff );
		
		textElement = createField( 17 );
		textElement.x = 25;
		textElement.y = 25;
		
		textElement.text = "Existential Tarot\n";
		textElement.appendText("  Keyboard arrows and WASD also rotate camera and Z and X zoom camera.\n");
		textElement.appendText("Picking ----- \n");
		textElement.appendText("  Click on the head model to draw on its texture. \n");
		
		addChild( textElement );
	}
	
}