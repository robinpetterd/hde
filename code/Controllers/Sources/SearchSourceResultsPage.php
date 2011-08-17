<?php

class SearchSourceResultsPage extends Page {

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

class SearchSourceResultsPage_Controller extends Page_Controller {

	static $number_per_page = 7;
	
	
	
	function SourceSearchForm() {
		$request = $this->getRequest();
		
		if($Source = $request->requestVar('Source')) {
			Session::set("SourceSearch.Source", $Source);
		}
		else {
			$Source = Session::get("SourceSearch.Source");
		}
		
		
		
 
		$fields = new FieldSet();
		$fields->push(new TextField('Source','Search the sources by keyword',$Source));

 
		$actions = new FieldSet(
			new FormAction('doSearch','Search')
		);
 
		return new Form($this, 'SourceSearchForm', $fields, $actions);
	}
 
 	
	function doSearch ($data, $form, $request) {
 			
			$Source = Convert::raw2sql($data['Source']);
			Session::set("SourceSearch.Source", $Source);
			
	
	 
		
		Director::redirect($this->Link());
	}

	
	function init() {
              parent::init();
			  
			  Requirements::javascript("themes/blackloyalist/javascript/css3-multi-column.js");
			  //$people = DataObject::get('Source'); 
			  //Debug::show("ha");
			  $currentTitle = "The search results for " . Session::get("SourceSearch.Source");
			  
			  $this->Title =   $currentTitle;

	   }
	  		   
   function Sources() {
	   	
	 //Need to do this all the data objects where we might find the Source.  
	  
		if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
  		$SQL_start = (int)$_GET['start'];
  
		
			$Source = Session::get("SourceSearch.Source");
			$Year = Session::get("SourceSearch.Date");

			
			//Debug::show($Source);
			
			$Source_SQL = Convert::raw2sql($Source); 
			$Year_SQL = Convert::raw2sql($Year); 

			 	
			//Debug::show($Source_SQL);

		   $sources = DataObject::get("Sources",
									 "Name LIKE '%{$Source_SQL}%' OR Explaination LIKE '%{$Source_SQL}%'",
									  "",//Sorts by last name
									  "",
									  
									  "{$SQL_start},50"); 
	
	
	
			 $sourceTranscript = DataObject::get("SourceImage",
									 "Transcript LIKE '%{$Source_SQL}%'",
									  "",//Sorts by last name
									  "",
								  ""); 

				   
				//Debug::show( $sourceTranscript);

			 
		 //  $source =  array_unique($sources);

	 	   //Debug::show( $sourceisimages);
			
		if( $sources ) {
				
				$count = $sources->Count(); 
				
				//if ($count == 0) {$count = $sourceTranscript->Count()};

				} else {
				$count = 0;
		};
		
		if($count == 0) {
			if($sourceTranscript) {
								$count = $sourceTranscript->Count(); 

			}
	
		}
		
		
		
		
		
	
			 			
	 	return $this->customise(array('Source' => $sources, 'Transcripts' =>$sourceTranscript,  'Count' => $count));
	 	 
	 
	  
   }
   
   
   

   
   
      function theSearch() {

		
		$Source = Session::get("SourceSearch.Source");
			
			//Debug::show($Person);

	 	return $Source; 
	 
	 
	  
   }
   
   

}


?>
