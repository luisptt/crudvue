<template>
    <div class="container">
        <router-link to="/crearpastel" class="btn btn-success">AgregarNuevo  Pastel</router-link>
        <br/><br/>
    
        <div class="card">
            <div class="card-header">
            </div>
            <div class="card-body">
                    <table class="table">
                        <thead>

                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Acciones</th>
                            </tr>

                        </thead>

                        <tbody>

                            <tr v-for="pastel in pasteles" :key="pastel.idpastel">
                                <td>{{ pastel.IDpastel}}</td>
                                <td>{{ pastel.NombrePastel }}</td>

                                <div class="btn-group" role="group" aria-label="">

                                    <div class="btn-group" role="group" aria-label="">
                                        <router-link :to="{name:'EditarPastel',params:{id:pastel.IDpastel}}" class="btn btn-info">Editar</router-link>

                                        <button type="button" v-on:click="borrarPasteles(pastel.IDpastel)" class="btn btn-danger">Borrar</button>
                                        
                                    </div>

                                </div>

                                
                            </tr>

                        </tbody>
                    </table>

            </div>
            <div class="card-footer text-muted">
                Footer
            </div>
        </div>



        <div >
            <div></div>
            <div></div>

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

        this.consultarPasteles();

    },
    methods:{
        //http://localhost/proyectopasteles/
        consultarPasteles(){
            fetch('http://localhost/proyectopasteles/')
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta)=>{
                
                console.log(datosRespuesta)
                this.pasteles=[]
                if(typeof datosRespuesta[0].success==='undefined')
                {
                    this.pasteles=datosRespuesta;
                }
            })
            .catch(console.log);
        },

        borrarPasteles(idpastel){

            console.log(idpastel);

            fetch('http://localhost/proyectopasteles/?borrar='+idpastel)
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta)=>{
                
                console.log(datosRespuesta)
                window.location.href="listarpastel"
                
            })
            .catch(console.log);

        }

    },


}
</script>