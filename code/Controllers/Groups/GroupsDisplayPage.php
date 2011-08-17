<?php

class GroupsDisplayPage extends Page {

 	static $db = array(
 	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		return $fields;
	}	
	

}

class  GroupsDisplayPage_Controller extends Page_Controller {

	static $number_per_page = 7;
	
 	
	
	function init() {
              parent::init();
			  
			  Requirements::javascript("themes/blackloyalist/javascript/css3-multi-column.js");
			  //$people = DataObject::get('Person'); 
			  //Debug::show("ha");

		///return $this ->renderWith(array('PeopleDisplayPage', 'Page'));
				  
          }
	  
	  
	  	   
   function Groups() {
	   	
	 //Need to do this all the data objects where we might find the person.  
	  
		if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
  		$SQL_start = (int)$_GET['start'];
  		
		///Debug::show($ID_SQL);

		$groups = DataObject::get("myGroups",
											  "",// Only show the featured Events
											  //"SUBSTRING_INDEX(Name, ' ', -1) ",//Sorts by last name
											  "Name ASC",
											  "",
											  "{$SQL_start},100"); //Get all the blacks 
	
		//$events->sort('Year'); //ascending
	 	//Debug::Show($events);
		
	 	return $this->customise(array('Groups' => $groups));
	 
	 
	  
   }
   
   

}


?>
