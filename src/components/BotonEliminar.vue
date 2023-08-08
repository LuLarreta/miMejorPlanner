<template>
    
    <v-btn transition="fade" @click="$emit('eliminar')" class="shrink mr-2 botonEliminar" contain>
        <v-icon append-icon size="24">mdi-close-octagon-outline</v-icon>
        {{ label }}
    </v-btn>
</template>
  
<script>
export default {
    props: {
        label: {
            type: String,
            required: true,
        },
        btnClass: {
            type: String,
            default: "btn btn-danger",
        },
    },
    data() {
    return {
      showButton: true,
    };
  },
  computed: {
    buttonText() {
      return this.showButton ? 'Mostrar' : 'Ocultar';
    },
  },
  methods: {
    showMessage() {
      alert('¡El botón fue presionado!');
    },
  },
};
</script>

<style>
button.botonEliminar.v-btn.v-btn--is-elevated.v-btn--has-bg.theme--light.v-size--default {
    background-color: red;
    flex-direction: row-reverse;
    color: #ffffff;
    width: 100%;
    transition: elevation 0.2s;
}

span.v-btn__content {
    flex-direction: row-reverse;
}
/* Pseudo-clase hover */
button.botonEliminar.v-btn.v-btn--is-elevated.v-btn--has-bg.theme--light.v-size--default:hover {
  opacity: 0.7; /* Cambia la opacidad cuando el mouse está encima */
  transition: elevation 8s;
  
}

span.v-btn__content {
  flex-direction: row-reverse;
}

/* Asegúrate de mantener las clases para la transición fade */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to /* .fade-leave-active in <2.1.8 */ {
  opacity: 0;
}
</style>
  