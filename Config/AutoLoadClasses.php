<?php namespace Config;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AutoLoadClasses
 *
 * @author Ing. Carlos
 */
class AutoLoadClasses{
    public static function init(){
        spl_autoload_register(function ($class){
            $rute = "..\\".$class.".php";
            if(is_readable($rute)){                
                require_once $rute;
            }else{
                print($rute." -> File not found... <br>");
                exit;
            }            
        });
    }
}
