<template>
  <div class="container-fluid semanaCont">
    <div v-if="!modoEdicion" class="semanal">
      <form @submit.prevent="agregarTarea()">
        <div class="row align-items-end py-3 px-4 justify-content-center ">
          <div class="col-lg-3 col-4 ">
            <p>Elegi un icono!</p>
            <SeleccionarIcono @icono-seleccionado="onSelectChange"></SeleccionarIcono>
          </div>
          <div class="col-lg-2 col-4">
            <p>Elegi la fecha!</p>
            <v-select transition="fade-transition" v-model="fechaSeleccionada"
              :items="listaFecha.map(fecha => fecha.nombre)" label="Elegi la fecha del año!"></v-select>
          </div>
          <div class="col-lg-3 col-4 ">
            <p>Elegi el mes!</p>
            <v-select transition="fade-transition" v-model="mesSeleccionado" :items="listaMeses.map(mes => mes.nombre)"
              label="Elegi la fecha del año!"></v-select>
          </div>
          <div class="col-lg-4 col-12 ">
            <p>Describi brevemente tu tarea</p>
            <label id="descripcion" class="d-none">Ingresa tu tarea del mes!</label>
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
  name: 'CargarTareasMensuales',
  components: {
    SeleccionarIcono,

  },
  data() {
    return {
      nuevaTarea: {
        descripcion: '',
        mes: '',
        fecha: '',
        icono: null,
        marcada: false,

      },
      mesSeleccionado: '',
      iconoSeleccionadoPadre: null,
      fechaSeleccionada: '',
      tareas: [],
      error: false,
      modoEdicion: false,
      tareaEditada: null,
      listaMeses: [],
      listaFecha: [],
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
          mes: this.mesSeleccionado,
          fecha: this.fechaSeleccionada,
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
        this.mesSeleccionado = "";
        this.fechaSeleccionada = "";
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
    obtenerMeses() {
      fetch('https://dispo-moviles-larreta.000webhostapp.com/mesAno.php')
        .then((respuesta) => respuesta.json())
        .then(data => {
          console.log('Datos obtenidos:', data);
          this.listaMeses = JSON.parse(data); // Analizar la cadena JSON aquí
          this.nombre = this.listaMeses[0].nombre; // Establecer nombre de ejemplo, puedes cambiar esto según tus necesidades.
          this.id = this.listaMeses[0].id; // Establecer id de ejemplo, puedes cambiar esto según tus necesidades.
          console.log(this.nombre);
          console.log(this.id);
        })
        .catch(error => console.error('Error al obtener los iconos:', error));
    },
    obtenerFecha() {
      fetch('https://dispo-moviles-larreta.000webhostapp.com/fechaAno.php')
        .then((respuesta) => respuesta.json())
        .then(data => {
          console.log('Datos obtenidos:', data);
          this.listaFecha = JSON.parse(data); // Analizar la cadena JSON aquí
          this.nombre = this.listaFecha[0].nombre; // Establecer nombre de ejemplo, puedes cambiar esto según tus necesidades.
          this.id = this.listaFecha[0].id; // Establecer id de ejemplo, puedes cambiar esto según tus necesidades.
          console.log(this.nombre);
          console.log(this.id);
        })
        .catch(error => console.error('Error al obtener los iconos:', error));
    },


  },
  mounted() {
    // Llamamos a la función obtenerIconos cuando se monta el componente
    console.log('Componente montado');
    this.obtenerMeses();
    this.obtenerFecha();
    console.log('Componente montado');
    console.log(this.listaMeses);


  },


};
</script>
  
<style></style>
  