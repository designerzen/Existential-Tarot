package models;

import models.PredictionModel;
import openfl.Assets;

class PredictionModelFactory
{
	private var predictions:Array<PredictionModel>;
	private var current:Int = -1;
	
	public function new() 
	{
		predictions = [];
	}
	
	public function loadPredictions( filename:String ):Void
	{
		// here we load in a text file and parse it into models.
		var raw:String = Assets.getText(filename);
		var split:Array<String> = raw.split('\n');
		var quantity:Int= split.length - 1;
		
		for ( p in 0...quantity)
		{
			predictions.push( new PredictionModel( split[p] ) );
		}
		
		// shuffle array!
		shuffle( predictions );
	}
	
	public function getPrediction( index:Int=0 ):PredictionModel
	{
		return predictions[index]; 
	}
	
	public function getNextPrediction():PredictionModel
	{
		if ( ++current >= predictions.length ) current = 0;
		return predictions[current]; 
	}
	
	
	// https://github.com/jasononeil/hxrandom/blob/master/src/Random.hx
	/** Shuffle an Array.  This operation affects the array in place, and returns that array.
		The shuffle algorithm used is a variation of the [Fisher Yates Shuffle](http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle) */
	private function shuffle<T>(arr:Array<T>):Array<T>
	{
		if (arr!=null) {
			for (i in 0...arr.length) {
				var j = Math.floor( arr.length * Math.random() );
				var a = arr[i];
				var b = arr[j];
				arr[i] = b;
				arr[j] = a;
			}
		}
		return arr;
	}
}