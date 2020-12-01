{literal}
<div id="vue-comentarios">

    <h2>Comentarios</h2>
    <div
        v-for="comentario in comentarios"
        class="pelicula"
        :data-id-comentarios="comentario.id"> 
        <ul>
            <li>Usuario: {{ comentario.userName }}</li>
            <li>Comentario: {{ comentario.comentario}}</li>
            <li>Puntaje: {{comentario.puntaje}}</li>
        </ul>
         <button v-if="superUser == 1" v-on:click="deleteComentario(comentario.id)" class="botonVisible"> Borrar </button>
    </div>

</div>
{/literal}