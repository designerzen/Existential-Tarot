package models;

class PredictionModel
{
	public var prediction:String;
	
	public function new( message:String ) 
	{
		prediction = message;
	}
	public function toString():String
	{
		return prediction;
	}
}