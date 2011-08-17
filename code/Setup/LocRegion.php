<?php 

class LocRegion extends Loc {
 
    
   static $db = array(
      	'Name' => 'Varchar',

	  );

 
  static $has_one = array(
      'County' => 'LocCounty'
   );
	
	
	
   /*
   static $db = array(
      'Name' => 'Varchar',
	  'Lat' => 'Float',
	  'Long' => 'Float'
	  );*/
 
//TDDO - does this need some sort of narrative about the place ? should this link to a information page instead of here. 	
	//static $has_one = array(
      //'Image' => 'Image'
   //);
	
  
   static $searchable_fields = array(
   'Name' );
   
  
      static $summary_fields = array(
   'Name','ID'
   );
   
    public	 function getCMSFields() {

		 $fields = parent::getCMSFields();


		 $locs= DataObject::get('LocCounty');
		 $locs->sort("Name", "ASC");
		 $map = $locs->toDropDownMap('ID', 'Name');
		 $dropdownfield = new DropdownField("CountyID", "County", $map);
		 $fields-> addFieldToTab('Root.Main', $dropdownfield );
		 
		 
		 return $fields; 
	 
	 }
	
public function CMSFields_forPopup()
	{
		
		$fields = parent::getCMSFields(); 
		
		$fields->removeByName('Location'); //Removes the My Groups from the People area.

		 $locs= DataObject::get('LocCounty');
		 $locs->sort("Name", "ASC");
		 $map = $locs->toDropDownMap('ID', 'Name');
		 $dropdownfield = new DropdownField("CountyID", "County", $map);
		 $fields-> addFieldToTab('Root.Main', $dropdownfield,'Name' );
		 
		 		 return $fields; 

	
	} 
	
 
};

?>
