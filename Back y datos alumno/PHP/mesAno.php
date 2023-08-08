<?PHP
require_once 'Clases/Conexion.php';

// Creamos una función para obtener los meses en formato JSON
function obtenerMeses() {
    try {
        $conexion = Conexion::getConexion();
        $query = "SELECT * FROM mes_ano";
        $PDOStatement = $conexion->prepare($query);
        $PDOStatement->execute();
        $listaMeses = $PDOStatement->fetchAll(PDO::FETCH_ASSOC); // Usamos PDO::FETCH_ASSOC para obtener un array asociativo
        
        // Devolvemos los datos en formato JSON
        header("Access-Control-Allow-Origin: http://localhost:8080");
        header('Content-Type: application/json');
        $listaMesesJson = json_encode($listaMeses);
        echo json_encode($listaMesesJson);
        return $listaMesesJson;
        
    } catch (Exception $e) {
        // En caso de error, devolvemos un mensaje de error en formato JSON
        header('Content-Type: application/json');
        echo json_encode(array('error' => 'Error al obtener los meses'));
    }
}

// Llamamos a la función para obtener los meses
obtenerMeses();