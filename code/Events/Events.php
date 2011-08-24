<?php 

class Events extends DataObject {
    
    static $api_access = true;
    function canView() { return true; }
   
    static $default_sort = "\"Sort\"";

    static $db = array(
	  'Name' =>  'Text',
 		
	  'Day' => 'Int', 
	  'Month' =>  'Int',
	  'Year' => 'Int', 
	  
	  'Information' => 'Text',
	  
	  'RuleFeatured' => 'Boolean',
	  
	  'RuleBased' => 'Boolean',
	  'RuleIsEveryone' => 'Boolean',
	  'RuleShowInLists' => 'Boolean', // When this true we don't show - so that we don't have to set on all .
	  'RuleRanStart' => 'Int',
	  'RuleRanEnd' => 'Int'

   );
	
        static $defaults = array(
    	"RuleFeatured" => 'False',
  	);
  
	 static $has_one = array(
	 	    //'KnownAs' => 'Person', //Main linkage

		   'Location' => 'Loc',
		   'SourceFile' => 'File',
		   'Source' => 'Sources',
   );
	 
	 
	static $has_many = array(
		'Data' => 'EventData'					  
  	);
	 

   static $many_many = array(
	    'Group' => 'myGroups',
	    'InformationPage' => 'InformationPage',
	);
		 
	
   static $searchable_fields = array(
	 'Name','Year','LocationID'
   );
   
     static $summary_fields = array(
	   'Name','Year','ID', 'LocationID'

   );
	   
	   
  
    function getCMSFields() {
		   
			 /*
			 BUG - FUTURE this is a work around to get stuff work with 
			 */
			 
			 //Do the people 
			 $fields = parent::getCMSFields();
		 
			 // $fields->removeByName('Data');
		
			$fields->renameField('Data','People');
			  
			  
			  
			  
			  //Do the same thing for the groups 
			  
			  //TODO - add nice group management back on 
			 // $fields->removeByName('Group');
		 
			  /*$groupTablefield = new ManyManyDataObjectManager(
				 $this,
				 'Group',
				 'myGroups',
				 array(
				'Name' => 'Name'
				 )
			  );
			 
			// $peopleTablefield->setAddTitle( 'A Module' );
		 
			  //$fields->addFieldToTab("Root.Group or Groups", $groupTablefield);*/
			  
			  
		  //TODO about the information page working again  
		/*$fields->removeByName('Information Page');

			$infoOnTablefield = new ManyManyDataObjectManager(
				 $this,
				'InformationPage',
				'InformationPage',
				 array(
					'Summary' => 'Summary'
				 ),'	'
			  );
		
			$fields->addFieldToTab("Root.Information Pages", $infoOnTablefield);*/

			
			$fields->removeByName('Data');
			
			/*$EDataTablefield = new HasOneComplexTableField  (
				 $this,
				'Data',
				'EventData',
				 array(
					'KnownAs' => 'KnownAs' )
			  ,'');

		   $fields->addFieldToTab("Root.Event People", $EDataTablefield);*/

								
			 $fields->removeByName('Rule Based');
			 $fields->removeByName('RuleIsEveryone');
			 $fields->removeByName('RuleFeatured');



		$isFeaturedForm = new CheckboxField ($name = "RuleFeatured",
 	    $title = "Is this a featured event"); 		
		$fields->addFieldToTab("Root.Rules",$isFeaturedForm );


		$showInLists = new CheckboxField ($name = "RuleShowInLists",
 	    $title = "Don't show this event in list's, eg in the places browse"); 
		$fields->addFieldToTab("Root.Rules",$showInLists );

			
		$isRuleForm = new CheckboxField ($name = "RuleBased",
 	    $title = "This is a rule base event"); 
		
		$fields->addFieldToTab("Root.Rules", $isRuleForm);

		$everyOneForm = new CheckboxField ($name = "RuleIsEveryone",
 	    	 $title = "This rule is for everyone"); 
			 
		$fields->addFieldToTab("Root.Rules", $everyOneForm);
		
		 $fields->removeByName('RuleRanStart');
		 $fields->removeByName('RuleRanEnd');
		 
		 
		 $fields->addFieldToTab("Root.Rules", new NumericField(
				   $name = "RuleRanStart",
				   $title = "Start - this is based on when they would have run",
				   $value = "1783"
			  ));
			  
	   $fields->addFieldToTab("Root.Rules", new NumericField(
				   $name = "RuleRanEnd",
				   $title = "End",
				   $value = "1783"
			  ));
			  
			  


	
			//$fields->removeByName('Traveling On');
			  $fields->removeByName('Location');


			$locs= DataObject::get('Loc');
		 	//$locs->sort("Name", "ASC");
		 	//$map = $locs->toDropDownMap('ID', 'Name');
		 	//$dropdownfield = new DropdownField("LocationID", "Location", $map);
		    //$fields-> addFieldToTab('Root.Main', $dropdownfield, 'SourceFile' );
		 
		 
	
			
		 
			
			
			  return $fields;
   }
   
   
     
	public function populateDefaults(){
    	parent::populateDefaults();
		
		//$workflow = DataObject::get_by_id('WorkFlow', 1);
		 		
		//$this->CountryID = $countries->First()->ID;


		
			
	}
 
};

?>
