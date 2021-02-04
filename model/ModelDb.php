<?php


namespace app\model;

use app\engine\Db;

abstract class ModelDb extends Model
{

    abstract public static function getTableName();
    abstract public static function getSql();

    public function basketCreate()
    {
        foreach ($this as $key) {
            $row[] = "$key => false";
        }
        return $this->row;
    }

    public static function getOne($id)
    {
        $tableName = static::getTableName();
        $sql = "SELECT * FROM {$tableName} WHERE id = :id";
        return Db::getInstance()->queryOne($sql, ['id' => $id]);
    }


    public static function getAlltoId($id)
    {
        if (!empty(static::getSql())) {
            $sql = static::getSql();
            $params[':id_session'] = $id;
        } else {
            $tableName = static::getTableName();
            $sql = "SELECT * FROM {$tableName} WHERE id = :id";
            $params[':id'] = $id;
        }

        return Db::getInstance()->queryAll($sql, $params);
    }

    public static function getAll()
    {
        $tableName = static::getTableName();
        $sql = "SELECT * FROM {$tableName}";
        return Db::getInstance()->queryAll($sql);
    }

    public function insert()
    {
        $tableName = static::getTableName();

        foreach ($this->prop as $key => $value) {
            if ($value) {
                $columns[] = $key;
                $values[] = ":" . $key;
                $params[":$key"] =  $this->$key;
            }
        }

        $values = implode(',', $values);
        $columns = implode(',', $columns);

        $sql = "INSERT INTO {$tableName} ({$columns}) VALUES ({$values})";

        Db::getInstance()->execute($sql, $params);

        $this->id = Db::getInstance()->getLastId();
        return $this;
    }

    public function update()
    {
        $tableName = static::getTableName();

        foreach ($this->prop as $key => $value) {
            if ($value) {
                if ($key != 'id') {
                    $columns[] = $key . "  = :" . $key;
                }
                $params[":$key"] =  $this->$key;
            }
        }
        $columns = implode(',', $columns);
        $sql = "UPDATE `$tableName` SET $columns WHERE `id`=:id";
        Db::getInstance()->execute($sql, $params);
        return $this;
    }

    public function delete()
    {
        $tableName = static::getTableName();
        echo $tableName;
        $sql = "DELETE FROM `$tableName` WHERE `id` = :id";
        Db::getInstance()->execute($sql, [':id' => $this->id]);
    }
}
