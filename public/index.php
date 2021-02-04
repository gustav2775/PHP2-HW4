<?php

session_start();

$_SESSION['id'] = 1;

include "../config/config.php";

include "../engine/Autoload.php";
use app\engine\Autoload;

spl_autoload_register([new Autoload(), 'loadClass']);

$controllerName = $_GET["c"] ?: "index";
$controllerClass = "app\\controllers\\" . ucfirst($controllerName) . "Controller";

$actionName = $_GET["a"] ?: $controllerName;
$actionMethod = "action" . ucfirst($actionName);

if (class_exists($controllerClass)) {
    $controllerClass = new $controllerClass();
    if (method_exists($controllerClass, $actionMethod)) {
        $controllerClass->$actionMethod();
    } else {
        die("Такого метода не существует");
    }
} else {
    die("Такой страницы не существует");
}