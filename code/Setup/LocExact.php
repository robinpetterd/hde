<?php 

class LocExact extends Loc {
 
    
   static $db = array(
      	'Name' => 'Varchar',

	  );

 
  static $has_one = array(
      'Region' => 'LocRegion'
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
	
	
		$fields->removeByName('Region'); //Removes the My Groups from the People area.


		 $locs= DataObject::get('LocRegion');
		 $locs->sort("Name", "ASC");
		 $map = $locs->toDropDownMap('ID', 'Name');
		 $dropdownfield = new DropdownField("RegionID", "Region", $map);
		 $fields-> addFieldToTab('Root.Main', $dropdownfield );
		 
		 
		 return $fields; 
	 
	 }
	
public function CMSFields_forPopup()
	{
		
		$fields = parent::getCMSFields(); 
		
		$fields->removeByName('Region'); //Removes the My Groups from the People area.

		 $locs= DataObject::get('LocRegion');
		 $locs->sort("Name", "ASC");
		 $map = $locs->toDropDownMap('ID', 'Name');
		 $dropdownfield = new DropdownField("RegionID", "Region", $map);
		 $fields-> addFieldToTab('Root.Main', $dropdownfield,'Name' );
		 
		 		 return $fields; 

	
	} 
	
};

?>
