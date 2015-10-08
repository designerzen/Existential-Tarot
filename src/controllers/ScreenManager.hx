package controllers;

import openfl.display.Sprite;
import views.Screen;

class ScreenManager
{
	private var container:Sprite;
	private var currentScreen:Screen;
	
	// pass in the ain sprite you want this to be added to
	public function new( sprite:Sprite, firstScreen:Screen ) 
	{
		container = sprite;
		change( firstScreen );
	}
	
	// Change to another screen
	// Monitor for events from screen...
	// EXIT_REQUESTED
	//
	public function change( screen:Screen ):Bool
	{
		var oldScreen:Screen = currentScreen;
		
		// now add
		container.addChild( screen );
		
		// remove the old screen...
		if ( oldScreen != null )
		{
			container.removeChild( oldScreen );
		}
		
		// save reference to new screen
		currentScreen = screen;
		
		return true;
	}
	
}