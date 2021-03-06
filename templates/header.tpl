
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href={BASE_URL}/>
        <link rel="stylesheet" href="estilos/style.css">
        <!-- development version, includes helpful console warnings -->
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <link rel="shortcut icon" href="imagenes/logo/1.2.png" type="image/x-icon">
        <title>CINEMA</title>
    </head>
    <body>
        <!-- Inicio header y barra -->
        <header>
            <img class="imgMenu"src="imagenes/menu.png" alt="">
            <img src="imagenes/logo/1.2.png" alt="logo" class="logo">
            <h1>CINEMA</h1>
            {if isset($UserName_s)}
                <h3>Bienvenido: {$UserName_s}</h3>
            {/if}

        </header>
        
        <nav>
            <ul class="navigation">
                <li> <a href="home"> Inicio </a> </li>
                <li> <a href="generos"> Generos </a> </li>
                {if isset($superUser_s) && $superUser_s == 1}
                    <li> <a href="administrar"> Administrar </a> </li>
                {/if}
                 {if isset($UserEmail_s)}
                    <li> <a href="logout"> Logout </a> </li>
                {else}   
                    <li> <a href="registrarse"> Registrarse </a> </li>
                    <li> <a href="login"> Login </a> </li>
                {/if}
            </ul>
        </nav>
        