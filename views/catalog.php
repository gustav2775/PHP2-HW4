<div class="container">
  <div class="catalogHeader">
    <h1>Каталог</h1>
  </div>
  <?php if ($_SESSION['id'] == 1) : ?>
    <p>Создать новый товар</p>
    <form class=newProduct action="/?c=catalog&a=save" method="post">
      <input class="newProductInput" type="text" name='name' placeholder="Название товара">
      <input class="newProductInput" type="text" name='price' placeholder="Цена">
      <input class="newProductInput" type="text" name='description' placeholder="Описание">
      <input type="file" name="productImg" id="">
      <input class="newProductSubmit" type="submit" value="Создать">
    </form>
  <?php endif ?>

  <div class="catalog">
    <?php foreach ($catalog as $item) : ?>
      <div class="item">
        <a href="?c=catalog&a=product&id=<?= $item['id'] ?>">
          <div class="imgitem">
            <img src="img/imgCatalog/<?= $item['img_prod'] ?>" style="width: 250px;" alt="">
          </div>
          <p class="catalogItem"><?= $item['name_product'] ?></p>
          <p> Price : <span><?= $item['price'] ?> USD</span></p>
        </a>
        <?php if ($_SESSION['id'] == 1) : ?>
          <a href="/?c=catalog&a=delete&id=<?= $item['id'] ?>">[x]</a>
        <?php endif ?>
        <a href="?c=catalog&a=buy&id=<?= $item['id'] ?>">Купить</a>
      </div>
    <?php endforeach ?>
  </div>
  
  <a href="/?c=catalog&page=<?=$page + 5?>">Показать еще 5</a>
</div>