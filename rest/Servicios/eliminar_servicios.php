<?php
include "../Config/config.php";
include "../Config/utils.php";
// Conectar a la base de datos
$dbConn = connect($db);

// Verificar el método de solicitud
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    // Obtener el ID del usuario a eliminar desde la URL
    $id_servi = $_GET['id_servi'];

    if (!empty($id_servi)) {
        // Construir la consulta SQL para eliminar el usuario
        $sql = "DELETE FROM servicio WHERE id_servi = :id_servi";
        $statement = $dbConn->prepare($sql);
        $statement->bindValue(':id_servi', $id_servi);

        // Ejecutar la consulta
        $statement->execute();
        header("HTTP/1.1 200 OK");
        echo json_encode(array("message" => "Usuario eliminado con éxito"));
        exit();
    } else {
        // ID de usuario vacío en la URL
        header("HTTP/1.1 400 Bad Request");
        echo json_encode(array("error" => "ID de usuario no proporcionado"));
        exit();
    }
} else {
    // Método de solicitud no admitido
    header("HTTP/1.1 405 Method Not Allowed");
    echo json_encode(array("error" => "Método no permitido"));
    exit();
}
?>
