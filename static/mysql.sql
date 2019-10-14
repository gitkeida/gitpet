SET NAMES UTF8;
DROP DATABASE IF EXISTS mine;
CREATE DATABASE mine CHARSET=UTF8;
use mine;

###########################################################
##################			            ###################
##################     用户信息表	     ###################
##################			            ###################
###########################################################

CREATE TABLE m_user_admin(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(16) NOT NULL,
    user_password VARCHAR(16) NOT NULL,
    user_email VARCHAR(32),
    reg_time DATETIME,
    expire int NOT NULL DEFAULT 0,
    user_db int DEFAULT 1
);

INSERT INTO m_user_admin VALUES
(null,'root','root','','2019-09-29',0,1);



###########################################################
##################			            ###################
##################     首页轮播表	     ###################
##################			            ###################
###########################################################

CREATE TABLE m_banner(
    bannerid INT PRIMARY KEY AUTO_INCREMENT,
    imgurl VARCHAR(128),
    link VARCHAR(128),
    title VARCHAR(64),
    bannerText VARCHAR(64)
);

INSERT INTO m_banner VALUES
(null,"http://119.29.67.165/mineData/images/slider1.jpg","","我是什么","是万世沙烁中的一颗"),
(null,"http://119.29.67.165/mineData/images/slider2.jpg","","我就是我","是颜色不一样的烟火"),
(null,"http://119.29.67.165/mineData/images/slider3.jpg","","星河滚烫","你是人间理想"),
(null,"http://119.29.67.165/mineData/images/slider4.jpg","","皓月清凉","你是人间曙光"),
(null,"http://119.29.67.165/mineData/images/slider1.jpg","","人海冷漠","你是人间炽热"),
(null,"http://119.29.67.165/mineData/images/slider2.jpg","","满眼星河","你是清梦满船"),
(null,"http://119.29.67.165/mineData/images/slider7.jpg","","万事浮沉","你是人间归途"),
(null,"http://119.29.67.165/mineData/images/slider8.jpg","","众人平庸","你是人间星光"),
(null,"http://119.29.67.165/mineData/images/slider9.jpg","","世事无常","你是人间琳琅");


###########################################################
##################			            ###################
##################     宠物信息表	     ###################
##################			            ###################
###########################################################


CREATE TABLE m_pet(
    pet_id INT PRIMARY KEY AUTO_INCREMENT,
    pet_type_id INT NOT NULL DEFAULT 1,
    pet_name VARCHAR(32),
    pic VARCHAR(128),
    pet_text VARCHAR(128),
    createtime DATETIME
);

INSERT INTO m_pet VALUES
(null,1,'大猫咪','http://119.29.67.165/mineData/images/pet/pet1.jpg','无论你的宠物的耳朵周围需要抓伤，还是需要玩耍的地方,都可以给它戴顶帽子',now()),
(null,1,'小猫咪','http://119.29.67.165/mineData/images/pet/pet2.jpg','最好的朋友宠物护理是领导者的时候，谈到绝对最好的照顾你的猫或狗。',now()),
(null,2,'大狗子','http://119.29.67.165/mineData/images/pet/pet3.jpg','老盆友了，这是一段很有爱的描述',now());
