class Endangered < ApplicationRecord
Date of extract: 
<%= Date.today %>
<br>

Posts count:
<%= @sharks.count %>
<br>

<table style="width:100%">
  <thead>
    <tr>
      <th>id
      <th>name</th>
      <th>fact</th>
    </tr>
  </thead>
  <tbody>
    <% @sharks.each do |shark| %>
      <%= content_tag :tr, id: dom_id(post), class: dom_class(post) do %>
        <td><%= shark.name %></td>
        <td><%= shark.fact%></td>
      <% end %>
    <% end %>
  </tbody>
</table> 
end
