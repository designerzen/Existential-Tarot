package controllers;

import flash.events.Event;
import openfl.display.Sprite;
import views.Screen;

class ScreenManager
{
	public var locked:Bool = false;
	private var container:Sprite;
	
	private var currentScreen:Screen;
	private var head:Screen;
	private var tail:Screen;
	private var quantity:Int = 0;
	
	// pass in the ain sprite you want this to be added to
	public function new( sprite:Sprite, firstScreen:Screen ) 
	{
		container = sprite;
		head = tail = firstScreen;
		quantity++;
		change( firstScreen );
	}
	
	// add some screens to the queue via linked lists!
	public function add( screen:Screen ):Void
	{
		if ( head == tail ) 
		{
			head.nextScreen = screen;
			screen.previousScreen = head;
		}else {
			tail.nextScreen = screen;
			screen.previousScreen = tail;
		}
		tail = screen;
		quantity++;
		
		// test
		trace("Test "+quantity );
		var test = head;
		while (test != null)
		{
			trace("Bark");
			test = test.nextScreen;
		}
	}
	
	// changes to the enxt screen in the queue if it exists
	public function next():Screen
	{
		var nextScreen:Screen = currentScreen.nextScreen;
		if (nextScreen != null) 
		{
			change( nextScreen );
			return nextScreen;
		}
		// should we loop?
		change( head );
		return head;
	}
	
	// Change to another screen
	// Monitor for events from screen...
	// EXIT_REQUESTED
	//
	public function change( screen:Screen ):Bool
	{
		// exit early if same screen requested...
		if ( currentScreen == screen ) 
		{
			screen.open();
			return false;
		}
		
		locked = true;
		
		// now add
		screen.addEventListener( Screen.OPENED, onScreenOpened );
		screen.open();
		container.addChild( screen );
		
		// look through our queue of screens to see which one this is,
		// and what the next one should be!
		
	
		return true;
	}
	
	private function onScreenOpened(e:Event):Void 
	{
		var screen:Screen = e.currentTarget;
		// remove the old screen...
		
		var oldScreen:Screen = currentScreen;
		if ( oldScreen != null )
		{
			oldScreen.addEventListener( Screen.CLOSED, onScreenClosed );
			oldScreen.close();
		}else {
			// first run...
			locked = false;
		}
		
		// save reference to new screen
		currentScreen = screen;
	}
	
	private function onScreenClosed(e:Event):Void 
	{
		var oldScreen:Screen = e.currentTarget;
		// wait for CLOSED event from Screen...
		oldScreen.removeEventListener( Screen.CLOSED, onScreenClosed );
		container.removeChild( oldScreen );
		locked = false;
	}
	
}