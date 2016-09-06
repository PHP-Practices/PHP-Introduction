        <?php
            header('Content-Type: application/json');
            require_once '../Config/AutoLoadClasses.php';
            \Config\AutoLoadClasses::init();
            
            $objAudiencia = new Model\AudienciasModel;
//            $objAudiencia->Set("fl_pk_student", 1);
//            $objAudiencia->Set("fl_fk_career", 1);
//            $objAudiencia->Set("fl_enrollment", "UTS");
            
//            $responseInsert = array(
//                "response" => array(
//                    "status" => $objAudiencia->Insert()
//                )
//            ); 
//            echo json_encode($responseInsert);
//            
//            $responseUpdate = array(
//                "response" => array(
//                    "status" => $objAudiencia->Update()
//                )
//            ); 
//            echo json_encode($responseUpdate);
//            
//            $responseDelete = array(
//                "response" => array(
//                    "status" => $objAudiencia->Delete(1)
//                )
//            );
//            echo json_encode($responseDelete);
//            
//            $row = array(
//                "row" => $objAudiencia->SelectOne(6)
//            );
//            echo json_encode($row);
//            
//            
            $rows = array(
                "rows" => $objAudiencia->SelectAll()
            );
            echo json_encode($rows);