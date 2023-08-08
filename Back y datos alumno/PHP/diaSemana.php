<?PHP
require_once 'Clases/Conexion.php';

// Creamos una función para obtener los iconos en formato JSON
function obtenerDias() {
    try {
        $conexion = Conexion::getConexion();
        $query = "SELECT * FROM dia_semana";
        $PDOStatement = $conexion->prepare($query);
        $PDOStatement->execute();
        $listaDias = $PDOStatement->fetchAll(PDO::FETCH_ASSOC); // Usamos PDO::FETCH_ASSOC para obtener un array asociativo
        
        // Devolvemos los datos en formato JSON
        header("Access-Control-Allow-Origin: http://localhost:8080");
        header('Content-Type: application/json');
        $listaDiasJson = json_encode($listaDias);
        echo json_encode($listaDiasJson);
        return $listaDiasJson;
        
    } catch (Exception $e) {
        // En caso de error, devolvemos un mensaje de error en formato JSON
        header('Content-Type: application/json');
        echo json_encode(array('error' => 'Error al obtener los dias'));
    }
}

// Llamamos a la función para obtener los iconos
obtenerDias();