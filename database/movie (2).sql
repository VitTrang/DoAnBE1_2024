-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: DB
-- Thời gian đã tạo: Th6 01, 2024 lúc 06:45 PM
-- Phiên bản máy phục vụ: 5.7.44
-- Phiên bản PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `movie`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seats` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timePay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

-- INSERT INTO `bill` (`id`, `user_id`, `product_id`, `seats`, `address`, `timePay`, `totalPrice`, `created_at`) VALUES
-- (1, 1, 16, 'H1 ', 'Panda Vincom Thủ Đức', '09:45 - Chủ nhật, Ngày 2 Tháng 6', 83125, '2024-06-02 01:40:11'),
-- (2, 1, 17, 'H2 ', 'Panda Bùi Viện', '8:30 - Chủ nhật, Ngày 2 Tháng 6', 83125, '2024-06-02 01:41:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Được Yêu Thích Nhất'),
(2, 'Thịnh Hành'),
(6, 'Đang Chiếu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_view` int(11) NOT NULL DEFAULT '0',
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imdb` float NOT NULL,
  `timer` int(11) NOT NULL,
  `trailer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`, `category_id`, `product_view`, `banner`, `imdb`, `timer`, `trailer`) VALUES
(1, 'Garfield: Mèo Béo Siêu Quậy ', 'Trong bộ phim hoạt hình này, chú mèo mê đồ ăn Garfield bị cuốn vào một vụ trộm để giúp cha mình - một tên trộm đường phố, khỏi một chú mèo biểu diễn khác đang muốn trả thù ông. Bắt đầu như một mối quan hệ hợp tác miễn cưỡng và kết thúc bằng việc Garfield và Vic nhận ra rằng cha con họ không hề  khác biệt như vẻ ngoài của mình.', 80000, 'garfield-1_17167983614901.jpg', 6, 19, 'gar_16x9_thumb_officialtrailer_v3_01_1109_081.jpg', 9.5, 101, 'https://www.youtube.com/watch?v=hMrTVMZS0TA'),
(2, 'Nobita Và Bản Giao Hưởng Địa Cầu', 'Sẽ ra sao nếu thế giới không còn âm nhạc? Phim Điện Ảnh Doraemon: Nobita Và Bản Giao Hưởng Địa Cầu là tác phẩm điện ảnh đầu tiên về chú Mèo Ú lấy đề tài âm nhạc! Hè này, hãy cùng Doraemon, Nobita, Shizuka, Suneo và Jaian bước vào thế giới của những giai điệu diệu kì. ', 60000, 'doraemon-movie-43-nobitas-earth-symphony-1-1_17162731203501.jpg', 6, 3, 'lich-chieu-phim-doraemon-nobita-va-ban-giao-huong-dia-cau-2405070208441.jpg', 9.7, 115, 'https://www.youtube.com/watch?v=Yug8gbDd5EQ'),
(3, 'Totto-chan: Cô Bé Bên Cửa Sổ', 'Do không phù hợp với trường tiểu học ban đầu, Totto-chan chuyển sang đi học tại trường Tomoe. Tại đây, cô bé gặp những học sinh đặc biệt và học được những điều mới mẻ, ngay cả khi Nhật Bản rơi vào chiến tranh.', 80000, 'totto-chan-the-little-girl-at-the-window-1_17163528875291.jpg', 6, 34, 'maxresdefault12793.jpeg', 9.7, 114, 'https://www.youtube.com/watch?v=zZy0h3fPJYs'),
(4, 'Haikyu!!: Trận Chiến Bãi Phế Liệu', 'Một trong những series manga và anime thể thao về bóng chuyền nổi tiếng nhất mọi thời đại. Cuộc đối đầu bóng chuyền giữa hai đối thủ đầy \"duyên nợ\" Cao trung Karasuno và THPT Nekoma hứa hẹn sẽ vô cùng kịch tính và không kém phần thú vị. Bạn sẽ theo team Quạ hay team Mèo?', 60000, 'haikyuu-the-dumpster-battle-4_1715588036535.jpg', 2, 4, '640x396-haikyu.jpg', 9.7, 85, 'https://www.youtube.com/watch?v=DKwuwNQaP5w'),
(5, 'Furiosa: Câu Chuyện Từ Max Điên', 'Furiosa: A Mad Max Saga xảy ra trước những sự kiện của Mad Max: Fury Road, câu chuyện kể về thời trẻ của nữ chiến binh Furiosa khi cô bị tách ra khỏi nơi ẩn náu ở Green Place of Many Mothers và lần đầu tiên buộc phải đối mặt với sự điên rồ của thế giới bên ngoài. Nhưng cô ấy luôn nuôi trong mình một khát vọng “trở về đất mẹ” mãnh liệt.', 80000, 'furiosa-500_1716547292998.jpg', 1, 8, 'Furiosa-A-Mad-Max-Saga-_-1024x576.jpg', 8.7, 148, 'https://www.youtube.com/watch?v=BUwndlpdbVU'),
(6, 'Lật Mặt 7: Một Điều Ước', 'Qua những lát cắt đan xen, ẩn chứa nhiều nụ cười và cả nước mắt, \"Lật Mặt 7: Một Điều Ước\" là câu chuyện cảm động về đại gia đình bà Hai 73 tuổi - người mẹ đơn thân tự mình nuôi 5 người con khôn lớn. Khi trưởng thành, mỗi người đều có cuộc sống và gia đình riêng. Bất chợt, biến cố ập đến, những góc khuất dần được hé lộ, những nỗi niềm, lo lắng, trĩu nặng ẩn sâu trong trái tim người mẹ. Trách nhiệm thuộc về ai?', 70000, 'lm7-500_1714101585009.jpg', 2, 25, 'latmatmotdieuuoc.jpg', 9.4, 138, 'https://www.youtube.com/watch?v=nzLavaLXU_U'),
(7, 'Vây Hãm: Kẻ Trừng Phạt', 'Siêu cớm Ma Seok-do tái xuất để đối đầu với những tội phạm tinh vi trong giới công nghệ. Nắm đấm trứ danh liệu có phát huy được sức mạnh trước liên minh tội phạm của thiên tài công nghệ và ông trùm nhà cái lớn nhất châu Á?', 70000, 'roundup-500_1714102279125.jpg', 1, 8, 'the-roundup-punishment.jpg', 9.1, 109, 'https://www.youtube.com/watch?v=h4okylxDB1Y'),
(8, 'Vùng Đất Câm Lặng: Ngày Một', 'Cùng chứng kiến nơi mọi thứ bắt đầu, ngày Trái Đất trở nên câm lặng!   Dự án đầu tư vỏn vẹn 17 triệu $ và dàn diễn viên tổng cộng chỉ 7 người, A Quiet Place đã làm bùng nổ năm 2018. Doanh thu hơn 341 triệu $. Tiếp nối thành công ấy, A Quiet Place 2 cũng đạt được thành công chẳng kém, đạt hơn 297 triệu $ dẫu công chiếu ngay giữa thời gian đại dịch Covid-19 đang hoành hành.', 80000, 'aqp-500_1716438951296.jpg', 1, 1, 'maxresdefault2.jpg', 9, 120, 'https://www.youtube.com/watch?v=eD1O0wVwW7o'),
(9, 'Deadpool & Wolverine', 'Sau một số tác phẩm chưa đạt thành công như kì vọng gần đây, Marvel Studios ngày càng thận trọng khi ra mắt các dự án mới. Deadpool & Wolverine chính là bộ phim Marvel duy nhất ra mắt năm 2024. Bộ phim là tác phẩm mà công chúng kì vọng sẽ cứu rỗi vũ trụ điện ảnh Marvel khỏi cơn thoái trào. Chính vì vậy, chẳng có gì ngạc nhiên khi Deadpool & Wolverine được đầu tư, chăm chút hết sức kĩ lưỡng. Sau teaser và trailer đầu tiên, cốt truyện Deadpool & Wolverine dần dần hé lộ. Đặc sản “trứng phục sinh” bùng nổ ở trailer, khiến khán giả đồn đoán liên tục, gợi nhớ đến loạt tác phẩm quen thuộc như Ant-Man, X-Men United, X-Men: First Class, Loki...', 80000, 'deadpool-3_1713781347901.jpg', 1, 3, 'deadpool_and_wolverine_banner_hd_by_andrewvm_dhae98u-fullview.jpg', 9.5, 140, 'https://www.youtube.com/watch?v=lW4-A3ZQnVQ'),
(10, 'Kraven - Thợ Săn Thủ Lĩnh', 'Gã nhập cư Nga Sergei Kravinoff đang thực hiện nhiệm vụ chứng minh rằng anh ta là thợ săn vĩ đại nhất thế giới.', 80000, 'kraven-poster_1687246462454.jpg', 6, 0, 'KTH-NWP.jpg', 8.7, 114, 'https://www.youtube.com/watch?v=48RnDkQL7jo'),
(11, 'Lốc Xoáy Tử Thần', 'Nhà săn bão Kate Cooper từng trải qua cơn lốc xoáy thời đại học hiện tại đang làm nhà nghiên cứu đặc điểm, hiện tượng của những cơn bão thông qua màn hình tại thành phố New York. Cô được người bạn cũ Javi mời đến vùng đồng bằng để thử nghiệm hệ thống theo dõi mới mang tính đột phá. Tại đó, cô tình cờ gặp Tyler Owens. Anh là ngôi sao truyền thông mạng xã hội đầy sức quyến rũ, nổi tiếng với việc đăng tải những chuyến phiêu lưu săn bão nghẹt thở cùng với đoàn nhân viên ồn ào, thích thú với sự nguy hiểm.', 80000, 'twisters-500_1714101885086.jpg', 6, 14, '0957d1904de477e1ded0b68ce683f806.jpeg', 8.5, 120, 'https://www.youtube.com/watch?v=Q9CtcaZSZtI'),
(12, 'Những Kẻ Theo Dõi', 'Bộ phim theo chân Mina, một họa sĩ 28 tuổi bị lạc trong khu rừng hoang sơ ở phía tây Ireland. Khi Mina tìm được nơi trú ẩn, cô không hề biết rằng mình đã bị mắc kẹt cùng ba người lạ khác, mà tất cả đều đang bị theo dõi và săn lùng bởi những sinh vật bí ẩn mỗi đêm.', 80000, 'poster-payoff-nhung-ke-theo-doi8_1717124783055.jpg', 6, 8, 'maxresdefault.jpg', 8.7, 127, 'https://www.youtube.com/watch?v=1RUbfnTwCFM'),
(13, 'Kẻ Trộm Mặt Trăng 4', 'Cuộc phiêu lưu điên rồ và hài hước của Gru và gia đình, tất nhiên là không thể thiếu nhóm “chuối vàng” hậu đậu – Minions! Tiếp nối những sự kiện Despicable Me 3 (2017), giờ đây Gru đã hoàn lương, hạn chế tham gia các hoạt động phi pháp. Ngoài vợ Lucy Wilde và các cô con gái nuôi Margo, Edith, Agnes, giờ đây gia đình Gru còn đón thêm thành viên mới là nhóc tì Gru Junior - con trai đầu lòng của anh. Tuy nhiên, sự an toàn của gia đình Gru nhanh chóng bị đe dọa khi kẻ thù cũ của anh là Maxime Le Mal đã trốn khỏi nhà tù, hắn lên kế hoạch trả thù và thanh toán nợ cũ với Gru. Đồng hành với Maxime còn có người yêu Valentina của gã. Do đó, Gru buộc phải đứng lên đối mặt với kẻ thù để bảo vệ gia đình và các Minions.', 70000, 'dm4-500_1715670501365.jpg', 1, 14, 'dm-750_1712201980971.jpg', 9.6, 120, 'https://www.youtube.com/watch?v=l3oHhZCuTA4'),
(14, 'Gia Tài Của Ngoại ', 'Đã bao lâu kể từ lần cuối cùng bạn ở bên bà của mình? Với chàng trai trẻ M (Putthipong Assaratanakul / Billkin), đó là khi anh chàng nghe tin bà của mình mắc bệnh ung thư. M quyết định trở về bên cạnh chăm sóc bà. Thế nhưng, mục đích ban đầu của anh chàng không phải vì muốn ở bên bà, mà vì mong muốn được thừa kế gia sản mà bà để lại. Trước khi không còn thời gian, M phải làm tất cả để trở thành “cháu cưng” của bà. ', 60000, 'gia-tai-cua-ngoai-3_1716955336667.jpg', 2, 5, 'dsc00106-171394565962483796550.webp', 9.6, 130, 'https://www.youtube.com/watch?v=YjbcS0dtENg'),
(15, 'Những Gã Trai Hư: Chơi Hay Bị Xơi', 'Chuyện phim mới kể về những diễn biến đầy hành động của thám tử Miami-Dade Mike Lowrey (Will Smith) và Marcus Burnett (Martin Lawrence). Giờ đây, Lowrey và Burnett phải hợp tác để tiêu diệt tên Đại úy Conrad Howard, người đang bị buộc tội hoạt động cùng băng đảng ma túy.', 80000, 'bad-boy-500_1712891792541.jpg', 2, 8, 'phim.jpg', 8.8, 115, 'https://www.youtube.com/watch?v=oc3Bls7FsGo'),
(16, 'Hội Nhóc Quậy', 'Cat, Fouad, Antoine và Sami cùng lập băng đảng thiếu niên. Bị khiêu khích, lũ trẻ bắt tay hành động điên rồ - cho nổ tung nhà máy đã gây ô nhiễm dòng sông nhiều năm qua. Tuy nhiên, vì mới thành lập, bất đồng thường xảy ra, số phiếu đồng thuận luôn không đồng nhất làm kế hoạch bị trì hoãn. Để có lá phiếu quyết định, chúng đưa nhóc mồ côi Aimé vào nhóm. Năm đồng phạm sẽ học cách sống và chiến đấu cùng nhau trong cuộc phiêu lưu hài hước này.', 70000, 'the-little-gang_1716885247551.jpg', 1, 9, 'web-7.png', 7, 106, 'https://www.youtube.com/watch?v=qVN6RIKVY9o'),
(17, 'Stalker: Tội Ác Hoàn Hảo', 'Lợi dụng công việc môi giới bất động sản của mình, Koo Jung-tae thường xuyên đột nhập vào những căn nhà bằng chìa khoá được khách hàng giao để thoả mãn sở thích rình rập và trộm các món đồ không cần thiết. Mọi rắc rối bắt đầu khi anh bí mật theo dõi cuộc sống của Han Sora - cô gái xinh đẹp, nổi tiếng trên mạng xã hội. Đến một ngày, Han Sora trở thành khách hàng của văn phòng môi giới bất động sản mà Koo Jung-tae làm việc. Có được chìa khoá căn hộ của Han Sora, theo “thói quen”, Koo Jung-tae lẻn vào nhà và bất ngờ chứng kiến cảnh Han Sora chết trên sofa. Bị thám tử Oh Young-joo buộc tội giết người, Koo Jung-tae buộc phải tìm kiếm tên tội phạm thực sự và khám phá ra nhiều bí mật động trời phía sau cái chết của Han Sora.', 70000, 'stalker-500_1715240711738.jpg', 2, 11, 'review-phim-stalker-toi-ac-hoan-hao.jpg.webp', 9.3, 103, 'https://www.youtube.com/watch?v=koJdVjJ3A4w'),
(18, 'Những Mảnh Ghép Cảm Xúc 2', 'Những Mảnh Ghép Cảm Xúc 2 sẽ quay trở lại phần tâm trí mới của cô bé thiếu niên Riley. Một ngày, trụ sở chính đột ngột bị phá hủy để nhường chỗ cho một thứ hoàn toàn mới: Một cảm xúc mới! Vui Vẻ, Buồn Bã, Giận Dữ, Sợ Hãi và Chán Ghét phải \'chào đón\' sự xuất hiện của một loại cảm xúc mới là Lo Âu. Và có vẻ như cô ấy không chỉ xuất hiện một mình.', 80000, 'inside-out-2-3_1714970461256.jpg', 2, 2, 'g_disney_insideout2_798_05_4ecb5fb3.jpeg', 8.5, 109, 'https://www.youtube.com/watch?v=qlwZy9PL0LA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_comment`
--

