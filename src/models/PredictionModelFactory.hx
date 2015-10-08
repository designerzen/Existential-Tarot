package models;
import models.PredictionModel;
import openfl.Assets;

class PredictionModelFactory
{
	private var predictions:Array<PredictionModel>;
	
	public function new() 
	{
		predictions = [];
	}
	
	public function loadPredictions( filename:String ):Void
	{
		// here we load in a text file and parse it into models.
		var raw:String = Assets.getText('txt/predictions.txt');
		var split:Array<String> = raw.split('\n');
		var quantity:Int= split.length;
		
		for ( var p:Int = 0; p < quantity; ++p)
		{
			predictions.push( new PredictionModel( split[p] ) );
		}
	}
	
	public function getPrediction( index:Int=0 ):PredictionModel
	{
		return predictions[index]; 
	}
	
}