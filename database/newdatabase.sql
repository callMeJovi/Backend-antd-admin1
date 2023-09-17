-- phpMyAdmin SQL Dump

-- version 5.1.1

-- https://www.phpmyadmin.net/

--

-- 主机： 127.0.0.1

-- 生成日期： 2022-07-29 12:57:42

-- 服务器版本： 10.4.21-MariaDB

-- PHP 版本： 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

--

-- 数据库： `newdatabase`

--

-- --------------------------------------------------------

--

-- 表的结构 `city`

--

CREATE TABLE
    `city` (
        `id` int(11) NOT NULL,
        `label` text NOT NULL,
        `value` text NOT NULL,
        `pid` int(11) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `city`

--

INSERT INTO
    `city` (`id`, `label`, `value`, `pid`)
VALUES (11, '南京', 'nanjig', 1), (12, '苏州', 'suzhou', 1), (21, '杭州', 'hangzhou', 2), (22, '温州', 'wenzhou', 2), (11, '南京', 'nanjig', 1), (12, '苏州', 'suzhou', 1), (21, '杭州', 'hangzhou', 2), (22, '温州', 'wenzhou', 2);

-- --------------------------------------------------------

--

-- 表的结构 `hotwords`

--

CREATE TABLE
    `trending` (
        `name` text NOT NULL,
        `value` int(11) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `hotwords`

--

INSERT INTO
    `trending` (`name`, `value`)
VALUES ('iPhone', 2000), ('手机', 8000), ('键盘', 2560), ('耳机', 5000), ('运动鞋', 10000), ('李宁', 7100), ('安踏', 7100), ('无线耳机', 6000), ('抽纸', 3600), ('洗衣液', 4800), ('游戏键盘', 5000), ('零食', 2600), ('nike', 2300), ('iPhone', 2000), ('手机', 8000), ('键盘', 2560), ('耳机', 5000), ('运动鞋', 10000), ('李宁', 7100), ('安踏', 7100), ('无线耳机', 6000), ('抽纸', 3600), ('洗衣液', 4800), ('游戏键盘', 5000), ('零食', 2600), ('nike', 2300);

-- --------------------------------------------------------

--

-- 表的结构 `mapsales`

--

CREATE TABLE
    `mapsales` (
        `name` text NOT NULL,
        `lng` text NOT NULL,
        `lat` text NOT NULL,
        `value` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `mapsales`

--

INSERT INTO
    `mapsales` (`name`, `lng`, `lat`, `value`)
VALUES (
        '山东',
        '117.000923\r\n',
        '36.675807\r\n',
        '2000'
    ), (
        '河北',
        '114.502461\r\n',
        '38.045474\r\n',
        '1000'
    ), (
        '安徽',
        '117.283042\r\n',
        '31.86119\r\n',
        '3000'
    ), (
        '陕西',
        '108.948024\r\n',
        '34.263161\r\n',
        '3000'
    ), (
        '江苏',
        '118.767413\r\n\r\n',
        '32.041544',
        '5000'
    ), (
        '山东',
        '117.000923\r\n',
        '36.675807\r\n',
        '2000'
    ), (
        '河北',
        '114.502461\r\n',
        '38.045474\r\n',
        '1000'
    ), (
        '安徽',
        '117.283042\r\n',
        '31.86119\r\n',
        '3000'
    ), (
        '陕西',
        '108.948024\r\n',
        '34.263161\r\n',
        '3000'
    ), (
        '江苏',
        '118.767413\r\n\r\n',
        '32.041544',
        '5000'
    );

-- --------------------------------------------------------

--

-- 表的结构 `menu`

--

CREATE TABLE
    `menu` (
        `id` int(11) NOT NULL,
        `pid` int(11) NOT NULL,
        `name` text NOT NULL,
        `linkUrl` text NOT NULL,
        `openType` text NOT NULL,
        `icon` text NOT NULL,
        `isOfAdmin` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `menu`

--

INSERT INTO
    `menu` (
        `id`,
        `pid`,
        `name`,
        `linkUrl`,
        `openType`,
        `icon`,
        `isOfAdmin`
    )
VALUES (
        5,
        -1,
        '系统设置',
        '/',
        '1',
        'SettingOutlined',
        '1'
    ), (
        12,
        5,
        '菜单管理',
        '/setting/menu',
        '1',
        'AlignLeftOutlined',
        '1'
    ), (
        23,
        5,
        '用户管理',
        '/setting/user',
        '1',
        'UserOutlined',
        '1'
    ), (
        24,
        -1,
        '业务管理',
        '/',
        '1',
        'AimOutlined',
        '2'
    ), (
        25,
        24,
        '商品管理',
        '/business/product',
        '1',
        'GiftOutlined',
        '2'
    ), (
        26,
        24,
        '业务概览',
        '/business/overview',
        '1',
        'EyeOutlined',
        '2'
    );

-- --------------------------------------------------------

--

-- 表的结构 `product`

--

CREATE TABLE
    `product` (
        `id` int(11) NOT NULL,
        `name` text NOT NULL,
        `type` text NOT NULL,
        `attrs` text NOT NULL,
        `mainPic` text DEFAULT NULL,
        `morePic` text DEFAULT NULL,
        `isOnShelf` text NOT NULL,
        `price` text DEFAULT NULL,
        `descs` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `product`

--

INSERT INTO
    `product` (
        `id`,
        `name`,
        `type`,
        `attrs`,
        `mainPic`,
        `morePic`,
        `isOnShelf`,
        `price`,
        `descs`
    )
VALUES (
        9,
        '耳机',
        '4',
        '[{\"key\":\"颜色\",\"value\":\"粉色\"},{\"key\":\"用途\",\"value\":\"学习\"}]',
        '\\upload\\1643096616332_61Kdho1yikS._AC_UL320_.jpg',
        '\\upload\\1643096618651_61Kdho1yikS._AC_UL320_.jpg',
        '1',
        '100',
        '<p>用途：学习，听歌<img src=\"\\upload\\1643096642355_61Kdho1yikS._AC_UL320_.jpg\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><p><br/></p>'
    ), (
        11,
        'react',
        '0',
        '[{\"key\":\"出版社\",\"value\":\"太阳出版社\"},{\"key\":\"版本\",\"value\":\"最新版\"}]',
        '\\upload\\1643098464374_51mWntLQ2PL._SX260_.jpg',
        '\\upload\\1643098466258_51mWntLQ2PL._SX260_.jpg',
        '1',
        '120',
        '<p>前端程序员必备</p>'
    ), (
        12,
        'nodejs',
        '0',
        '[{\"key\":\"出版社\",\"value\":\"太阳出版社\"}]',
        '\\upload\\1643098492991_B012A6EVCO.01._SCLZZZZZZZ_SX500_.jpg',
        NULL,
        '1',
        '80',
        '<p>前端程序员必备</p>'
    ), (
        15,
        '炫酷键盘',
        '4',
        '[{\"key\":\"颜色\",\"value\":\"彩虹色\"},{\"key\":\"用途\",\"value\":\"学习\"}]',
        '\\upload\\1643166650201_71cjIjAQMOL._AC_SL1500_.jpg',
        '\\upload\\1643166651976_71ArFTaUM0L._AC_SL1500_.jpg,\\upload\\1643166654606_71qI-ciyV8L._AC_UL320_.jpg',
        '1',
        '260',
        '<p>用途：<font color=\"#8baa4a\">学习，敲代码，玩游戏</font></p>'
    ), (
        18,
        '少女键盘1',
        '4',
        '[{\"key\":\"颜色\",\"value\":\"粉色\"},{\"key\":\"用途\",\"value\":\"学习\"}]',
        '\\upload\\1643169089760_61VfMDrYMmS._AC_SL1000_.jpg',
        '\\upload\\1643169092083_71EFyKbGtxS._AC_SL1200_.jpg,\\upload\\1643169094554_71tsyBRd4qS._AC_UL320_.jpg',
        '1',
        '100',
        '<p>用途：学习<img src=\"\\upload\\1643169083358_71EFyKbGtxS._AC_SL1200_.jpg\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p>'
    );

-- --------------------------------------------------------

--

-- 表的结构 `producttypesales`

--

CREATE TABLE
    `producttypesales` (
        `name` text NOT NULL,
        `value` int(11) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `producttypesales`

--

INSERT INTO
    `producttypesales` (`name`, `value`)
VALUES ('图书', 100000), ('数码', 300000), ('服装', 80000), ('电器', 500000), ('家具', 600000), ('食品', 100000), ('图书', 100000), ('数码', 300000), ('服装', 80000), ('电器', 500000), ('家具', 600000), ('食品', 100000);

-- --------------------------------------------------------

--

-- 表的结构 `province`

--

CREATE TABLE
    `province` (
        `id` int(11) NOT NULL,
        `label` text NOT NULL,
        `value` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `province`

--

INSERT INTO
    `province` (`id`, `label`, `value`)
VALUES (1, '江苏省', 'jiangsu'), (2, '浙江省', 'zhejiang');

-- --------------------------------------------------------

--

-- 表的结构 `region`

--

CREATE TABLE
    `region` (
        `id` int(11) NOT NULL,
        `pid` int(11) NOT NULL,
        `label` text NOT NULL,
        `value` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `region`

--

INSERT INTO
    `region` (`id`, `pid`, `label`, `value`)
VALUES (111, 11, '浦口区', 'pukou'), (112, 11, '建邺区', 'jianye'), (121, 12, '姑苏区', 'gusu'), (211, 21, '上城区', 'shangcheng'), (221, 22, '龙湾区', 'longwan');

-- --------------------------------------------------------

--

-- 表的结构 `salestop10`

--

CREATE TABLE
    `salestop10` (
        `name` text NOT NULL,
        `value` int(11) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `salestop10`

--

INSERT INTO
    `salestop10` (`name`, `value`)
VALUES ('百草味', 1000), ('维达', 1000), ('键盘', 2000), ('电脑', 2000), ('手机', 3000), ('化妆品', 4000), ('短靴', 5000), ('羊绒大衣', 6000), ('耳机', 8000), ('纸巾', 10000), ('百草味', 1000), ('维达', 1000), ('键盘', 2000), ('电脑', 2000), ('手机', 3000), ('化妆品', 4000), ('短靴', 5000), ('羊绒大衣', 6000), ('耳机', 8000), ('纸巾', 10000);

-- --------------------------------------------------------

--

-- 表的结构 `salestrend`

--

CREATE TABLE
    `salestrend` (
        `name` text NOT NULL,
        `value` int(11) NOT NULL,
        `type` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `salestrend`

--

INSERT INTO
    `salestrend` (`name`, `value`, `type`)
VALUES ('01-01', 1000, '1'), ('01-02', 2000, '1'), ('01-03', 2600, '1'), ('01-04', 3000, '1'), ('01-05', 4100, '1'), ('01-06', 4500, '1'), ('01-07', 5100, '1'), ('01-01', 10000, '2'), ('01-02', 13000, '2'), ('01-03', 18000, '2'), ('01-04', 16000, '2'), ('01-05', 20000, '2'), ('01-06', 26000, '2'), ('01-07', 36000, '2'), ('01-01', 1000, '1'), ('01-02', 2000, '1'), ('01-03', 2600, '1'), ('01-04', 3000, '1'), ('01-05', 4100, '1'), ('01-06', 4500, '1'), ('01-07', 5100, '1'), ('01-01', 10000, '2'), ('01-02', 13000, '2'), ('01-03', 18000, '2'), ('01-04', 16000, '2'), ('01-05', 20000, '2'), ('01-06', 26000, '2'), ('01-07', 36000, '2');

-- --------------------------------------------------------

--

-- 表的结构 `statistics`

--

CREATE TABLE
    `statistics` (
        `totalTurnover` int(11) NOT NULL,
        `turnoverGrowth` text NOT NULL,
        `totalQuantity` int(11) NOT NULL,
        `quantityGrowth` text NOT NULL,
        `totalVisited` int(11) NOT NULL,
        `visitedGrowth` text NOT NULL,
        `totalStats` int(11) NOT NULL,
        `statsGrowth` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `statistics`

--

INSERT INTO
    `statistics` (
        `totalTurnover`,
        `turnoverGrowth`,
        `totalQuantity`,
        `quantityGrowth`,
        `totalVisited`,
        `visitedGrowth`,
        `totalStats`,
        `statsGrowth`
    )
VALUES (
        180000,
        '15%',
        26000,
        '10%',
        1005623,
        '20%',
        10236,
        '5%'
    ), (
        180000,
        '15%',
        26000,
        '10%',
        1005623,
        '20%',
        10236,
        '5%'
    );

-- --------------------------------------------------------

--

-- 表的结构 `test`

--

CREATE TABLE
    `test` (
        `name` text NOT NULL,
        `value` int(11) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `test`

--

INSERT INTO
    `test` (`name`, `value`)
VALUES ('test1', 10), ('test2', 20), ('test1', 10), ('test2', 20);

-- --------------------------------------------------------

--

-- 表的结构 `user`

--

CREATE TABLE
    `user` (
        `id` int(11) NOT NULL,
        `name` text NOT NULL,
        `account` text NOT NULL,
        `area` text NOT NULL,
        `tel` text NOT NULL,
        `email` text NOT NULL,
        `picture` text DEFAULT NULL,
        `relatedMenus` text DEFAULT NULL,
        `password` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `user`

--

INSERT INTO
    `user` (
        `id`,
        `name`,
        `account`,
        `area`,
        `tel`,
        `email`,
        `picture`,
        `relatedMenus`,
        `password`
    )
VALUES (
        -1,
        'administrator',
        'admin',
        '',
        '',
        '',
        NULL,
        NULL,
        '123123'
    ), (
        10,
        '用户1',
        'user1',
        'jiangsu,nanjig,jianye',
        '15630639633',
        '1101152873@qq.com',
        '\\upload\\1642756962153_src=http___b-ssl.duitang.com_uploads_item_201611_17_20161117173627_NTJiW.thumb.700_0.jpeg&refer=http___b-ssl.duitang.jpg',
        '24,25',
        ''
    ), (
        11,
        '用户2',
        'user2',
        'jiangsu,nanjig,pukou',
        '15630639633',
        '1101152873@qq.com',
        '\\upload\\1642756988254_src=http___pic4.zhimg.com_v2-3a9150d24819e00a17ab348b55b7a5db_b.jpg&refer=http___pic4.zhimg.jpg',
        NULL,
        ''
    ), (
        12,
        '用户3',
        'user3',
        'jiangsu,nanjig,pukou',
        '15630639633',
        '1101152873@qq.com',
        '\\upload\\1642757875402_src=http___c-ssl.duitang.com_uploads_item_202006_25_20200625210505_jSZsN.thumb.1000_0.jpeg&refer=http___c-ssl.duitang.jpg',
        NULL,
        'd2dxCg-V'
    ), (
        13,
        '用户4',
        'user4',
        'jiangsu,nanjig,pukou',
        '15630639633',
        '1101152873@qq.com',
        '\\upload\\1643006135086_src=http___c-ssl.duitang.com_uploads_item_201712_08_20171208214551_AFQ2h.thumb.1000_0.jpeg&refer=http___c-ssl.duitang.jpg',
        '24,25',
        'q&89SPWT'
    );

-- --------------------------------------------------------

--

-- 表的结构 `volumetop10`

--

CREATE TABLE
    `volumetop10` (
        `name` text NOT NULL,
        `value` int(11) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- 转存表中的数据 `volumetop10`

--

INSERT INTO
    `volumetop10` (`name`, `value`)
VALUES ('book', 200000), ('ipod', 150000), ('keyboard', 100000), ('laptop', 98000), ('smartphone', 90000), ('cosmetics', 70000);

--

-- 转储表的索引

--

--

-- 表的索引 `menu`

--

ALTER TABLE `menu` ADD PRIMARY KEY (`id`);

--

-- 表的索引 `product`

--

ALTER TABLE `product` ADD PRIMARY KEY (`id`);

--

-- 表的索引 `province`

--

ALTER TABLE `province` ADD PRIMARY KEY (`id`);

--

-- 表的索引 `region`

--

ALTER TABLE `region` ADD PRIMARY KEY (`id`);

--

-- 表的索引 `user`

--

ALTER TABLE `user` ADD PRIMARY KEY (`id`);

--

-- 在导出的表使用AUTO_INCREMENT

--

--

-- 使用表AUTO_INCREMENT `menu`

--

ALTER TABLE
    `menu` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 27;

--

-- 使用表AUTO_INCREMENT `product`

--

ALTER TABLE
    `product` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 19;

--

-- 使用表AUTO_INCREMENT `province`

--

ALTER TABLE
    `province` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--

-- 使用表AUTO_INCREMENT `region`

--

ALTER TABLE
    `region` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 222;

--

-- 使用表AUTO_INCREMENT `user`

--

ALTER TABLE
    `user` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 14;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;