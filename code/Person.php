<?php 


class Person extends DataObject {
 
 	static $api_access = true;
   function canView() { return true; }
   
   
   static $db = array(
      'Name' => 'Varchar',
	  'Remarks' => 'HTMLText',
	  'DateOfBirth' => 'Int',
	  'Featured' => 'Boolean'
	);

	static $has_one = array(
	 'Role' => 'Role',
      'Gender' => 'Gender',
	  'CustomImage' => 'Image', 
	  'Status' => 'WorkFlow',



   );
	 
	 static $has_many = array(
		'EventRelationship' => 'EventRelationship',


	);
	 
	 static $many_many = array(
		'InformationPage' => 'InformationPage',

		'EventData' => 'EventData',			

    );


	   
	
	  static $belongs_many_many = array(
		
								
		'Relationships' => 'Relationship',

		//'Events' => 'Events',
		'myGroups' => 'myGroups',
  		
		
		
		);


		 
	
  
   static $searchable_fields = array(
       'Name','ID','Role.Name',
   );
   
  
    static $summary_fields = array(
     'Name','ID','Role.Name',
   );
	
	
	
	
	
	
public function getCustomSearchContext() {
		$fields = $this->scaffoldSearchFields(array(
			'restrictFields' => array('Name')
		));
		$filters = array(
			'Name' => new PartialMatchFilter('Name'),
			//'Transcript' => new PartialMatchFilter('Transcript'),
		);
		return new SearchContext(
			$this->class, 
			$fields, 
			$filters
		);
	}
	
	
	
	
	   function getCMSFields() {
		   
			

			 $fields = parent::getCMSFields(); 
			  
			  	
		 	$labelText = '<h2><a href="/person/display/' .  $this->ID . '" target="new" >Link to front end page</a></h2>';
			
		 	$label = new LiteralField ( $title = "Link",
									   $content = $labelText
			   );
			
			$fields->addFieldToTab("Root.Main",$label);
				
				
				
			 $fields->replaceField ('Remarks', $wysiwyg = new TextareaField('Remarks','',$rows = 8));	


			 $fields->removeByName('my Groups'); //Removes the My Groups from the People area.
			  $fields->removeByName('Events'); //Removes the My Groups from the People area. 
			  $fields->removeByName('EventData');
		       $fields->removeByName('Relationships'); //Removes the My Groups from the People area. 
			 
		     $fields->removeByName('EventRelationship'); //Removes the My Groups from the People area. 

 		
		$fields->removeByName('Information Page');

			$infoOnTablefield = new ManyManyDataObjectManager(
				 $this,
				'InformationPage',
				'InformationPage',
				 array(
					'Summary' => 'Summary'
				 )
			  );
			
				
		   $fields->addFieldToTab("Root.Info", $infoOnTablefield);
			
			
			

				 return $fields;
  	   }
 
 	public function CMSFields_forPopup()
	{
		
	
	 $fields = parent::getCMSFields(); 
			 $fields->removeByName('my Groups'); //Removes the My Groups from the People area.
			  $fields->removeByName('Events'); //Removes the My Groups from the People area. 
			  			  $fields->removeByName('EventData');

		       $fields->removeByName('Relationships'); //Removes the My Groups from the People area. 
			 
			 		       $fields->removeByName('DateOfBirth'); //Removes the My Groups from the People area. 


		$fields->removeByName('Status');
		$fields->removeByName('Featured');

		$fields->removeByName('Custom Image');


	
					$this->StatusID = 1; 




		
		return $fields;
		
	}
	
 public function populateDefaults(){
	 
    	parent::populateDefaults(); 		
		 
		$this->StatusID = 1;
				
			
	}
	
	
 
   
};

?>
