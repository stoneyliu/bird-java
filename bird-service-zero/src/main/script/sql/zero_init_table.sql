CREATE SCHEMA IF NOT EXISTS `bird-zero`;

CREATE TABLE IF NOT EXISTS `bird-zero`.`zero_user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(32) NOT NULL COMMENT '用户名',
  `nickName` VARCHAR(32) NULL COMMENT '昵称',
  `password` VARCHAR(128) NULL COMMENT '密码',
  `phoneNo` VARCHAR(45) NULL COMMENT '联系电话',
  `locked` TINYINT NOT NULL DEFAULT 0 COMMENT '是否锁定',
  `remark` VARCHAR(128) NULL COMMENT '备注',
  `lastLoginTime` DATETIME NULL,
  `delFlag` TINYINT NOT NULL DEFAULT 0 COMMENT '是否删除',
  `createBy` BIGINT NULL,
  `createTime` DATETIME NULL,
  `deleteBy` BIGINT NULL,
  `deleteTime` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bird-zero`.`zero_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '角色名',
  `remark` VARCHAR(128) NULL COMMENT '备注',
  `displayName` VARCHAR(45) NULL COMMENT '显示名',
  `static` TINYINT NOT NULL DEFAULT 0 COMMENT '是否静态角色，静态角色不能删除',
  `default` TINYINT NOT NULL DEFAULT 0 COMMENT '是否默认角色，默认角色新增用户自动关联',
  `delFlag` TINYINT NOT NULL DEFAULT 0 COMMENT '是否删除',
  `createBy` BIGINT NULL,
  `createTime` DATETIME NULL,
  `deleteBy` BIGINT NULL,
  `deleteTime` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bird-zero`.`zero_user_role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `userId` BIGINT NOT NULL,
  `roleId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userId_idx` (`userId` ASC),
  INDEX `roleId_idx` (`roleId` ASC),
  CONSTRAINT `user_role_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `bird-zero`.`zero_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_role_roleId`
    FOREIGN KEY (`roleId`)
    REFERENCES `bird-zero`.`zero_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bird-zero`.`zero_role_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roleId` INT NOT NULL COMMENT '角色Id',
  `permissionName` VARCHAR(128) NOT NULL COMMENT '权限名',
  PRIMARY KEY (`id`),
  INDEX `roleId_idx` (`roleId` ASC),
  CONSTRAINT `role_permission_roleId`
    FOREIGN KEY (`roleId`)
    REFERENCES `bird-zero`.`zero_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bird-zero`.`zero_user_login_attempt` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL COMMENT '用户名',
  `clientIp` VARCHAR(45) NULL COMMENT '登录客户端IP',
  `clientName` VARCHAR(80) NULL COMMENT '登录客户端名称',
  `browserInfo` VARCHAR(256) NULL COMMENT '浏览器信息',
  `result` INT NOT NULL COMMENT '1.成功;2.用户名不存在;3.密码错误;4.用户被锁定',
  `createBy` BIGINT NULL,
  `createTime` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bird-zero`.`zero_menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT '菜单名称',
  `url` VARCHAR(128) NULL COMMENT '关联地址',
  `icon` VARCHAR(45) NULL COMMENT '图标',
  `parentId` INT NOT NULL DEFAULT 0 COMMENT '父菜单Id',
  `orderNo` INT NOT NULL DEFAULT 0 COMMENT '排序号',
  `permissionName` VARCHAR(128) NULL COMMENT '所需权限名',
  `remark` VARCHAR(128) NULL COMMENT '备注',
  `visitType` VARCHAR(45) NULL COMMENT '1.游客访问;2.登录访问;3.权限访问',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

