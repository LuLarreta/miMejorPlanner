<template>
    <div>
        <v-list-item class="p-0">
            <v-checkbox v-model="tareaLocal.marcada" :color="tarea.marcada ? '' : 'success'"></v-checkbox>
            <v-list-item-content>
                <transition name="tarea-transition">
                    <div v-if="!tareaLocal.marcada" class="row align-items-center px-2">
                        <div class="col-3 ">
                            <img v-if="tarea.icono === 'Auto'" src="../assets/iconos/auto.png" alt="Icono de Auto"
                                class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Carrito'" src="../assets/iconos/carrito.png"
                                alt="Icono de Carrito" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Celular'" src="../assets/iconos/celular.png"
                                alt="Icono de Celular" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Cocina'" src="../assets/iconos/cocina.png"
                                alt="Icono de Cocina" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Corazón'" src="../assets/iconos/corazon.png"
                                alt="Icono de Corazon" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Flores'" src="../assets/iconos/flores.png"
                                alt="Icono de flores" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Medico'" src="../assets/iconos/medico.png"
                                alt="Icono de Medico" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Perro'" src="../assets/iconos/perro.png" alt="Icono de Perro"
                                class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Pesas'" src="../assets/iconos/pesas.png" alt="Icono de Pesas"
                                class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Tarjetas'" src="../assets/iconos/tarjetas.png"
                                alt="Icono de Tarjetas" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Trabajo'" src="../assets/iconos/trabajo.png"
                                alt="Icono de Trabajo" class="img-fluid" />
                            <p v-else> ?</p>
                        </div>
                        <div class="col-9">{{ tareaLocal.descripcion }}</div>
                    </div>
                    <div v-else class="tarea-tachada row align-items-center px-2 ">
                        <div class="col-3">
                            <img v-if="tarea.icono === 'Auto'" src="../assets/iconos/auto.png" alt="Icono de Auto"
                                class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Carrito'" src="../assets/iconos/carrito.png"
                                alt="Icono de Carrito" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Celular'" src="../assets/iconos/celular.png"
                                alt="Icono de Celular" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Cocina'" src="../assets/iconos/cocina.png"
                                alt="Icono de Cocina" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Corazón'" src="../assets/iconos/corazon.png"
                                alt="Icono de Corazon" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Flores'" src="../assets/iconos/flores.png"
                                alt="Icono de flores" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Medico'" src="../assets/iconos/medico.png"
                                alt="Icono de Medico" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Perro'" src="../assets/iconos/perro.png" alt="Icono de Perro"
                                class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Pesas'" src="../assets/iconos/pesas.png" alt="Icono de Pesas"
                                class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Tarjetas'" src="../assets/iconos/tarjetas.png"
                                alt="Icono de Tarjetas" class="img-fluid" />
                            <img v-else-if="tarea.icono === 'Trabajo'" src="../assets/iconos/trabajo.png"
                                alt="Icono de Trabajo" class="img-fluid" />
                            <p v-else> ?</p>
                        </div>
                        <div class="col-9">{{ tareaLocal.descripcion }}
                        </div>
                    </div>
                </transition>
            </v-list-item-content>
        </v-list-item>

    </div>
</template>

<script>

export default {
    props: {
        tarea: {
            type: Object,
            required: true,
        },
    },
    data() {
        return {
            tareaLocal: { ...this.tarea },
        };
    },
    methods: {

    },
}
</script>

<style>
.tarea-checkbox {
    margin-right: 10px;
}

.tarea-tachada {
    text-decoration: line-through;
    opacity: 0.3;
}

.tarea-transition-enter-active,
.tarea-transition-leave-active {
    transition: all 0.3s;
}

.tarea-transition-enter,
.tarea-transition-leave-to {
    opacity: 0;
    transform: translateY(-10px);
}
.v-messages{
    display: none;
}
</style>