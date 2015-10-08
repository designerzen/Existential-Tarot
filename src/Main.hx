package;

import openfl.display.Sprite;
import openfl.Lib;

import models.PredictionModelFactory;
import models.PredictionModel;
import views.IntroScreen;
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
		
		// initialise
		factory = new PredictionModelFactory();
		factory.loadPredictions( '' );
		
		// 1. Show intro screen
		screenManager = new ScreenManager( this, new IntroScreen()  );
		
		// 2. Press for Prediction (possibly astro stuff)
		prediction = factory.getPrediction(0);
		
		// 3. Present prediction
		view = new PredictionView();
		view.setPrediction( prediction );
		
		screenManager.change( view );
		
		//screenManager.change( new IntroScreen() );
		
		// 4. Press too return to intro
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
	}

}
