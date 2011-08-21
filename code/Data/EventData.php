<?php 

class EventData extends DataObject {
 
   	static $api_access = true;
    
	function canView() { return true; }
   
    static $db = array(

   );


   static $has_one = array(
	
	'KnownAs' => 'Person', //Main linkage
  	'Event' => 'Events',
	'SourceFile' => 'File',
	
   );
   
   static $has_many = array(
   );	  
   	
	
    static $many_many = array(	
		'Relationships'=>'EventRelationship',
	    'Groups'=>'myGroups',

	);
	

		

  static $searchable_fields = array(
       'KnownAs.Name',
   );
 
   

									
    static $summary_fields = array(
     'KnownAs.Name','KnownAs.ID','ID'
   );
	
	
	function setKnownAsName($NameID){
		 Debug::show("hefre");
		 $this->KnownAs = $NameID;	
	}
 	
	


function onBeforeWrite() {
   		
	  
    	parent::onBeforeWrite();
}
  




function getRel() {
	  
	//Debug::show($this->Event()->ID);	
	
	$rel = new DataObjectSet();
	$who = new DataObjectSet();

	
	Session::set("Current.Event", $this->EventID);

	//Debug::show($this->KnownAsID);
	
	$dataSet = DataObject::get(
							"EventRelationship",
							 "RelativeID = {$this->KnownAsID}",
							 "",
							 "LEFT JOIN EventData_Relationships ON EventRelationship.ID =  EventData_Relationships.EventRelationshipID",
							 ""
							 );
	//Debug::show($dataSet);  
	
	if($dataSet) {	

		 foreach ($dataSet as $data) {
					//Debug::show("yes got a DataSet");   
					//Debug::show($this->EventID);   
					//Get what 
				  $eventDataSet = DataObject::get(
												 "EventData",
												 "EventData_Relationships.EventRelationshipID = {$data->ID}",
												 "",
												 "LEFT JOIN EventData_Relationships ON EventData.ID =  EventData_Relationships.EventDataID
												  ",
												 ""
										);
				  
								//Debug::show($eventDataSet); 
								
								/** Make sure these Relationship do related to this event**/
									if($eventDataSet) {
										 foreach ($eventDataSet as $event) {		
										 		
												//Debug::show($event->EventID);   
												//Debug::show($this->Event()->ID);
												
												if ($event->EventID == $this->Event()->ID) {
													//so now the a relationship has been found 
													//Debug::show('found');
													$rel->push($data);
													
													//Debug::show("found");  
													break;
													//Debug::show($resultDataObjectSet);
												}
										 }
									}
						
			}
			
		
	}
	  	//Debug::show($rel);
		
		
		//$result = array_unique($rel);

		return $rel;
}
	
 function getCMSFields() {
		   
			 /*
			 BUG - FUTURE this is a work around to get stuff work with 
			 */
			 
			 $fields = parent::getCMSFields();
		
		 	$labelText = '<h2><a href="/person/display/' .  $this->KnownAsID . '" target="new" >Link to front end page</a></h2>';
			
		 	$label = new LiteralField ( $title = "Link",
									   $content = $labelText
			   );
			
			$fields->addFieldToTab("Root.Main",$label);
				
				
				

	 		//$fields->removeByName('Event'); //We remove this event at this stage because in actual data it's harded wired. 
			//$fields->removeByName('Relationships');
			//$fields->removeByName('Groups');

		    $fields->removeByName('SourceFile');
			
			
			
			$fields->removeByName('Known As');
					
			
			$knowasOnTablefield = new HasOneDataObjectManager(
				 $this,
				'KnownAs',
				'Person',
				 array(
				'Name' => 'Name'
			 ),		'CMSFields_forPopup'
			  );
			
			
				
		    $fields->addFieldToTab("Root.Main", $knowasOnTablefield);
			
			
			$fields->removeByName('Relationships');

			
			
		/*	$relTablefield = new ManyManyDataObjectManager(
			$this,
				'Relationships',
				'EventRelationship',
				 array('myName'=>'Name', 'ID'=>'Relationship ID'
				 )
			  );
			
			
				
					
			$fields->addFieldToTab("Root.Relatives",$relTablefield);*/




		 $fields->removeByName('Groups');

			
			
			$GroupTablefield = new ManyManyDataObjectManager(
				 $this,
			 	'Groups',
				'myGroups',
				 array(
				 )
			  );
				
			  $fields->addFieldToTab("Root.Groups",$GroupTablefield);


			$EventTablefield = new HasOneDataObjectManager(
				 $this,
			 	'Event',
				'Events',
				 array(
				 )
			  );
				
			  $fields->addFieldToTab("Root.Main",$EventTablefield);

			 
			 $myimage  = new FileIFrameField('SourceFile','Choose the source file'); 
			
			  //$myimage->value = $LastSource; 

				// $myimage::setFolderName()  =  'bon'; 
  			 
			 $fields->addFieldToTab("Root.Main",  $myimage);
			  
			  
			  
			  return $fields;
   }
   
   
function removeFields( $fields) {
		  
			 
			 //$fields = parent::getCMSFields();
		 

	 		$fields->removeByName('Event'); //We remove this event at this stage because in actual data it's harded wired. 
			$fields->removeByName('Relationships');
			$fields->removeByName('Groups');
		    $fields->removeByName('SourceFile');

				
			  return $fields;
   }
		
			
	


 
};

?>
