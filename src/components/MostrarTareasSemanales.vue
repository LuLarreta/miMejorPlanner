<template>
  <div class="container semanaCont">
    <h3>Una Semana Perfecta</h3>
    <div class="container-fluid">
      <div class="row justify-content-between rowSemanal">
        <div v-for="dia in diasSemana" :key="dia" class="col-12  borderosa"
          :class="masAncho(dia) ? 'col-lg-4' : 'col-lg-3'">
          <h4>{{ mayusculaDia(dia) }}</h4>
          <v-list>
            <TareaCheckbox v-for="tarea in tareasPorDia(dia)" :key="tarea.id" :tarea="tarea" />
          </v-list>
          <p v-if="tareasPorDia(dia).length === 0">Tenés el Dia Libre❤️ </p>
        </div>
      </div>


    </div>
  </div>
</template>
  
<script>
import TareaCheckbox from './TareaCheckbox.vue';
import { obtenerTareas } from '@/utils/tareasUtils';



export default {
  name: 'TareasOrdenadas',
  components: {
    TareaCheckbox,
  },
  data() {
    return {
      tareas: [],
    };
  },
  methods: {
    tareasPorDia(dia) {

      return this.tareas.filter((tarea) => tarea.dia === dia);
    },
    onTareaAgregada(nuevaTarea) {
      this.tareas.push(nuevaTarea);
    },
    mayusculaDia(texto) {
      return texto.charAt(0).toUpperCase() + texto.slice(1);
    },
    masAncho(dia) {
      return dia === 'Viernes' || dia === 'Sábado' || dia === 'Domingo';
    },
  },
  computed: {
    diasSemana() {
      //array de dias
      return ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
    },
  },
  mounted() {
    //obtener tareas del localStorage
    this.tareas = obtenerTareas();
  },



}
</script>
  
<style>
.diasSemana {
  background-color: #ffd1bc;

}

.tarea {
  border-bottom: solid 2px #f4dce2;
  padding: 3px;
  text-align: center;
  margin: 0;
}

.borderosa {
  border: #f4dce2 solid 6px;
}

.finde {
  height: 40%;
}

.semanal {
  height: 60%;
}

.semanaCont {
  background: #f4dce2;
  padding: 10px;
  border-radius: 6px;
}

h3{
  text-align: center;
}



.rowSemanal {
  background-color: #ffffff;
  border-radius: 20px;

  @media (min-width: 992px) {

    min-height: 80vh;

  }


}
</style>