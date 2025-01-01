
<div class="top-header" >
    <div class="top-contact" >
        <div class="container">
            <ul class="top-contact-list">
                <!-- <li><a href="" class="email-contact"><i class="fa-solid fa-envelope"></i> Duckcinema@gmail.com</a></li>
                <li><a href="" class="phone-number"><i class="fa-solid fa-phone-flip"></i> +84 123456789</a></li> -->
            </ul>

        </div>
    </div>
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid position-relative">
                <a class="navbar-brand logo-brand collapse navbar-collapse" style=" border-radius: 50%;" href="index.php">
                    <img src="./assets/img/popcorn.png" alt="logo" class="img-fluid" style="height: 100px;">
                </a>
                <a href="index.php">
                    <img style="height: 40px;" src="./assets/img/popcorn.png" alt="logo">
                </a>
                <button class="navbar-toggler ms-auto me-5" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse me-5" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <!-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            DỊCH VỤ
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li> -->
                        <!-- <li class="nav-item">
                            <a class="nav-link" href="#">BLOG</a>
                        </li> -->
                        <?php if (!isset($_SESSION['user'])) { ?>
                            <li class="nav-item">
                                <a class="nav-link" href="login.php" id="login">Đăng Nhập</a>
                            </li>
                        <?php } ?>
                        
                        <?php if (isset($_SESSION['user'])) { ?>
                            <li class="nav-item dropdown">
                                <p class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="user">
                                    <?php echo substr($_SESSION['user']['name'], 0, 20); ?>
                                </p>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <?php if ($_SESSION['user']['role'] === "admin") { ?>
                                        <li><a class="dropdown-item" href="add_product.php" id="manage">Thêm Phim</a></li>
                                        <li><a class="dropdown-item" href="category_manage.php" id="manage">Quản Lý Danh Mục</a></li>
                                        <li><a class="dropdown-item" href="user_manage.php" id="manage">Quản Lý Người Dùng</a></li>
                                    <?php } ?>
                                    
                                    <li><a class="dropdown-item" href="edit_user.php">Xem Thông Tin</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="history.php">Lịch Sử</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="change_pass.php">Đổi Mật Khẩu</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="logout.php">Đăng Xuất</a></li>
                                </ul>
                            </li>
                        <?php } ?>
                    </ul>
                    <form action="search.php" method="get">
                        <input class="search form-control" type="search" placeholder="Search..." aria-label="Search" name="key" value="<?php if (isset($_GET['key'])) {
                                                                                                                                            echo $_GET['key'];
                                                                                                                                        } ?>">
                    </form>
                </div>
                <a href="cartgory.php" class="nav-link shopping-list position-absolute end-0 top-0" data-count=<?php echo isset($_SESSION['cartgory']) ? count($_SESSION['cartgory']) : '0' ?> id="cart"><i class="fa-solid fa-basket-shopping"></i></a>
            </div>

        </nav>
    </div>
</div>