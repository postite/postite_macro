package;

import utest.Assert;

class RunAll{
    static function main() {
        utest.UTest.run([new TestLoad()]);

    }
}

class TestLoad extends utest.Test{
    // public function new() {
        
    // }

    public function testLoad(){
       var t= new LoadFile();
        Assert.isTrue(t.file.length==2);
    }
}