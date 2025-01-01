<?php
include "data.php";

// Kiểm tra người dùng đã đăng nhập chưa
if (!isset($_SESSION['user'])) {
    header('location:login.php');
    exit;
}

// Lấy thông tin người dùng từ phiên
$currentUser = $_SESSION['user'];

// Kiểm tra quyền truy cập (chỉ được sửa thông tin của chính họ)
$id = $_POST['id'] ?? $currentUser['id']; // Nếu không có `id`, mặc định là ID của chính người dùng
if ($id != $currentUser['id'] && $currentUser['role'] != 'admin') {
    header('location:login.php');
    exit;
}

// Lấy thông tin người dùng từ database
$user = $userModel->getUserByID($id);

// Xử lý khi người dùng gửi form
if (isset($_POST['fullname']) && isset($_POST['phone_number']) && isset($_POST['dob']) && isset($_POST['gender'])) {
    $fullname = $_POST['fullname'];
    $phone_number = $_POST['phone_number'];
    $dob = $_POST['dob'];
    $gender = $_POST['gender'];

    // Cập nhật thông tin người dùng
    if ($userModel->updateUser($id, $fullname, $gender, $dob, $phone_number)) {
        $alert = '<script>alert("Cập nhật thành công");</script>';

        // Cập nhật thông tin phiên nếu người dùng chỉnh sửa chính họ
        if ($id == $currentUser['id']) {
            $_SESSION['user'] = $userModel->getUserByID($id);
        }
    } else {
        $alert = '<script>alert("Cập nhật thất bại");</script>';
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
    <title><?php echo htmlspecialchars($user['name']); ?></title>
</head>

<body>
    <!-- header -->
    <?php
    if (isset($alert)) {
        echo $alert;
    }
    include 'header.php';
    ?>
    <h1 style="text-align: center;">Cập nhật thông tin người dùng</h1>
    <div class="container">
        <form class="mt-5" action="" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <input type="hidden" value="<?php echo htmlspecialchars($user['id']); ?>" name="id">
                <label for="fullname">Tên đầy đủ </label>
                <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter full name" value="<?php echo htmlspecialchars($user['name']); ?>">
            </div>
            <div class="form-group">
                <label for="phoneNumber">Số điện thoại</label>
                <input type="text" class="form-control" id="phoneNumber" name="phone_number" placeholder="Enter phone number" value="<?php echo htmlspecialchars($user['phone_number']); ?>">
                <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không bao giờ chia sẻ số điện thoại của bạn với bất kỳ ai khác.</small>
            </div>
            <div class="form-group">
                <label for="dob">Ngày Sinh</label>
                <input type="date" class="form-control" id="dob" name="dob" value="<?php echo htmlspecialchars($user['dob']); ?>">
            </div>
            <div class="form-group">
                <label for="gender">Giới Tính</label>
                <select id="gender" name="gender" class="form-select">
                    <option value="male" <?php if ($user['gender'] == 'male') echo "selected"; ?>>Nam</option>
                    <option value="female" <?php if ($user['gender'] == 'female') echo "selected"; ?>>Nữ</option>
                    <option value="other" <?php if ($user['gender'] == 'other') echo "selected"; ?>>Khác</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Lưu</button>
        </form>
    </div>
    <!-- footer -->
    <?php include 'footer.php'; ?>
    <script src="./public/js/bootstrap.bundle.min.js"></script>
    <script src="./public/js/app.js"></script>
</body>

</html>
