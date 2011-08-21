<?php

class PersonDisplayPage extends Page {


}

class  PersonDisplayPage_Controller extends Page_Controller {

	function init() {
				
				parent::init();

		//Requirements::javascript("hde/javascript/qtip/jquery-1.3.2.min.js");
		
		//Requirements::javascript("hde/javascript/qtip/jquery.qtip-1.0.0-rc3.min.js");
		
                Requirements::javascript("hde/javascript/exhibit/api/exhibit-api.js?autoCreate=false");
                 Requirements::javascript("hde/javascript/exhibit/api/extensions/time/time-extension.js");
	 
//	Requirements::javascript("hde/javascript/exhibit/api/extensions/map/map-extension.js?gmapkey=ABQIAAAAHwMDoJv7ztwpHkLRxQpwXhTd4Yb1hKwwc865J-MNGv4PuLdf3hTTpz1UPuxrXLma8Kx9rUatwRZ0ow");
				
                Requirements::css("themes/blackloyalist/css/SpryTabbedPanels.css");
	
	
				
				

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
		//Director::redirect('error/');
		}//

	 //Need to do this all the data objects where we might find the person.

	Session::set('CurrentPerson', $id);


	$person = DataObject::get_by_id('Person',$id);
	//Debug::show($person);

    if($person == null) {
      //  Director::redirect('error/')
    };


	$this->Title = $person->Name;//Make the person name show up in the title
				$eventObjects = new DataObjectSet();


				//Only do this stuff if user is logged.

		//	Debug::show();



			//----------SEARCH THRU ALL THE BITS OF DATA this is bit messy for the white people  ----------- it would be good this was more elegeant



		  $PersonEventObjects = new  DataObjectSet();
		//just the stanard searches
		  $PersonEventObjects = DataObject::get("EventData",
												"KnownAsID = '$id'",
												"Events.YEAR ASC",
												"LEFT JOIN Events ON Events.ID = EventData.EventID");


		$eventObjects->sort('Year');//ascending

		foreach($eventObjects as $EventData) {

					//Debug::Show($EventData->EventID);

				 // Debug::Show($EventData->Year);
		}

	 $relationshipsObjects = DataObject::get(
								"Relationship",
								"Relationship_Relatives.PersonID = {$id}",
								"",
								"LEFT JOIN Relationship_Relatives ON Relationship.ID = Relationship_Relatives.RelationshipID
							 ",
								 ""
							 );

	//Debug::show($relationshipsObjects);


	if(Permission::check(0)){//Check to see if vieerw is login

	   			  //Debug::show($eventObjects);
				return $this
				  ->customise(array('Person' => $person,'EventData' => $eventObjects))
				  ->renderWith(array('PersonDisplayPage', 'Page'));

   	} else {
      //This is what happen if the user is not logged in
	  //Debug::show("Not logged"'

		$CurrentStatus = $person->Status();// Get the status

			//Debug::show($CurrentStatus);

			  if($CurrentStatus->Name == 'Publish')
				{

			//Debug::show("Show  it the world");

						return $this
						  ->customise(array('Person' => $person,'EventData' => $eventObjects))
						  ->renderWith(array('PersonDisplayPage', 'Page'));
						  
				} else {
				 Director::redirect('error/');

				}

      };



  
	  
	  
   }
   
  
 

}


?>
