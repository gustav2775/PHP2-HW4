<?php


namespace app\model;

use app\interfaces\IModel;

abstract class Model implements IModel
{
    function __set($name, $value)
    {
        if (array_key_exists($name, $this->prop)) {
            $this->prop[$name] = true;
        }
        $this->$name = $value;
    }

    function __get($name)
    {
        return $this->$name;
    }

    public function __isset($name)
    {
        var_dump($this->$name);
        return true;
    }
}
