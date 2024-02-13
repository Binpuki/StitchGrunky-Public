package states;

import lime.net.HTTPRequest;
import lime.app.Future;
import lime.utils.Assets;
import lime.utils.AssetLibrary;
import flixel.FlxState;

using StringTools;

class LoadingScreen extends FlxState
{
    private var nextState:MusicBeatState;
    private var totalCount:Int = 0;

    public override function new(nextState:MusicBeatState)
    {
        super();

        this.nextState = nextState;

        var cacheList:Array<String> = nextState.getCacheList();
        totalCount = cacheList.length;

        for (path in cacheList)
        {
            #if cpp
            if (FileSystem.exists(path))
            {
                if (FileSystem.isDirectory(path))
                {
                    CoolUtil.recursiveSearch(path, function(p){
                        
                    });
                }
                //var request:HTTPRequest<String> = new HTTPRequest<String>().
            }
            #end
            //Future.withValue()
        }
    }

    //private function loadText()
}