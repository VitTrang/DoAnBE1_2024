<?php
session_start();
include "data.php";

// Kiểm tra người dùng đã đăng nhập
if (!isset($_SESSION['user'])) {
    header('location:login.php');
    exit;
}

// Lấy thông tin người dùng hiện tại
$currentUser = $_SESSION['user'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $oldPassword = $_POST['old_password'];
    $newPassword = $_POST['new_password'];
    $confirmPassword = $_POST['confirm_password'];

    // Lấy thông tin người dùng từ database
    $user = $userModel->getUserByID($currentUser['id']);

    // Kiểm tra người dùng có tồn tại hay không
    if (!$user) {
        $error = "Người dùng không tồn tại!";
    } 
    // Kiểm tra mật khẩu cũ
    elseif (!password_verify($oldPassword, $user['password'])) {
        $error = "Mật khẩu cũ không đúng!";
    } 
    // Kiểm tra mật khẩu mới và xác nhận mật khẩu
    elseif ($newPassword !== $confirmPassword) {
        $error = "Mật khẩu mới và xác nhận mật khẩu không khớp!";
    } else {
        // Mã hóa mật khẩu mới
        $hashedPassword = password_hash($newPassword, PASSWORD_BCRYPT);

        // Cập nhật mật khẩu trong cơ sở dữ liệu
        if ($userModel->updatePassword($currentUser['id'], $hashedPassword)) {
            $success = "Đổi mật khẩu thành công!";
        } else {
            $error = "Đã xảy ra lỗi khi đổi mật khẩu!";
        }
    }
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
    <title>Đổi Mật Khẩu</title>
</head>

<body>
    <!-- header -->
    <?php include 'header.php'; ?>

    <div class="container mt-5">
        <h2 class="text-center">Đổi Mật Khẩu</h2>

        <!-- Hiển thị thông báo lỗi hoặc thành công -->
        <?php if (isset($error)) { ?>
            <div class="alert alert-danger"><?php echo $error; ?></div>
        <?php } elseif (isset($success)) { ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php } ?>

        <!-- Form đổi mật khẩu -->
        <form action="" method="POST">
            <div class="form-group">
                <label for="old_password">Mật khẩu cũ</label>
                <input type="password" class="form-control" id="old_password" name="old_password" required>
            </div>
            <div class="form-group">
                <label for="new_password">Mật khẩu mới</label>
                <input type="password" class="form-control" id="new_password" name="new_password" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Xác nhận mật khẩu mới</label>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Đổi mật khẩu</button>
        </form>
    </div>

    <!-- footer -->
    <?php include 'footer.php'; ?>
    <script src="./public/js/bootstrap.bundle.min.js"></script>
    <script src="./public/js/app.js"></script>
</body>

</html>
