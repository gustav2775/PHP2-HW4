<?php

namespace app\controllers;

use app\model\Catalog;
use app\model\Feedback;

class CatalogController extends Controller
{
    public function actionCatalog()
    {
        $page = $_GET['page'] ?: 10 ;

        $catalog = Catalog::getAllLimit($page);

        echo $this->renderLayouts("catalog", [
            "catalog" => $catalog,
            'page' =>$page
        ]);
    }

    public function actionProduct()
    {
        $id = $_GET["id"];
        $catalog = Catalog::getOne($id);
        $feedback = Feedback::getAlltoId($id);

        echo $this->renderLayouts("product", [
            "item" => $catalog,
            "feedback" => $feedback
        ]);
    }

    public function actionSave()
    {
        $id = $_GET['id'];
        $catalog = new Catalog;

        if (isset($id)) {
            $catalog = Catalog::getOne($id);
            foreach ($_POST as $key => $value) {
                $catalog->$key->$_POST[$value];
            }
            $catalog->update();
        } else {
            $catalog = new Catalog($_POST['name'], $_POST['price'], $_POST['description']);
            $catalog->insert();
        }
        header("location:/?c=catalog&a=product&id=$id");
    }

    public function actionDelete()
    {      
        $catalog =Catalog::getOne($_GET['id']);
        $catalog -> delete();
 
        header("location:/?c=catalog");
    }
}
