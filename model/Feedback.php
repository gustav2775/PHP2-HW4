<?php

namespace app\model;

class Feedback  extends ModelDb
{
    protected $id;
    protected $name;
    protected $feedback;
    protected $datefeedback;
    protected $idmode;

    // protected $prop = [
    //     'id' => false,
    //     'name' => false,
    //     'feedback' => false,
    //     'datefeedback' => false,
    //     'idmode' => false
    // ];
    public static function getSql()
    {
    }
    public function __construct($name = null, $feedback = null)
    {
        $this->name = $name;
        $this->feedback = $feedback;
    }

    public static function getTableName()
    {
        return "feedback";
    }
}
