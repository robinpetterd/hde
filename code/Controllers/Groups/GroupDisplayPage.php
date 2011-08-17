<?php

class GroupDisplayPage extends Page {


}

class  GroupDisplayPage_Controller extends Page_Controller {

	function init() {
              parent::init();
			   Requirements::javascript('hde/javascript/swfobject.js');
          }
		

   function display() {
	   
	      $params = Director::urlParams();
	      $id = (int)$params['ID'];
	
		 if ($id == null){
			Director::redirect('error/');
			}//
	
		 //Need to do this all the data objects where we might find the person.  
		  
		
		$group = DataObject::get_by_id('myGroups',$id); 
		//Debug::show($person);
	
	    if($group == null) Director::redirect('error/');
	
		$this->Title = $group->Name;//Make the person name show up in the title

			   Session::set("Group", $group);


		$groupEvents =  new DataObjectSet(); 

		$GroupDataObjects = DataObject::get("EventData",
												 "EventData_Groups.myGroupsID = {$id}",
												 "",
												 "LEFT JOIN EventData_Groups ON EventData.ID =  EventData_Groups.EventDataID
												  ",
												 "");
		
		$groupEvents->merge($GroupDataObjects);

		$BONDataObjects = DataObject::get("BONData",
												 "ServiceID = {$id}",
												 "",
												 "",
												 "");
		
		//array_push($groupEvents, $BONDataObjects);
		
		$groupEvents->merge($BONDataObjects);
		
		$BirchTownDataObjects = DataObject::get("BirchtownMusterData",
												 "CompanyTheyAreNowWithID = {$id}",
												 "",
												 "",
												 "");
			
		$groupEvents->merge($BirchTownDataObjects);
		
		$BirchTownCompaniesDataObjects = DataObject::get("BirchtownMusterData",
												 "BirchtownMusterData_CompaniesTheyBelongTo.myGroupsID = {$id}",
												 "",
												 "LEFT JOIN BirchtownMusterData_CompaniesTheyBelongTo ON BirchtownMusterData.ID =  BirchtownMusterData_CompaniesTheyBelongTo.BirchtownMusterDataID
												  
												  ",
												 "");
			
		$groupEvents->merge($BirchTownCompaniesDataObjects);
		
		
		
		
		
		
	//	$groupArrayData = new ArrayData($groupEvents);

		//Debug::Show($groupEvents);
		
		return $this 
				  ->customise(array('Group' => $group,'GroupEvent' => $groupEvents))
				  ->renderWith(array('GroupDisplayPage', 'Page'));	
      }

	  function GroupData() {
		  

		  		 $GroupData= Session::get("Group");
				 $GroupID = $GroupData->ID;
				
				Debug::Show($GroupID);
				
				 $GroupDataObjects = DataObject::get("EventData",
												 "EventData_Groups.myGroupsID = {$id}",
												 "",
												 "LEFT JOIN EventData_Relationships ON EventData.ID =  EventData_Relationships.EventDataID
												  ",
												 "");	 

				  $EventObjects->sort('Order'); //ascending
				  if ($EventID == 9) {
				   $EventObjects->sort('LastName'); //ascending
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
