<?php
namespace app\model;

class Orders extends ModelDb{
    protected $id_order;
    protected $id_user;
    protected $user_name;
    protected $number;
    protected $email;
    protected $city;

    public static function getSql() {}

    public function __construct($login = null, $pass = null)
    {
        $this->login = $login;
        $this->pass = $pass;
    }

    public static function getTableName() {
       return 'orders';
    }
} 