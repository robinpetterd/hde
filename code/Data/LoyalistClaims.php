<?php 

class LoyalistClaims extends EventData {
 
   
    static $db = array(
      
	 // 'Name' => 'Text',
	 'OwnerName' => 'Text',
	 'Transcript' => 'HTMLText', //// Just a general transcript field 
	  
	  
	  	  'Narrative' => 'Text',  //What the data entry person thought

   );


   static $has_one = array(
   ); 
  
  
	static $many_many = array(
		  'RunAways' => 'Person', //This the same as the Owner in the BON I think. 
		);



  static $searchable_fields = array(
									
		'OwnerName',


   );
 
   

									
    static $summary_fields = array(
	 'OwnerName','ID'

   );
	
	public function GetOwnerID() {
		//return "nfsdakfnd";
		return $this->KnownAsID;	
	}
	
	
	public function populateDefaults(){
			
			parent::populateDefaults();
			//$this->EventID = 8;
  		     
			 $where = 'Name = "Patriot claims for losses to the British"';
		
			$ThisEvent = DataObject::get_one('Events', $where );
		  //  Debug::show($ThisEvent);
			
		  	//Debug::show($ThisEvent->ID);
		   $this->EventID = $ThisEvent->ID;

   }


	
function onBeforeWrite() {
   		
	 	//Debug::show($this->KnownAsID);
		//* this is all a bit of hack to get Model Admin to search on name basically creates a virtual name 
		
		
		$id = $this->KnownAsID;
		$id = (integer)$id;
		
		$me = DataObject::get_by_id('Person',$id);
		
		
		if($me) {
			//Debug::show($me);
			$this->OwnerName = $me->Name; //this is a bit of hack so the search on Model Admin can find see the person's name. 
		}
    	parent::onBeforeWrite();
		
		
}
  
  
	
 function getCMSFields() {
		   
			 /*
			 BUG - FUTURE this is a work around to get stuff work with 
			 */
			 
			 $fields = parent::getCMSFields();
			 
			 $fields = $this->removeFields($fields); 
			
						$fields->removeByName('Run Aways');

		 	 								$fields->removeByName('Owner Name');

			 			$fields->removeByName('Known As');

			 /*---- Add a title to this page - because all of these pages will start to look that same */
						  
			  
			 $fields->addFieldToTab("Root.Main",new HeaderField (
 					   
					'Claims Against the British'  ,
    					
						$headingLevel = "1"
			));
			 

			
			
			$fields->removeByName('Known As');

		

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Owner",
    					$headingLevel = "3"
			));
					
			
			$knowasOnTablefield = new HasOneDataObjectManager(
				 $this,
				'KnownAs',
				'Owner',
				 array(
				'Name' => 'Name'
				 ),'CMSFields_forPopup'
			  );
			
			
					    $fields->addFieldToTab("Root.Main", $knowasOnTablefield);

   
		
			

			
			 $fields->removeByName('Transcript'); 
			 
			 $fields->addFieldToTab("Root.Main", new TextareaField(
				   $name = 'Transcript',
				   $title = "Transcript - this a html field to make a line break use <br\> at the end of each line ",
				   $rows = 8,
   				   $cols = 3,
				   $value = ""
			  ));
			 
			 
			
				$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "Slaves that this many relate to",
    					$headingLevel = "3"
			));
				
			
			$RunawaysTablefield = new ManyManyDataObjectManager(
				 $this,
				 'RunAways',
				 'Person',
				 array(
				'Name' => 'Name'
				 )
			  );
			
		    $fields->addFieldToTab("Root.Main",$RunawaysTablefield);
			 
	

			 $fields->removeByName('Narrative');

			$fields->addFieldToTab("Root.Main",new HeaderField (
 					   $title = "------- Our assumptions and notes and narrative  that appears with this------- ",
    					$headingLevel = "3"
			));
				
			
					
				 $fields->addFieldToTab("Root.Main", new TextField(
				   $name = 'Narrative',
				   $title = '[Narrative]',
				   $value = ''
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
