/*删除题目时也删除与其他之间的关联(在测试)*/
DROP TRIGGER IF EXISTS `delTM_tiku_timu`;
DELIMITER ;;
CREATE TRIGGER `delTM_tiku_timu` BEFORE DELETE ON `timu` FOR EACH ROW BEGIN
    DELETE FROM tiku_timu WHERE tmid = old.tmid;
END
;;
DELIMITER ;

/*删除题库时也删除与题目之间的关联*/
DROP TRIGGER IF EXISTS `delTk_tiku_timu`;
DELIMITER ;;
CREATE TRIGGER `delTk_tiku_timu` BEFORE DELETE ON `tiku` FOR EACH ROW BEGIN
    DELETE FROM tiku_timu WHERE tkid = old.tkid;
END
;;
DELIMITER ;

/*删除考场时也删除与面试官之间的关联*/
DROP TRIGGER IF EXISTS `delKC_tri`;
DELIMITER ;;
CREATE TRIGGER `delKC_tri` BEFORE DELETE ON `kc` FOR EACH ROW BEGIN
    UPDATE msg SET kcid = NULL WHERE kcid = old.kcid;
END
;;
DELIMITER ;

/*添加考场和题库之间的关联时将题库中kcnames更新*/
DROP TRIGGER IF EXISTS `addTk_tri`;
DELIMITER $$
CREATE
    TRIGGER `addTk_tri` AFTER INSERT
    ON `kc_tiku`
    FOR EACH ROW BEGIN
	UPDATE tiku SET kcnames = (SELECT GROUP_CONCAT(kcname) AS kcnames FROM kc WHERE kcid IN(SELECT kcid FROM kc_tiku WHERE tkid = tiku.tkid));
    END$$
DELIMITER ;
/*删除考场与题库之间的关联时将题库中kcnames更新*/
DROP TRIGGER IF EXISTS `delTk_tri`;
DELIMITER $$
CREATE
    TRIGGER `delTk_tri` AFTER DELETE
    ON `kc_tiku`
    FOR EACH ROW BEGIN
	UPDATE tiku SET kcnames = (SELECT GROUP_CONCAT(kcname) AS kcnames FROM kc WHERE kcid IN(SELECT kcid FROM kc_tiku WHERE tkid = tiku.tkid));
    END$$
DELIMITER ;
/*添加题目和题库之间的关联时将题目中tknames更新*/
DROP TRIGGER IF EXISTS `addTM_tri`;
DELIMITER $$
CREATE
    TRIGGER `addTM_tri` AFTER INSERT
    ON `tiku_timu`
    FOR EACH ROW BEGIN
	UPDATE timu SET tknames = (SELECT GROUP_CONCAT(tkname) AS tknames FROM tiku WHERE tkid IN(SELECT tkid FROM tiku_timu WHERE tmid = timu.tmid));
    END$$
DELIMITER ;
/*删除题目和题库之间的关联时将题目中tknames更新*/
DROP TRIGGER IF EXISTS `delTM_tri`;
DELIMITER $$
CREATE
    TRIGGER `delTM_tri` BEFORE DELETE
    ON `tiku_timu`
    FOR EACH ROW BEGIN
	UPDATE timu SET tknames = (SELECT GROUP_CONCAT(tkname) AS tknames FROM tiku WHERE tkid IN(SELECT tkid FROM tiku_timu WHERE tmid = timu.tmid));
    END$$
DELIMITER ;
/*更新zgtscore时也添加到users中*/
DROP TRIGGER IF EXISTS `addzgtscore_users`;
DELIMITER $$
CREATE
    TRIGGER `addzgtscore_users` AFTER UPDATE
    ON `users_zgt`
    FOR EACH ROW BEGIN
	UPDATE users SET zgtscore = (SELECT zgtscore FROM users_zgt WHERE openid = users.openid);
	UPDATE users SET score = zgtscore + kgtscore;
    END$$
DELIMITER ;

/*计算总分*/
DROP TRIGGER IF EXISTS `score_users`;
DELIMITER $$
CREATE
    TRIGGER `score_users` BEFORE UPDATE
    ON `users`
    FOR EACH ROW BEGIN
	UPDATE users SET score = kgtscore+zgtscore;
    END$$
DELIMITER ;