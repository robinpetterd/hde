<?php

class LocationDisplayPage extends Page {


}

class LocationDisplayPage_Controller extends Page_Controller {

	function init() {
              parent::init();
			   Requirements::javascript('hde/javascript/swfobject.js');
			   Requirements::javascript("http://maps.google.com/maps?file=api&v=2.x//maps.google.com/maps?file=api&v=2.x&key=ABQIAAAAHwMDoJv7ztwpHkLRxQpwXhTd4Yb1hKwwc865J-MNGv4PuLdf3hTTpz1UPuxrXLma8Kx9rUatwRZ0ow");
          }
		

	  
   
   function map() {
		
		$Location = Session::get("Loc");
		//Debug::Show('here');

		header("Content-type: text/xml");
		die($Location->renderWith(array('map')));
	
		
    }
   


   function display() {
	   	   
      $params = Director::urlParams();
      $id = (int)$params['ID'];

	 if ($id == null){
		Director::redirect('error/');
		}//

	 //Need to do this all the data objects where we might find the person.  
	  
	
	$location = DataObject::get_by_id('Loc',$id); 
	//Debug::show($person);

    if($location  == null) Director::redirect('error/');


		$this->Title = $location->Name;//Make the name of the location show up in the title
	    Session::set("Loc", $location);
			  	
		return $this->customise(array('Location' => $location));

				  
      }

	
	 
	 function People() {
	   	   
     	//$peopleObjects = new DataObjectSet(); 
	  
		$Location = Session::get("Loc");
		//Debug::Show($Location);		
		$LocID = $Location->ID;
		
	    $Owners = DataObject::get(
							"Owner",
							 "LocationID = {$LocID}"
							 //"Events.YEAR ASC",
							 //"LEFT JOIN BONData_Owner ON BONData.ID = BONData_Owner.BONDataID 
							  //LEFT JOIN Events ON Events.ID = EventData.EventID ",
							 //"1"
							 );
		
		 $LocEvents = DataObject::get(
							"Events",
							 "LocationID = {$LocID}"
							 //"Events.YEAR ASC",
							 //"LEFT JOIN BONData_Owner ON BONData.ID = BONData_Owner.BONDataID 
							  //LEFT JOIN Events ON Events.ID = EventData.EventID ",
							 //"1"
							 );
		
		 $Ships = DataObject::get(
							"Ship",
							 "LeavesFromID = {$LocID} or LocationID = {$LocID} "
							 //"Events.YEAR ASC",
							 //"LEFT JOIN BONData_Owner ON BONData.ID = BONData_Owner.BONDataID 
							  //LEFT JOIN Events ON Events.ID = EventData.EventID ",
							 //"1"
							 );
							 
		//Debug::Show($Ships);		
		
		return new ArrayData(array("Owners" => $Owners, "LocEvents" => $LocEvents,"Ships" => $Ships ));	
		
		//return 	$events->buildNestedUL(2);
      }
  
	  
	  
   }
   
  
 




?>
