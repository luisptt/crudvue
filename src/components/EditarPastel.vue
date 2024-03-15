<template>
    <div class="container">

<div class="card">
    <div class="card-header">
        Editar pastel
    </div>

    <div class="card-body">

        <form v-on:submit.prevent="actualizarRegistro">

            <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text"
                class="form-control" required name="nombre" v-model="pasteles.nombrepastel" idpastel="nombre" aria-describedby="helpId" placeholder="Nombre">
            <small id="helpId" class="form-text text-muted">Escribe el nombre del pastel</small>
            </div>

           
            <div class="btn-group" role="group" aria-label="">
                <button type="submit" class="btn btn-warning">Modificar</button>

                <router-link :to="{name:'ListarPastel'}" class="btn btn-danger">Cancelar</router-link>

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
    
            pasteles:{}

        }
        
    },

    created:function(){
        this.obtenerInformacionID();

    },
    methods:{

        obtenerInformacionID(){

              
            fetch('http://localhost/proyectopasteles/?consultar='+this.$route.params.idpastel)
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta)=>{
                
                console.log(datosRespuesta)
                this.pasteles=datosRespuesta[0];
                
            })
            .catch(console.log)
        
        },
        
        actualizarRegistro(){

            var datosEnviar={id:this.$route.params.idpastel,nombrepastel:this.pasteles.nombrepastel}

        fetch('http://localhost/proyectopasteles/?actualizar='+this.$route.params.idpastel,{
            method:"POST",
            body:JSON.stringify(datosEnviar)
        })

        .then(respuesta=>respuesta.json())
        .then((datosRespuesta=>{
                console.log(datosRespuesta);
                window.location.href='../listarpastel'
        }))


        }
    }
}
</script>