<?php

class SourceImageDisplayPage extends Page {

}

class  SourceImageDisplayPage_Controller extends Page_Controller {

	function init() {
              parent::init();

          }
		  
   function display() {
      $params = Director::urlParams();
     
	 
	 
	 if (isset($_GET["file"])){
			//Search based on it being a file 
			//Debug::show($_GET["file"]);
			$where = Convert::raw2SQL($_GET["file"]); 
			$object = DataObject::get_one('SourceImage', "ImageID = '$where'");
			
			
	   } else {
	
		 //search for based on being ID 
		   $id = (int)$params['ID'];
		  $object = DataObject::get_by_id('SourceImage',$id);
		 
		
      } 
	  
	  //now see if we actually got something  
	   if($object) {
			 
			 $this->Title = 'Image from ' . $object->mySource()->Name; 
			 return $this 
			  ->customise(array('SourceImage' => $object))
			 ->renderWith(array('SourceImagePage', 'Page'));
			 
		  } else {
			  //don't have anything we send them to an error page 
         Director::redirect('error/');
      }
	 	   
	   
   }
   
   
  
   

}


?>
