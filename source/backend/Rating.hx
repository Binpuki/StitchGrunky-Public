package backend;

import backend.ClientPrefs;

class Rating
{
	public var name:String = '';
	public var image:String = '';
	public var hitWindow:Null<Int> = 0; //ms
	public var ratingMod:Float = 1;
	public var scoreMult:Float = 1;
	public var noteSplash:Bool = true;
	public var hits:Int = 0;

	public function new(name:String)
	{
		this.name = name;
		this.image = name;
		this.hitWindow = 0;

		var window:String = name + 'Window';
		try
		{
			this.hitWindow = Reflect.field(ClientPrefs.data, window);
		}
		catch(e) FlxG.log.error(e);
	}

	public static function loadDefault():Array<Rating>
	{
		var ratingsData:Array<Rating> = [new Rating('sick')]; //highest rating goes first

		//(float)((NoteValue * PerfectHits) + (NoteValue * (GreatHits * 0.95)) + (NoteValue * (GoodHits * 0.75)) + (NoteValue * (BadHits * 0.5)));
		var rating:Rating = new Rating('good');
		rating.ratingMod = 0.67;
		rating.scoreMult = 0.75;
		rating.noteSplash = false;
		ratingsData.push(rating);

		var rating:Rating = new Rating('bad');
		rating.ratingMod = 0.34;
		rating.scoreMult = 0.5;
		rating.noteSplash = false;
		ratingsData.push(rating);

		var rating:Rating = new Rating('shit');
		rating.ratingMod = 0;
		rating.scoreMult = 0;
		rating.noteSplash = false;
		ratingsData.push(rating);
		return ratingsData;
	}
}
