<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Conecta a la base de datos  con usuario, contraseña y nombre de la BD
$servidor = "localhost"; $usuario = "root"; $contrasenia = ""; $nombreBaseDatos = "pasteleria";
$conexionBD = new mysqli($servidor, $usuario, $contrasenia, $nombreBaseDatos);


// Consulta datos y recepciona una clave para consultar dichos datos con dicha clave
if (isset($_GET["consultar"])){
    $sqlPasteles = mysqli_query($conexionBD,"SELECT * FROM pasteles WHERE idpastel=".$_GET["consultar"]);
    if(mysqli_num_rows($sqlPasteles) > 0){
        $pasteles = mysqli_fetch_all($sqlPasteles,MYSQLI_ASSOC);
        echo json_encode($pasteles);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}
//borrar pero se le debe de enviar una clave ( para borrado )
if (isset($_GET["borrar"])){
    $sqlPasteles = mysqli_query($conexionBD,"DELETE FROM pasteles WHERE idpastel=".$_GET["borrar"]);
    if($sqlPasteles){
        echo json_encode(["success"=>1]);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}
//Inserta un nuevo registro y recepciona en método post el dato nombrepastel
if(isset($_GET["insertar"])){
    $data = json_decode(file_get_contents("php://input"));
    //echo("<script>console.log('PHP: " . $data->nombrepastel . "');</script>");
    $nombrepastel=$data->nombrepastel;
    
        if(($nombrepastel!="")){           
         $sqlPasteles = mysqli_query($conexionBD,"INSERT INTO pasteles(idpastel, nombrepastel) VALUES(null,'$nombrepastel')");
        echo json_encode(["success"=>1]);
        }
    exit();
}
// Actualiza datos pero recepciona datos de nombre y una clave para realizar la actualización
if(isset($_GET["actualizar"])){
    
    $data = json_decode(file_get_contents("php://input"));

    $idpastel=(isset($data->idpastel))?$data->idpastel:$_GET["actualizar"];
    $nombrepastel=$data->nombrepastel;
    
    
    $sqlPasteles = mysqli_query($conexionBD,"UPDATE pasteles SET nombrepastel='$nombrepastel' WHERE idpastel='$idpastel'");
    echo json_encode(["success"=>1]);
    exit();
}
// Consulta todos los registros de la tabla pasteles
$sqlPasteles = mysqli_query($conexionBD,"SELECT * FROM pasteles ");
if(mysqli_num_rows($sqlPasteles) > 0){
    $pasteles = mysqli_fetch_all($sqlPasteles,MYSQLI_ASSOC);
    echo json_encode($pasteles);
}
else{ echo json_encode([["success"=>0]]); }


?>
