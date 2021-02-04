<?php

namespace app\controllers;

use app\model\Catalog;
use app\model\Feedback;

class CatalogController extends Controller
{
    public function actionCatalog()
    {
        $catalog = Catalog::getAll();

        echo $this->renderLayouts("catalog", [
            "catalog" => $catalog
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
        $catalog = new Catalog;
        if (isset($_GET['id'])) {
            $catalog = Catalog::getOne($_GET['id']);

            foreach ($_POST as $key => $value) {
                $catalog->$key->$_POST[$value];
            }

            $catalog->update();
            $this->actionProduct();
            
        } else {
            $catalog = new Catalog($_POST['name'], $_POST['price'], $_POST['description']);
            $catalog->insert();
            $this->actionCatalog();
        }
    }

    public function actionDelete()
    {
        $catalog = new Catalog;
        $catalog = Catalog::getOne($_GET['id'])-> delete();
        $catalog ;

        $this->actionCatalog();
    }
}
