<?php 

class RanEvent extends EventData {
 
   
    static $db = array(
		  	'RanYear' => 'Int', 
				   
   );


   static $has_one = array(
   ); 
  
  
	static $many_many = array(
		);



  static $searchable_fields = array(


   );
 
   

									
    static $summary_fields = array(
	'KnownAs.Name', 'Event.Name'

   );
	
	
	
	
	public	function GetBONRan(){
	
		$TimeLeft = 1783 - $this->RanYear; 
		
		$Owned = DataObject::get(
					"BONData",
					 "BONData_Owner.OwnerID = {$this->KnownAsID} AND BONData.TimeLeft = {$TimeLeft} ",
					 "",
					"LEFT JOIN BONData_Owner ON BONData.ID = BONData_Owner.BONDataID"
				 );
		
		//return $Owned; 
		//$OwnedList = $Owned->buildNestedUL(0);;
		//Debug::Show($OwnedList);
	   // Debug::Show($Owned);
	
		$result = ''; 
		
		foreach ($Owned as $BON){
			
			$Person = DataObject::get_by_id(
					"Person",
					 "{$BON->KnownAsID}"
				 );
			
			//Debug::Show($Person);
		
				//This is a bit of hack because the dates are note actual all the same - but this needs
				$result = $result . '<li>'. '<a href="person/display/' . $BON->KnownAsID . '" > ' . $Person->Name .   '</a></li>'  ; 
			}
			
			
		return $result; 
		
	
	}
	
	

function getYear() {
			
	return $this->RanYear;
}
  
  
	
 function getCMSFields() {
		   
	
			 $fields = parent::getCMSFields();
			 
		
			  return $fields;
   }
   
   

		
			
	


 
};

?>
