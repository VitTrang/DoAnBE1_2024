<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "data.php";

if ($_SESSION['user']['role'] != 'admin') {
    header('location:login.php');
}

//$id, $name, $description, $price, $image, $category_id, $banner, $imdb, $timer, $trailer
if (isset($_POST['name'])  && isset($_POST['description']) && isset($_POST['price']) && isset($_POST['category_id']) && isset($_POST['imdb']) && isset($_POST['timer']) && isset($_POST['trailer'])) {
    $imageFile = "./public/images/" . $_FILES['image']['name'];
    $bannerFile = "./public/images/" . $_FILES['banner']['name'];
    if (is_uploaded_file($_FILES['image']['tmp_name']) && is_uploaded_file($_FILES['banner']['tmp_name']) && move_uploaded_file($_FILES['image']['tmp_name'], $imageFile) && move_uploaded_file($_FILES['banner']['tmp_name'], $bannerFile)) {
        $name = $_POST['name'];
        $description = $_POST['description'];
        $price = $_POST['price'];
        $image = $_FILES['image']['name'];
        $category_id = $_POST['category_id'];
        $banner = $_FILES['banner']['name'];
        $imdb = $_POST['imdb'];
        $timer = $_POST['timer'];
        $trailer = $_POST['trailer'];
        if ($productModel->addProduct($name, $description, $price, $image, $category_id, $banner, $imdb, $timer, $trailer)) {
            $alert = '<script>
                        alert("add success")
                     </script>';
        } else {
            $alert = '<script>
                        alert("add fail")
                    </script>';
        }
    } else {
        $alert = '<script>
                        alert("add fail")
                    </script>';
    }
} else {
}

// Số sản phẩm hiển thị trên mỗi trang
$products_per_page = 10;

// Lấy số trang hiện tại từ URL, nếu không có thì mặc định là 1
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;

// Tính OFFSET
$offset = ($page - 1) * $products_per_page;

// Lấy tổng số sản phẩm
$total_products = $productModel->getTotalProducts();
$total_pages = ceil($total_products / $products_per_page);

// Lấy danh sách sản phẩm cho trang hiện tại
$products = $productModel->getProductsWithPagination($products_per_page, $offset);
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
    <title>Thêm Phim</title>
</head>

<body>
    <!-- header -->
    <?php
    if (isset($alert)) {
        echo $alert;
    }
    include 'header.php';
    ?>
    <div class="container">
        <form class="mt-5" action="" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Tên Phim</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter movie's name">
            </div>
            <div class="row">
                <div class="form-group col-6">
                    <label for="image">Hình ảnh</label>
                    <input type="file" class="form-control" id="image" name="image" accept="image/png, image/gif, image/jpeg, image/webp">
                </div>
                <div class="form-group col-6">
                    <label for="banner">Ảnh bìa</label>
                    <input type="file" class="form-control" id="banner" name="banner" accept="image/png, image/gif, image/jpeg, image/webp">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-6">
                    <label for="price">Gía</label>
                    <input type="number" class="form-control" id="price" name="price" placeholder="add price">
                </div>
                <div class="form-group col-6">
                    <label for="imdb">imdb</label>
                    <input type="number" class="form-control" id="imdb" name="imdb" placeholder="add imdb" min="1" max="10" step="0.1" oninput=(checkMinMax(this))>
                </div>
            </div>
            <div class="row">
                <div class="input-radio col-6">
                    <label for="category">Danh mục</label>
                    <select class="form-control" id="category" name="category_id">
                        <option selected>Chọn...</option>
                        <?php
                        foreach ($categories as $category) { ?>
                            <option value=<?php echo  $category['id'] ?>><?php echo $category['name'] ?></option>
                        <?php
                        }
                        ?>
                    </select>
                </div>
                <div class="form-group col-6">
                    <label for="timer">Timer</label>
                    <input type="number" class="form-control" id="timer" name="timer" placeholder="add timer">
                </div>
            </div>

            <div class="form-group">
                <label for="trailer">Trailer</label>
                <input type="text" class="form-control" id="trailer" name="trailer" placeholder="add trailer">
            </div>
            <div class="form-group">
                <label for="description">Mô tả</label>
                <textarea class="form-control" name="description" id="description" cols="30" rows="10"></textarea>
                <small id="emailHelp" class="form-text text-muted">Mô tả Phim.</small>
            </div>


            <button type="submit" class="btn btn-primary">Thêm</button>
        </form>
    </div>
    <div class="container">
    <table class="table table-primary mt-5">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Tên Phim</th>
                <th scope="col">Mô tả</th>
                <th scope="col">Gía</th>
                <th scope="col">Hình ảnh</th>
                <th scope="col">Hành Động</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (isset($products) && count($products) > 0) {
                foreach ($products as $product) {
            ?>
                    <tr>
                        <td><?php echo $product['id']; ?></td>
                        <td><?php echo $product['name']; ?></td>
                        <td><?php echo strlen($product['description']) > 100 ? substr($product['description'], 0, 100) . '...' : $product['description']; ?></td>
                        <td><?php echo number_format($product['price'], 0, ',', '.'); ?> đ</td>
                        <td>
                            <img src="./public/images/<?php echo $product['image']; ?>" alt="Product Image" style="width: 100px; height: auto;">
                        </td>
                        <td>
                            <!-- Button sửa -->
                            <a href="edit_product.php?id=<?php echo $product['id']; ?>" class="btn btn-warning btn-sm">Sửa</a>
                            <!-- Button xóa -->
                            <form action="delete_product.php" method="POST" style="display:inline-block;">
                                <input type="hidden" name="id" value="<?php echo $product['id']; ?>">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?');">Xóa</button>
                            </form>
                        </td>
                    </tr>
            <?php
                }
            } else {
                echo '<tr><td colspan="6" class="text-center">Không có sản phẩm nào.</td></tr>';
            }
            ?>
        </tbody>
    </table>
    <!-- Điều hướng phân trang -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <?php if ($page > 1): ?>
                <li class="page-item"><a class="page-link" href="?page=<?php echo $page - 1; ?>">Trước</a></li>
            <?php endif; ?>
            <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                <li class="page-item <?php echo $i === $page ? 'active' : ''; ?>">
                    <a class="page-link" href="?page=<?php echo $i; ?>"><?php echo $i; ?></a>
                </li>
            <?php endfor; ?>
            <?php if ($page < $total_pages): ?>
                <li class="page-item"><a class="page-link" href="?page=<?php echo $page + 1; ?>">Sau</a></li>
            <?php endif; ?>
        </ul>
    </nav>
</div>

    <!-- footer -->
    <?php include 'footer.php' ?>
    <script src="./public/js/bootstrap.bundle.min.js"></script>
    <script src="./public/js/app.js"></script>
</body>

</html>