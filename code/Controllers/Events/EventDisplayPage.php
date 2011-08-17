<?php

class EventDisplayPage extends Page {


}

class  EventDisplayPage_Controller extends Page_Controller {

	function init() {
              parent::init();
			   Requirements::javascript('hde/javascript/swfobject.js');
          }
		
	function toJSON() {
		
					   
			$params = Director::urlParams();
			 $id = (int)$params['ID'];
		
			if ($id == null){
				Director::redirect('error/');
			};
				
			//-- old Silverstrip  stuff--//		
			/*$person = DataObject::get_by_id('Person',$id); 
		
			$f = new JSONDataFormatter();
			$f->relationDepth = 2;
			$json = $f->convertDataObject($person);
			return $json; */
			
			$PersonEventObjects = DataObject::get("EventData",
												"KnownAsID = '$id'",
												"Events.YEAR ASC",
												"LEFT JOIN Events ON Events.ID = EventData.EventID");
			
			//header("Content-type: application/json");	

			return $this->customise(
			array('EventData' => $PersonEventObjects))
			->renderWith('PersonJson');

	}
	
	
   function display() {
	   
	   
	      $params = Director::urlParams();
	      $id = (int)$params['ID'];
	
		 if ($id == null){
			Director::redirect('error/');
			}//
	
		 //Need to do this all the data objects where we might find the person.  
		  
		
		$event = DataObject::get_by_id('Events',$id); 
		//Debug::show($person);
	
	    if($event == null) Director::redirect('error/');
	
	
		$this->Title = $event->Name;//Make the person name show up in the title
		
			    Session::set("Event", $event);



		return $this 
				  ->customise(array('Event' => $event))
				  ->renderWith(array('EventDisplayPage', 'Page'));	
      }

	  function EventData() {
		  

		  		 $Event= Session::get("Event");
				 $EventID = $Event->ID;

				 $EventObjects = DataObject::get("EventData",
				 								"EventID = '{$EventID}'",
														"",
														"");	 
				 if($EventObjects) {
					  $EventObjects->sort('Order'); //ascending
					  if ($EventID == 9) {
						$EventObjects->sort('LastName'); //ascending
					  }
				 }
				 //Debug::Show("got here");
						
				  $EventType = DataObject::get_one("EventData",
				 								"EventID = '{$EventID}'",
														"Order ASC",
														"");	

				 if ($EventType) {
				 	$EventName = $EventType->ClassName;
				 	} else {
				 		$EventName ="None";
					}

				 
				//Debug::Show($EventObjects);	
				
				return new ArrayData(array("Data" => $EventObjects, "EventType" => $EventName ));	

				//return  $EventObjects;

	  }
	  
	  
		  
	  
   }
   
  
 




?>
