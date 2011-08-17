<?xml version="1.0" encoding="UTF-8"?>
<graph>


<% control People %><node id="$ID" name="$Name" narrative="" role="$Visual.Name" age="<% control BON %><% if Age %>$Age<% end_if %><% end_control %>" ></node>
<% end_control %>

<!-- Start of the EventRelationship -->
<% control Relationships %>
				<edge type="Relationship" source="Manual_Relationship" 
			<% control Relatives %>
					<% if Pos == 1 %>
						fromID="$ID"
					<% end_if %>
					<% if Pos == 2 %>
					 toID="$ID"  
					<% end_if %>
			 <% end_control %>
					thickness="$Type.thickness" color="$Type.color" alpha="$Type.alpha" >
				</edge>
  <% end_control %>



<!-- Start of the EventRelationship -->
<% control EventRelationships %>
	$DisplayXML
<% end_control %>
<!-- Start of the Relationship -->

<!-- Start of EventData BL-RELATED -->
<% control EventData %> 
           <% if ClassName == TithablesData %>
						<% if Owner %> 	
<edge type="Ownership" source="$ClassName" fromID="$KnownAs.ID" toID="<% control Owner %>$ID<% end_control %>"  thickness="8" color="0" alpha="1" ></edge>
                        <% end_if %>  <% end_if %>
                   <% if ClassName == BONData %>
                            <% if Owner %> 	
<edge type="Ownership" source="$ClassName" fromID="$KnownAs.ID" toID="<% control Owner %>$ID<% end_control %>"  thickness="8" color="0" alpha="1"  ></edge>
                            <% end_if %>
     <% end_if %>  
							
							
							
                   <% if ClassName == BirchtownMusterData %>
                          <% if Owner %> 	
<edge type="Ownership" source="$ClassName" fromID="$KnownAs.ID" toID="<% control Owner %>$ID<% end_control %>"  thickness="8" color="0" alpha="1" ></edge>
						  <% end_if %>
                   <% end_if %>
<% end_control %>
</graph>





