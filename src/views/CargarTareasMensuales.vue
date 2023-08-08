<template>
  <div class="container ">
    <h1>Aqui Puedes Cargar Tareas Mensuales</h1>
<div class="bienvenidos-container">
    <h2>Cargue sus Tareas Semanales</h2>
    <p>Seleccione un icono que mas represente su tarea, el dia que la tiene que realizar y la descripcion de la misma.</p>
    <CargarTareasMensuales></CargarTareasMensuales>
    <h2 class="pt-3">Modifique sus Tareas Semanales</h2>
    <p>Aqui tienes todas tus tareas ordenadas por dia.</p>
    <TareasOrdenadasMensuales></TareasOrdenadasMensuales>



</div>
  </div>
</template>
    
<script>

import TareasOrdenadasMensuales from '@/components/TareasOrdenadasMensuales.vue'
import CargarTareasMensuales from '@/components/CargarTareasMensuales.vue'
export default {
  name: 'CargarTareas',
  components: {

    TareasOrdenadasMensuales,
    CargarTareasMensuales,
  },
};
</script>
    
<style>
.btn {
  margin-top: 10px;
}
</style>