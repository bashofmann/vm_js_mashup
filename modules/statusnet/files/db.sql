-- phpMyAdmin SQL Dump
-- version 2.6.4-pl3
-- http://www.phpmyadmin.net
-- 
-- Host: db424174366.db.1and1.com
-- Erstellungszeit: 09. September 2012 um 13:25
-- Server Version: 5.0.91
-- PHP-Version: 5.3.3-7+squeeze14
-- 
-- Datenbank: `db424174366`
-- 
CREATE DATABASE `db424174366` DEFAULT CHARACTER SET latin1 COLLATE latin1_german2_ci;
USE db424174366;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `avatar`
-- 

DROP TABLE IF EXISTS `avatar`;
CREATE TABLE IF NOT EXISTS `avatar` (
  `profile_id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `original` tinyint(1) default '0' COMMENT 'uploaded by user or generated?',
  `width` int(11) NOT NULL COMMENT 'image width',
  `height` int(11) NOT NULL COMMENT 'image height',
  `mediatype` varchar(32) collate utf8_bin NOT NULL COMMENT 'file type',
  `filename` varchar(255) collate utf8_bin default NULL COMMENT 'local filename, if local',
  `url` varchar(255) collate utf8_bin default NULL COMMENT 'avatar location',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`profile_id`,`width`,`height`),
  UNIQUE KEY `url` (`url`),
  KEY `avatar_profile_id_idx` (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `avatar`
-- 

INSERT INTO `avatar` (`profile_id`, `original`, `width`, `height`, `mediatype`, `filename`, `url`, `created`, `modified`) VALUES (64, 1, 128, 128, 0x696d6167652f6a706567, 0x36342d3132382d32303132303930363136313932342e6a706567, 0x687474703a2f2f7374617475736e65742e6261737469616e686f666d616e6e2e64652f6176617461722f36342d3132382d32303132303930363136313932342e6a706567, '2012-09-06 16:19:24', '2012-09-06 18:19:24');
INSERT INTO `avatar` (`profile_id`, `original`, `width`, `height`, `mediatype`, `filename`, `url`, `created`, `modified`) VALUES (64, 0, 96, 96, 0x696d6167652f6a706567, 0x36342d39362d32303132303930363136313932342e6a706567, 0x687474703a2f2f7374617475736e65742e6261737469616e686f666d616e6e2e64652f6176617461722f36342d39362d32303132303930363136313932342e6a706567, '2012-09-06 16:19:24', '2012-09-06 18:19:24');
INSERT INTO `avatar` (`profile_id`, `original`, `width`, `height`, `mediatype`, `filename`, `url`, `created`, `modified`) VALUES (64, 0, 48, 48, 0x696d6167652f6a706567, 0x36342d34382d32303132303930363136313932342e6a706567, 0x687474703a2f2f7374617475736e65742e6261737469616e686f666d616e6e2e64652f6176617461722f36342d34382d32303132303930363136313932342e6a706567, '2012-09-06 16:19:24', '2012-09-06 18:19:24');
INSERT INTO `avatar` (`profile_id`, `original`, `width`, `height`, `mediatype`, `filename`, `url`, `created`, `modified`) VALUES (64, 0, 24, 24, 0x696d6167652f6a706567, 0x36342d32342d32303132303930363136313932342e6a706567, 0x687474703a2f2f7374617475736e65742e6261737469616e686f666d616e6e2e64652f6176617461722f36342d32342d32303132303930363136313932342e6a706567, '2012-09-06 16:19:24', '2012-09-06 18:19:24');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `config`
-- 

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `section` varchar(32) collate utf8_bin NOT NULL default '' COMMENT 'configuration section',
  `setting` varchar(32) collate utf8_bin NOT NULL default '' COMMENT 'configuration setting',
  `value` varchar(255) collate utf8_bin default NULL COMMENT 'configuration value',
  PRIMARY KEY  (`section`,`setting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `config`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `confirm_address`
-- 

DROP TABLE IF EXISTS `confirm_address`;
CREATE TABLE IF NOT EXISTS `confirm_address` (
  `code` varchar(32) collate utf8_bin NOT NULL COMMENT 'good random code',
  `user_id` int(11) NOT NULL COMMENT 'user who requested confirmation',
  `address` varchar(255) collate utf8_bin NOT NULL COMMENT 'address (email, Jabber, SMS, etc.)',
  `address_extra` varchar(255) collate utf8_bin NOT NULL COMMENT 'carrier ID, for SMS',
  `address_type` varchar(8) collate utf8_bin NOT NULL COMMENT 'address type ("email", "jabber", "sms")',
  `claimed` datetime default NULL COMMENT 'date this was claimed for queueing',
  `sent` datetime default NULL COMMENT 'date this was sent for queueing',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- 
-- Tabellenstruktur für Tabelle `consumer`
-- 

DROP TABLE IF EXISTS `consumer`;
CREATE TABLE IF NOT EXISTS `consumer` (
  `consumer_key` varchar(255) collate utf8_bin NOT NULL COMMENT 'unique identifier, root URL',
  `consumer_secret` varchar(255) collate utf8_bin NOT NULL COMMENT 'secret value',
  `seed` char(32) collate utf8_bin NOT NULL COMMENT 'seed for new tokens by this consumer',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`consumer_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `consumer`
-- 

INSERT INTO `consumer` (`consumer_key`, `consumer_secret`, `seed`, `created`, `modified`) VALUES (0x3731623435346337393761353865386465356466333331333765393563623863, 0x6236666232653033653730313765323566343330313065666262326239353935, 0x3336626230616163626466666530303265313032386530363434366436356431, '2011-09-11 00:48:10', '2011-09-10 17:48:10');
INSERT INTO `consumer` (`consumer_key`, `consumer_secret`, `seed`, `created`, `modified`) VALUES (0x3435393433666636616439383564613765656332363736303866663163316432, 0x3632373264653338643235353063626134643831663737386665323965343336, 0x3538663239313237313539356465313561336537313163653864313461396361, '2012-04-09 11:37:07', '2012-04-09 04:37:07');
INSERT INTO `consumer` (`consumer_key`, `consumer_secret`, `seed`, `created`, `modified`) VALUES (0x3737393134653937373937326466333961336335316536333638613938616230, 0x3030373666323631643362373531646433616135393535626337633563373562, 0x3634343930343661323633303335653139326661373035376139333065373632, '2012-07-17 20:22:40', '2012-07-17 22:22:40');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `conversation`
-- 

DROP TABLE IF EXISTS `conversation`;
CREATE TABLE IF NOT EXISTS `conversation` (
  `id` int(11) NOT NULL auto_increment COMMENT 'unique identifier',
  `uri` varchar(225) collate utf8_bin default NULL COMMENT 'URI of the conversation',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=MyISAM AUTO_INCREMENT=381 DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=381 ;


-- 
-- Tabellenstruktur für Tabelle `deleted_notice`
-- 

DROP TABLE IF EXISTS `deleted_notice`;
CREATE TABLE IF NOT EXISTS `deleted_notice` (
  `id` int(11) NOT NULL COMMENT 'identity of notice',
  `profile_id` int(11) NOT NULL COMMENT 'author of the notice',
  `uri` varchar(255) collate utf8_bin default NULL COMMENT 'universally unique identifier, usually a tag URI',
  `created` datetime NOT NULL COMMENT 'date the notice record was created',
  `deleted` datetime NOT NULL COMMENT 'date the notice record was created',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `deleted_notice_profile_id_idx` (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `deleted_notice`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `design`
-- 

DROP TABLE IF EXISTS `design`;
CREATE TABLE IF NOT EXISTS `design` (
  `id` int(11) NOT NULL auto_increment COMMENT 'design ID',
  `backgroundcolor` int(11) default NULL COMMENT 'main background color',
  `contentcolor` int(11) default NULL COMMENT 'content area background color',
  `sidebarcolor` int(11) default NULL COMMENT 'sidebar background color',
  `textcolor` int(11) default NULL COMMENT 'text color',
  `linkcolor` int(11) default NULL COMMENT 'link color',
  `backgroundimage` varchar(255) collate utf8_bin default NULL COMMENT 'background image, if any',
  `disposition` tinyint(4) default '1' COMMENT 'bit 1 = hide background image, bit 2 = display background image, bit 4 = tile background image',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `design`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `fave`
-- 

DROP TABLE IF EXISTS `fave`;
CREATE TABLE IF NOT EXISTS `fave` (
  `notice_id` int(11) NOT NULL COMMENT 'notice that is the favorite',
  `user_id` int(11) NOT NULL COMMENT 'user who likes this notice',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`notice_id`,`user_id`),
  KEY `fave_notice_id_idx` (`notice_id`),
  KEY `fave_user_id_idx` (`user_id`,`modified`),
  KEY `fave_modified_idx` (`modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `fave`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `feedsub`
-- 

DROP TABLE IF EXISTS `feedsub`;
CREATE TABLE IF NOT EXISTS `feedsub` (
  `id` int(11) NOT NULL auto_increment,
  `uri` varchar(255) character set utf8 NOT NULL,
  `huburi` text character set utf8,
  `verify_token` text character set utf8,
  `secret` text character set utf8,
  `sub_state` enum('subscribe','active','unsubscribe','inactive') collate utf8_bin NOT NULL,
  `sub_start` datetime default NULL,
  `sub_end` datetime default NULL,
  `last_update` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `feedsub_uri_idx` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `feedsub`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `file`
-- 

DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(255) default NULL COMMENT 'destination URL after following redirections',
  `mimetype` varchar(50) default NULL COMMENT 'mime type of resource',
  `size` int(11) default NULL COMMENT 'size of resource when available',
  `title` varchar(255) default NULL COMMENT 'title of resource when available',
  `date` int(11) default NULL COMMENT 'date of resource according to http query',
  `protected` int(1) default NULL COMMENT 'true when URL is private (needs login)',
  `filename` varchar(255) default NULL COMMENT 'if a local file, name of the file',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=774 DEFAULT CHARSET=utf8 AUTO_INCREMENT=774 ;

-- 
-- Tabellenstruktur für Tabelle `file_oembed`
-- 

DROP TABLE IF EXISTS `file_oembed`;
CREATE TABLE IF NOT EXISTS `file_oembed` (
  `file_id` int(11) NOT NULL COMMENT 'oEmbed for that URL/file',
  `version` varchar(20) default NULL COMMENT 'oEmbed spec. version',
  `type` varchar(20) default NULL COMMENT 'oEmbed type: photo, video, link, rich',
  `mimetype` varchar(50) default NULL COMMENT 'mime type of resource',
  `provider` varchar(50) default NULL COMMENT 'name of this oEmbed provider',
  `provider_url` varchar(255) default NULL COMMENT 'URL of this oEmbed provider',
  `width` int(11) default NULL COMMENT 'width of oEmbed resource when available',
  `height` int(11) default NULL COMMENT 'height of oEmbed resource when available',
  `html` text COMMENT 'html representation of this oEmbed resource when applicable',
  `title` varchar(255) default NULL COMMENT 'title of oEmbed resource when available',
  `author_name` varchar(50) default NULL COMMENT 'author name for this oEmbed resource',
  `author_url` varchar(255) default NULL COMMENT 'author URL for this oEmbed resource',
  `url` varchar(255) default NULL COMMENT 'URL for this oEmbed resource when applicable (photo, link)',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Tabellenstruktur für Tabelle `file_redirection`
-- 

DROP TABLE IF EXISTS `file_redirection`;
CREATE TABLE IF NOT EXISTS `file_redirection` (
  `url` varchar(255) collate utf8_bin NOT NULL COMMENT 'short URL (or any other kind of redirect) for file (id)',
  `file_id` int(11) default NULL COMMENT 'short URL for what URL/file',
  `redirections` int(11) default NULL COMMENT 'redirect count',
  `httpcode` int(11) default NULL COMMENT 'HTTP status code (20x, 30x, etc.)',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Tabellenstruktur für Tabelle `file_thumbnail`
-- 

DROP TABLE IF EXISTS `file_thumbnail`;
CREATE TABLE IF NOT EXISTS `file_thumbnail` (
  `file_id` int(11) NOT NULL COMMENT 'thumbnail for what URL/file',
  `url` varchar(255) collate utf8_bin default NULL COMMENT 'URL of thumbnail',
  `width` int(11) default NULL COMMENT 'width of thumbnail',
  `height` int(11) default NULL COMMENT 'height of thumbnail',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`file_id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Tabellenstruktur für Tabelle `file_to_post`
-- 

DROP TABLE IF EXISTS `file_to_post`;
CREATE TABLE IF NOT EXISTS `file_to_post` (
  `file_id` int(11) NOT NULL default '0' COMMENT 'id of URL/file',
  `post_id` int(11) NOT NULL default '0' COMMENT 'id of the notice it belongs to',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`file_id`,`post_id`),
  KEY `post_id_idx` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Tabellenstruktur für Tabelle `foreign_link`
-- 

DROP TABLE IF EXISTS `foreign_link`;
CREATE TABLE IF NOT EXISTS `foreign_link` (
  `user_id` int(11) NOT NULL default '0' COMMENT 'link to user on this system, if exists',
  `foreign_id` bigint(20) unsigned NOT NULL default '0' COMMENT 'link to user on foreign service, if exists',
  `service` int(11) NOT NULL COMMENT 'foreign key to service',
  `credentials` varchar(255) collate utf8_bin default NULL COMMENT 'authc credentials, typically a password',
  `noticesync` tinyint(4) NOT NULL default '1' COMMENT 'notice synchronization, bit 1 = sync outgoing, bit 2 = sync incoming, bit 3 = filter local replies',
  `friendsync` tinyint(4) NOT NULL default '2' COMMENT 'friend synchronization, bit 1 = sync outgoing, bit 2 = sync incoming',
  `profilesync` tinyint(4) NOT NULL default '1' COMMENT 'profile synchronization, bit 1 = sync outgoing, bit 2 = sync incoming',
  `last_noticesync` datetime default NULL COMMENT 'last time notices were imported',
  `last_friendsync` datetime default NULL COMMENT 'last time friends were imported',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`user_id`,`foreign_id`,`service`),
  KEY `foreign_user_user_id_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `foreign_link`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `foreign_service`
-- 

DROP TABLE IF EXISTS `foreign_service`;
CREATE TABLE IF NOT EXISTS `foreign_service` (
  `id` int(11) NOT NULL COMMENT 'numeric key for service',
  `name` varchar(32) collate utf8_bin NOT NULL COMMENT 'name of the service',
  `description` varchar(255) collate utf8_bin default NULL COMMENT 'description',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `foreign_service`
-- 

INSERT INTO `foreign_service` (`id`, `name`, `description`, `created`, `modified`) VALUES (1, 0x54776974746572, 0x54776974746572204d6963726f2d626c6f6767696e672073657276696365, '2011-09-11 02:43:18', '2011-09-10 17:43:18');
INSERT INTO `foreign_service` (`id`, `name`, `description`, `created`, `modified`) VALUES (2, 0x46616365626f6f6b, 0x46616365626f6f6b, '2011-09-11 02:43:18', '2011-09-10 17:43:18');
INSERT INTO `foreign_service` (`id`, `name`, `description`, `created`, `modified`) VALUES (3, 0x46616365626f6f6b436f6e6e656374, 0x46616365626f6f6b20436f6e6e656374, '2011-09-11 02:43:18', '2011-09-10 17:43:18');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `foreign_subscription`
-- 

DROP TABLE IF EXISTS `foreign_subscription`;
CREATE TABLE IF NOT EXISTS `foreign_subscription` (
  `service` int(11) NOT NULL COMMENT 'service where relationship happens',
  `subscriber` int(11) NOT NULL COMMENT 'subscriber on foreign service',
  `subscribed` int(11) NOT NULL COMMENT 'subscribed user',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY  (`service`,`subscriber`,`subscribed`),
  KEY `foreign_subscription_subscriber_idx` (`subscriber`),
  KEY `foreign_subscription_subscribed_idx` (`subscribed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `foreign_subscription`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `foreign_user`
-- 

DROP TABLE IF EXISTS `foreign_user`;
CREATE TABLE IF NOT EXISTS `foreign_user` (
  `id` bigint(20) NOT NULL COMMENT 'unique numeric key on foreign service',
  `service` int(11) NOT NULL COMMENT 'foreign key to service',
  `uri` varchar(255) collate utf8_bin NOT NULL COMMENT 'identifying URI',
  `nickname` varchar(255) collate utf8_bin default NULL COMMENT 'nickname on foreign service',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`,`service`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `foreign_user`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `group_alias`
-- 

DROP TABLE IF EXISTS `group_alias`;
CREATE TABLE IF NOT EXISTS `group_alias` (
  `alias` varchar(64) collate utf8_bin NOT NULL COMMENT 'additional nickname for the group',
  `group_id` int(11) NOT NULL COMMENT 'group profile is blocked from',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date alias was created',
  PRIMARY KEY  (`alias`),
  KEY `group_alias_group_id_idx` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `group_alias`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `group_block`
-- 

DROP TABLE IF EXISTS `group_block`;
CREATE TABLE IF NOT EXISTS `group_block` (
  `group_id` int(11) NOT NULL COMMENT 'group profile is blocked from',
  `blocked` int(11) NOT NULL COMMENT 'profile that is blocked',
  `blocker` int(11) NOT NULL COMMENT 'user making the block',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date of blocking',
  PRIMARY KEY  (`group_id`,`blocked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `group_block`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `group_inbox`
-- 

DROP TABLE IF EXISTS `group_inbox`;
CREATE TABLE IF NOT EXISTS `group_inbox` (
  `group_id` int(11) NOT NULL COMMENT 'group receiving the message',
  `notice_id` int(11) NOT NULL COMMENT 'notice received',
  `created` datetime NOT NULL COMMENT 'date the notice was created',
  PRIMARY KEY  (`group_id`,`notice_id`),
  KEY `group_inbox_created_idx` (`created`),
  KEY `group_inbox_notice_id_idx` (`notice_id`),
  KEY `group_inbox_group_id_created_notice_id_idx` (`group_id`,`created`,`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `group_inbox`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `group_member`
-- 

DROP TABLE IF EXISTS `group_member`;
CREATE TABLE IF NOT EXISTS `group_member` (
  `group_id` int(11) NOT NULL COMMENT 'foreign key to user_group',
  `profile_id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `is_admin` tinyint(1) default '0' COMMENT 'is this user an admin?',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`group_id`,`profile_id`),
  KEY `group_member_profile_id_idx` (`profile_id`),
  KEY `group_member_created_idx` (`created`),
  KEY `group_member_profile_id_created_idx` (`profile_id`,`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `group_member`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `hubsub`
-- 

DROP TABLE IF EXISTS `hubsub`;
CREATE TABLE IF NOT EXISTS `hubsub` (
  `hashkey` char(40) character set utf8 NOT NULL,
  `topic` varchar(255) character set utf8 NOT NULL,
  `callback` varchar(255) character set utf8 NOT NULL,
  `secret` text character set utf8,
  `lease` int(11) default NULL,
  `sub_start` datetime default NULL,
  `sub_end` datetime default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`hashkey`),
  KEY `hubsub_topic_idx` (`topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `hubsub`
-- 

INSERT INTO `hubsub` (`hashkey`, `topic`, `callback`, `secret`, `lease`, `sub_start`, `sub_end`, `created`, `modified`) VALUES ('3b982db5e239bccc809cc6cdf25c0bc917035c30', 'http://dev.status.net:8080/index.php/api/statuses/user_timeline/1.atom', 'http://localhost:8000/', NULL, NULL, NULL, NULL, '2012-02-28 18:36:28', '2012-06-08 10:27:44');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `inbox`
-- 

DROP TABLE IF EXISTS `inbox`;
CREATE TABLE IF NOT EXISTS `inbox` (
  `user_id` int(11) NOT NULL COMMENT 'user receiving the notice',
  `notice_ids` blob COMMENT 'packed list of notice ids',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `invitation`
-- 

DROP TABLE IF EXISTS `invitation`;
CREATE TABLE IF NOT EXISTS `invitation` (
  `code` varchar(32) collate utf8_bin NOT NULL COMMENT 'random code for an invitation',
  `user_id` int(11) NOT NULL COMMENT 'who sent the invitation',
  `address` varchar(255) collate utf8_bin NOT NULL COMMENT 'invitation sent to',
  `address_type` varchar(8) collate utf8_bin NOT NULL COMMENT 'address type ("email", "jabber", "sms")',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY  (`code`),
  KEY `invitation_address_idx` (`address`,`address_type`),
  KEY `invitation_user_id_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `invitation`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `local_group`
-- 

DROP TABLE IF EXISTS `local_group`;
CREATE TABLE IF NOT EXISTS `local_group` (
  `group_id` int(11) NOT NULL COMMENT 'group represented',
  `nickname` varchar(64) collate utf8_bin default NULL COMMENT 'group represented',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`group_id`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `local_group`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `location_namespace`
-- 

DROP TABLE IF EXISTS `location_namespace`;
CREATE TABLE IF NOT EXISTS `location_namespace` (
  `id` int(11) NOT NULL COMMENT 'identity for this namespace',
  `description` varchar(255) collate utf8_bin default NULL COMMENT 'description of the namespace',
  `created` datetime NOT NULL COMMENT 'date the record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `location_namespace`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `login_token`
-- 

DROP TABLE IF EXISTS `login_token`;
CREATE TABLE IF NOT EXISTS `login_token` (
  `user_id` int(11) NOT NULL COMMENT 'user owning this token',
  `token` char(32) collate utf8_bin NOT NULL COMMENT 'token useable for logging in',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `login_token`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `magicsig`
-- 

DROP TABLE IF EXISTS `magicsig`;
CREATE TABLE IF NOT EXISTS `magicsig` (
  `user_id` int(11) NOT NULL,
  `keypair` text character set utf8 NOT NULL,
  `alg` varchar(64) character set utf8 NOT NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `magicsig`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `message`
-- 

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL auto_increment COMMENT 'unique identifier',
  `uri` varchar(255) default NULL COMMENT 'universally unique identifier',
  `from_profile` int(11) NOT NULL COMMENT 'who the message is from',
  `to_profile` int(11) NOT NULL COMMENT 'who the message is to',
  `content` text COMMENT 'message content',
  `rendered` text COMMENT 'HTML version of the content',
  `url` varchar(255) default NULL COMMENT 'URL of any attachment (image, video, bookmark, whatever)',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  `source` varchar(32) default NULL COMMENT 'source of comment, like "web", "im", or "clientname"',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `message_from_idx` (`from_profile`),
  KEY `message_to_idx` (`to_profile`),
  KEY `message_created_idx` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `message`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `nonce`
-- 

DROP TABLE IF EXISTS `nonce`;
CREATE TABLE IF NOT EXISTS `nonce` (
  `consumer_key` varchar(255) collate utf8_bin NOT NULL COMMENT 'unique identifier, root URL',
  `tok` char(32) collate utf8_bin default NULL COMMENT 'buggy old value, ignored',
  `nonce` char(32) collate utf8_bin NOT NULL COMMENT 'nonce',
  `ts` datetime NOT NULL COMMENT 'timestamp sent',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`consumer_key`,`ts`,`nonce`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `notice`
-- 

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL auto_increment COMMENT 'unique identifier',
  `profile_id` int(11) NOT NULL COMMENT 'who made the update',
  `uri` varchar(255) default NULL COMMENT 'universally unique identifier, usually a tag URI',
  `content` text COMMENT 'update content',
  `rendered` text COMMENT 'HTML version of the content',
  `url` varchar(255) default NULL COMMENT 'URL of any attachment (image, video, bookmark, whatever)',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  `reply_to` int(11) default NULL COMMENT 'notice replied to (usually a guess)',
  `is_local` tinyint(4) default '0' COMMENT 'notice was generated by a user',
  `source` varchar(32) default NULL COMMENT 'source of comment, like "web", "im", or "clientname"',
  `conversation` int(11) default NULL COMMENT 'id of root notice in this conversation',
  `lat` decimal(10,7) default NULL COMMENT 'latitude',
  `lon` decimal(10,7) default NULL COMMENT 'longitude',
  `location_id` int(11) default NULL COMMENT 'location id if possible',
  `location_ns` int(11) default NULL COMMENT 'namespace for location',
  `repeat_of` int(11) default NULL COMMENT 'notice this is a repeat of',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `notice_created_id_is_local_idx` (`created`,`id`,`is_local`),
  KEY `notice_profile_id_idx` (`profile_id`,`created`,`id`),
  KEY `notice_repeat_of_created_id_idx` (`repeat_of`,`created`,`id`),
  KEY `notice_conversation_created_id_idx` (`conversation`,`created`,`id`),
  KEY `notice_replyto_idx` (`reply_to`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM AUTO_INCREMENT=381 DEFAULT CHARSET=utf8 AUTO_INCREMENT=381 ;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `notice_inbox`
-- 

DROP TABLE IF EXISTS `notice_inbox`;
CREATE TABLE IF NOT EXISTS `notice_inbox` (
  `user_id` int(11) NOT NULL COMMENT 'user receiving the message',
  `notice_id` int(11) NOT NULL COMMENT 'notice received',
  `created` datetime NOT NULL COMMENT 'date the notice was created',
  `source` tinyint(4) default '1' COMMENT 'reason it is in the inbox, 1=subscription',
  PRIMARY KEY  (`user_id`,`notice_id`),
  KEY `notice_inbox_notice_id_idx` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `notice_inbox`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `notice_source`
-- 

DROP TABLE IF EXISTS `notice_source`;
CREATE TABLE IF NOT EXISTS `notice_source` (
  `code` varchar(32) collate utf8_bin NOT NULL COMMENT 'source code',
  `name` varchar(255) collate utf8_bin NOT NULL COMMENT 'name of the source',
  `url` varchar(255) collate utf8_bin NOT NULL COMMENT 'url to link to',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `notice_tag`
-- 

DROP TABLE IF EXISTS `notice_tag`;
CREATE TABLE IF NOT EXISTS `notice_tag` (
  `tag` varchar(64) collate utf8_bin NOT NULL COMMENT 'hash tag associated with this notice',
  `notice_id` int(11) NOT NULL COMMENT 'notice tagged',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY  (`tag`,`notice_id`),
  KEY `notice_tag_created_idx` (`created`),
  KEY `notice_tag_notice_id_idx` (`notice_id`),
  KEY `notice_tag_tag_created_notice_id_idx` (`tag`,`created`,`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `notice_tag`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `oauth_application`
-- 

DROP TABLE IF EXISTS `oauth_application`;
CREATE TABLE IF NOT EXISTS `oauth_application` (
  `id` int(11) NOT NULL auto_increment COMMENT 'unique identifier',
  `owner` int(11) NOT NULL COMMENT 'owner of the application',
  `consumer_key` varchar(255) collate utf8_bin NOT NULL COMMENT 'application consumer key',
  `name` varchar(255) collate utf8_bin NOT NULL COMMENT 'name of the application',
  `description` varchar(255) collate utf8_bin default NULL COMMENT 'description of the application',
  `icon` varchar(255) collate utf8_bin NOT NULL COMMENT 'application icon',
  `source_url` varchar(255) collate utf8_bin default NULL COMMENT 'application homepage - used for source link',
  `organization` varchar(255) collate utf8_bin default NULL COMMENT 'name of the organization running the application',
  `homepage` varchar(255) collate utf8_bin default NULL COMMENT 'homepage for the organization',
  `callback_url` varchar(255) collate utf8_bin default NULL COMMENT 'url to redirect to after authentication',
  `type` tinyint(4) default '0' COMMENT 'type of app, 1 = browser, 2 = desktop',
  `access_type` tinyint(4) default '0' COMMENT 'default access type, bit 1 = read, bit 2 = write',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

-- 
-- Daten für Tabelle `oauth_application`
-- 

INSERT INTO `oauth_application` (`id`, `owner`, `consumer_key`, `name`, `description`, `icon`, `source_url`, `organization`, `homepage`, `callback_url`, `type`, `access_type`, `created`, `modified`) VALUES (1, 1, 0x3731623435346337393761353865386465356466333331333765393563623863, 0x636c69656e74206170706c69636174696f6e, 0x636c69656e74206170706c69636174696f6e, '', 0x687474703a2f2f6c6f63616c686f73743a383038302f7374617475736e65745f6a735f636c69656e745f326e64, 0x44656d6f, 0x687474703a2f2f7777772e6578616d706c652e636f6d2f, 0x687474703a2f2f6c6f63616c686f73743a383038302f7374617475736e65745f6a735f6d61736875705f326e642f63616c6c6261636b2e68746d6c, 1, 3, '2011-09-11 00:48:10', '2012-04-09 04:37:23');
INSERT INTO `oauth_application` (`id`, `owner`, `consumer_key`, `name`, `description`, `icon`, `source_url`, `organization`, `homepage`, `callback_url`, `type`, `access_type`, `created`, `modified`) VALUES (2, 1, 0x3435393433666636616439383564613765656332363736303866663163316432, 0x6a6176615f636c69656e74, 0x6a61766120636c69656e74, '', 0x687474703a2f2f6c6f63616c686f73743a393039312f, 0x44656d6f, 0x687474703a2f2f6c6f63616c686f73743a393039312f, 0x687474703a2f2f6c6f63616c686f73743a393039312f43616c6c6261636b, 1, 3, '2012-04-09 11:37:07', '2012-04-09 05:59:39');
INSERT INTO `oauth_application` (`id`, `owner`, `consumer_key`, `name`, `description`, `icon`, `source_url`, `organization`, `homepage`, `callback_url`, `type`, `access_type`, `created`, `modified`) VALUES (3, 3, 0x3737393134653937373937326466333961336335316536333638613938616230, 0x616263617070, 0x616263, '', 0x687474703a2f2f7777772e6578616d706c652e636f6d2f, 0x414243, 0x687474703a2f2f7777772e6578616d706c652e636f6d2f, 0x687474703a2f2f7777772e6578616d706c652e636f6d, 1, 1, '2012-07-17 20:22:40', '2012-07-17 22:22:40');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `oauth_application_user`
-- 

DROP TABLE IF EXISTS `oauth_application_user`;
CREATE TABLE IF NOT EXISTS `oauth_application_user` (
  `profile_id` int(11) NOT NULL COMMENT 'user of the application',
  `application_id` int(11) NOT NULL COMMENT 'id of the application',
  `access_type` tinyint(4) default '0' COMMENT 'access type, bit 1 = read, bit 2 = write',
  `token` varchar(255) collate utf8_bin default NULL COMMENT 'request or access token',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`profile_id`,`application_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `oauth_application_user`
-- 

INSERT INTO `oauth_application_user` (`profile_id`, `application_id`, `access_type`, `token`, `created`, `modified`) VALUES (1, 1, 3, 0x6461316662376161386564373336646435343933366634346631323531316365, '2012-06-08 10:13:47', '2012-06-08 03:13:47');
INSERT INTO `oauth_application_user` (`profile_id`, `application_id`, `access_type`, `token`, `created`, `modified`) VALUES (1, 2, 3, 0x3364646165373736333763353033366138626562306564613639323266373864, '2012-04-18 16:06:59', '2012-04-18 09:06:59');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `oauth_token_association`
-- 

DROP TABLE IF EXISTS `oauth_token_association`;
CREATE TABLE IF NOT EXISTS `oauth_token_association` (
  `profile_id` int(11) NOT NULL default '0',
  `application_id` int(11) NOT NULL default '0',
  `token` varchar(255) character set utf8 NOT NULL default '',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`profile_id`,`application_id`,`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `oid_associations`
-- 

DROP TABLE IF EXISTS `oid_associations`;
CREATE TABLE IF NOT EXISTS `oid_associations` (
  `server_url` blob NOT NULL,
  `handle` varchar(255) character set latin1 NOT NULL default '',
  `secret` blob,
  `issued` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `assoc_type` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`server_url`(255),`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `oid_associations`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `oid_nonces`
-- 

DROP TABLE IF EXISTS `oid_nonces`;
CREATE TABLE IF NOT EXISTS `oid_nonces` (
  `server_url` varchar(2047) collate utf8_bin default NULL,
  `timestamp` int(11) default NULL,
  `salt` char(40) collate utf8_bin default NULL,
  UNIQUE KEY `server_url` (`server_url`(255),`timestamp`,`salt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `oid_nonces`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `ostatus_profile`
-- 

DROP TABLE IF EXISTS `ostatus_profile`;
CREATE TABLE IF NOT EXISTS `ostatus_profile` (
  `uri` varchar(255) character set utf8 NOT NULL,
  `profile_id` int(11) default NULL,
  `group_id` int(11) default NULL,
  `feeduri` varchar(255) character set utf8 default NULL,
  `salmonuri` text character set utf8,
  `avatar` text character set utf8,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`uri`),
  UNIQUE KEY `ostatus_profile_profile_id_idx` (`profile_id`),
  UNIQUE KEY `ostatus_profile_group_id_idx` (`group_id`),
  UNIQUE KEY `ostatus_profile_feeduri_idx` (`feeduri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `ostatus_profile`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `ostatus_source`
-- 

DROP TABLE IF EXISTS `ostatus_source`;
CREATE TABLE IF NOT EXISTS `ostatus_source` (
  `notice_id` int(11) NOT NULL,
  `profile_uri` varchar(255) character set utf8 NOT NULL,
  `method` enum('push','salmon') collate utf8_bin NOT NULL,
  PRIMARY KEY  (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `ostatus_source`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `profile`
-- 

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL auto_increment COMMENT 'unique identifier',
  `nickname` varchar(64) NOT NULL COMMENT 'nickname or username',
  `fullname` varchar(255) default NULL COMMENT 'display name',
  `profileurl` varchar(255) default NULL COMMENT 'URL, cached so we dont regenerate',
  `homepage` varchar(255) default NULL COMMENT 'identifying URL',
  `bio` text COMMENT 'descriptive biography',
  `location` varchar(255) default NULL COMMENT 'physical location',
  `lat` decimal(10,7) default NULL COMMENT 'latitude',
  `lon` decimal(10,7) default NULL COMMENT 'longitude',
  `location_id` int(11) default NULL COMMENT 'location id if possible',
  `location_ns` int(11) default NULL COMMENT 'namespace for location',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  KEY `profile_nickname_idx` (`nickname`),
  FULLTEXT KEY `nickname` (`nickname`,`fullname`,`location`,`bio`,`homepage`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

-- 
-- Daten für Tabelle `profile`
-- 

INSERT INTO `profile` (`id`, `nickname`, `fullname`, `profileurl`, `homepage`, `bio`, `location`, `lat`, `lon`, `location_id`, `location_ns`, `created`, `modified`) VALUES (1, 'bastian', 'bastian', 'http://dev.status.net:8080/index.php/bastian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-09-11 00:43:18', '2011-09-10 17:43:18');
INSERT INTO `profile` (`id`, `nickname`, `fullname`, `profileurl`, `homepage`, `bio`, `location`, `lat`, `lon`, `location_id`, `location_ns`, `created`, `modified`) VALUES (2, 'bill', 'Bill', 'http://dev.status.net:8080/index.php/bill', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-09-11 00:46:07', '2011-09-10 17:46:07');
INSERT INTO `profile` (`id`, `nickname`, `fullname`, `profileurl`, `homepage`, `bio`, `location`, `lat`, `lon`, `location_id`, `location_ns`, `created`, `modified`) VALUES (3, 'foobar', 'Foo bar', 'http://statusnet.bastianhofmann.de/foobar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-17 20:20:50', '2012-07-17 22:20:50');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `profile_block`
-- 

DROP TABLE IF EXISTS `profile_block`;
CREATE TABLE IF NOT EXISTS `profile_block` (
  `blocker` int(11) NOT NULL COMMENT 'user making the block',
  `blocked` int(11) NOT NULL COMMENT 'profile that is blocked',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date of blocking',
  PRIMARY KEY  (`blocker`,`blocked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `profile_block`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `profile_role`
-- 

DROP TABLE IF EXISTS `profile_role`;
CREATE TABLE IF NOT EXISTS `profile_role` (
  `profile_id` int(11) NOT NULL COMMENT 'account having the role',
  `role` varchar(32) collate utf8_bin NOT NULL COMMENT 'string representing the role',
  `created` datetime NOT NULL COMMENT 'date the role was granted',
  PRIMARY KEY  (`profile_id`,`role`),
  KEY `profile_role_role_created_profile_id_idx` (`role`,`created`,`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `profile_role`
-- 

INSERT INTO `profile_role` (`profile_id`, `role`, `created`) VALUES (1, 0x61646d696e6973747261746f72, '2011-09-11 00:43:18');
INSERT INTO `profile_role` (`profile_id`, `role`, `created`) VALUES (1, 0x6d6f64657261746f72, '2011-09-11 00:43:18');
INSERT INTO `profile_role` (`profile_id`, `role`, `created`) VALUES (1, 0x6f776e6572, '2011-09-11 00:43:18');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `profile_tag`
-- 

DROP TABLE IF EXISTS `profile_tag`;
CREATE TABLE IF NOT EXISTS `profile_tag` (
  `tagger` int(11) NOT NULL COMMENT 'user making the tag',
  `tagged` int(11) NOT NULL COMMENT 'profile tagged',
  `tag` varchar(64) collate utf8_bin NOT NULL COMMENT 'hash tag associated with this notice',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date the tag was added',
  PRIMARY KEY  (`tagger`,`tagged`,`tag`),
  KEY `profile_tag_modified_idx` (`modified`),
  KEY `profile_tag_tagger_tag_idx` (`tagger`,`tag`),
  KEY `profile_tag_tagged_idx` (`tagged`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `profile_tag`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `queue_item`
-- 

DROP TABLE IF EXISTS `queue_item`;
CREATE TABLE IF NOT EXISTS `queue_item` (
  `id` int(11) NOT NULL auto_increment COMMENT 'unique identifier',
  `frame` blob NOT NULL COMMENT 'data: object reference or opaque string',
  `transport` varchar(8) collate utf8_bin NOT NULL COMMENT 'queue for what? "email", "jabber", "sms", "irc", ...',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `claimed` datetime default NULL COMMENT 'date this item was claimed',
  PRIMARY KEY  (`id`),
  KEY `queue_item_created_idx` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `queue_item`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `related_group`
-- 

DROP TABLE IF EXISTS `related_group`;
CREATE TABLE IF NOT EXISTS `related_group` (
  `group_id` int(11) NOT NULL COMMENT 'foreign key to user_group',
  `related_group_id` int(11) NOT NULL COMMENT 'foreign key to user_group',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  PRIMARY KEY  (`group_id`,`related_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `related_group`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `remember_me`
-- 

DROP TABLE IF EXISTS `remember_me`;
CREATE TABLE IF NOT EXISTS `remember_me` (
  `code` varchar(32) collate utf8_bin NOT NULL COMMENT 'good random code',
  `user_id` int(11) NOT NULL COMMENT 'user who is logged in',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `remote_profile`
-- 

DROP TABLE IF EXISTS `remote_profile`;
CREATE TABLE IF NOT EXISTS `remote_profile` (
  `id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `uri` varchar(255) collate utf8_bin default NULL COMMENT 'universally unique identifier, usually a tag URI',
  `postnoticeurl` varchar(255) collate utf8_bin default NULL COMMENT 'URL we use for posting notices',
  `updateprofileurl` varchar(255) collate utf8_bin default NULL COMMENT 'URL we use for updates to this profile',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `remote_profile`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `reply`
-- 

DROP TABLE IF EXISTS `reply`;
CREATE TABLE IF NOT EXISTS `reply` (
  `notice_id` int(11) NOT NULL COMMENT 'notice that is the reply',
  `profile_id` int(11) NOT NULL COMMENT 'profile replied to',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  `replied_id` int(11) default NULL COMMENT 'notice replied to (not used, see notice.reply_to)',
  PRIMARY KEY  (`notice_id`,`profile_id`),
  KEY `reply_notice_id_idx` (`notice_id`),
  KEY `reply_profile_id_idx` (`profile_id`),
  KEY `reply_replied_id_idx` (`replied_id`),
  KEY `reply_profile_id_modified_notice_id_idx` (`profile_id`,`modified`,`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `reply`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `rsscloud_subscription`
-- 

DROP TABLE IF EXISTS `rsscloud_subscription`;
CREATE TABLE IF NOT EXISTS `rsscloud_subscription` (
  `subscribed` int(11) NOT NULL,
  `url` varchar(255) character set utf8 NOT NULL,
  `failures` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`subscribed`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `rsscloud_subscription`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `session`
-- 

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(32) collate utf8_bin NOT NULL COMMENT 'session ID',
  `session_data` text collate utf8_bin COMMENT 'session data',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  KEY `session_modified_idx` (`modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `session`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sms_carrier`
-- 

DROP TABLE IF EXISTS `sms_carrier`;
CREATE TABLE IF NOT EXISTS `sms_carrier` (
  `id` int(11) NOT NULL COMMENT 'primary key for SMS carrier',
  `name` varchar(64) collate utf8_bin default NULL COMMENT 'name of the carrier',
  `email_pattern` varchar(255) collate utf8_bin NOT NULL COMMENT 'sprintf pattern for making an email address from a phone number',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `subscription`
-- 

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
  `subscriber` int(11) NOT NULL COMMENT 'profile listening',
  `subscribed` int(11) NOT NULL COMMENT 'profile being listened to',
  `jabber` tinyint(4) default '1' COMMENT 'deliver jabber messages',
  `sms` tinyint(4) default '1' COMMENT 'deliver sms messages',
  `token` varchar(255) collate utf8_bin default NULL COMMENT 'authorization token',
  `secret` varchar(255) collate utf8_bin default NULL COMMENT 'token secret',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`subscriber`,`subscribed`),
  KEY `subscription_subscriber_idx` (`subscriber`,`created`),
  KEY `subscription_subscribed_idx` (`subscribed`,`created`),
  KEY `subscription_token_idx` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `token`
-- 

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `consumer_key` varchar(255) collate utf8_bin NOT NULL COMMENT 'unique identifier, root URL',
  `tok` char(32) collate utf8_bin NOT NULL COMMENT 'identifying value',
  `secret` char(32) collate utf8_bin NOT NULL COMMENT 'secret value',
  `type` tinyint(4) NOT NULL default '0' COMMENT 'request or access',
  `state` tinyint(4) default '0' COMMENT 'for requests, 0 = initial, 1 = authorized, 2 = used',
  `verifier` varchar(255) collate utf8_bin default NULL COMMENT 'verifier string for OAuth 1.0a',
  `verified_callback` varchar(255) collate utf8_bin default NULL COMMENT 'verified callback URL for OAuth 1.0a',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`consumer_key`,`tok`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `user`
-- 

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL COMMENT 'foreign key to profile table',
  `nickname` varchar(64) default NULL COMMENT 'nickname or username, duped in profile',
  `password` varchar(255) default NULL COMMENT 'salted password, can be null for OpenID users',
  `email` varchar(255) default NULL COMMENT 'email address for password recovery etc.',
  `incomingemail` varchar(255) default NULL COMMENT 'email address for post-by-email',
  `emailnotifysub` tinyint(4) default '1' COMMENT 'Notify by email of subscriptions',
  `emailnotifyfav` tinyint(4) default '1' COMMENT 'Notify by email of favorites',
  `emailnotifynudge` tinyint(4) default '1' COMMENT 'Notify by email of nudges',
  `emailnotifymsg` tinyint(4) default '1' COMMENT 'Notify by email of direct messages',
  `emailnotifyattn` tinyint(4) default '1' COMMENT 'Notify by email of @-replies',
  `emailmicroid` tinyint(4) default '1' COMMENT 'whether to publish email microid',
  `language` varchar(50) default NULL COMMENT 'preferred language',
  `timezone` varchar(50) default NULL COMMENT 'timezone',
  `emailpost` tinyint(4) default '1' COMMENT 'Post by email',
  `jabber` varchar(255) default NULL COMMENT 'jabber ID for notices',
  `jabbernotify` tinyint(4) default '0' COMMENT 'whether to send notices to jabber',
  `jabberreplies` tinyint(4) default '0' COMMENT 'whether to send notices to jabber on replies',
  `jabbermicroid` tinyint(4) default '1' COMMENT 'whether to publish xmpp microid',
  `updatefrompresence` tinyint(4) default '0' COMMENT 'whether to record updates from Jabber presence notices',
  `sms` varchar(64) default NULL COMMENT 'sms phone number',
  `carrier` int(11) default NULL COMMENT 'foreign key to sms_carrier',
  `smsnotify` tinyint(4) default '0' COMMENT 'whether to send notices to SMS',
  `smsreplies` tinyint(4) default '0' COMMENT 'whether to send notices to SMS on replies',
  `smsemail` varchar(255) default NULL COMMENT 'built from sms and carrier',
  `uri` varchar(255) default NULL COMMENT 'universally unique identifier, usually a tag URI',
  `autosubscribe` tinyint(4) default '0' COMMENT 'automatically subscribe to users who subscribe to us',
  `urlshorteningservice` varchar(50) default 'ur1.ca' COMMENT 'service to use for auto-shortening URLs',
  `inboxed` tinyint(4) default '0' COMMENT 'has an inbox been created for this user?',
  `design_id` int(11) default NULL COMMENT 'id of a design',
  `viewdesigns` tinyint(4) default '1' COMMENT 'whether to view user-provided designs',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `incomingemail` (`incomingemail`),
  UNIQUE KEY `jabber` (`jabber`),
  UNIQUE KEY `sms` (`sms`),
  UNIQUE KEY `uri` (`uri`),
  KEY `user_smsemail_idx` (`smsemail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Daten für Tabelle `user`
-- 

INSERT INTO `user` (`id`, `nickname`, `password`, `email`, `incomingemail`, `emailnotifysub`, `emailnotifyfav`, `emailnotifynudge`, `emailnotifymsg`, `emailnotifyattn`, `emailmicroid`, `language`, `timezone`, `emailpost`, `jabber`, `jabbernotify`, `jabberreplies`, `jabbermicroid`, `updatefrompresence`, `sms`, `carrier`, `smsnotify`, `smsreplies`, `smsemail`, `uri`, `autosubscribe`, `urlshorteningservice`, `inboxed`, `design_id`, `viewdesigns`, `created`, `modified`) VALUES (1, 'bastian', 'aaa42296669b958c3cee6c0475c8093e', NULL, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 0, NULL, 'http://dev.status.net:8080/index.php/user/1', 0, 'ur1.ca', 1, NULL, 1, '2011-09-11 00:43:18', '2011-09-10 17:43:18');
INSERT INTO `user` (`id`, `nickname`, `password`, `email`, `incomingemail`, `emailnotifysub`, `emailnotifyfav`, `emailnotifynudge`, `emailnotifymsg`, `emailnotifyattn`, `emailmicroid`, `language`, `timezone`, `emailpost`, `jabber`, `jabbernotify`, `jabberreplies`, `jabbermicroid`, `updatefrompresence`, `sms`, `carrier`, `smsnotify`, `smsreplies`, `smsemail`, `uri`, `autosubscribe`, `urlshorteningservice`, `inboxed`, `design_id`, `viewdesigns`, `created`, `modified`) VALUES (2, 'bill', '6978915ee7dbc5aff1bc34b59e8c0fc5', NULL, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 0, NULL, 'http://dev.status.net:8080/index.php/user/2', 0, 'ur1.ca', 1, NULL, 1, '2011-09-11 00:46:07', '2011-09-10 17:46:07');
INSERT INTO `user` (`id`, `nickname`, `password`, `email`, `incomingemail`, `emailnotifysub`, `emailnotifyfav`, `emailnotifynudge`, `emailnotifymsg`, `emailnotifyattn`, `emailmicroid`, `language`, `timezone`, `emailpost`, `jabber`, `jabbernotify`, `jabberreplies`, `jabbermicroid`, `updatefrompresence`, `sms`, `carrier`, `smsnotify`, `smsreplies`, `smsemail`, `uri`, `autosubscribe`, `urlshorteningservice`, `inboxed`, `design_id`, `viewdesigns`, `created`, `modified`) VALUES (3, 'foobar', '11ea1cf4f9ed1fd9e94f451963c90365', 'bashofmann@gmail.com', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 0, NULL, 'http://statusnet.bastianhofmann.de/user/3', 0, 'ur1.ca', 1, NULL, 1, '2012-07-17 20:20:50', '2012-07-18 22:04:00');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `user_group`
-- 

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
  `id` int(11) NOT NULL auto_increment COMMENT 'unique identifier',
  `nickname` varchar(64) default NULL COMMENT 'nickname for addressing',
  `fullname` varchar(255) default NULL COMMENT 'display name',
  `homepage` varchar(255) default NULL COMMENT 'URL, cached so we dont regenerate',
  `description` text COMMENT 'group description',
  `location` varchar(255) default NULL COMMENT 'related physical location, if any',
  `original_logo` varchar(255) default NULL COMMENT 'original size logo',
  `homepage_logo` varchar(255) default NULL COMMENT 'homepage (profile) size logo',
  `stream_logo` varchar(255) default NULL COMMENT 'stream-sized logo',
  `mini_logo` varchar(255) default NULL COMMENT 'mini logo',
  `design_id` int(11) default NULL COMMENT 'id of a design',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  `uri` varchar(255) default NULL COMMENT 'universal identifier',
  `mainpage` varchar(255) default NULL COMMENT 'page for group info to link to',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uri` (`uri`),
  KEY `user_group_nickname_idx` (`nickname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `user_group`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `user_location_prefs`
-- 

DROP TABLE IF EXISTS `user_location_prefs`;
CREATE TABLE IF NOT EXISTS `user_location_prefs` (
  `user_id` int(11) NOT NULL COMMENT 'user who has the preference',
  `share_location` tinyint(4) default '1' COMMENT 'Whether to share location data',
  `created` datetime NOT NULL COMMENT 'date this record was created',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT 'date this record was modified',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `user_location_prefs`
-- 

INSERT INTO `user_location_prefs` (`user_id`, `share_location`, `created`, `modified`) VALUES (64, 1, '2012-09-06 16:18:34', '2012-09-06 18:18:34');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `user_openid`
-- 

DROP TABLE IF EXISTS `user_openid`;
CREATE TABLE IF NOT EXISTS `user_openid` (
  `canonical` varchar(255) character set utf8 NOT NULL,
  `display` varchar(255) character set utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NULL default NULL,
  PRIMARY KEY  (`canonical`),
  UNIQUE KEY `user_openid_display_idx` (`display`),
  KEY `user_openid_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `user_openid`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `user_openid_trustroot`
-- 

DROP TABLE IF EXISTS `user_openid_trustroot`;
CREATE TABLE IF NOT EXISTS `user_openid_trustroot` (
  `trustroot` varchar(255) character set utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NULL default NULL,
  PRIMARY KEY  (`trustroot`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Daten für Tabelle `user_openid_trustroot`
-- 

