<template>
    <div class="container">

        <div class="card">
            <div class="card-header">
                Agregar nuevo pastel
            </div>

            <div class="card-body">
                <form v-on:submit.prevent="agregarRegistro">
                    <div class="form-group">
                      <label for="nombre">Nombre:</label>
                      <input type="text"
                        class="form-control" required name="nombre" v-model="pasteles.nombrepastel" id="nombre" aria-describedby="helpId" placeholder="Nombre">
                      <small id="helpId" class="form-text text-muted">Escribe el nombre del pastel</small>
                    </div>

                    <div class="form-group">
                      <label for="ingrediente">Ingredientes:</label>
                      <input type="text"
                        class="form-control" required name="ingrediente" v-model="ingredientes.ingrediente" id="ingrediente" aria-describedby="helpId" placeholder="Ingrediente">
                      <small id="helpId" class="form-text text-muted">Escriba un ingrediente</small> <button type="button" class="btn btn-success">Agregar otro ingrediente</button>

                    </div>

                    <div class="btn-group" role="group" aria-label="">
                        <button type="submit" class="btn btn-success">Agregar</button>

                        <router-link :to="{name:'ListarPastel'}" class="btn btn-warning">Cancelar</router-link>

                    </div>

                </form>

            </div>

        </div>
        
    </div>
</template>

<script>
export default {

    data(){
        return{
            pasteles:{},
            ingredientes:{},
        }
    },
    methods:{
        agregarRegistro(){

            console.log(this.pasteles);

        var datosEnviar={nombrepastel:this.pasteles.nombrepastel}

        fetch('http://localhost/proyectopasteles/?insertar=1',{
            method:"POST",
            body:JSON.stringify(datosEnviar)
        })

        .then(respuesta=>respuesta.json())
        .then((datosRespuesta=>{
                console.log(datosRespuesta);
                window.location.href='listarpastel'
        }))

        }

    },
}
</script>