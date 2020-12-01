{include file="header.tpl"}
{foreach from=$peliculasConGenero_s item=peliculaConGenero}
    <div class="pelicula">
        <img src="{$peliculaConGenero->imagen}" alt="imgen de la pelicula" class="PeliculasDelUsuario" >
        <ul>
            <li>Nombre:<a href="visualizarItem/{$peliculaConGenero->titulo}"> {$peliculaConGenero->titulo} </a> </li>
            <li>Genero: {$peliculaConGenero->nombre}</li>
        </ul>
    </div>
{/foreach}            
 <nav>
    <ul  class="navigation" > 
        <li><a href="home/1">Inicio</a></li> 
        {for $i = 2 to $totalDePaginas_s - 1}
            <li>
                <a href="home/{$i}" >{$i}</a>
            </li>
        {/for}
        {if $totalDePaginas_s > 1} 
            <li><a href="home/{$totalDePaginas_s}" >Final</a></li>  
        {/if} 
    </ul>
</nav>
{include file="footer.tpl"}
