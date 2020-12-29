package loadfile;
import haxe.macro.Expr.Access;
import haxe.Json;
import sys.io.File;
import haxe.io.Path;
import haxe.macro.Expr.Field;
class MacLoadFile{
    public static function load(file:String){
       // trace( "hello");
        var t=loadme(file);
        var fields=haxe.macro.Context.getBuildFields();
        for( field in fields){
            if( field.name==Path.withoutExtension(file)){

                //fields.remove(field);
                var kind=field.kind.getParameters()[0];
                //trace(kind);
                        field.name=Path.withoutExtension(file);
                        field.access= [Access.APublic];
                        field.kind=FVar(kind , macro $v{t});
                        field.pos=haxe.macro.Context.currentPos();
               break;

            }else{
            fields.push({
            name:Path.withoutExtension(file),
            access: [Access.APublic],
            kind:FVar(macro:Array<Dynamic>,macro $v{t}),
            pos:haxe.macro.Context.currentPos()
                });
            }
        }
      
        return fields;
    }

    static function loadme(f){
        var cwd= Sys.getCwd();
        var path = Path.join([cwd,f]);
        var content=File.getContent(path);
        return Json.parse(content);
    }

    
}