<?php

class PeopleDisplayPage extends Page {

 	static $db = array(
 		'PeoplePerPage' => 'Int'
 	);

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldsToTab('Root.Content.PageControl',array(
			new NumericField('PeoplePerPage','People Per Page'),
		));
		return $fields;
	}	
	

}

class  PeopleDisplayPage_Controller extends Page_Controller {

	static $number_per_page = 7;
	
	
	
	function FormAction($data){
		
			//Debug::show("is the do Search");
				
				if (isset($data['Person']) && $data['Person'] != "") {
		 
					$Person = Convert::raw2sql($data['Person']);
		 
					Session::set("PersonSearch.Person", $Person);
				}
		 
				
				Director::redirect($this->BaseHref() . 'search');
	}
	
	function PeopleSearchForm() {
		$request = $this->getRequest();
		
		if($Person = $request->requestVar('Person')) {
			Session::set("PersonSearch.Person", $Person);
		}
		else {
			//$Person = Session::get("PersonSearch.Person");
		}
		
 
		$fields = new FieldSet();
		$fields->push(new TextField('Person','Search for a runaway',$Person));
 
		$actions = new FieldSet(
			new FormAction('FormAction','Search')
		);
 
 		return new Form($this,'FormAction', $fields, $actions);


		//return new Form($this, 'PersonSearchForm', $fields, $actions);
	}
 
 	
	

	
	function init() {
              parent::init();
			  
			  Requirements::javascript("themes/blackloyalist/javascript/css3-multi-column.js");
			  //$people = DataObject::get('Person'); 
			  //Debug::show("ha");

		///return $this ->renderWith(array('PeopleDisplayPage', 'Page'));
				  
          }
	  
	  
	  function WhatSearch() {
		
		 return Session::get("PersonSearch.Person");
	   }
	  		   
   function People() {
	   	
	 //Need to do this all the data objects where we might find the person.  
	  
		if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
  		$SQL_start = (int)$_GET['start'];
  
	  $colorObject = DataObject::get_one('Visual','Name = "White"');
	  $colorID =   $colorObject->ID; 
	  
	
	  $workflowObject = DataObject::get_one('WorkFlow','Name = "Publish"');
	  $workflowID = $workflowObject->ID; 
	  
	 

	     $ID_SQL = Convert::raw2sql($colorID); 
		
		///Debug::show($ID_SQL);


	  
	 // $people = DataObject::get('Person','VisualID = "$color" AND StatusID = "1"'); //Get all the blacks and the ones that are published.  

		if(Permission::check(0)){//Check to see if viewer is login 
			//What happen if the user is logged
			
			Debug::show("You are logged in so you getting a list of all the people");
			
			$people = DataObject::get("Person",
									  "VisualID != '{$colorID }'",
									  //"SUBSTRING_INDEX(Name, ' ', -1) ",//Sorts by last name
									  "Name ASC",
									  "",
									  "{$SQL_start},100"); //Get all the blacks 
			
			//$people ->sort('Name');
			
		$featured = DataObject::get("Person","VisualID != '{$colorID }' AND Featured=TRUE" ); //Get all the blacks 


		} else {
		   $people = DataObject::get("Person",
									 "VisualID != '{$colorID }' AND StatusID = '{$workflowID}'",
									  //"SUBSTRING_INDEX(Name, ' ', -1) ",//Sorts by last name
									  "Name ASC",
									  "",
									  
									  "{$SQL_start},50"); //Get all the blacks 
		$featured = DataObject::get("Person","VisualID != '{$colorID }' AND Featured=TRUE" ); //Get all the blacks 


		}
	    



	 
	 	return $this->customise(array('Person' => $people,'Featured' => $featured));
	 
	 
	  
   }
   
   

}


?>
