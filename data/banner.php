<?php

    header("Content-Type:application/json");
    require_once("./init.php");

    $sql = "SELECT * FROM m_banner ORDER BY RAND() LIMIT 4";

    $result = sql_execute($sql);
    
    if(count($result)){
        echo json_encode($result);
    }

