<template>
  <div>
    <div>
      <h1>Planner Semanal</h1>
      <router-view></router-view>
      <MostrarTareas></MostrarTareas>
    </div>

    

  </div>
</template>

<script>
import MostrarTareas from '../components/MostrarTareasSemanales.vue';


export default {
  name: 'VistaSemanal',
  components: {
    MostrarTareas,
  }

}
</script>


<style></style>

