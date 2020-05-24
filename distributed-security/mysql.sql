DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
	`client_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端标识',
	`resource_ids` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接入资源列表',
	`client_secret` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端密钥',
	`scope` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	`authorized_grant_types` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	`web_server_redirect_uri` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	`authorities` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	`access_token_validity` INT(11) NULL DEFAULT NULL,
	`refresh_token_validity` INT(11) NULL DEFAULT NULL,
	`additional_information` LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`create_time` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
	`archived` TINYINT(4) NULL DEFAULT NULL,
	`trusted` TINYINT(4) NULL DEFAULT NULL,
	`autoapprove` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接入客户端信息' ROW_FORMAT = Dynamic;

INSERT INTO `oauth_client_details` VALUES ('c1', 'res1', '使用TestBCrypt生成对应加密的secret', 'ROLE_ADMIN,ROLE_USER,ROLE_API', 'client_credentials, password, authorization_code, implicit, refresh_token', 'http://www.baidu.com', NULL, 7200, 259200, NULL, '2020-03-24 16:04:28', 0, 0, 'false')
INSERT INTO `oauth_client_details` VALUES ('c2', 'res2', '使用TestBCrypt生成对应加密的secret', 'ROLE_API', 'client_credentials, password, authorization_code, implicit, refresh_token', 'http://www.baidu.com', NULL, 31536000, 2592000, NULL, '2020-03-24 16:04:28', 0, 0, 'false')

DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
	`create_time` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`code` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
	`authentication` BLOB NULL,
	INDEX `code_index`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `oauth_code` (`create_time`, `code`) VALUES ('2020-03-24 16:04:28', 'GzCF3g')