/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost:3307
 Source Schema         : message_board_db

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 05/06/2022 21:13:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message_board_detail
-- ----------------------------
DROP TABLE IF EXISTS `message_board_detail`;
CREATE TABLE `message_board_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级ID',
  `user_id` int(11) NOT NULL COMMENT '用户主键ID',
  `message_content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户发布消息内容',
  `released_time` datetime(0) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '留言板明细内容' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of message_board_detail
-- ----------------------------
INSERT INTO `message_board_detail` VALUES (1, NULL, 1, '第一条信息', '2022-06-05 10:36:00');
INSERT INTO `message_board_detail` VALUES (21, 1, 1, '第一条子消息', '2022-06-05 08:02:34');
INSERT INTO `message_board_detail` VALUES (22, 21, 1, '第二条子消息', '2022-06-05 08:02:45');
INSERT INTO `message_board_detail` VALUES (23, NULL, 1, '第二条平级消息', '2022-06-05 08:02:59');
INSERT INTO `message_board_detail` VALUES (24, 1, 1, 'qweqweqweqwe', '2022-06-05 08:49:23');
INSERT INTO `message_board_detail` VALUES (25, 24, 1, 'asdasd小自产自销阿萨德啊', '2022-06-05 08:49:39');
INSERT INTO `message_board_detail` VALUES (26, 25, 1, '请问企鹅', '2022-06-05 09:20:16');
INSERT INTO `message_board_detail` VALUES (27, 26, 1, '请问大象', '2022-06-05 09:21:00');
INSERT INTO `message_board_detail` VALUES (28, 23, 1, '撒大声地阿打算大声道as的撒', '2022-06-05 09:21:15');
INSERT INTO `message_board_detail` VALUES (29, 23, 1, '122222222222222222', '2022-06-05 09:21:26');
INSERT INTO `message_board_detail` VALUES (30, 27, 1, 'sad撒多阿萨德sad阿萨德阿萨德', '2022-06-05 09:29:03');
INSERT INTO `message_board_detail` VALUES (31, 30, 1, '自行车自行车阿萨是', '2022-06-05 09:29:57');
INSERT INTO `message_board_detail` VALUES (32, 31, 1, 'sdasdasdasd', '2022-06-05 09:32:31');
INSERT INTO `message_board_detail` VALUES (33, 29, 1, '12312', '2022-06-05 09:34:17');
INSERT INTO `message_board_detail` VALUES (34, 29, 1, 'asda', '2022-06-05 09:37:08');
INSERT INTO `message_board_detail` VALUES (35, 29, 1, '1', '2022-06-05 09:37:19');
INSERT INTO `message_board_detail` VALUES (36, 28, 1, 'qwewqeqwe', '2022-06-05 09:37:55');
INSERT INTO `message_board_detail` VALUES (37, 32, 1, 'zxczxczcx', '2022-06-05 09:47:11');
INSERT INTO `message_board_detail` VALUES (38, NULL, 1, 'asdadadasdsada', '2022-06-05 09:47:16');
INSERT INTO `message_board_detail` VALUES (39, NULL, 1, 'asdasdasdasd', '2022-06-05 09:47:35');
INSERT INTO `message_board_detail` VALUES (40, 24, 2, 'qwewqeqeqwe', '2022-06-05 09:49:51');
INSERT INTO `message_board_detail` VALUES (41, 25, 2, 'qwewqewqeqe', '2022-06-05 09:49:59');
INSERT INTO `message_board_detail` VALUES (42, 27, 2, '21212313', '2022-06-05 09:52:39');
INSERT INTO `message_board_detail` VALUES (43, 30, 2, 'sadasdasdas', '2022-06-05 09:53:12');
INSERT INTO `message_board_detail` VALUES (44, 36, 2, 'asdasdasdasda', '2022-06-05 09:54:08');
INSERT INTO `message_board_detail` VALUES (45, 34, 2, 'sdasdasdad', '2022-06-05 09:54:15');
INSERT INTO `message_board_detail` VALUES (46, 38, 2, 'asdasdasdad', '2022-06-05 09:54:19');
INSERT INTO `message_board_detail` VALUES (47, 25, 2, 'asdasdsadad', '2022-06-05 09:54:27');
INSERT INTO `message_board_detail` VALUES (48, 24, 2, 'qweqweqe', '2022-06-05 09:54:43');
INSERT INTO `message_board_detail` VALUES (49, 25, 2, 'qweqeqeq', '2022-06-05 09:54:48');
INSERT INTO `message_board_detail` VALUES (50, 48, 2, 'asasdadasdasdasd', '2022-06-05 09:55:04');
INSERT INTO `message_board_detail` VALUES (51, 24, 1, 'asdasdasdad', '2022-06-05 09:58:00');
INSERT INTO `message_board_detail` VALUES (52, 24, 1, 'asdasdasdad', '2022-06-05 09:58:05');
INSERT INTO `message_board_detail` VALUES (53, 24, 1, 'asdasdasdad', '2022-06-05 09:58:12');
INSERT INTO `message_board_detail` VALUES (54, 24, 1, 'asdasdasdad', '2022-06-05 09:58:16');
INSERT INTO `message_board_detail` VALUES (55, 24, 1, 'asdasdasdad', '2022-06-05 09:58:18');
INSERT INTO `message_board_detail` VALUES (56, 24, 1, 'asdasdasdad', '2022-06-05 09:58:27');
INSERT INTO `message_board_detail` VALUES (57, 24, 1, 'asdasdasdad', '2022-06-05 09:58:35');
INSERT INTO `message_board_detail` VALUES (58, 24, 1, 'asdasdasdad', '2022-06-05 09:58:38');
INSERT INTO `message_board_detail` VALUES (59, 24, 1, 'asdasdasdad', '2022-06-05 09:58:46');
INSERT INTO `message_board_detail` VALUES (60, 1, 3, 'qweqwewqeq', '2022-06-05 10:10:03');
INSERT INTO `message_board_detail` VALUES (61, 60, 3, 'qweqweqewq', '2022-06-05 10:10:12');
INSERT INTO `message_board_detail` VALUES (62, 58, 3, 'sadsadasdada', '2022-06-05 10:10:19');
INSERT INTO `message_board_detail` VALUES (63, 56, 3, 'asdsadsadsadada', '2022-06-05 10:10:25');
INSERT INTO `message_board_detail` VALUES (64, 60, 1, 'wqeqweq', '2022-06-05 10:58:58');
INSERT INTO `message_board_detail` VALUES (65, 60, 1, 'qweqwe', '2022-06-05 10:59:44');
INSERT INTO `message_board_detail` VALUES (66, 61, 1, 'qwewqe', '2022-06-05 11:00:01');
INSERT INTO `message_board_detail` VALUES (67, 60, 1, 'qweqweqeq', '2022-06-05 11:03:10');
INSERT INTO `message_board_detail` VALUES (68, 60, 1, 'qweqweqeqzczxc', '2022-06-05 11:03:15');
INSERT INTO `message_board_detail` VALUES (69, 60, 1, 'qwewqeqe', '2022-06-05 11:03:26');
INSERT INTO `message_board_detail` VALUES (70, 60, 1, 'qwewqeqe', '2022-06-05 11:03:34');
INSERT INTO `message_board_detail` VALUES (71, 60, 1, 'qwewqeqe', '2022-06-05 11:03:43');
INSERT INTO `message_board_detail` VALUES (72, 60, 1, 'qweqeqe1212321321', '2022-06-05 11:04:15');
INSERT INTO `message_board_detail` VALUES (73, 60, 1, '12321313', '2022-06-05 11:04:22');
INSERT INTO `message_board_detail` VALUES (74, 60, 1, '123123123qweqwe\n', '2022-06-05 11:05:00');
INSERT INTO `message_board_detail` VALUES (75, 60, 1, 'asdasdasdsadsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2022-06-05 11:05:13');
INSERT INTO `message_board_detail` VALUES (76, 74, 1, 'xzczxczczxczxzczxcxzczxcxzczx', '2022-06-05 11:05:26');
INSERT INTO `message_board_detail` VALUES (77, 74, 1, 'asdadasdasdadasdada', '2022-06-05 11:05:33');
INSERT INTO `message_board_detail` VALUES (78, 77, 1, '请问企鹅群翁', '2022-06-05 11:07:58');
INSERT INTO `message_board_detail` VALUES (79, 78, 1, '湿哒哒所多as大师大师打实打实多阿萨德', '2022-06-05 11:08:02');
INSERT INTO `message_board_detail` VALUES (80, 1, 1, '一身转战三千里，一剑曾当百万师。', '2022-06-05 11:08:36');
INSERT INTO `message_board_detail` VALUES (81, 80, 1, '男儿何不带吴钩，收取关山五十州？', '2022-06-05 11:08:43');
INSERT INTO `message_board_detail` VALUES (82, 81, 1, '生当作人杰，死亦为鬼雄。', '2022-06-05 11:08:50');
INSERT INTO `message_board_detail` VALUES (83, 82, 1, '醉卧沙场君莫笑，古来征战几人回？', '2022-06-05 11:08:57');
INSERT INTO `message_board_detail` VALUES (84, 83, 1, '相逢意气为君饮，系马高楼垂柳边', '2022-06-05 11:09:05');
INSERT INTO `message_board_detail` VALUES (85, 83, 1, '要看银山拍天浪,开窗放入大江来。', '2022-06-05 11:09:14');
INSERT INTO `message_board_detail` VALUES (86, 84, 1, '二三星斗胸前落，十万峰峦脚底青。', '2022-06-05 11:09:23');
INSERT INTO `message_board_detail` VALUES (87, 86, 1, '大鹏一日同风起，扶摇直上九万里。', '2022-06-05 11:09:32');
INSERT INTO `message_board_detail` VALUES (88, 87, 1, '黄沙百战穿金甲，不破楼兰终不还。', '2022-06-05 11:09:39');
INSERT INTO `message_board_detail` VALUES (89, 88, 1, '傲世世间无天险，大江东去去不还。', '2022-06-05 11:09:46');
INSERT INTO `message_board_detail` VALUES (90, 89, 1, '楚天不断四时雨，巫峡长吹千里风。', '2022-06-05 11:09:53');
INSERT INTO `message_board_detail` VALUES (91, 90, 1, '一万年来谁著史，三千里外欲封侯。<img src=\"https://pica.zhimg.com/50/v2-238e23608a66f19cdf072daf0d1203b2_720w.jpg?source=1940ef5c\" data-caption=\"\" data-size=\"normal\" data-rawwidth=\"400\" data-rawheight=\"400\" data-defau', '2022-06-05 11:10:01');
INSERT INTO `message_board_detail` VALUES (92, 91, 1, '钟山风雨起苍黄,百万雄师过大江。', '2022-06-05 11:10:09');
INSERT INTO `message_board_detail` VALUES (93, 92, 1, '生当作人杰，死亦为鬼雄', '2022-06-05 11:10:15');
INSERT INTO `message_board_detail` VALUES (94, 93, 1, '尔曹身与名俱灭，不废江河万古流', '2022-06-05 11:10:22');
INSERT INTO `message_board_detail` VALUES (95, 94, 1, '五更鼓角声悲壮，三峡星河影动摇', '2022-06-05 11:10:30');
INSERT INTO `message_board_detail` VALUES (96, 95, 1, '江流天地外,山色有无中。', '2022-06-05 11:10:36');
INSERT INTO `message_board_detail` VALUES (97, 96, 1, '壮志饥餐胡虏肉，笑谈渴饮匈奴血。', '2022-06-05 11:10:44');
INSERT INTO `message_board_detail` VALUES (98, 97, 1, '十年磨一剑， 霜寒未曾试。', '2022-06-05 11:10:57');
INSERT INTO `message_board_detail` VALUES (99, 98, 1, '杀尽江南百万兵，腰间宝剑血犹腥。', '2022-06-05 11:11:03');
INSERT INTO `message_board_detail` VALUES (100, 99, 1, '仰天大笑出门去，我辈岂是蓬蒿人。', '2022-06-05 11:11:10');
INSERT INTO `message_board_detail` VALUES (101, 100, 1, '竟然邀请我这个知乎小白耶！那就意识流想到哪写到哪吧～\n\n气势磅礴，必须是我们李白大大冲在前线啊！\n\n弃我去者，昨日之日不可留。乱我心者，今日之日多烦忧。\n\n君不见黄河之水天上来， 奔流到海不复回。\n\n…太多了，太多了……\n\n然后就想到《登幽州台歌》', '2022-06-05 11:11:20');
INSERT INTO `message_board_detail` VALUES (102, 80, 2, '爱仕达大所大所大实打实大师阿萨德', '2022-06-05 11:12:04');
INSERT INTO `message_board_detail` VALUES (103, 81, 2, '　鹧鸪天 ——秋瑾\n　　 \n　　祖国沉沦感不禁，闲来海外觅知音。 \n　　 \n　　金瓯已缺总须补，为国牺牲敢惜身。 \n　　 \n　　嗟险阻，叹飘零，关山万里作雄行。 \n　　 \n　　休言女子非英物，夜夜龙泉壁上鸣', '2022-06-05 11:12:36');
INSERT INTO `message_board_detail` VALUES (104, 83, 2, '黄海舟中日人索句并见日俄战争地图 ——秋瑾\n　　 \n　　万里乘云去复来，只身东海挟春雷。 \n　　忍看图画移颜色，肯使江山付劫灰。 \n　　浊酒不销忧国泪，救时应仗出群才。 \n　　拼将十万头颅血，须把乾坤力挽回。 ', '2022-06-05 11:12:50');
INSERT INTO `message_board_detail` VALUES (105, 90, 1, '寂寞空庭春欲晚，满地梨花不开门。——刘方平《春怨》', '2022-06-05 11:41:28');
INSERT INTO `message_board_detail` VALUES (106, 101, 1, '万里清江万里天，一村桑柘一村烟。——韩偓《醉著》', '2022-06-05 11:41:41');
INSERT INTO `message_board_detail` VALUES (107, 106, 1, '水月通禅寂，鱼龙听梵声。——钱起《送僧归日本》', '2022-06-05 11:41:47');
INSERT INTO `message_board_detail` VALUES (108, 107, 1, '花开花落不长久，落红满地归寂中。——陈叔宝《玉树后庭花》', '2022-06-05 11:41:55');
INSERT INTO `message_board_detail` VALUES (109, 108, 1, '秋风生渭水，落叶满长安。——贾岛《忆江上吴处士》\n', '2022-06-05 11:42:03');
INSERT INTO `message_board_detail` VALUES (110, 109, 1, '客子光阴诗卷里，杏花消息雨声中。——陈与义《怀天经智老因访之》', '2022-06-05 11:42:10');
INSERT INTO `message_board_detail` VALUES (111, 110, 1, '细雨湿流光，芳草年年与恨长。——冯延巳《南乡子》', '2022-06-05 11:42:17');
INSERT INTO `message_board_detail` VALUES (112, 111, 1, '.白云千里万里，明月前溪后溪。——刘长卿《谪仙怨》', '2022-06-05 11:42:27');
INSERT INTO `message_board_detail` VALUES (113, 112, 1, '漠漠梨花烂漫，纷纷柳絮飞残。——陈允平《红林擒近·寿词·满路花》', '2022-06-05 11:42:34');
INSERT INTO `message_board_detail` VALUES (114, 113, 1, '酒醒明月下，梦逐潮声去。——姜夔《玲珑四犯·越中岁暮闻箫鼓感怀》', '2022-06-05 11:42:41');
INSERT INTO `message_board_detail` VALUES (115, 114, 1, '高树月初白，微风酒半醒。独行穿落叶，闲坐数流萤。——林景熙《溪亭》', '2022-06-05 11:42:48');
INSERT INTO `message_board_detail` VALUES (116, 115, 1, '啼鸟云山静，落花溪水香。——戴叔伦《雨》', '2022-06-05 11:42:55');
INSERT INTO `message_board_detail` VALUES (117, 116, 1, '一树梨花一溪月，不知今夜属何人？——《杂诗》', '2022-06-05 11:43:01');
INSERT INTO `message_board_detail` VALUES (118, 117, 1, '就船买得鱼偏美，踏雪沽来酒倍香。——杜荀鹤《冬末同友人泛潇湘》', '2022-06-05 11:43:07');
INSERT INTO `message_board_detail` VALUES (119, 118, 1, '尘中见月心亦闲，况是清秋仙府间。——刘禹锡《八月十五夜桃源玩月》', '2022-06-05 11:43:17');
INSERT INTO `message_board_detail` VALUES (120, 1, 4, '我来啦', '2022-06-05 11:46:37');

