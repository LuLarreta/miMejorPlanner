<template>
  <v-app >
    <v-app-bar app class="navegacion" dark>


      <div class="d-flex align-center">
        <v-img alt="Logo de Panner" class="shrink mr-2" contain src="../src/assets/logo.png" transition="scale-transition"
          width="40" />
        <v-toolbar-title>Mi Mejor Planner</v-toolbar-title>
      </div>

      <v-spacer></v-spacer>
      <v-toolbar-items class="d-none d-lg-flex">
        <v-btn text to="/">Home</v-btn>
        <v-btn text to="/VistaSemanal">Tareas Semanales</v-btn>
        <v-btn text to="/VistaMensual">Tareas Mensuales</v-btn>
        <v-btn text to="/CargarTareasSemanales">Cargar Tareas Semanales</v-btn>
        <v-btn text to="/CargarTareasMensuales">Cargar Tareas Mensuales</v-btn>
      </v-toolbar-items>

      <!-- Icono hamburguesa para tamaños más pequeños (md y menores) -->
      <v-app-bar-nav-icon class="d-lg-none" @click="drawer = !drawer"></v-app-bar-nav-icon>
    </v-app-bar>

    <!-- Contenido del menú desplegable -->
    <v-navigation-drawer app v-model="drawer" width="250" class="d-lg-none">
      <v-list>
        <v-list-item v-for="item in menuItems" :key="item.title" @click="navigate(item.route)">
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-main class="app">
      <div class="container my-4 frase">
        <p>{{ frase }}❤️</p>
        <p>{{ autor }}</p>
      </div>
      <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'App',
  data() {
    return {
      drawer: false,
      menuItems: [
        { title: 'Home', route: '/' },
        { title: 'Tareas Semanales', route: '/VistaSemanal' },
        { title: 'Tareas Mensuales', route: '/VistaMensual' },
        { title: 'Cargar Tareas Semanales', route: '/CargarTareasSemanales' },
        { title: 'Cargar Tareas Mensuales', route: '/CargarTareasMensuales' },
      ],
      frase: '',
      autor: '',
    };
  },
  methods: {
    navigate(route) {
      this.drawer = false; // Cierra el menú desplegable al hacer clic en un ítem
      this.$router.push(route); // Navega a la ruta correspondiente
    },
    obtenerFrases() {
      fetch('https://type.fit/api/quotes')
        .then(response => response.json())
        .then(data => {
          // El resultado de la API estará en el objeto "data", que contendrá una lista de frases
          const randomQuote = data[Math.floor(Math.random() * data.length)];
          // Asignamos la frase y el autor a los datos del componente para mostrarlos en la plantilla
          this.frase = randomQuote.text;
          this.autor = randomQuote.author;
        })
        .catch(error => console.error('Error al obtener las frases:', error));
    },
  },
  mounted() {
    // Llamamos a la función obtenerFrases cuando el componente se monta
    this.obtenerFrases();
  },
};

</script>
<style>
.v-application {
  font-family: cursive;
  background-image: url(assets/logo.png);
}

.navegacion {
  background-color: #5D5D63 !important;
}

.app {
  background-image: url(assets/fondo.png);
  background-size: cover;
    background-attachment: fixed;
    background-position: center;
}

.frase {
  text-align: center;
    text-shadow: 1px 2px 5px #ffffff
}

</style>
