<?php 
use PHPUnit\Framework\TestCase;
use CrudBase\Neko;

class NekoTest extends TestCase{
    
    protected $obj;
    protected function setUp() :void {
        
        $this->object = Neko::getInstance();
    }
    
    public function testAdd() {
        $this->assertEquals('赤猫はニャーンと吠えた3', $this->object->bark('赤猫'));
    }

}