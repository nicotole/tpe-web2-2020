<?php

require_once "./libs/smarty/Smarty.class.php";

class peliculasYGeneroView{

    private $smarty;
    
    
    function __construct(){
       $this->smarty = new Smarty();
    }

    function ShowHome($peliculasConGenero, $totalDePaginas){

        session_start();
        if (isset($_SESSION['email'])){
            $this->setUserBasicsToSmarty();
        }
        $this->smarty->assign('peliculasConGenero_s', $peliculasConGenero);
        $this->smarty->assign('totalDePaginas_s', $totalDePaginas);
        $this->smarty->display('templates/home.tpl'); // muestro el template 
    }
    function ShowError404(){
        $this->smarty->display('templates/error404.tpl'); 
    }

    function ShowHomeLocation(){
        header(BASE_URL);
    }

    function ShowGeneros($Generos){
        $this->smarty->assign('generos_s', $Generos);
        session_start();
        if (isset($_SESSION['email'])){
            $this->setUserBasicsToSmarty();
        }
        $this->smarty->display('templates/generos.tpl');
    }

    function ShowItem($item){
        session_start();
        if (isset($_SESSION['email'])){//si esta set el email es porque hay sesion 
            $this->setUserBasicsToSmarty();
        }
        $this->smarty->assign('item_s',$item);
        $this->smarty->display('templates/item.tpl');
    }

    function ShowPeliculasPorGenero($peliculasPorGenero,$genero_nombre){
        session_start();
        if (isset($_SESSION['email'])){
            $this->setUserBasicsToSmarty();
        }
        $this->smarty->assign('peliculasPorGenero_s',$peliculasPorGenero);
        $this->smarty->assign('genero_s',$genero_nombre);
        $this->smarty->display('templates/peliculasPorGenero.tpl');
    }

    function ShowAdministrar($peliculas, $generos){//peliculas es un arreglo de obj pelicula
        if (isset($_SESSION['email'])){
            $this->setUserBasicsToSmarty();
            $this->smarty->display('templates/admin.tpl');
        }else{
            $this->ReLocalizar("login");
        }
    }
  
    function ShowEditPelicula($peliculas, $id_pelicula,$generos){
        $this->smarty->assign('peliculas_s', $peliculas);
        $this->smarty->assign('generos_s', $generos);
        $this->smarty->assign('id_pelicula_s', $id_pelicula);
        $this->setUserBasicsToSmarty();
        $this->smarty->display('templates/adminPeliculas.tpl');
    }

    function ShowEditGenero($peliculas, $generos, $id){
        $this->smarty->assign('peliculas_s', $peliculas);
        $this->smarty->assign('generos_s', $generos);
        $this->smarty->assign('id_genero_s', $id);
        $this->setUserBasicsToSmarty();
        $this->smarty->display('templates/adminGeneros.tpl');
    }

    function AdminPeliculas($peliculasConGenero, $generos){
        $this->smarty->assign('peliculas_s',$peliculasConGenero);
        $this->smarty->assign('generos_s', $generos);
        $this->setUserBasicsToSmarty();
        $this->smarty->display('templates/adminPeliculas.tpl');
    }

    function AdminGeneros($generos){
        if (isset($_SESSION['email'])){
            $this->setUserBasicsToSmarty();
            $this->smarty->assign('generos_s',$generos);
            $this->smarty->display('templates/adminGeneros.tpl');
        }else{
            $this->ReLocalizar("login");
        }
    }

    private function setUserBasicsToSmarty(){
        $this->smarty->assign('UserEmail_s', $_SESSION['email']);
        $this->smarty->assign('UserId_s', $_SESSION['id']);
        $this->smarty->assign('UserName_s', $_SESSION['userName']);
        $this->smarty->assign('superUser_s', $_SESSION['superuser']);
    }

    function ReLocalizar($direcion){
        header("Location:".BASE_URL."/$direcion");
    }
    
}