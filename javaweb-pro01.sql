/*
 Navicat Premium Data Transfer

 Source Server         : mh
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : javaweb-pro01

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 19/06/2023 19:25:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `applyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `applytime` datetime NOT NULL,
  `applyemail` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applyclub` int NOT NULL,
  `applyid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`applyid`) USING BTREE,
  INDEX `apply_ibfk_1`(`applyclub` ASC) USING BTREE,
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`applyclub`) REFERENCES `club` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------

-- ----------------------------
-- Table structure for club
-- ----------------------------
DROP TABLE IF EXISTS `club`;
CREATE TABLE `club`  (
  `club_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `club_id` int NOT NULL AUTO_INCREMENT,
  `club_manager` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `club_note` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`club_id`) USING BTREE,
  INDEX `club_name`(`club_name` ASC) USING BTREE,
  INDEX `fk_club_management`(`club_manager` ASC) USING BTREE,
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`club_manager`) REFERENCES `management` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of club
-- ----------------------------
INSERT INTO `club` VALUES ('电竞社', 1, '莫航', '今晚在综合楼举行活动，请大家务必到场！');
INSERT INTO `club` VALUES ('棋牌社', 2, '辰辰', '欢迎加入我们的棋牌社！我们是一个热爱棋牌游戏的社团，致力于提供一个友好、有趣和竞技的棋牌游戏交流平台。');
INSERT INTO `club` VALUES ('滑板社', 3, '陈英杰', '我们注重团队合作和滑板文化的传承，因此我们组织内部的滑板比赛和表演活动。这是一个展示自己滑板技巧和创造力的机会，同时也是与其他滑板爱好者交流、学习和成长的平台。我们鼓励成员们互相激励、分享经验，并共同推动滑板文化的发展。\r\n\r\n加入我们的滑板社，你将有机会结识其他滑板爱好者，一起探索滑板世界的乐趣和挑战。无论你是想追求滑板运动的职业发展，还是将滑板作为一种激情和生活方式，我们都欢迎你的加入！');
INSERT INTO `club` VALUES ('舞蹈社', 4, '雷恩熙', '欢迎来到我们的舞蹈社！我们是一个热爱舞蹈的社团，致力于提供一个充满艺术和创造力的舞蹈平台。不论你是有经验的舞者还是对舞蹈充满热情的新手，我们都欢迎你加入我们的大家庭。');
INSERT INTO `club` VALUES ('棒球社', 5, '吴孟达', '手动阀手动阀士大夫啥的lalalalala啦啦队了法律手段分裂势力地方罗斯拉夫历史地理 ');
INSERT INTO `club` VALUES ('动漫社', 6, '王小明', '动漫社是一个热爱动画与漫画文化的社团。我们致力于提供一个交流和分享动漫作品的平台，让成员们可以共同探讨他们喜爱的角色、故事情节和创作技巧。无论是从事二次元文化的研究，还是组织观影活动和漫展参观，我们都希望能够深入了解并欣赏动漫的魅力。');
INSERT INTO `club` VALUES ('掌机社', 7, '李小红', '掌机社是一个致力于掌上游戏机的研究和娱乐的社团。我们热爱各类掌机游戏，并且热衷于分享游戏攻略、交流游戏心得和组织游戏比赛。在这个社团里，你可以找到与志同道合的人一起探索掌机游戏的世界，体验游戏带来的乐趣和挑战。');
INSERT INTO `club` VALUES ('福瑞社', 8, '张伟华', '福瑞社是一个关注福利与幸福的社团。我们致力于提供一系列活动和资源，帮助社团成员改善生活质量，增进身心健康，培养积极乐观的心态。无论是举办健身活动、提供心理咨询，还是分享快乐的经历和心灵鸡汤，我们都致力于营造一个充满正能量和关怀的社团氛围。');
INSERT INTO `club` VALUES ('日漫社', 9, '刘晓梅', '日漫社是一个致力于推广和欣赏日本动画文化的社团。我们热爱日本动画作品，通过观影、讨论和举办活动，致力于传播日本动画的魅力。我们也鼓励社团成员进行二次创作和角色扮演，创造属于自己的日本动画世界。');
INSERT INTO `club` VALUES ('艺术窝', 10, '陈建国', '艺术窝是一个汇集各类艺术形式的社团。我们欢迎所有对艺术感兴趣的人，无论是绘画、摄影、音乐还是舞蹈。在这里，你可以与其他艺术爱好者分享灵感、展示作品，并参与各种创作活动。我们致力于培养创意和审美能力，打造一个充满艺术氛围的创作空间。');
INSERT INTO `club` VALUES ('乐活社', 11, '林佳琳', '乐活社是一个倡导健康、活力和积极生活方式的社团。我们关注身体健康、运动和生活乐趣，通过组织户外活动、健身训练和营养知识分享，鼓励社团成员拥抱积极的生活态度。在这个社团里，你可以结交到志同道合的伙伴，一起追求健康与快乐的生活。');
INSERT INTO `club` VALUES ('书香会', 12, '黄翔宇', '书香会是一个热爱阅读和分享读书体验的社团。我们致力于创建一个阅读、讨论和文学交流的平台，提供丰富的书籍资源和文学活动。无论你是喜欢小说、诗歌、历史还是哲学，加入书香会，你将与其他书迷一起探索文字的魅力，一同开启知识与智慧的旅程。');
INSERT INTO `club` VALUES ('美食社', 13, '吴静雅', '美食社是一个热爱美食探索和分享的社团。我们追求口腹之欢，通过举办美食品鉴、烹饪课程和食材交流，让社团成员能够一起品尝各种美味佳肴，了解不同的烹饪文化和技巧。在这里，你将有机会结识到热爱美食的朋友，一同探索美食的无穷魅力。');
INSERT INTO `club` VALUES ('科技社', 14, '陈思婷', '科技社是一个热衷于科技创新和探索的社团。我们关注最新的科技趋势和发展，通过组织讲座、实验和项目，鼓励社团成员深入研究和应用科学技术。在科技社，你可以与其他科技爱好者一起分享想法、探讨问题，并共同努力推动科技的进步。');

-- ----------------------------
-- Table structure for clubapply
-- ----------------------------
DROP TABLE IF EXISTS `clubapply`;
CREATE TABLE `clubapply`  (
  `clubname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applyreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clubapply
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime NOT NULL,
  `userName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `club_id` int NOT NULL,
  `comment_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `comments_ibfk_1`(`club_id` ASC) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('电竞社真的是非常好的一个社团！！', '2023-06-13 00:00:00', '张三', 1, 1);
INSERT INTO `comments` VALUES ('非常好！', '2023-06-13 19:02:59', '雷恩熙', 1, 2);
INSERT INTO `comments` VALUES ('我喜欢！', '2023-06-13 19:08:48', '陈英杰', 1, 3);
INSERT INTO `comments` VALUES ('都是美女！', '2023-06-13 19:23:31', '陈英杰', 4, 5);
INSERT INTO `comments` VALUES ('nice', '2023-06-13 19:32:25', '莫航', 1, 12);
INSERT INTO `comments` VALUES ('我爱滑板！', '2023-06-13 20:00:16', '莫航', 3, 14);
INSERT INTO `comments` VALUES ('我爱滑板', '2023-06-13 20:01:20', '莫航', 1, 15);
INSERT INTO `comments` VALUES ('我天天滑滑板', '2023-06-13 20:01:56', '莫航', 1, 16);
INSERT INTO `comments` VALUES ('撒旦发射点发射点', '2023-06-13 20:04:34', '莫航', 1, 17);
INSERT INTO `comments` VALUES ('最后一次测试', '2023-06-13 20:05:30', '莫航', 1, 18);
INSERT INTO `comments` VALUES ('sdfsd ', '2023-06-13 20:08:25', '莫航', 3, 19);
INSERT INTO `comments` VALUES ('hello world!', '2023-06-13 20:20:30', '莫航', 3, 20);
INSERT INTO `comments` VALUES ('1111test！,,', '2023-06-15 21:40:10', '莫航', 4, 22);
INSERT INTO `comments` VALUES ('joidsjfiosdf', '2023-06-16 10:17:52', '就今山', 3, 23);
INSERT INTO `comments` VALUES ('我喜欢下围棋。', '2023-06-19 18:54:41', '梦幻之舞', 2, 24);
INSERT INTO `comments` VALUES ('啦啊啦啦啦拉拉', '2023-06-19 18:54:50', '梦幻之舞', 2, 25);
INSERT INTO `comments` VALUES ('test他推特他他', '2023-06-19 18:54:55', '梦幻之舞', 2, 26);

-- ----------------------------
-- Table structure for management
-- ----------------------------
DROP TABLE IF EXISTS `management`;
CREATE TABLE `management`  (
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `management` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`email`) USING BTREE,
  INDEX `name_2`(`name` ASC) USING BTREE,
  INDEX `name`(`name` ASC, `email` ASC) USING BTREE,
  INDEX `management_ibfk_2`(`management` ASC) USING BTREE,
  CONSTRAINT `management_ibfk_2` FOREIGN KEY (`management`) REFERENCES `club` (`club_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `management_ibfk_3` FOREIGN KEY (`name`, `email`) REFERENCES `users` (`name`, `email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management
-- ----------------------------
INSERT INTO `management` VALUES ('辰辰', '2sdf511@qq.com', '棋牌社');
INSERT INTO `management` VALUES ('陈建国', 'chenjianguo@qq.com', '艺术窝');
INSERT INTO `management` VALUES ('陈思婷', 'chensiting@qq.com', '科技社');
INSERT INTO `management` VALUES ('陈英杰', 'chenyinjie@163.com', '滑板社');
INSERT INTO `management` VALUES ('黄翔宇', 'huangxiangyu@qq.com', '书香会');
INSERT INTO `management` VALUES ('雷恩熙', 'leienxi@qq.com', '舞蹈社');
INSERT INTO `management` VALUES ('林佳琳', 'linjialin@qq.com', '乐活社');
INSERT INTO `management` VALUES ('刘晓梅', 'liuxiaomei@qq.com', '日漫社');
INSERT INTO `management` VALUES ('李小红', 'lixiaohong@qq.com', '掌机社');
INSERT INTO `management` VALUES ('莫航', 'mhangggggg@gmail.com', '电竞社');
INSERT INTO `management` VALUES ('王小明', 'wangxiaoming@qq.com', '动漫社');
INSERT INTO `management` VALUES ('吴静雅', 'wujingya@qq.com', '美食社');
INSERT INTO `management` VALUES ('吴孟达', 'wumengda@qq.com', '棒球社');
INSERT INTO `management` VALUES ('张伟华', 'zhangweihua@qq.com', '福瑞社');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `socialClub` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE,
  INDEX `name`(`name` ASC, `telephone` ASC, `email` ASC) USING BTREE,
  INDEX `name_2`(`name` ASC, `email` ASC) USING BTREE,
  INDEX `users_ibfk_1`(`socialClub` ASC) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`socialClub`) REFERENCES `club` (`club_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('王君', '1367526566556', '26516511@qq.com', '666666', '舞蹈社');
INSERT INTO `users` VALUES ('辰辰', '123456789', '2sdf511@qq.com', '16156161', '棋牌社');
INSERT INTO `users` VALUES ('陈建国', '13567891234', 'chenjianguo@qq.com', 'Pass123word', '艺术窝');
INSERT INTO `users` VALUES ('陈思婷', '13912348765', 'chensiting@qq.com', 'S1tingLove', '科技社');
INSERT INTO `users` VALUES ('陈英杰', '52565689982', 'chenyinjie@163.com', 'sdfsdf5254', '滑板社');
INSERT INTO `users` VALUES ('士大夫', '15161651515', 'fdsffd@gmail.com', 'sdfsdfsdfdf', '电竞社');
INSERT INTO `users` VALUES ('黄翔宇', '13112345678', 'huangxiangyu@qq.com', 'P@ssw0rd789', '书香会');
INSERT INTO `users` VALUES ('就今山', '1559595955452', 'jsfoii@qq.com', 'dsf sd', '滑板社');
INSERT INTO `users` VALUES ('雷恩熙', '12131356650', 'leienxi@qq.com', '203254', '舞蹈社');
INSERT INTO `users` VALUES ('林佳琳', '13398765432', 'linjialin@qq.com', '4567890Ab', '乐活社');
INSERT INTO `users` VALUES ('刘晓梅', '13612341234', 'liuxiaomei@qq.com', 'Summer2023', '日漫社');
INSERT INTO `users` VALUES ('李小红', '13798765432', 'lixiaohong@qq.com', 'Password123', '掌机社');
INSERT INTO `users` VALUES ('莫航', '19338025490', 'mhangggggg@gmail.com', '6666', '电竞社');
INSERT INTO `users` VALUES ('梦幻之舞', '5151655555', 'test1@qq.com', 'test1', NULL);
INSERT INTO `users` VALUES ('僵尸先生', '2652662622', 'test2@qq.com', 'test2', NULL);
INSERT INTO `users` VALUES ('饺子', '62626255', 'test3@qq.com', 'test3', NULL);
INSERT INTO `users` VALUES ('王晶', '565954551', 'wangjing@qq.com', 'dsff54988', '棒球社');
INSERT INTO `users` VALUES ('王小明', '13812345678', 'wangxiaoming@qq.com', 'Abc12345', '动漫社');
INSERT INTO `users` VALUES ('吴静雅', '13098765432', 'wujingya@qq.com', 'Qwerty123!', '美食社');
INSERT INTO `users` VALUES ('吴孟达', '2151566565', 'wumengda@qq.com', '2102456fsdf', '棒球社');
INSERT INTO `users` VALUES ('许明阳', '13787651234', 'xumingyang@qq.com', 'Sunshine789', '掌机社');
INSERT INTO `users` VALUES ('张伟华', '13987654321', 'zhangweihua@qq.com', 'Hello1234', '福瑞社');
INSERT INTO `users` VALUES ('周星驰', '125549985', 'zhouxingchi@qq.com', '0316622', '电竞社');

SET FOREIGN_KEY_CHECKS = 1;
