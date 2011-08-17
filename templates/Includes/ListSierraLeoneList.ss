<table >
      <tr>
        <th scope="col" class="Column  Start" >Name</th>
        <th scope="col" class="SmallColumn">Age</th>
        <th scope="col" class="MediumColumn">Where Born</th>
        <th scope="col"class="SmallColumn">Number Of Children</th>
        <th scope="col" class="SmallColumn">Age Of Eldest </th>
        <th scope="col" class="Column" >Occupation</th>
        <th scope="col" class="LongColumn" >Property</th>

      </tr>

  <% control Data %>
      <tr>
        <td class="Start"><a href="person/display/$KnownAs.ID">$Name</a> </td>
       <td>   $Age</td>
       <td><a href="location/display/$WhereTheyWhereBorn.ID">$WhereTheyWhereBorn.Name</a></td>
       <td> $NumberOfChildren  </td>
       <td> $AgeOfEldest  </td>
       <td> $Occupation  </td>
       <td> $Property  </td>
      </tr>
	<% end_control %>

      </table>

  