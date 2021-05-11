/**
 * 
 */

//hide the alerts on page load

$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
		
	}
	$("#alertError").hide();
	
});


//Add an event handler for click event

//Save--------------------------------------------------------------
$(document).on("click", "#btnSave",function(event)
{
	//clear alerts
	
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();




//Form validation

var status = validateItemForm();

if(status != true){
	
	$("#alertError").text(status);
	$("#alertError").show();
	return;
	
}

//If Valid------------------------------

$("formItem").submit();


});


// Update-------------------------------------------

$(document).on("click",".btnUpdate",function(event)
{
	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
	$("#itemCode").val($(this).closest("tr").find('td:eq(0)').text());
	$("#itemName").val($(this).closest("tr").find('td:eq(1)').text());
	$("#itemPrice").val($(this).closest("tr").find('td:eq(2)').text());
	$("#itemDesc").val($(this).closest("tr").find('td:eq(3)').text());

});


//Client Model----------------------------------------

function validateItemForm(){
	
	//Code
	if ($("#itemCode").val().trim() == ""){
		
		return "Insert Item Code";		
	}
	
	//Name
	if ($("#itemName").val().trim() == ""){
		
		return "Insert Item Name";
		
	}
	
	//Price
	if($("#itemPrice").val().trim() == ""){
		
		return "Insert Item Price";
		
		
	}
	
	// is numeric value
	
	var tempprice = $("#itemPrice").val().trim();
	
	if(!$.isNumeric(tempprice))
	{
		return "Insert a numerical value for Item Price";
		
	}
	
	//convert to decimal price
	
	$("#itemPrice").val(parseFloat(tempprice).toFixed(2));
	
	
	//Description
	
	if($("#itemDesc").val().trim() == ""){
		
		return "Insert Item Description";
		
	}
	
	return true;
	
}


