-- 创建数据库表
CREATE TABLE `t_user`(
	`id` BIGINT(20) NOT NULL COMMENT '用户id',
	`username` VARCHAR(64) NOT NULL,
	`password` VARCHAR(64) NOT NULL,
	`fullname` VARCHAR(255) NOT NULL COMMENT '用户姓名',
	`mobile` VARCHAR(11) DEFAULT NULL COMMENT '手机号',
	PRIMARY KEY (`id`) USING BTREE
)

CREATE TABLE `t_role`(
	`id` BIGINT(20) NOT NULL,
	`role_name` VARCHAR(255) DEFAULT NULL,
	`description` VARCHAR(255) DEFAULT null,
	`create_time` DATETIME DEFAULT NULL,
	`update_time` DATETIME DEFAULT NULL,
	`status` CHAR(1) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `unique_role_name` (`role_name`)
)

CREATE TABLE `t_user_role`(
	`user_id` BIGINT(20) NOT NULL,
	`role_id` BIGINT(20) NOT NULL,
	`create_time` DATETIME DEFAULT NULL,
	`creator` VARCHAR(255) DEFAULT NULL
)

CREATE TABLE `t_permission`(
	`id` BIGINT(20) NOT NULL COMMENT '资源id',
	`code` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	`url` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE
)

CREATE TABLE `t_role_permission`(
	`role_id` BIGINT(20) NOT NULL,
	`permission_id` BIGINT(20) NOT NULL
)

-- 插入数据 密码是执行测试类TestBCrypt获得的
INSERT INTO `tanwb`.`t_user`(`id`, `username`, `password`, `fullname`, `mobile`) VALUES (1, 'zhangsan', '使用TestBCrypt生成对应加密的密码', '张三', '123456')
INSERT INTO `tanwb`.`t_user`(`id`, `username`, `password`, `fullname`, `mobile`) VALUES (2, 'lisi', '使用TestBCrypt生成对应加密的密码', '李四', '654321')

INSERT INTO `t_role`(`id`, `role_name`, `description`, `create_time`, `update_time`, `status`) VALUES ('1', '管理员', NULL, NULL, NULL, '')

INSERT INTO `t_user_role`(`user_id`, `role_id`, `create_time`, `creator`) VALUES ('1', '1', NULL, NULL)

INSERT INTO `t_permission`(`id`, `code`, `description`, `url`) VALUES ('1', 'p1', '测试资源1', '/r/r1')
INSERT INTO `t_permission`(`id`, `code`, `description`, `url`) VALUES ('2', 'p2', '测试资源2', '/r/r2')

INSERT INTO `t_role_permission`(`role_id`, `permission_id`) VALUES ('1', '1')
INSERT INTO `t_permission`(`role_id`, `permission_id`) VALUES ('1', '2')