package;

import flash.events.MouseEvent;
import openfl.display.Sprite;
import openfl.Lib;

import models.Fonts;
import views.CalibrationScreen;

import models.PredictionModelFactory;
import models.PredictionModel;
import views.IntroScreen;
import views.Screen;
import views.PredictionView;
import controllers.ScreenManager;

class Main extends Sprite 
{
	var factory:PredictionModelFactory;
	var view:PredictionView;
	var screenManager:ScreenManager;
	var prediction:PredictionModel;

	public function new() 
	{
		super();
		
		// screen stuff...
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		
		// initialise
		Fonts.init();
		
		factory = new PredictionModelFactory();
		factory.loadPredictions( 'txt/predictions.txt' );
		
		// 1. Show intro screen
		
		// 2. Press for Prediction (possibly astro stuff)
		//prediction = factory.getPrediction(0);
		prediction = factory.getNextPrediction();
		
		// 3. Present prediction
		view = new PredictionView();
		view.setPrediction( prediction );
		
		// assign the order of the things...
		screenManager = new ScreenManager( this, new IntroScreen() );
		screenManager.add( new CalibrationScreen() );
		screenManager.add( view );
		//screenManager.change( new IntroScreen() );
		
		// 4. Press too return to intro
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		stage.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
	}
	
	private function onMouseDown(e:MouseEvent):Void 
	{
		// doo different stuff depending on what screen we are on.
		
		/*
		
		prediction = factory.getNextPrediction();
		view.setPrediction( prediction );
		screenManager.change( view );
		
		*/
		
		// currently involvd with a transition
		if (screenManager.locked) return;
		
		// if we are on view...
		var screen:Screen = screenManager.next();
		
		if (screen == view )
		{
			prediction = factory.getNextPrediction();
			view.setPrediction( prediction );
			trace("Tarot reading... ");
		}
		
		stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
	}
	
	private function onMouseUp(e:MouseEvent):Void 
	{
		stage.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
		
	}

}
