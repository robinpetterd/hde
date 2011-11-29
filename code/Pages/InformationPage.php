<?php
/**
 * Defines the Information page type
 */
class InformationPage extends Page {
	 
  static $default_parent = "Information";
   static $can_be_root = false;
   
   static $db = array(
	'Summary'=>'HTMLText',
        'ShowOnHome' => 'Boolean'
   );
   static $has_one = array(
	 'Image' =>'File',
	 'Icon' =>'File'

   );
   
    static $many_many = array(
      'References' => 'Reference',
       'Media' => 'MediaAsset',
   );
	
	static $belongs_many_many = array(
	     'Person' => 'Person',
		 'Events' => 'Events',
		 'myGroups' => 'myGroups',
		 	 
			 


	);
	
	function getCMSFields() {

	$fields = parent::getCMSFields();
                
             $fields->addFieldToTab("Root.Content.Main", new CheckboxField('ShowOnHome'));

		$fields->addFieldToTab("Root.Content.Image", new ImageField('Icon'));

		$fields->addFieldToTab("Root.Content.Image", new ImageField('Image'));
                
                $MediaManager = new ManyManyComplexTableField(
                                        $this, // Controller
                                        'Media', // Source name
                                        'MediaAsset', // Source class
                                        array(
                                                'Title' => 'Title',
                                        ), // Headings  
                                        'getCMSFields_forPopup' // Detail fields (function name or FieldSet object)
                                        // Filter clause
                                        // Sort clause
                                        // Join clause
                                );

                                 $fields->addFieldToTab("Root.Content.Media", $MediaManager);

 		
      $referenceTablefield = new ManyManyComplexTableField(
         $this,
         'References',
         'Reference',
         array(
	    'Name' => 'Name'
         ),
         'getCMSFields_forPopup'
      );
      $referenceTablefield->setAddTitle( 'A Reference' );
 
      $fields->addFieldToTab( 'Root.Content.References', $referenceTablefield );
	  
	  $fields->addFieldToTab('Root.Content.Main', new HtmlEditorField( $name = 'Summary', $title='Short Summary'), 'Content');
		 

	  
	  
	  
	  
      return $fields;
   }
   
   
   
}
 
class InformationPage_Controller extends Page_Controller {
	
	public function localBaseTag() { 
		//return Director::absoluteBaseURL() . '/'. $this->URLSegment ; 
		//return $rewriteHashlinks;


		//return '<base href="'.  Director::absoluteBaseURL() . $this->URLSegment. '" />'; 
	}
	
	
	
	public function mainBaseTag() { 
		return '<base href="'. Director::absoluteBaseURL() . '" />'; 
	}
 
}
 
?>