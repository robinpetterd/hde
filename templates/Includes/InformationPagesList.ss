
                <% if InformationPage %>
                        <div class="InformationPage">
                   <h5>More information</h5>

                         <ul>
                             <% control InformationPage %>
                                <li><a href="$URLSegment">$Title</a> - $Summary</li>
                             <% end_control %>
                         <ul>
                         </div>
             <% end_if %>