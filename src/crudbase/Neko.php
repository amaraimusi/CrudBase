<?php 
namespace CrudBase;

class Neko{
    
    private static $singleton;
    
    public static function getInstance(){
        if (!isset(self::$singleton)) {
            self::$singleton = new Neko();
        }
        
        return self::$singleton;
        
    }
    
    public function bark($name){
        return $name . 'はニャーンと吠えた3';
    }
    
}