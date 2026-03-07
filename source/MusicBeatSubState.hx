package;

import flixel.FlxG;
import flixel.addons.ui.FlxUISubState;

class MusicBeatSubState extends FlxUISubState
{
    public var curBeat:Int = 0;
    public var curStep:Int = 0;
    
    var lastBeat:Int = -1;
    var lastStep:Int = -1;

    public function new() {
        super();
    }
    
    override function create() {
        super.create();
    
        Conductor.init(100); // default init first
    }

    override function update(elapsed:Float) {
        Conductor.update(elapsed);
        
        curStep = Conductor.curStep;
        curBeat = Conductor.curBeat;
        
        if (curStep != lastStep)
        {
            stepHit();
            lastStep = curStep;
        }
        
        if (curBeat != lastBeat)
        {
            beatHit();
            lastBeat = curBeat;
        }
        
        super.update(elapsed);
    }
    
    public function beatHit()
    {}
    
    public function stepHit()
    {}
    
    public function startSong(?songBPM:Int)
    {
        if (songBPM != null)
            Conductor.setBPM(songBPM);
            
        if (FlxG.sound.music != null)
        {
            FlxG.sound.music.play();
            Conductor.songPosition = 0;
        }
    }
    
    public function pauseSong(pause:Bool = true)
    {
        if (FlxG.sound.music != null)
        {
            if (pause)
                FlxG.sound.music.pause();
            else
                FlxG.sound.music.play();
        }
    }
}