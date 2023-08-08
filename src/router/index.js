import Vue from "vue";
import VueRouter from "vue-router";
import VistaInicio from "@/views/VistaInicio.vue";
import VistaSemanal from "@/views/VistaSemanal.vue";
import VistaMensual from "@/views/VistaMensual.vue";
import CargarTareasSemanales from "@/views/CargarTareas.vue";
import CargarTareasMensuales from "@/views/CargarTareasMensuales.vue"

Vue.use(VueRouter);

const routes = [
  { path: "/", component: VistaInicio },
  {
    path: "/VistaSemanal",
    name: "Semanal",
    component: VistaSemanal,
  },
  {
    path: "/VistaMensual",
    name: "VistaMensual",
    component: VistaMensual,
  },
  { path: "/CargarTareasSemanales", name: "CargarTareas", component: CargarTareasSemanales },
  { path: "/CargarTareasMensuales", name: "CargarTareasMensuales", component: CargarTareasMensuales },
];

const router = new VueRouter({
  routes,
  mode: "history",
});

export default router;
