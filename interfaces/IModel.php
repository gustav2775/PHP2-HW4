<?php

namespace app\interfaces;

interface IModel
{
    public static function getOne($id);
    public static function getAll($page);
    public static function getTableName();

}