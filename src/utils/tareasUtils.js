
// Función para agregar una nueva tarea al localStorage
export function agregarTarea(tarea) {
    const tareas = obtenerTareas();
    tareas.push(tarea);
    localStorage.setItem('tareas', JSON.stringify(tareas));
  }
  
  // Función para obtener todas las tareas del localStorage
  export function obtenerTareas() {
    const tareasJSON = localStorage.getItem('tareas');
    return tareasJSON ? JSON.parse(tareasJSON) : [];
  }
  
  // Función para eliminar una tarea del localStorage
  export function eliminarTarea(id) {
    const tareas = obtenerTareas().filter((tarea) => tarea.id !== id);
    localStorage.setItem('tareas', JSON.stringify(tareas));
  }

  // Función para guardar las tareas en el localStorage
export function guardarTarea(tareas) {
  const tareasString = JSON.stringify(tareas);
  localStorage.setItem('tareas', tareasString);
}

// Función para actualizar una tarea en el localStorage por su id
export function actualizarTarea(tareaActualizada) {
  const tareas = obtenerTareas();
  const index = tareas.findIndex((tarea) => tarea.id === tareaActualizada.id);

  if (index !== -1) {
    tareas.splice(index, 1, tareaActualizada);
    guardarTarea(tareas);
  }
}