<?php 

class SecondBirchtownMusterData extends EventData {
 
   
    static $db = array(
      
	  'FirstName' => 'Varchar', //From the Muster 
	  'LastName' => 'Varchar', //From the Muster 
  	
   );


   static $has_one = array(
		 
   );
   	
 
  
  
	static $many_many = array(
		);



  static $searchable_fields = array(
	   'FirstName', 'LastName'
   );
 
   
									
    static $summary_fields = array(
	 'KnownAs.Name','FirstName', 'LastName'

   );
	
	
	public function populateDefaults(){
			
			parent::populateDefaults();
			//$this->EventID = 8;
  		     
			 $where = 'Name = "2nd Birchtown Muster"';
			
			$ThisEvent = DataObject::get_one('Events', $where );
		  //  Debug::show($ThisEvent);
			
		  	//Debug::show($ThisEvent->ID);
		   $this->EventID = $ThisEvent->ID;

   }


	
function onBeforeWrite() {
   		
	  
	   $WriteCookie = new Cookie;
	  
		
	
			 if ($this->KnownAsID){
				 	$WriteCookie->set('KnownAsID', $this->KnownAsID);
		   }; 
		   
		


    	parent::onBeforeWrite();
		
		
}
  
  
	
 function getCMSFields() {
		   
			 /*
			 BUG - FUTURE this is a work around to get stuff work with 
			 */
			 
			 $fields = parent::getCMSFields();
			 $fields = $this->removeFields($fields); 

			 
			 /*---- Add a title to this page - because all of these pages will start to look that same */
			 
			 $fields->addFieldToTab("Root.Main",new HeaderField (
 					   
					'Birchtown Muster ' .  $title = $this->FirstName . ' ' . $this->LastName ,
    					
						$headingLevel = "1","FirstName"
			));
			 
			$fields->removeByName('Known As');

		

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Who is this person known as",
    					$headingLevel = "3"
			));
					
			
			$knowasOnTablefield = new HasOneDataObjectManager(
				 $this,
				'KnownAs',
				'Person',
				 array(
				'Name' => 'Name',
				 ),'CMSFields_forPopup'
			  );
			
			
			  $Cookie = new Cookie;
			 
			 if ($Cookie->get('LastPersonID')) { 
				$LastPerson =  $Cookie->get('LastPersonID');
				$LastPersonRecord = DataObject::get_by_id('Person', $LastPerson);
				$LastPersonName = $LastPersonRecord->Name;  
			 } else {
				 
				 $LastPerson = 0; 
				 $LastPersonName = 'no last person found'; 
				 
			 };
				
				
						
				$knowasOnTablefield->setFilter(
				   'Name', // The field we're filtering
				   'Filter by possible names', // The label for the filter field
				   array(
						 
					' '  =>  ' ',
					$LastPersonName => $LastPersonName,
					 $this->FirstName . ' ' . $this->LastName  => $this->FirstName . ' ' . $this->LastName ,
					  $this->FirstName   => $this->FirstName  ,
					  $this->LastName  =>  $this->LastName ,
  
				   ) // The dropdown map of values => display text. The values will be matched against the Author field.
				);
				
				
		    $fields->addFieldToTab("Root.Main", $knowasOnTablefield);



    //----------- First and Last name, description   -----------///

				 
			 $fields->removeByName('First Name');
			 $fields->removeByName('Last Name');
			


		 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'FirstName',
				   $title = "First Name",
				   $value = ""
			  ));
			
			$fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'LastName',
				   $title = "Last Name",
				   $value = ""
			  ));
				 
				 
				 
        $fields->removeByName('Source');
			 
			 	$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "------- Source ------- ",
    					$headingLevel = "3"
			));
				
			 
			$Cookie = new Cookie;
		
			if ($Cookie ->get('SourceFileID'))	{
					
					$LastSource= $Cookie ->get('SourceFileID'); 
					//$this->SourceFile =  $LastSource; 
					
			} else {$LastSource=0;};
			
			
			 
			 
			 
			 $myimage  = new FileIFrameField('SourceFile','Choose the source file'); 
			
			  //$myimage->value = $LastSource; 

				// $myimage::setFolderName()  =  'bon'; 
  			 
			 $fields->addFieldToTab("Root.Main",  $myimage);
			  
											
			 
			 
			
		
			 

			//$fields->changeFieldOrder('LastName','FirstName');
		
			  return $fields;
   }
   
   

		
			
	


 
};

?>
