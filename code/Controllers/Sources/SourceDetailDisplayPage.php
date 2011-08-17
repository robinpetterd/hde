<?php

class SourceDetailDisplayPage extends Page {

	
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

class  SourceDetailDisplayPage_Controller extends Page_Controller {

 
	
		function init() {
              parent::init();
			  Requirements::css('http://yui.yahooapis.com/combo?2.7.0/build/carousel/assets/skins/sam/carousel.css'); 
			  Requirements::css('hde/css/carousel.css'); 
	 		 Requirements::javascript('http://yui.yahooapis.com/combo?2.7.0/build/yahoo-dom-event/yahoo-dom-event.js&2.7.0/build/element/element-min.js&2.7.0/build/carousel/carousel-min.js');
          }
		  
		  
   function display() {
      $params = Director::urlParams();
      $id = (int)$params['ID'];
      
	  $object = DataObject::get_by_id('Sources',$id);

	  
	  	$this->Title = $object->Name;//Make the person name show up in the title


      if($object) {
         
		 return $this 
		  ->customise(array('Source' => $object))
          ->renderWith(array('SourceDetailsPage', 'Page'));
		 
		
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
