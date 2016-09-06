<?php namespace Model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Connection
 *
 * @author Ing. Carlos
 */
class Connection {
    //put your code here
    private $data = array(
        "host" => "127.0.0.1",
        "user" => "root",
        "password" => "",
        "db" => "db_agenda"        
    );    
    private $mysqli;
    
    public function __construct() {
        $this->mysqli = new \mysqli($this->data["host"], $this->data["user"], $this->data["password"], $this->data["db"]);    
        if ($this->mysqli->connect_errno) {
            echo "Error: Fallo al conectarse a MySQL debido a: <br>";
            echo "Errno: " . $this->mysqli->connect_errno . "<br>";
            echo "Error: " . $this->mysqli->connect_error . "<br>";
            exit;
        }
    }
    public function getConnection(){
        if ($this->mysqli->connect_errno) {
            echo "Error: Fallo al conectarse a MySQL debido a: <br>";
            echo "Errno: " . $this->mysqli->connect_errno . "<br>";
            echo "Error: " . $this->mysqli->connect_error . "<br>";
            exit;
        }
        return $this->mysqli;
    }

        public function executeQuery($query){
        $dataResult = $this->mysqli->query($query);
        if(!$dataResult){
            echo "Error: La ejecución de la consulta falló debido a: <br>";
            echo "Query: " . $query . "<br>";
            echo "Errno: " . $this->mysqli->errno . "<br>";
            echo "Error: " . $this->mysqli->error . "<br>";
            exit;
        }
        return $dataResult;
    }

    public function executeUpdate($query) {
        $status = $this->mysqli->query($query);
        if(!$status){
            echo "Error: La ejecución de la consulta falló debido a: <br>";
            echo "Query: " . $query . "<br>";
            echo "Errno: " . $this->mysqli->errno . "<br>";
            echo "Error: " . $this->mysqli->error . "<br>";
            exit;
        }
    }
   
}
