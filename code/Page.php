<?php

class Page extends SiteTree {
	  
	  
	public static $db = array(
							  
	);
	
	public static $has_one = array(
	);
	
	
	  static $defaults = array(
   );
   
   function getCMSFields() {
   
   		$fields = parent::getCMSFields();
    	return $fields;

   }

}


class Page_Controller extends ContentController {
	
	public function init() {
			parent::init();
			//Debug::show("in page controller"); 
					
			Requirements::set_write_js_to_body(false);
            
		
	}
	
	
	
	
	
	
	
}

?>