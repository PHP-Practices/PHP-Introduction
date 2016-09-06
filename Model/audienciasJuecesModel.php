<?php namespace Model;
    class audienciasJuecesModel {
        private $fl_pk_audiencia_juez;
        private $fl_fk_juez_rol;
        private $fl_fecha_inicial="";
        private $fl_fecha_final="";


        protected $mysqli;
        protected $stmt;

        public function __construct() {
            $objConn = new Connection();
            $this->mysqli = $objConn->getConnection();
        }
        
        public function Set($att, $value){
            $this->$att = $value;
        }
        
        public function Get($att){
            return $this->$att;
        }

        public function Insert() {
            $query = "INSERT INTO tb_audiencia_tb_juez (fl_fk_juez_rol, fl_fecha_inicial, fl_fecha_final) VALUES (?, ?, ?);";
            $this->stmt = $this->mysqli->prepare($query);
            if (!$this->stmt) {
                echo "Prepare failed: (" . $this->mysqli->errno . ") " . $this->mysqli->error;
            }
            $this->stmt->bind_param(
                    "iss", 
                    $this->fl_fk_juez_rol, 
                    $this->fl_fecha_inicial, 
                    $this->fl_fecha_final
            );
            if (!$this->stmt->execute()) {
                echo "Execute failed: (" . $this->stmt->errno . ") " . $this->stmt->error;
            }else{
                $this->stmt->get_result();                
            }      
            return $this->stmt->affected_rows;
        }
        
        public function Update() {
            $query = "UPDATE tb_audiencia_tb_juez SET fl_fk_juez_rol=?, fl_fecha_inicial=?, fl_fecha_final=? WHERE  fl_pk_audiencia_juez=?;";
            $this->stmt = $this->mysqli->prepare($query);
            if (!$this->stmt) {
                echo "Prepare failed: (" . $this->mysqli->errno . ") " . $this->mysqli->error;
            }
            $this->stmt->bind_param(
                    "iss", 
                    $this->fl_fk_juez_rol, 
                    $this->fl_fecha_inicial, 
                    $this->fl_fecha_final
            );
            if (!$this->stmt->execute()) {
                echo "Execute failed: (" . $this->stmt->errno . ") " . $this->stmt->error;
            }else{
                $this->stmt->get_result();                
            }      
            return $this->stmt->affected_rows;
        }
        
        public function Delete($id_row) {
            $query = "DELETE FROM tb_audiencia_tb_juez WHERE  fl_pk_audiencia_juez=?;";
            $this->stmt = $this->mysqli->prepare($query);
            if (!$this->stmt) {
                echo "Prepare failed: (" . $this->mysqli->errno . ") " . $this->mysqli->error;
            }
            $this->stmt->bind_param(
                "i", 
                $id_row
            );
            
            if (!$this->stmt->execute()) {
                echo "Execute failed: (" . $this->stmt->errno . ") " . $this->stmt->error;
            }else{
                $this->stmt->get_result(); 
            }     
            
            return $this->stmt->affected_rows;
        }
        
        public function SelectOne($id_row) {
            $row = null;
            $query = "";
           
            $this->stmt = $this->mysqli->prepare($query);
            if (!$this->stmt) {
                echo "Prepare failed: (" . $this->mysqli->errno . ") " . $this->mysqli->error;
            }
            $this->stmt->bind_param(
                "i", 
                $id_row
            );

            if (!$this->stmt->execute()) {
                echo "Execute failed: (" . $this->stmt->errno . ") " . $this->stmt->error;
            }else{
                $result = $this->stmt->get_result();
                $row = $result->fetch_assoc();                
            }      
            return $row;
        }
        
        public function SelectAll() {
            $rows = null;
            $query = "SELECT * FROM tb_audiencia_tb_juez;";
            
            $this->stmt = $this->mysqli->prepare($query);
            if (!$this->stmt) {
                echo "Prepare failed: (" . $this->mysqli->errno . ") " . $this->mysqli->error;
            }
            
            if (!$this->stmt->execute()) {
                echo "Execute failed: (" . $this->stmt->errno . ") " . $this->stmt->error;
            }else{
                $result = $this->stmt->get_result();
                while ($data = $result->fetch_assoc()){
                    $rows[] = $data;
                }    
//                var_dump($rows);
            }                     
            return $rows;
        }
        
        public function __toString(){
          return "fl_fk_juez_rol: $this->fl_fk_juez_rol fl_fecha_inicial: $this->fl_fecha_inicial fl_fecha_final: $this->fl_fecha_final";
        }
        public function __destruct() {
            $this->mysqli->close();
            if ($this->stmt) {
                $this->stmt->close();
            }            
        }
    }