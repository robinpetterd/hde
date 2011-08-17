<?php
/**
 */
class SourceDisplayPage extends Page {
	
	
	
   
   
}
 
class SourceDisplayPage_Controller extends Page_Controller {
 
 function init() {
      
	  parent::init();	  
 
   }
   
   
      
 function Featured() {
      
	  $Featured = DataObject::get('Sources',
								 "Featured = TRUE",
								"",
								"",
								"");
	$Featured->Sort('Name');
	 //Debug::show($Featured);

	 return $Featured; 
	  
 
   }
   
   
   
 function Sources() {
      
	  	if(!isset($_GET['start']) || !is_numeric($_GET['start']) || (int)$_GET['start'] < 1) $_GET['start'] = 0;
  		$SQL_start = (int)$_GET['start'];
		
	  $sources = DataObject::get('Sources',
								 "",
								"Name ASC",
								"",
								"{$SQL_start},20");
	
	 // Debug::show($sources );

	 return $sources; 
	  
 
   }
   
  
  function FormAction($data){
		
			//Debug::show("is the do Search");
				
				if (isset($data['Source']) && $data['Source'] != "") {
		 
					$Person = Convert::raw2sql($data['Source']);
		 
					Session::set("SourceSearch.Source", $Person);
				}
		 
				Director::redirect($this->BaseHref() . 'search-source');
	}
	
	function SourceSearchForm() {
		$request = $this->getRequest();
		
		if($Source = $request->requestVar('Source')) {
			Session::set("SourceSearch.Source", $Source);
		}
		else {
			//$Source = Session::get("SourceSearch.Source");
		}
		
 
		$fields = new FieldSet();
		$fields->push(new TextField('Source','Search the sources by keyword',$Source));
 
		$actions = new FieldSet(
			new FormAction('FormAction','Search')
		);
 
 		return new Form($this,'FormAction', $fields, $actions);


		//return new Form($this, 'PersonSearchForm', $fields, $actions);
	}
 
 	



   
   
	   
	   
   
}
 
?>