<?php

class SearchPersonResultsPage extends Page {

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

class  SearchPersonResultsPage_Controller extends Page_Controller {

	static $number_per_page = 7;
	
	
	
	function PeopleSearchForm() {
		$request = $this->getRequest();
		
		if($Person = $request->requestVar('Person')) {
			Session::set("PersonSearch.Person", $Person);
		}
		else {
			$Person = Session::get("PersonSearch.Person");
		}
		
 
		$fields = new FieldSet();
		$fields->push(new TextField('Person','Search for a person',$Person));
 
		$actions = new FieldSet(
			new FormAction('doSearch','Search')
		);
 
		return new Form($this, 'PersonSearchForm', $fields, $actions);
	}
 
 	
	function doSearch ($data, $form, $request) {
 
		$filter = array();
			
		if (isset($data['Person']) && $data['Person'] != "") {
 
			$Person = Convert::raw2sql($data['Person']);
 
			Session::set("PersonSearch.Person", $Person);
		}
 
		
		Director::redirect($this->Link());
	}

	
	function init() {
              parent::init();
			  
			  Requirements::javascript("themes/blackloyalist/javascript/css3-multi-column.js");
			  //$people = DataObject::get('Person'); 
			  //Debug::show("ha");
			  $currentTitle = "The search results for " . Session::get("PersonSearch.Person");
			  
			  $this->Title =   $currentTitle;

	   }
	  		   
   function People() {
	   	
	 //Need to do this all the data objects where we might find the person.  
	  
		if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
  		$SQL_start = (int)$_GET['start'];
  
		 // $colorObject = DataObject::get_one('Visual','');
		 // $colorID =   $colorObject->ID; 
	  
	
		  $workflowObject = DataObject::get_one('WorkFlow','Name = "Publish"');
		  $workflowID = $workflowObject->ID; 
	  
	 

	 	   // $ID_SQL = Convert::raw2sql($colorID); 
		
			$Person = Session::get("PersonSearch.Person");
			
			//Debug::show($Person);
			
			$Person_SQL = Convert::raw2sql($Person); 
			 	
			//Debug::show("VisualID != '{$colorID}' AND StatusID = '{$workflowID}' AND Name LIKE '{%$Person_SQL}%'");

		   $people = DataObject::get("Person",
									 "StatusID = '{$workflowID}' AND Name LIKE '%{$Person_SQL}%' ",
									  "SUBSTRING_INDEX(Name, ' ', -1) ",//Sorts by last name
									  "",
									  "{$SQL_start},50"); //Get all the blacks 
			    



	 		//Debug::show($people->Count());
			
			if($people) {
				$count = $people->Count(); 
				} else {
				$count = 0;
			}
			
			 
	 	return $this->customise(array('Person' => $people,'Count' => $count));
	 
	 
	  
   }
   
   
   

   
   
      function theSearch() {

		
		$Person = Session::get("PersonSearch.Person");
			
			//Debug::show($Person);

	 	return $Person; 
	 
	 
	  
   }
   
   

}


?>
