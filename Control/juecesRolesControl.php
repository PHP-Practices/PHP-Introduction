        <?php
            header('Content-Type: application/json');
            require_once './Config/AutoLoadClasses.php';
            \Config\AutoLoadClasses::init();
            
            $objStudent = new Model\Student();
            $objStudent->Set("fl_pk_student", 1);
            $objStudent->Set("fl_fk_career", 1);
            $objStudent->Set("fl_enrollment", "UTS");
            
//            $responseInsert = array(
//                "response" => array(
//                    "status" => $objStudent->Insert()
//                )
//            ); 
//            echo json_encode($responseInsert);
//            
//            $responseUpdate = array(
//                "response" => array(
//                    "status" => $objStudent->Update()
//                )
//            ); 
//            echo json_encode($responseUpdate);
//            
//            $responseDelete = array(
//                "response" => array(
//                    "status" => $objStudent->Delete(1)
//                )
//            );
//            echo json_encode($responseDelete);
//            
//            $row = array(
//                "row" => $objStudent->SelectOne(6)
//            );
//            echo json_encode($row);
//            
//            
            $rows = array(
                "rows" => $objStudent->SelectAll()
            );
            echo json_encode($rows);