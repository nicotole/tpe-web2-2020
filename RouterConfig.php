<?php
    require_once 'Controller/peliculasYGeneroController.php';
    require_once 'RouterClass.php';
    require_once 'Controller/userController.php';
    
    // CONSTANTES PARA RUTEO
    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]));

    $r = new Router();

    // rutas
    $r->addRoute("home/:PAGINA", "GET", "peliculasYGeneroController", "Home");
    $r->addRoute("generos", "GET", "peliculasYGeneroController", "Generos");//URL; METODO; clase; funcion a usar de la clase
    $r->addRoute("visualizarItem/:TITULO","GET","peliculasYGeneroController","VisualizarItem");
    $r->addRoute("visualizarGenero/:GENERO","GET","peliculasYGeneroController","VisualizarGenero");
    $r->addRoute("login", "GET", "userController", "VisualizarLogin");
    $r->addRoute("verifyUser", "POST", "userController", "VerifyUser");
    $r->addRoute("logout","GET","userController","LogOut");
    $r->addRoute("administrar", "GET", "peliculasYGeneroController","Administrar");
    $r->addRoute("borrar/:ID","GET","peliculasYGeneroController","BorrarPelicula");
    $r->addRoute("subirPelicula","POST","peliculasYGeneroController","SubirPelicula");
    $r->addRoute("editar/:ID","GET","peliculasYGeneroController","EditarPelicula");
    $r->addRoute("guardarPelicula/:ID","POST","peliculasYGeneroController","GuardarPelicula");
    $r->addRoute("borrarGenero/:ID","GET","peliculasYGeneroController","BorrarGenero");
    $r->addRoute("editarGenero/:ID","GET","peliculasYGeneroController","EditarGenero");
    $r->addRoute("guardarGenero/:ID","POST","peliculasYGeneroController","GuardarGenero");
    $r->addRoute("subirGenero","POST","peliculasYGeneroController","SubirGenero");
    $r->addRoute("adminPeliculas", "GET","peliculasYGeneroController", "AdminPeliculas");
    $r->addRoute("adminGeneros","GET","peliculasYGeneroController","AdminGeneros");
    $r->addRoute("registrarse","GET","userController","Registrarse");
    $r->addRoute("registrarUsuario","POST","userController","RegistrarUsuario");    
    $r->addRoute("adminUsuarios","GET","userController","AdminUsuarios");
    $r->addRoute("borrarUsuario/:ID","GET","userController","BorrarUsuario");   
    $r->addRoute("administrador/:ID","GET","userController","SetSuperUsuario"); 
    $r->addRoute("no-administrador/:ID","GET","userController","SetNoSuperUsuario");


    // //Ruta por defecto.
    $r->setDefaultRoute("peliculasYGeneroController", "Home");

    // //run
    $r->route($_GET['action'], $_SERVER['REQUEST_METHOD']);  
?>