-- ----------------------------
-- Table structure for sys_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_userinfo`;
CREATE TABLE `sys_userinfo`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `enable` smallint(255) NOT NULL DEFAULT 0 COMMENT '是否可用',
  `head_portrait` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_userinfo
-- ----------------------------
INSERT INTO `sys_userinfo` VALUES (1, 'Fengqixian1996', '570311238@qq.com', '6e11ec3384b83f1c168331f467725e18f0c07a7515419e1479711d1fcd4aab06', 0, '20220604173625.png');
INSERT INTO `sys_userinfo` VALUES (2, 'Ceshi123', '7855121@qq.com', 'e2d160b0ffbfadc23d69a30207816223a81860db00e07bb19744905e344ad521', 0, '20220604173446.png');
INSERT INTO `sys_userinfo` VALUES (3, 'sad1232', '5703123@qq.com', 'e2d160b0ffbfadc23d69a30207816223a81860db00e07bb19744905e344ad521', 0, '20220604173542.png');
INSERT INTO `sys_userinfo` VALUES (4, '7788Ceshi', '7788@qq.com', '4a52df26d114f13254be0da6c574c20b0b8889bef7e64ec53162a48e3739e396', 0, '20220604173625.png');

SET FOREIGN_KEY_CHECKS = 1;
