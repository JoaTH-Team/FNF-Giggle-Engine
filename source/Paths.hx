package;

import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;

class Paths {
	public static function image(key:String)
		return get('images/$key.png');

	public static function sound(key:String)
		return get('sounds/$key.ogg');

	public static function music(key:String)
		return get('music/$key.ogg');

	public static function font(key:String)
		return get('fonts/$key');

	public static function txt(key:String)
		return get('data/$key.txt');

	public static function xml(key:String)
		return get('data/$key.xml');

	public static function json(key:String)
		return get('data/$key.json');

	public static function video(key:String)
		return get('videos/$key.mp4');

	public static function soundRandom(key:String, min:Int, max:Int)
		return sound('$key${FlxG.random.int(min, max)}');

	public static function getSparrowAtlas(key:String)
		return FlxAtlasFrames.fromSparrow(image(key), xml(key));

	public static function getPackerAtlas(key:String)
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key), txt(key));

	private static function get(path:String)
		return 'assets/$path';
}