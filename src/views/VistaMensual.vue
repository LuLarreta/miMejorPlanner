<template>
  <div>

  
    <h1>Planner Mensual</h1>
    <MostrarTarea></MostrarTarea>
    </div>
</template>

<script>
import MostrarTarea from '@/components/MostrarTareasMensuales.vue';

export default {
    name: "VistaMensual",
    components: {
      MostrarTarea,

    }
  }
</script>