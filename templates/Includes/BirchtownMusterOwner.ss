<table >
      <tr>
        <th scope="col" class="Column  Start" >Name</th>
        <th scope="col" class="SmallColumn">Age</th>
        <th scope="col" class="MediumColumn">Occupation</th>
        <th scope="col"class="Column">Families they lived with</th>
        <th scope="col" class="LongColumn">Companies they belong to</th>
        <th scope="col">Remarks</th>
         <th scope="col" class="Column" >Company They Are Now With</th>

    
      </tr>
      <tr>
        <td  class="Start">$FirstName $LastName</td>
       <td>   <% if Age !=  0 %>$CorrectedAge <% end_if %></td>
       <td>$Occupation</td>
       <td>
       	    <% if Owner %>
           		  <% control  Owner %>
                   <a href="person/display/$ID">$Name</a>
                <% end_control %>
			  <% end_if %>


       </td>
       <td>
           	    <% if  CompaniesTheyBelongTo %>
           		  <% control CompaniesTheyBelongTo %>
                 <a href="group/display/$ID">$Name</a> 
                <% end_control %>
			  <% end_if %>
       </td>
       <td>$Remarks</td>
       <td><a href="group/display/$CompanyTheyAreNowWith.ID">$CompanyTheyAreNowWith.Name</a></td>
      </tr>
      </table>
