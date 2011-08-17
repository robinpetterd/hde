<?php

class SourceImagesDisplayPage extends Page {

	
	static $db = array (
	 'Instructions'=>'Text'
			
	);
	
	
		
	public function getCMSFields()
	{
		$f = parent::getCMSFields();
		
			$f->addFieldToTab('Root.Content.Instructions', new TextField('Instructions'));




		
		

		return $f;
	}
	
	
	
	
	
	}

class  SourceImagesDisplayPage_Controller extends Page_Controller {

		function init() {
              parent::init();
          }
		  
		  
   function display() {
      $params = Director::urlParams();
      $id = (int)$params['ID'];
      
	  $object = DataObject::get_by_id('SourceImages',$id);

	  
	  	$this->Title = $object->Name;//Make the person name show up in the title


      if($object) {
         
		 return $this 
		  ->customise(array('SourceImages' => $object))
          ->renderWith(array('SourceImagesPage', 'Page'));
		 
		
      } else {
         Director::redirect('page-not-found/');
      }
   }
   
   
  
   
   function transcript() {
		  $params = Director::urlParams();
		  $id = (int)$params['ID'];
		  
		  $object = DataObject::get_by_id('SourceImages',$id);
		  
		  //Debug::show($object);


		  if($object) {
			 
			
			 $this->Title = $object->Name;//Make the person name show up in the title


			 return $this 
			  ->customise(array('SourceImages' => $object))
			  ->renderWith(array('TranscriptsPage', 'Page'));
			 
			
		  } else {
			 Director::redirect('page-not-found/');
		  }
   }
   
   
   
   
   
 
	   

}


?>
