package models;

class PredictionModel
{
	public var prediction:String;
	
	public function new( message:String ) 
	{
		// if we have commas, let us assume new lines...
		prediction = message;
	}
	
	public function getMessage():String
	{
		return prediction;
	}
	
	public function toString():String
	{
		return prediction;
	}
}