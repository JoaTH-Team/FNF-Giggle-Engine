package;

import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.util.FlxTimer;

class Conductor
{
    public static var bpm:Int = 100;
    public static var crochet:Float = 0;
    public static var stepCrochet:Float = 0;
    
    public static var songPosition:Float = 0;
    public static var lastSongPosition:Float = 0;
    
    public static var curBeat:Int = 0;
    public static var curStep:Int = 0;
    
    public static var targetBPM:Int = 100;
    public static var bpmChangeSpeed:Float = 0;
    public static var bpmChanging:Bool = false;
    
    public static function init(bpm:Int = 100)
    {
        Conductor.bpm = bpm;
        targetBPM = bpm;
        recalculateCrochet();
    }
    
    static function recalculateCrochet()
    {
        crochet = (60 / bpm) * 1000;
        stepCrochet = crochet / 4;
    }
    
    public static function update(elapsed:Float)
    {
        if (bpmChanging)
        {
            var newBPM:Float = FlxMath.lerp(bpm, targetBPM, bpmChangeSpeed * elapsed);
            bpm = Math.round(newBPM);
            
            if (Math.abs(bpm - targetBPM) <= 1)
            {
                bpm = targetBPM;
                bpmChanging = false;
            }
            
            recalculateCrochet();
        }
        
        lastSongPosition = songPosition;
        
        if (FlxG.sound.music != null)
            songPosition = FlxG.sound.music.time;
        
        curStep = Math.floor(songPosition / stepCrochet);
        curBeat = Math.floor(curStep / 4);
    }
    
    public static function changeBPM(newBPM:Int, changeTime:Float = 0)
    {
        targetBPM = newBPM;
        
        if (changeTime <= 0)
        {
            bpm = newBPM;
            bpmChanging = false;
            recalculateCrochet();
        }
        else
        {
            bpmChanging = true;
            bpmChangeSpeed = 1 / changeTime;
        }
    }
    
    public static function setBPM(newBPM:Int)
    {
        bpm = newBPM;
        targetBPM = newBPM;
        bpmChanging = false;
        recalculateCrochet();
    }
    
    public static function getBeatProgress():Float
    {
        return (songPosition % crochet) / crochet;
    }
    
    public static function getStepProgress():Float
    {
        return (songPosition % stepCrochet) / stepCrochet;
    }
}