CREATE TABLE `product_comment` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product_comment`
--

-- INSERT INTO `product_comment` (`id`, `product_id`, `user_id`, `created_at`, `content`) VALUES
-- (81, 2, 122, '2024-05-31 01:11:53', 'ahihihi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_like`
--

CREATE TABLE `product_like` (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product_like`
--

INSERT INTO `product_like` (`product_id`, `user_id`) VALUES
(0, 56),
(1, 2),
(1, 8),
(1, 9),
(1, 12),
(2, 8),
(2, 9),
(2, 12),
(2, 15),
(3, 1),
(3, 2),
(3, 8),
(3, 12),
(3, 15),
(3, 43),
(4, 1),
(4, 8),
(4, 12),
(5, 1),
(5, 2),
(5, 8),
(5, 9),
(5, 12),
(5, 15),
(6, 2),
(7, 8),
(7, 9),
(7, 12),
(8, 1),
(8, 8),
(8, 9),
(8, 11),
(9, 8),
(9, 12),
(9, 15),
(10, 1),
(10, 8),
(10, 10),
(11, 1),
(11, 2),
(11, 9),
(11, 12),
(12, 8),
(12, 12),
(13, 1),
(13, 10),
(14, 8),
(14, 12),
(15, 2),
(15, 8),
(15, 15),
(15, 16),
(16, 2),
(16, 8),
(16, 9),
(16, 12),
(16, 15),
(17, 1),
(17, 2),
(17, 8),
(17, 9),
(18, 8),
(18, 9),
(18, 12),
(18, 16),
(19, 1),
(19, 12),
(20, 1),
(20, 8),
(20, 15),
(20, 46),
(21, 8),
(21, 12),
(22, 1),
(22, 2),
(22, 8),
(22, 12),
(22, 42),
(22, 45),
(23, 8),
(23, 12),
(23, 16),
(24, 8),
(24, 12),
(24, 51),
(25, 1),
(25, 8),
(25, 16),
(34, 15),
(34, 16),
(35, 1),
(35, 12),
(36, 8),
(36, 12),
(37, 1),
(37, 8),
(37, 12),
(37, 54),
(38, 1),
(38, 8),
(38, 12),
(39, 2),
(39, 8),
(39, 12),
(39, 15),
(43, 2),
(43, 12),
(44, 1),
(44, 2),
(44, 10),
(44, 12),
(44, 16),
(45, 1),
(47, 1),
(48, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_view`
--

CREATE TABLE `product_view` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('standard','premium','deluxe') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `gender`, `dob`, `phone_number`, `password`, `role`, `type`) VALUES
(1, 'admin', 'male', '1994-04-21', '0123456789', '$2y$10$TxndoIm6j.z4w.kM8snEre3oBY3AJOx6ohsyonDwJpP1t9eMHjkeu', 'admin', 'deluxe');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `id_product` (`product_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_cart` (`user_id`);

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_product_cart_detail` (`product_id`),
  ADD KEY `FK_cart_cart_detail` (`cart_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_comment`
--
ALTER TABLE `product_comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_like`
--
ALTER TABLE `product_like`
  ADD PRIMARY KEY (`product_id`,`user_id`);

--
-- Chỉ mục cho bảng `product_view`
--
ALTER TABLE `product_view`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `phone_number_2` (`phone_number`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `product_comment`
--
ALTER TABLE `product_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `product_view`
--
ALTER TABLE `product_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_user_cart` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `FK_cart_cart_detail` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_product_cart_detail` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
