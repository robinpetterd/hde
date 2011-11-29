<?php
/**
 * Defines the ProjectHolder page type
 */
class Information extends Page {
   static $db = array(
   );
   static $has_one = array(
   );
   
   static $allowed_children = array('InformationPage','Information');
   static $default_child = 'InformationPage';
}
 
 
class Information_Controller extends Page_Controller {

 
}
 
?>