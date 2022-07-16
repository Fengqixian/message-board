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

 Date: 16/07/2022 11:38:48
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
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '留言板明细内容' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of message_board_detail
-- ----------------------------
INSERT INTO `message_board_detail` VALUES (1, 0, 1, 'Time tries all.', '2022-06-05 10:36:00');
INSERT INTO `message_board_detail` VALUES (21, 1, 1, '第一条子消息', '2022-06-05 08:02:34');
INSERT INTO `message_board_detail` VALUES (22, 21, 1, '第二条子消息', '2022-06-05 08:02:45');
INSERT INTO `message_board_detail` VALUES (23, 0, 1, '第二条平级消息', '2022-06-05 08:02:59');
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
INSERT INTO `message_board_detail` VALUES (159, 119, 1, '江上往来人，但爱鲈鱼美。\n\n君看一叶舟，出没风波里', '2022-06-09 15:19:21');
INSERT INTO `message_board_detail` VALUES (160, 159, 1, '墙角数枝梅，凌寒独自开。\n\n遥知不是雪，为有暗香来。', '2022-06-09 15:19:30');
INSERT INTO `message_board_detail` VALUES (161, 160, 1, '春阴垂野草青青，\n\n时有幽花一树明。\n\n晚泊孤舟古祠下，\n\n满川风雨看潮生。', '2022-06-09 15:19:38');
INSERT INTO `message_board_detail` VALUES (162, 161, 1, '京口瓜洲一水间，钟山只隔数重山。\n\n春风又绿江南岸，明月何时照我还？', '2022-06-09 15:19:49');
INSERT INTO `message_board_detail` VALUES (163, 162, 1, '茅檐长扫净无苔，\n\n花木成畦手自栽。\n\n一水护田将绿绕，\n\n两山排闼送青来。', '2022-06-09 15:19:59');
INSERT INTO `message_board_detail` VALUES (164, 163, 1, '飞来山上千寻塔，\n\n闻说鸡鸣见日升。\n\n不畏浮云遮望眼，\n\n自缘身在最高层。', '2022-06-09 15:20:09');
INSERT INTO `message_board_detail` VALUES (165, 164, 1, '横看成岭侧成峰，\n\n远近高低各不同。\n\n不识庐山真面目，\n\n只缘身在此山中。', '2022-06-09 15:20:18');
INSERT INTO `message_board_detail` VALUES (166, 165, 1, '荷尽已无擎雨盖，\n\n菊残犹有傲霜枝。\n\n一年好景君须记，\n\n正是橙黄橘绿时。', '2022-06-09 15:20:26');
INSERT INTO `message_board_detail` VALUES (167, 166, 1, '云淡风轻近午天，\n\n傍花随柳过前川。\n\n时人不识余心乐，\n\n将谓偷闲学少年。', '2022-06-09 15:20:34');
INSERT INTO `message_board_detail` VALUES (168, 167, 1, '四顾山光接水光，\n\n凭栏十里芰荷香。\n\n清风明月无人管，\n\n并作南楼一味凉', '2022-06-09 15:20:42');
INSERT INTO `message_board_detail` VALUES (169, 168, 1, '梅子金黄杏子肥，\n\n麦花雪白菜花稀。\n\n日长篱落无人过，\n\n惟有蜻蜓蛱蝶飞。', '2022-06-09 15:20:51');
INSERT INTO `message_board_detail` VALUES (170, 169, 1, '篱落疏疏一径深，\n\n树头花落未成阴。\n\n儿童急走追黄蝶，\n\n飞入菜花无处寻', '2022-06-09 15:20:58');
INSERT INTO `message_board_detail` VALUES (171, 170, 1, '应怜屐齿印苍苔，\n\n小扣柴扉久不开。\n\n春色满园关不住，\n\n一枝红杏出墙来。', '2022-06-09 15:21:07');
INSERT INTO `message_board_detail` VALUES (172, 171, 1, '山外青山楼外楼，\n\n西湖歌舞几时休？\n\n暖风熏得游人醉，\n\n直把杭州作汴州。', '2022-06-09 15:21:14');
INSERT INTO `message_board_detail` VALUES (173, 172, 1, '适与野情惬，千山高复低。\n\n好峰随处改，幽径独行迷。\n\n霜落熊升树，林空鹿饮溪。', '2022-06-09 15:21:22');
INSERT INTO `message_board_detail` VALUES (174, 173, 1, '马穿山径菊初黄，信马悠悠野兴长。\n\n万壑有声含晚籁，数峰无语立斜阳。\n\n棠梨叶落胭脂色，荞麦花开白雪香。\n\n何事吟余忽惆怅，村桥原树似吾乡。', '2022-06-09 15:21:29');
INSERT INTO `message_board_detail` VALUES (175, 174, 1, '众芳摇落独暄妍，占尽风情向小园。\n\n疏影横斜水清浅，暗香浮动月黄昏。\n\n霜禽欲下先偷眼，粉蝶如知合断魂。\n\n幸有微吟可相狎，不须檀板共金樽。', '2022-06-09 15:21:37');
INSERT INTO `message_board_detail` VALUES (176, 175, 1, '痴儿了却公家事，快阁东西倚晚晴。\n\n落木千山天远大，澄江一道月分明。\n\n朱弦已为佳人绝，青眼聊因美酒横。\n\n万里归船弄长笛，此心吾与白鸥盟。', '2022-06-09 15:21:46');
INSERT INTO `message_board_detail` VALUES (177, 1, 8, '请问', '2022-06-10 05:57:21');
INSERT INTO `message_board_detail` VALUES (178, 177, 8, '123213', '2022-07-16 03:37:11');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户基本信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_userinfo
-- ----------------------------
INSERT INTO `sys_userinfo` VALUES (1, 'Fengqixian1996', '570311238@qq.com', '6e11ec3384b83f1c168331f467725e18f0c07a7515419e1479711d1fcd4aab06', 0, '20220604173625.png');
INSERT INTO `sys_userinfo` VALUES (2, 'Ceshi123', '7855121@qq.com', 'e2d160b0ffbfadc23d69a30207816223a81860db00e07bb19744905e344ad521', 0, '20220604173446.png');
INSERT INTO `sys_userinfo` VALUES (3, 'sad1232', '5703123@qq.com', 'e2d160b0ffbfadc23d69a30207816223a81860db00e07bb19744905e344ad521', 0, '20220604173542.png');
INSERT INTO `sys_userinfo` VALUES (4, '7788Ceshi', '7788@qq.com', '4a52df26d114f13254be0da6c574c20b0b8889bef7e64ec53162a48e3739e396', 0, '20220604173625.png');
INSERT INTO `sys_userinfo` VALUES (5, 'Fqq123', '5555@qq.com', 'b4949c8737519d56b2f929429a5d3348130c1c8f103aa8fdbe84f3709e15738d', 0, '20220604173625.png');
INSERT INTO `sys_userinfo` VALUES (6, 'A12342', 'Fqx@qq.com', '6e11ec3384b83f1c168331f467725e18f0c07a7515419e1479711d1fcd4aab06', 0, '20220604173653.png');
INSERT INTO `sys_userinfo` VALUES (7, 'A12342A', 'Fqx@qq.com', '6e11ec3384b83f1c168331f467725e18f0c07a7515419e1479711d1fcd4aab06', 0, '20220604173542.png');
INSERT INTO `sys_userinfo` VALUES (8, 'Fengqixian1996A123', 'Abc123456@qq.cim', 'e2d160b0ffbfadc23d69a30207816223a81860db00e07bb19744905e344ad521', 0, '20220604173542.png');
INSERT INTO `sys_userinfo` VALUES (9, 'test111', 'adasffaf@qq.com', '0fadf52a4580cfebb99e61162139af3d3a6403c1d36b83e4962b721d1c8cbd0b', 0, '20220604173542.png');

SET FOREIGN_KEY_CHECKS = 1;
