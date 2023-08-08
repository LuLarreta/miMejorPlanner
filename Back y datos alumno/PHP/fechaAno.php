<?PHP
require_once 'Clases/Conexion.php';

// Creamos una función para obtener los iconos en formato JSON
function obtenerFecha() {
    try {
        $conexion = Conexion::getConexion();
        $query = "SELECT * FROM fecha_mes";
        $PDOStatement = $conexion->prepare($query);
        $PDOStatement->execute();
        $listaFecha = $PDOStatement->fetchAll(PDO::FETCH_ASSOC); // Usamos PDO::FETCH_ASSOC para obtener un array asociativo
        
        // Devolvemos los datos en formato JSON
        header("Access-Control-Allow-Origin: http://localhost:8080");
        header('Content-Type: application/json');
        $listaFechaJson = json_encode($listaFecha);
        echo json_encode($listaFechaJson);
        return $listaFechaJson;
        
    } catch (Exception $e) {
        // En caso de error, devolvemos un mensaje de error en formato JSON
        header('Content-Type: application/json');
        echo json_encode(array('error' => 'Error al obtener las fechas'));
    }
}

// Llamamos a la función para obtener los iconos
obtenerFecha();