<?php

require_once "./View/peliculasYGeneroView.php";
require_once "./Model/peliculasModel.php";
require_once "./Model/generoModel.php";

class peliculasYGeneroController{

    private $view;
    private $model;
    private $modelGenero;

    function __construct(){
        $this->view = new peliculasYGeneroView();
        $this->model = new peliculasModel();
        $this->modelGenero = new generoModel();
    }

     function Home($params){
        $itemFinal = 5;
        if($params != null){
            $itemInicio = ($params[':PAGINA'] - 1) * $itemFinal;
        }else{
            $itemInicio = 0;
        }
        $todasLasPeliculas = $this->model->GetPeliculas();
        $totalDePaginas = ceil(count($todasLasPeliculas) / $itemFinal);
        $peliculas = $this->model->GetPeliculasParaPaginacion($itemInicio, $itemFinal);
        $this->view->ShowHome($peliculas, $totalDePaginas);
    }

    function Generos(){
        $Generos = $this->modelGenero->GetGeneros();
        $this->view->ShowGeneros($Generos);
    }

    function VisualizarItem($params = null){
        $pelicula_titulo = $params[':TITULO'];
        $pelicula_completa = $this->model->GetPelicula($pelicula_titulo);
        if($pelicula_completa == true){
            $this->view->ShowItem($pelicula_completa);
        }else{
            $this->view->ShowError404();
        }

    }

    function VisualizarGenero($params = null){
        $genero_nombre = $params[':GENERO'];
        $Genero = $this->modelGenero->GetGeneroPorNombre($genero_nombre);
        if(!empty($Genero)){
            $peliculasPorGenero = $this->model->GetPeliculasPorGenero($genero_nombre);
            $this->view->ShowPeliculasPorGenero($peliculasPorGenero, $genero_nombre);
        }else{
            $this->view->ShowError404();
        }
    }

    function Administrar(){
        session_start();
        if ( isset($_SESSION['email']) && ( $_SESSION['superuser'] == 1 ) ){
            $peliculas = $this->model->GetPeliculasYGenero();
            $generos = $this->modelGenero->GetGeneros();
            $this->view->ShowAdministrar($peliculas, $generos);
        }else{
            $this->view->ReLocalizar("login");
        }
    }

    function AdminPeliculas(){
        session_start();
        if ( isset($_SESSION['email']) && ( $_SESSION['superuser'] == 1 ) ){
            $peliculas = $this->model->GetPeliculasYGenero();
            $generos = $this->modelGenero->GetGeneros();
            $this->view->AdminPeliculas($peliculas, $generos);
        }else{
            $this->view->ReLocalizar("login");
        }
    }

    function AdminGeneros(){
        session_start();
        if ( isset($_SESSION['email']) && ( $_SESSION['superuser'] == 1 ) ){
            $generos = $this->modelGenero->GetGeneros();
            $this->view->AdminGeneros($generos);
        }else{
            $this->view->ReLocalizar("login");
        }
    }

    function BorrarPelicula($params = null){
        session_start();
        if ( isset($_SESSION['email']) && ( $_SESSION['superuser'] == 1 ) ){// para que no pueda borrar solo pasando parametros por la barra
            $pelicula_id = $params[':ID'];//Este id pasa magico desde el router como declaramos la ruta
            $this->model->BorrarPelicula($pelicula_id);//pasamos el id para que lo borre el model
            $this->view->ReLocalizar("adminPeliculas");
        }else{
            $this->view->ReLocalizar("login");
        }

        
    }

    function SubirPelicula(){//no usamos params porque params es para get
        if(isset($_POST) && !is_null($_POST)){
            session_start();
            if ( isset($_SESSION['email']) && ( $_SESSION['superuser'] == 1 ) 
            && ($_FILES['imagen']['type'] == "image/jpg" || $_FILES['imagen']['type'] == "image/jpeg" )){
                $this->model->insertarPelicula($_POST['titulo'], $_POST['sinopsis'], $_POST['duracion'], $_POST['puntuacion'], $_POST['precio'], $_FILES['imagen']['tmp_name']);
                $this->view->ReLocalizar("adminPeliculas");
            }else{
                $this->view->ReLocalizar("login");
            }
        }
    }

    function EditarPelicula($params = null){
        session_start();
        if ( isset($_SESSION['email']) && ( $_SESSION['superuser'] == 1 ) ){
            $id_pelicula = $params[':ID'];
            $peliculas = $this->model->GetPeliculasYGenero();//pido toda la tabla de peliculas junto con la tambla de genero, viene todo en un arreglo
            $generos = $this->modelGenero->GetGeneros();
            $this->view->ShowEditPelicula($peliculas, $id_pelicula, $generos);
        }else{
            $this->view->ReLocalizar("login");
        }
    }
    
    function GuardarPelicula($params = null){
        if(isset($_POST) && !is_null($_POST)){
            if($_FILES['imagen']['type'] != null){
                $this->model->EditarPeliculaConImg( $_POST['titulo'] , $_POST['sinopsis'] , $_POST['duracion'] , $_POST['puntuacion'] , $_POST['precio'], $_FILES['imagen']['tmp_name'], $params[':ID']);
            }else{
                echo "entre al else";
                $this->model->EditarPelicula( $_POST['titulo'] , $_POST['sinopsis'] , $_POST['duracion'] , $_POST['puntuacion'] , $_POST['precio'], $params[':ID']);
            }
            $this->view->ReLocalizar("adminPeliculas");
        }
    }

    function BorrarGenero($params = null){
        $this->modelGenero->BorrarGenero($params[':ID']);
        $this->view->ReLocalizar("adminGeneros");
    }

    function EditarGenero($params = null){
        session_start();
        if ( isset($_SESSION['email']) && ( $_SESSION['superuser'] == 1 ) ){
            $peliculas = $this->model->GetPeliculasYGenero();
            $generos = $this->modelGenero->GetGeneros();
            $this->view->ShowEditGenero($peliculas, $generos, $params[':ID']);
        }else{
            $this->view->ReLocalizar("login");
        }
    }

    function GuardarGenero($params = null){
        if(isset($_POST) && !is_null($_POST)){
            $this->modelGenero->GuardarGenero($_POST['nombre'], $params[':ID']);
            $this->view->ReLocalizar("adminGeneros");
        }
    }

    function SubirGenero(){
        if(isset($_POST) && !is_null($_POST)){
            $this->modelGenero->SubirGenero($_POST['nombre']);
            $this->view->ReLocalizar("adminGeneros");
        }
    }

}