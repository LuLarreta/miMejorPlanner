<template>
  <div>
    <!-- Recorremos los días de la semana -->
    <div v-for="dia in diasSemana" :key="dia" class="semanaCont container">
      <h3>{{ mayusculaDia(dia) }}</h3>
      <div class="semanal">

        <div v-for="tarea in tareasPorDia(dia)" :key="tarea.id" class="container-fluid ">
          <div v-if="!tarea.editando" class="row align-items-center tarea justify-content-center mx-3">

            <div class="col-3 col-lg-1">
              <img v-if="tarea.icono === 'Auto'" src="../assets/iconos/auto.png" alt="Icono de Auto" class="img-fluid" />
              <img v-else-if="tarea.icono === 'Carrito'" src="../assets/iconos/carrito.png" alt="Icono de Carrito"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Celular'" src="../assets/iconos/celular.png" alt="Icono de Celular"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Cocina'" src="../assets/iconos/cocina.png" alt="Icono de Cocina"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Corazón'" src="../assets/iconos/corazon.png" alt="Icono de Corazon"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Flores'" src="../assets/iconos/flores.png" alt="Icono de flores"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Medico'" src="../assets/iconos/medico.png" alt="Icono de Medico"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Perro'" src="../assets/iconos/perro.png" alt="Icono de Perro"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Pesas'" src="../assets/iconos/pesas.png" alt="Icono de Pesas"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Tarjetas'" src="../assets/iconos/tarjetas.png" alt="Icono de Tarjetas"
                class="img-fluid" />
              <img v-else-if="tarea.icono === 'Trabajo'" src="../assets/iconos/trabajo.png" alt="Icono de Trabajo"
                class="img-fluid" />
              <p v-else> ?</p>
            </div>
            <div class="col-9 col-lg-7">{{ tarea.descripcion }} </div>
            <div class="col-6 col-lg-2 d-flex justify-content-center">
              <BotonEliminar label="Eliminar" @eliminar="eliminarTarea(tarea.id)" />
            </div>
            <div class="col-6 col-lg-2 d-flex justify-content-center">
              <BotonEditar label="Editar" @editar="editarTarea(tarea)"></BotonEditar>

            </div>

          </div>
          <div v-else class="row align-items-center tarea justify-content-evenly">
            <div class="col-3 col-lg-2">
              <SeleccionarIcono v-model="iconoSeleccionado" @icono-seleccionado="onSelectChange">
              </SeleccionarIcono>

            </div>
            <div class="col-3 col-lg-2">
              <v-select transition="fade-transition" v-model="tarea.dia" :items="listaDias.map(dia => dia.nombre)"
                label="Elegi el dia de la semana!"></v-select>
            </div>
            <div class="col-6 col-lg-4 my-2">
              <label id="descripcion" class="d-none">Ingresa tu tarea del dia!</label>
              <textarea id="descripcion" v-model="tarea.descripcion"></textarea>
            </div>
            <div class="col-4 col-lg-2">
              <BotonEditar label="Guardar" @editar="guardarCambiosTarea(tarea)"></BotonEditar>
            </div>
            <div class="col-4 col-lg-2 ">
            <BotonCancelar label="Cancelar" @cancelar="cancelarEdicionTarea(tarea)"></BotonCancelar></div>
            


          </div>
        </div>
      </div>
      <p v-if="tareasPorDia(dia).length === 0">No hay tareas para modificar</p>
    </div>

  </div>
</template>

<script>
import { obtenerTareas, eliminarTarea, guardarTarea } from '@/utils/tareasUtils';
import SeleccionarIcono from './SeleccionarIcono.vue';
import BotonEliminar from './BotonEliminar.vue';
import BotonEditar from './BotonEditar.vue';
import BotonCancelar from './BotonCancelar.vue';





export default {
  name: 'TareasOrdenadas',
  components: {
    SeleccionarIcono,
    BotonEliminar,
    BotonEditar,
    BotonCancelar,

  },
  data() {
    return {
      tareas: [],
      tareaEditando: null,
      dia: "",
      iconoSeleccionado: null,
      listaDias: [],
    };

  },
  methods: {
    onSelectChange(icono) {
      this.iconoSeleccionado = icono;
      console.log(icono);
    },
    tareasPorDia(dia) {
      return this.tareas.filter((tarea) => tarea.dia === dia);
    },
    onTareaAgregada(nuevaTarea) {
      this.tareas.push(nuevaTarea);
    },
    mayusculaDia(texto) {
      return texto.charAt(0).toUpperCase() + texto.slice(1);
    },
    eliminarTarea(id) {
      eliminarTarea(id);
      this.tareas = obtenerTareas();
    },
    editarTarea(tarea) {
      // Desactivamos el modo de edición para todas las tareas
      this.tareas.forEach((t) => {
        t.editando = false;
      });



      // Asignamos la tarea seleccionada a la variable tareaEditando
      this.tareaEditando = { ...tarea };


      // Marcamos la tarea actual como editando
      tarea.editando = true;
      this.iconoSeleccionado = tarea.icono;

      console.log(this.tareaEditando);
      console.log(this.iconoSeleccionado);
      console.log(tarea.icono);


    },
    // Método para guardar los cambios en una tarea editada
    guardarCambiosTarea(tareaEditada) {
      // Buscamos la tarea original en el array tareas utilizando su id
      const index = this.tareas.findIndex((tarea) => tarea.id === tareaEditada.id);

      if (index !== -1) {
        tareaEditada.icono = this.iconoSeleccionado;
        // Reemplazamos la tarea original con la tarea editada en el array tareas
        this.tareas.splice(index, 1, tareaEditada);

        // Actualizamos el localStorage con las tareas modificadas
        guardarTarea(this.tareas);
        console.log(this.tareas)
      }

      // Restablecemos el modo de edición y la tareaEditada a sus valores iniciales
      this.tareaEditando = null;
      tareaEditada.editando = false;
    },

    // Método para cancelar la edición de una tarea
    cancelarEdicionTarea() {
      if (this.tareaEditando) {
        // Buscamos la tarea actual en el array tareas utilizando su id
        const tareaActual = this.tareas.find((t) => t.editando === true);

        if (tareaActual) {
          // Copiamos los valores originales desde this.tareaEditando a la tarea actual
          tareaActual.descripcion = this.tareaEditando.descripcion;
          tareaActual.icono = this.tareaEditando.icono;
          // Copia otros campos de la tarea según sea necesario...

          // Marcamos la tarea actual como no editando
          tareaActual.editando = false;
        }

        // Restablecemos la variable tareaEditando a null
        this.tareaEditando = null;
      }
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
  computed: {
    diasSemana() {
      //array de dias
      return ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
    },
  },
  mounted() {
    //obtener tareas del localStorage
    this.tareas = obtenerTareas();
    this.obtenerDias();
    // Asegurarse de que el modo de edición esté desactivado al cargar el componente
    this.tareas.forEach((t) => {
      t.editando = false;
    });
  },


}
</script>

<style>
.diasSemana {
  background-color: #ffd1bc;

}

.semanal {
  background-color: #ffffff;
  border-radius: 6px;

}
</style>