<?php
include 'data.php';
$notication = "";
if (isset($_POST['username']) && isset($_POST['password']) && isset($_POST['gender']) && isset($_POST['password'])) {
    $user = $userModel->createUser($_POST['fullName'], $_POST['gender'], $_POST['dob'], $_POST['username'], $_POST['password']);
    if ($user != null) {
        $_SESSION['user'] = $user;
        header('location:index.php');
    } else {
        $notication = "<p style='color:red'>account already exists</p>";
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
    <link rel="stylesheet" href="./public/css/styleRegister.css">
    <link rel="shortcut icon" href="assets/img/popcorn.png">
    <title>Đăng ký</title>
</head>

<body>
    <form action="" method="post" onsubmit="return checkvalid()">
        <h1>Đăng ký</h1>
        <div class="input-group">
            <input type="text" id="username" name="username" required />
            <label for="username">Số điện thoại</label>
            <div class="invalid-feedback">
                ✘
            </div>
            <div class="valid-feedback">
                ✓
            </div>

        </div>
        <div class="input-group">
            <input type="text" id="fullName" name="fullName" required />
            <label for="fullName">Tên đầy đủ</label>
            <div class="invalid-feedback">
                ✘
            </div>
            <div class="valid-feedback">
                ✓
            </div>
        </div>
        <div class="input-group">
            <input type="password" id="password" name="password" autocomplete="new-password" required />
            <label for="password">Mật Khẩu</label>
            <div class="invalid-feedback">
                ✘
            </div>
            <div class="valid-feedback">
                ✓
            </div>
        </div>
        <div class="input-group">
            <input type="password" id="confirm" name="confirm" autocomplete="new-password" required />
            <label for="confirm">Nhập lại mật khẩu</label>
            <div class="invalid-feedback">
                ✘
            </div>
            <div class="valid-feedback">
                ✓
            </div>
        </div>
        <input type="date" class="form-control" name="dob" id="dob">
        <div class="input-radio">

            <label for="gender">Giới tính</label>
            <select class="form-control" id="gender" name="gender">
                <option value="male">Nam</option>
                <option value="female">Nữ</option>
                <option value="other">Khác</option>
            </select>
        </div>

        <?php if (isset($notication)) echo $notication ?>
        <button type="submit" id="submit">Đăng Ký</button>
        <p>Bạn đã có tài khoản? <a href="./login.php">Đăng Nhập</a></p>
    </form>
    <script src="./public/js/registerCheck.js"></script>
</body>

</html>