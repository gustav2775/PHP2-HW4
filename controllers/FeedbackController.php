<?php

namespace app\controllers;

use app\model\Feedback;

class FeedbackController extends Controller
{
    private $id = 0;

    public function actionFeedback()
    {
        $feedback = new Feedback();
        
        $feedbackItem = $feedback->getAlltoId($this->id);

        echo $this->renderLayouts("feedback", [
            "feedback" => $feedbackItem
        ]);
    }
}
