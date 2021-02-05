<?php

namespace app\controllers;

use app\model\Gallery;

class GalleryController extends Controller
{
    public function actionGallery()
    {
        $gallery = Gallery::getAll();

        echo $this->renderLayouts("gallery", [
            "gallery" => $gallery
        ]);
    }
    
    public function actionGalleryItem()
    {
        $id = $_GET["id"];

        $gallery = Gallery::getOne($id);

        echo $this->renderLayouts("galleryItem", [
            "itemGallery" => $gallery,
        ]);
    }
}
