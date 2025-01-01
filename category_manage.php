<?php
include 'data.php';
if (isset($_POST['id'])) {
    $id = $_POST['id'];
    $categoryModel->deleteCatgory($id);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./public/css/bootstrap.min.css">
    <link rel="stylesheet" href="./public/css/all.min.css">
    <link rel="stylesheet" href="./public/css/style.css">
    <link rel="shortcut icon" href="assets/img/popcorn.png">
    <title>Quản lý danh mục</title>
</head>

<body>
    <?php include 'header.php' ?>
    <div class="container">
        <table class="table table-primary mt-5">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Tên danh mục</th>
                    <th scope="col">Hành động</th>
                </tr>
            </thead>
            <?php
            $categories = $categoryModel->getAllCatgory();
            foreach ($categories as $category) {

            ?>
                <thead>
                    <tr>
                        <td scope="col"><?php echo $category['id'] ?></td>
                        <td scope="col"><?php echo $category['name'] ?></td>
                        <td scope="col">
                            <form action="" method="post" style="display: inline-block;">
                                <input type="hidden" name="id" value="<?php echo $category['id']  ?>">
                                <button type="submit" class="btn btn-primary" onclick="return confirm('Do you want to remove this?')">Xóa</button>
                            </form>
                            <form action="edit_category.php" method="post" style="display: inline-block;">
                                <input type="hidden" name="id" value="<?php echo $category['id']  ?>">
                                <button type="submit" class="btn btn-primary">Sửa</button>
                            </form>
                        </td>
                    </tr>
                </thead>
            <?php } ?>

        </table>
        <form action="add_category.php" method="post">
            <input type="hidden" name="id" value="<?php echo $category['id']  ?>">
            <button type="submit" class="btn btn-primary">Thêm Danh mục</button>
        </form>
    </div>
    <!-- footer -->
    <?php include 'footer.php' ?>
    <script src="./public/js/bootstrap.bundle.min.js"></script>
    <script src="./public/js/app.js"></script>
</body>

</html>