<template>
    <div class="container mesCont">
        <h3>Un Año Perfecto</h3>
        <div class="container-fluid">
            <div class="row justify-content-between rowMensual">
                <div v-for="mes in mesSelect" :key="mes"
                    class="col-lg-3 col-md-6 col-12 bordeblanco p-0 d-flex flex-column">
                    <h4 class="titulosMeses">{{ mayusculaMes(mes) }}</h4>
                    <!--cortar aca-->
                    <v-list>
                        <TareaCheckboxMensual v-for="tarea in tareasPorMes(mes)" :key="tarea.id" :tarea="tarea">
                        </TareaCheckboxMensual>
                    </v-list>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { obtenerTareas } from '@/utils/tareasUtils';
import TareaCheckboxMensual from './TareaCheckboxMensual.vue';

export default {
    name: 'TareasMensuales',
    components: {
        TareaCheckboxMensual,
    },
    data() {
        return {
            tareas: [],
        };
    },
    methods: {
        tareasPorMes(mes) {
            const tareasFiltradas = this.tareas.filter((tarea) => tarea.mes === mes);
            return tareasFiltradas.sort((a, b) => parseInt(a.dia) - parseInt(b.dia));
        },
        onTareaAgregada(nuevaTarea) {
            this.tareas.push(nuevaTarea);
        },
        mayusculaMes(texto) {
            return texto.charAt(0).toUpperCase() + texto.slice(1);
        },
    },
    computed: {
        mesSelect() {
            //array de mess
            return ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
        },
    },
    mounted() {
        //obtener tareas del localStorage
        this.tareas = obtenerTareas();
        // Asegurarse de que el modo de edición esté desactivado al cargar el componente
        this.tareas.forEach((t) => {
            t.editando = false;
        });
    },
}

</script>

<style>
.mesCont {
    background: #f4dce2;
    padding: 10px;
    border-radius: 6px;
}

.rowMensual {
    background-color: #ffffff;



    @media (min-width: 768px) {

        min-height: 90vh;

    }


}

.bordeblanco {
    border: #f4dce2 solid 3px;
    min-height: 30vh;
}


.titulosMeses {
    background: #f4dce2;
    text-align: start;
    display: inline;
    margin: 0 40% 0 0;
    padding: 0 3%;
}
</style>