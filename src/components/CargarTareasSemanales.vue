<template>
  <div class="container-fluid semanaCont">
    <div v-if="!modoEdicion" class="semanal">
      <form @submit.prevent="agregarTarea()">
        <div class="row align-items-end py-3 px-4 justify-content-center">
          <div class="col-lg-4 col-6">
            <p>Elegi un icono!</p>
            <SeleccionarIcono @icono-seleccionado="onSelectChange"></SeleccionarIcono>
          </div>
          <div class="col-lg-4 col-6">
            <p>Elegi un dia de la semana!</p>
            <v-select transition="fade-transition" v-model="diaSeleccionado" :items="listaDias.map(dia => dia.nombre)"
              label="Elegi el dia de la semana!"></v-select>

          </div>
          <div class="col-lg-4 col-12 ">
            <p>Describi brevemente tu tarea!</p>
            <label id="descripcion" class="d-none">Ingresa tu tarea del dia!</label>
            <textarea id="descripcion" v-model="nuevaTarea.descripcion"></textarea>
          </div>
          <button type="submit" class="agregarP btn mt-3 col-6">
            AGREGAR
          </button>
        </div>
        <p v-if="error" style="color: red; text-align: center;">Por favor, ingresa un pendiente</p>

      </form>
    </div>

  </div>
</template>

<script>
import SeleccionarIcono from './SeleccionarIcono.vue';
import { agregarTarea } from '@/utils/tareasUtils';
export default {
  name: 'CargarTareasSemanales',
  components: {
    SeleccionarIcono,

  },
  data() {
    return {
      nuevaTarea: {
        descripcion: '',
        dia: '',
        icono: null,
        marcada: false,
      },
      diaSeleccionado: '',
      iconoSeleccionadoPadre: null,
      tareas: [],
      error: false,
      modoEdicion: false,
      tareaEditada: null,
      listaDias: [],
    };
  },
  methods: {
    onSelectChange(value) {

      this.iconoSeleccionadoPadre = value;
      console.log(value);
    },
    agregarTarea() {
      if (this.nuevaTarea.descripcion.trim() !== "") {
        const iconoSeleccionado = this.iconoSeleccionadoPadre;

        // Crea el objeto de la nueva tarea
        const nuevaTarea = {
          id: Date.now(),
          descripcion: this.nuevaTarea.descripcion,
          dia: this.diaSeleccionado,
          icono: iconoSeleccionado,
          marcada: false,
        };

        // Llama a la función agregarTarea de tareasUtils.js para guardar la nueva tarea en el localStorage
        agregarTarea(nuevaTarea);
        // Emitimos el evento "tarea-agregada" para notificar al componente TareasOrdenadas
        this.$emit("tarea-agregada", nuevaTarea);

        // Agrega la nueva tarea a la lista de tareas local (opcional, solo si necesitas tener las tareas en el estado del componente también)
        this.tareas.push(nuevaTarea);

        console.log("icono:", iconoSeleccionado);
        console.log("Tareas:", this.tareas);

        // Limpia el formulario y las variables relacionadas con la nueva tarea
        this.nuevaTarea.descripcion = "";
        this.diaSeleccionado = "";
        this.iconoSeleccionadoPadre = null;
        this.error = false;
        window.location.reload();
      } else {
        this.error = true;
      }
    },
    editarTarea(tarea) {
      this.modoEdicion = true;
      this.tareaEditada = tarea;
    },
    obtenerDias() {
      fetch('https://dispo-moviles-larreta.000webhostapp.com/diaSemana.php')
        .then(respuesta => respuesta.json())
        .then(data => {
          console.log('Datos obtenidos:', data);
          this.listaDias = JSON.parse(data); // Almacenamos los días de la semana en el estado del componente
          this.nombre = this.listaDias[0].nombre; // Establecer nombre de ejemplo, puedes cambiar esto según tus necesidades.
          this.id = this.listaDias[0].id; // Establecer id de ejemplo, puedes cambiar esto según tus necesidades.
          console.log(this.nombre);
          console.log(this.id);
        })
        .catch(error => console.error('Error al obtener los días de la semana:', error));
    },


  },
  mounted() {
    // Llamamos a la función obtenerIconos cuando se monta el componente
    console.log('Componente montado');
    this.obtenerDias();
    console.log('Componente montado');
    console.log(this.listaDias);


  },


};
</script>

<style>
input {
  width: 100%;
}

.dia {
  text-align: center;
  display: block;
  margin: auto;
}

textarea {
  width: 100%;
  min-height: 60px;
  margin: auto;
  display: block;
  padding: 3px;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0px 6px 2px rgba(0, 0, 0, 0.2);
}

.agregarP {
  background-color: #a1d6d6;

}
</style>
