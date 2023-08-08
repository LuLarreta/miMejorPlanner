<template>
  <div class="container">
    <h1>Aqui Puedes Cargar Tareas Semanales</h1>
    <div class="bienvenidos-container">
    <h2>Cargue sus Tareas Semanales</h2>
    <p>Seleccione un icono que mas represente su tarea, el dia que la tiene que realizar y la descripcion de la misma.</p>
    <CargarTareasSemanales></CargarTareasSemanales>
    <h2>Modifique sus Tareas Semanales</h2>
    <p>Aqui tienes todas tus tareas ordenadas por dia.</p>
    <TareasOrdenadas></TareasOrdenadas>



    </div>
  </div>
</template>
  
<script>
import CargarTareasSemanales from '@/components/CargarTareasSemanales.vue'
import TareasOrdenadas from '@/components/TareasOrdenadas.vue'
export default {
  name: 'CargarTareas',
  components: {
    CargarTareasSemanales,
    TareasOrdenadas,
  },
};
</script>
  
<style>
.btn {
  margin-top: 10px;
}


</style>