<template>
  <div class="divIcono">
    <v-select transition="fade-transition" v-model="iconoSeleccionado" v-on:change="onSelectChange"
      v-bind:class="fondoSelect" :items="listaIconos.map(icono => icono.nombre)"
      label="Selecciona tu icono deseado!"></v-select>
  </div>
</template>
  
<script>
export default {
  name: 'SeleccionarIcono',
  props: {
    value: String, // Definimos el prop "value" para recibir el valor seleccionado desde el componente padre
  },
  data() {
    return {
      iconoSeleccionado: this.value,
      listaIconos: [],


    };
  },
  watch: {

  },
  methods: {
    obtenerIconos() {
      fetch('https://dispo-moviles-larreta.000webhostapp.com/iconos.php')
        .then((respuesta) => respuesta.json())
        .then(data => {
          console.log('Datos obtenidos:', data);
          this.listaIconos = JSON.parse(data); // Analizar la cadena JSON aquí
          this.nombre = this.listaIconos[0].nombre; // Establecer nombre de ejemplo, puedes cambiar esto según tus necesidades.
          this.id = this.listaIconos[0].id; // Establecer id de ejemplo, puedes cambiar esto según tus necesidades.
          console.log(this.nombre);
          console.log(this.id);
        })
        .catch(error => console.error('Error al obtener los iconos:', error));
    },


    onSelectChange() {

      this.$emit('icono-seleccionado', this.iconoSeleccionado);
      console.log(this.iconoSeleccionado);
    },
  },
  computed: {
    fondoSelect() {
      return {
        // Definimos las clases CSS y sus condiciones
        'icono-auto': this.iconoSeleccionado === "Auto" ? 'icono-auto' : '',
        'icono-carrito': this.iconoSeleccionado === "Carrito" ? 'icono-carrito' : '',
        'icono-celular': this.iconoSeleccionado === "Celular" ? 'icono-celular' : '',
        'icono-cocina': this.iconoSeleccionado === "Cocina" ? 'icono-cocina' : '',
        'icono-corazon': this.iconoSeleccionado === "Corazón" ? 'icono-corazon' : '',
        'icono-flores': this.iconoSeleccionado === "Flores" ? 'icono-flores' : '',
        'icono-medico': this.iconoSeleccionado === "Medico" ? 'icono-medico' : '',
        'icono-perro': this.iconoSeleccionado === "Perro" ? 'icono-perro' : '',
        'icono-pesas': this.iconoSeleccionado === "Pesas" ? 'icono-pesas' : '',
        'icono-tarjetas': this.iconoSeleccionado === "Tarjetas" ? 'icono-tarjetas' : '',
        'icono-trabajo': this.iconoSeleccionado === "Trabajo" ? 'icono-trabajo' : '',
      };
    },
  },
  mounted() {
    // Llamamos a la función obtenerIconos cuando se monta el componente
    console.log('Componente montado');
    this.obtenerIconos();
    console.log('Componente montado');
    console.log(this.listaIconos);


  },
};
</script>
  
<style>
.v-select {
  height: 60px;
  width: 100%;
  background-size: contains;
  background-repeat: no-repeat;
  background-position-x: center;
  background-position-y: top;
  text-align: right;
  padding: 3px;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0px 6px 2px rgba(0, 0, 0, 0.2);
}

.v-input__control {
  display: flex;
  flex-direction: column-reverse;
  padding: 5px;

}

.v-label {
  display: none;
}

.divIcono {
  width: 100%;
}

select:focus {
  border: none;
}

.icono-auto {
  background-image: url(../assets/iconos/auto.png);
}

.icono-carrito {
  background-image: url(../assets/iconos/carrito.png);
}

.icono-celular {
  background-image: url(../assets/iconos/celular.png);
}

.icono-cocina {
  background-image: url(../assets/iconos/cocina.png);
}

.icono-corazon {
  background-image: url(../assets/iconos/corazon.png);
}

.icono-flores {
  background-image: url(../assets/iconos/flores.png);
}

.icono-medico {
  background-image: url(../assets/iconos/medico.png);
}

.icono-perro {
  background-image: url(../assets/iconos/perro.png);
}

.icono-pesas {
  background-image: url(../assets/iconos/pesas.png);
}

.icono-tarjetas {
  background-image: url(../assets/iconos/tarjetas.png);
}

.icono-trabajo {
  background-image: url(../assets/iconos/trabajo.png);
}
</style>
  