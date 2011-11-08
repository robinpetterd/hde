<?php

date_default_timezone_set('Australia/Hobart');

ini_set("memory_limit","1000M");
//echo memory_get_usage() . "\n"; // 57960

//phpinfo();

// Sites running on the following servers will be
// run in development mode. See
// http://doc.silverstripe.com/doku.php?id=devmode
// for a description of what dev mode does.
Director::set_dev_servers(array(
	'localhost',
	'127.0.0.1',
));


SSViewer::set_source_file_comments(false);

//tell the Director about mysql dump which is the database back up system 

Director::addRules(8, array('dump//$Action' => 'MySQLDump'));
Director::addRules(50, array('network/$Action/$ID/$Name' => 'NetworkVis_Controller'));
Director::addRules(50, array('linkages/$Action/$ID/$Name' => 'Linkages'));
Director::addRules(50, array('image/$Action/$ID/$Name' => 'SourceImageDisplayPage_Controller'));


SSViewer::setOption('rewriteHashlinks',true);

//SortableDataObject::add_sortable_class('SourceImage');


// This line set's the current theme. More themes can be
// downloaded from http://www.silverstripe.com/themes/

CMSMenu::remove_menu_item('CommentAdmin');
//CMSMenu::remove_menu_item(HELP);

LeftAndMain::setApplicationName("The Historical Data Engine");
LeftAndMain::setLogo("http://www.blackloyalist.info/hde/images/logo.png", "position: relative; left: 5px; margin-top: -3px; padding-left: 50px;");

//LeftAndMain::set_loading_image("/loading.gif"):

	

?>