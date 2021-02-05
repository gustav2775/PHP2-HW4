<?php

namespace app\model;

class Basket extends ModelDb
{
    protected $id;
    protected $id_session;
    protected $id_user;
    protected $id_product;
    protected $quantity;
    protected $name_product;
    protected $price;
    protected $imgProd;
    protected $views;
    protected $description;

    protected $prop = [
        'id' => false,
        'id_product' => false,
        'quantity' => false,
    ];

    public function basketCreate()
    {
        foreach ($this as $key) {
            $row[] = "$key => false";
        }
        return $this;
    }

    public static function getTableName()
    {
        return 'basket';
    }

    public static function getSql()
    {
        return  "SELECT * FROM basket, catalog WHERE basket.id_product = catalog.id AND basket.id_session = :id_session";
    }
}
