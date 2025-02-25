<div id="Account">
<% if Order %>
	<% control Order %>
		<h2>Order #$ID ($Created.Long)</h2>

		<div id="PrintPageIcon">
			<img src="cms/images/pagination/record-print.png" onclick="window.print();" />
		</div>

		<div class="clear"><!-- --></div>

		<div class="block">
			<h3>Content</h3>
			<% include Order_Content %>
			$Top.CancelForm
		</div>

		<div class="block left">
			<h3>Billing Address</h3>
			<% control Member %>
				<% include Order_Member %>
			<% end_control %>
		</div>

		<div class="block right">
			<h3>Shipping Address</h3>
			<% if UseShippingAddress %>
				<table class="address" cellspacing="0" cellpadding="0">
					<tr>
						<th><% _t("NAME","Name") %></th>
						<td>$ShippingName</td>
					</tr>
					<tr>
						<th><% _t("ADDRESS","Address") %></th>
						<td>$ShippingAddress<% if ShippingAddress2 %><br/>$ShippingAddress2<% end_if %></td>
					</tr>
					<tr>
						<th><% _t("CITY","City") %></th>
						<td>$ShippingCity</td>
					</tr>
					<tr>
						<th><% _t("COUNTRY","Country") %></th>
						<td>$findShippingCountry</td>
					</tr>
				</table>
			<% else %>
				<% control Member %>
					<% include Order_Member %>
				<% end_control %>
			<% end_if %>
		</div>
		<div class="clear"><!-- --></div>
		<div class="block">
			<h3>Payment</h3>
			<table id="Payment" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th scope="col"><% _t("DATE","Date") %></th>
						<th scope="col"><% _t("PAYMENTMETHOD","Method") %></th>
						<th scope="col"><% _t("AMOUNT","Amount") %></th>
						<th scope="col"><% _t("PAYMENTSTATUS","Payment Status") %></th>
						<th scope="col"><% _t("DETAILS","Details") %></th>
					</tr>
				</thead>
				<tbody>
					<% if Payments %>
						<% control Payments %>
							<tr>
								<td scope="col">$Created.Nice</td>
								<td scope="col">$PaymentMethod</td>
								<td scope="col">$Amount.Nice $Currency</td>
								<td scope="col">$Status</td>
								<td scope="col"><% if Message %>$Message<% end_if %></td>
							</tr>
						<% end_control %>
					<% else %>
						<tr><td colspan="5">Sorry, no payment information is available at this time.</td></tr>
					<% end_if %>
				</tbody>
			</table>
		</div>
		<% if RepeatOrderID %>
		<p>This Order was based on Repeat Order # $RepeatOrderID.</p>
		<% else %>

		<% end_if %>
	<% end_control %>
		<div class="Actions"><input class="action" type="button" value="Convert to Repeat order" onclick="window.location='$CreateLink';" /></div>
		<div id="WhatAreRepeatOrders">
			$WhatAreRepeatOrders
		</div>

<% else %>
	<p><strong>$Message</strong></p>
<% end_if %>
</div>
