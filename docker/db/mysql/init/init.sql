CREATE TABLE `member` (
    `mem_seq`	int(10)	NOT NULL,
    `mem_id`	varchar(20)	NOT NULL,
    `mem_name`	varchar(30)	NOT NULL,
    `mem_phone`	varchar(11)	NOT NULL,
    `mem_email`	varchar(100)	NOT NULL,
    `mem_password`	varchar(16)	NOT NULL,
    `mem_nickname`	varchar(20)	NOT NULL,
    `mem_image`	varchar(500)	NOT NULL,
    `mem_status`	varchar(10)	NOT NULL	COMMENT '활성/휴면/탈퇴/관리자',
    `join_date`	date	NOT NULL	DEFAULT now()
);

CREATE TABLE `mlog` (
    `mlog_seq`	int(10)	NOT NULL,
    `mem_seq`	int(10)	NOT NULL,
    `mlog_address`	varchar(20)	NOT NULL,
    `mlog_name`	varchar(30)	NOT NULL,
    `mlog_category`	varchar(20)	NOT NULL,
    `mlog_image`	varchar(500)	NOT NULL
);

CREATE TABLE `mboard` (
    `mboard_seq`	int(10)	NOT NULL,
    `mlog_seq`	int(10)	NOT NULL,
    `mboard_no`	int(10)	NOT NULL,
    `mboard_name`	varchar(30)	NOT NULL,
    `mboard_intro`	varchar(300)	NULL,
    `mboard_status`	varchar(10)	NOT NULL	COMMENT '나만 보기/친구 공개/전체 공개'
);

CREATE TABLE `mpost` (
    `mpost_seq`	int(10)	NOT NULL,
    `mboard_seq`	int(10)	NOT NULL,
    `mpost_no`	int(10)	NOT NULL,
    `mpost_title`	varchar(30)	NOT NULL,
    `mpost_content`	varchar(10000)	NOT NULL,
    `mpost_tag`	varchar(1000)	NOT NULL	COMMENT '최대 16개',
    `mpost_status`	varchar(10)	NOT NULL	COMMENT '나만 보기/친구 공개/전체 공개',
    `allow_comment`	varchar(10)	NOT NULL	COMMENT '허용/비허용',
    `mpost_view`	int(10)	NOT NULL	DEFAULT 0,
    `mpost_like`	int(10)	NOT NULL	DEFAULT 0,
    `mpost_date`	date	NOT NULL	DEFAULT now(),
    `modify_date`	date	NOT NULL	DEFAULT now()
);

CREATE TABLE `mpost_comment` (
    `mcomment_seq`	int(10)	NOT NULL,
    `mpost_seq`	int(10)	NOT NULL,
    `mem_seq`	int(10)	NOT NULL,
    `mcomment_content`	varchar(100)	NOT NULL,
    `mcomment_status`	varchar(10)	NOT NULL	COMMENT '비공개(댓글 작성자 및 엠로그 주인만)/공개',
    `mcomment_date`	date	NOT NULL	DEFAULT now(),
    `modify_date`	date	NOT NULL	DEFAULT now()
);

CREATE TABLE `mpost_reply` (
    `reply_seq`	int(10)	NOT NULL,
    `mcomment_seq`	int(10)	NOT NULL,
    `mem_seq`	int(10)	NOT NULL,
    `reply_content`	varchar(100)	NOT NULL,
    `reply_status`	varchar(10)	NOT NULL	COMMENT '비공개(댓글 작성자 및 엠로그 주인만)/공개',
    `reply_date`	date	NOT NULL	DEFAULT now(),
    `modify_date`	date	NOT NULL	DEFAULT now()
);

CREATE TABLE `like` (
    `like_seq`	int(10)	NOT NULL,
    `mem_seq`	int(10)	NOT NULL,
    `mpost_seq`	int(10)	NOT NULL
);

CREATE TABLE `friend` (
    `friend_seq`	int(10)	NOT NULL,
    `mem_seq`	int(10)	NOT NULL,
    `fmem_seq`	int(10)	NOT NULL,
    `friend_content`	varchar(500)	NOT NULL,
    `friend_date`	date	NOT NULL	DEFAULT now(),
    `friend_status`	varchar(10)	NOT NULL	COMMENT '친구/절교'
);

CREATE TABLE `request_friend` (
    `request_seq`	int(10)	NOT NULL,
    `mem_seq`	int(10)	NOT NULL,
    `rmem_seq`	int(10)	NOT NULL,
    `request_content`	varchar(500)	NOT NULL,
    `request_date`	date	NOT NULL	DEFAULT now()
);

CREATE TABLE `message` (
    `message_seq`	int(10)	NOT NULL,
    `mem_seq`	int(10)	NOT NULL,
    `rmem_seq`	int(10)	NOT NULL,
    `message_title`	varchar(30)	NOT NULL,
    `message_content`	varchar(500)	NOT NULL,
    `message_date`	date	NOT NULL	DEFAULT now(),
    `rmessage_date`	date	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
    `mem_seq`
);

ALTER TABLE `mlog` ADD CONSTRAINT `PK_MLOG` PRIMARY KEY (
    `mlog_seq`
);

ALTER TABLE `mboard` ADD CONSTRAINT `PK_MBOARD` PRIMARY KEY (
    `mboard_seq`
);

ALTER TABLE `mpost` ADD CONSTRAINT `PK_MPOST` PRIMARY KEY (
    `mpost_seq`
);

ALTER TABLE `mpost_comment` ADD CONSTRAINT `PK_MPOST_COMMENT` PRIMARY KEY (
    `mcomment_seq`
);

ALTER TABLE `mpost_reply` ADD CONSTRAINT `PK_MPOST_REPLY` PRIMARY KEY (
    `reply_seq`
);

ALTER TABLE `like` ADD CONSTRAINT `PK_LIKE` PRIMARY KEY (
    `like_seq`
);

ALTER TABLE `friend` ADD CONSTRAINT `PK_FRIEND` PRIMARY KEY (
    `friend_seq`
);

ALTER TABLE `request_friend` ADD CONSTRAINT `PK_REQUEST_FRIEND` PRIMARY KEY (
    `request_seq`
);

ALTER TABLE `message` ADD CONSTRAINT `PK_MESSAGE` PRIMARY KEY (
    `message_seq`
);