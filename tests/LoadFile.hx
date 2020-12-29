typedef Truc={
    name:String,
    stuff:String
}

@:build(loadfile.MacLoadFile.load("file.json"))
class LoadFile{

    public var file:Array<Truc>;
    public function new(){

    }
}


