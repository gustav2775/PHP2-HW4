<p><?= $resultLoader ?></p>
<form class="formLoader" action="?c=gallery&a=insert" method="post" enctype="multipart/form-data">
    <input type="file" name="myfile"> <br>
    <input type="submit" value="Загрузить">
</form>

<div class="gallery">
    <h1>Галерея</h1>
    <div class="gallerybox">
    <?php foreach ($gallery as $item) : ?>
        <div class="image">
            <a class="biglink" href="/?c=gallery&a=galleryItem&id=<?= $item['id'] ?>">
                <img class="" src="img/smallImg/<?= $item['name'] ?>" alt="<?= $item['name'] ?>">
            </a>
            <a class="delete" href="/?c=gallery&a=delete&id=<?= $item['id'] ?>">x</a>
        </div>
    <?php endforeach; ?>
</div>
</div>