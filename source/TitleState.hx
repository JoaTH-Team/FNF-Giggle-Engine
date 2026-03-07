package;

class TitleState extends MusicBeatState
{
    override function create() {
        super.create();

        ModHandler.reload();
    }   
    
    override function update(elapsed:Float) {
        super.update(elapsed);
    }
}