<?php 
use PHPUnit\Framework\TestCase;
use CrudBase\CrudBase;

class CrudBaseTest extends TestCase{
    
    protected $obj;
    protected function setUp() :void {
        //$this->object = new Neko();
    }
    
    public function testAdd() {

       $y = date('Y');
       $field = 'img_fn';
       $files[$field] = ['name'=> 'neko.jpg'];
       $ent = [$field => 'neko.jpg'];
       $path_tmpl = "storage/neko/y%Y/999/%unique/orig/%fn";
       $path = CrudBase::makeFilePath($files, $path_tmpl, $ent, $field);

       var_dump('■■■□□□■■■□□□テスト→CrudBase::makeFilePath');//■■■□□□■■■□□□)
       var_dump($path);//■■■□□□■■■□□□)

       $flg = strpos($path, "storage/neko/y{$y}/999");
       $res = false;
       if($flg === 0) $res = true;

       $this->assertTrue( $res);

    }

}