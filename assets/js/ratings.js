$(document).ready(function(){
	/*STAR RATING*/

	$('.star').on("mouseover",function(){
		//get the id of star
		var star_id = $(this).attr('id');
		switch (star_id){
			case "star-1":
				$("#star-1").addClass('star-checked');
				break;
			case "star-2":
				$("#star-1").addClass('star-checked');
				$("#star-2").addClass('star-checked');
				break;
			case "star-3":
				$("#star-1").addClass('star-checked');
				$("#star-2").addClass('star-checked');
				$("#star-3").addClass('star-checked');
				break;
			case "star-4":
				$("#star-1").addClass('star-checked');
				$("#star-2").addClass('star-checked');
				$("#star-3").addClass('star-checked');
				$("#star-4").addClass('star-checked');
				break;
			case "star-5":
				$("#star-1").addClass('star-checked');
				$("#star-2").addClass('star-checked');
				$("#star-3").addClass('star-checked');
				$("#star-4").addClass('star-checked');
				$("#star-5").addClass('star-checked');
				break;
		}
	}).mouseout(function(){
		//remove the star checked class when mouseout
		$('.star').removeClass('star-checked');
	});
	
	$('.star2').on("mouseover",function(){
		//get the id of star
		var star_id = $(this).attr('id');
		switch (star_id){
			case "star-1-2":
				$("#star-1-2").addClass('star-checked');
				break;
			case "star-2-2":
				$("#star-1-2").addClass('star-checked');
				$("#star-2-2").addClass('star-checked');
				break;
			case "star-3-2":
				$("#star-1-2").addClass('star-checked');
				$("#star-2-2").addClass('star-checked');
				$("#star-3-2").addClass('star-checked');
				break;
			case "star-4-2":
				$("#star-1-2").addClass('star-checked');
				$("#star-2-2").addClass('star-checked');
				$("#star-3-2").addClass('star-checked');
				$("#star-4-2").addClass('star-checked');
				break;
			case "star-5-2":
				$("#star-1-2").addClass('star-checked');
				$("#star-2-2").addClass('star-checked');
				$("#star-3-2").addClass('star-checked');
				$("#star-4-2").addClass('star-checked');
				$("#star-5-2").addClass('star-checked');
				break;
		}
	}).mouseout(function(){
		//remove the star checked class when mouseout
		$('.star2').removeClass('star-checked');
	});
	
	$('.star3').on("mouseover",function(){
		//get the id of star
		var star_id = $(this).attr('id');
		switch (star_id){
			case "star-1-3":
				$("#star-1-3").addClass('star-checked');
				break;
			case "star-2-3":
				$("#star-1-3").addClass('star-checked');
				$("#star-2-3").addClass('star-checked');
				break;
			case "star-3-3":
				$("#star-1-3").addClass('star-checked');
				$("#star-2-3").addClass('star-checked');
				$("#star-3-3").addClass('star-checked');
				break;
			case "star-4-3":
				$("#star-1-3").addClass('star-checked');
				$("#star-2-3").addClass('star-checked');
				$("#star-3-3").addClass('star-checked');
				$("#star-4-3").addClass('star-checked');
				break;
			case "star-5-3":
				$("#star-1-3").addClass('star-checked');
				$("#star-2-3").addClass('star-checked');
				$("#star-3-3").addClass('star-checked');
				$("#star-4-3").addClass('star-checked');
				$("#star-5-3").addClass('star-checked');
				break;
		}
	}).mouseout(function(){
		//remove the star checked class when mouseout
		$('.star3').removeClass('star-checked');
	});
	
	$('.star4').on("mouseover",function(){
		//get the id of star
		var star_id = $(this).attr('id');
		switch (star_id){
			case "star-1-4":
				$("#star-1-4").addClass('star-checked');
				break;
			case "star-2-4":
				$("#star-1-4").addClass('star-checked');
				$("#star-2-4").addClass('star-checked');
				break;
			case "star-3-4":
				$("#star-1-4").addClass('star-checked');
				$("#star-2-4").addClass('star-checked');
				$("#star-3-4").addClass('star-checked');
				break;
			case "star-4-4":
				$("#star-1-4").addClass('star-checked');
				$("#star-2-4").addClass('star-checked');
				$("#star-3-4").addClass('star-checked');
				$("#star-4-4").addClass('star-checked');
				break;
			case "star-5-4":
				$("#star-1-4").addClass('star-checked');
				$("#star-2-4").addClass('star-checked');
				$("#star-3-4").addClass('star-checked');
				$("#star-4-4").addClass('star-checked');
				$("#star-5-4").addClass('star-checked');
				break;
		}
	}).mouseout(function(){
		//remove the star checked class when mouseout
		$('.star4').removeClass('star-checked');
	});	
	
	$('.star5').on("mouseover",function(){
		//get the id of star
		var star_id = $(this).attr('id');
		switch (star_id){
			case "star-1-5":
				$("#star-1-5").addClass('star-checked');
				break;
			case "star-2-5":
				$("#star-1-5").addClass('star-checked');
				$("#star-2-5").addClass('star-checked');
				break;
			case "star-3-5":
				$("#star-1-5").addClass('star-checked');
				$("#star-2-5").addClass('star-checked');
				$("#star-3-5").addClass('star-checked');
				break;
			case "star-4-5":
				$("#star-1-5").addClass('star-checked');
				$("#star-2-5").addClass('star-checked');
				$("#star-3-5").addClass('star-checked');
				$("#star-4-5").addClass('star-checked');
				break;
			case "star-5-5":
				$("#star-1-5").addClass('star-checked');
				$("#star-2-5").addClass('star-checked');
				$("#star-3-5").addClass('star-checked');
				$("#star-4-5").addClass('star-checked');
				$("#star-5-5").addClass('star-checked');
				break;
		}
	}).mouseout(function(){
		//remove the star checked class when mouseout
		$('.star5').removeClass('star-checked');
	});	
	
	$('.star6').on("mouseover",function(){
		//get the id of star
		var star_id = $(this).attr('id');
		switch (star_id){
			case "star-1-6":
				$("#star-1-6").addClass('star-checked');
				break;
			case "star-2-6":
				$("#star-1-6").addClass('star-checked');
				$("#star-2-6").addClass('star-checked');
				break;
			case "star-3-6":
				$("#star-1-6").addClass('star-checked');
				$("#star-2-6").addClass('star-checked');
				$("#star-3-6").addClass('star-checked');
				break;
			case "star-4-6":
				$("#star-1-6").addClass('star-checked');
				$("#star-2-6").addClass('star-checked');
				$("#star-3-6").addClass('star-checked');
				$("#star-4-6").addClass('star-checked');
				break;
			case "star-5-6":
				$("#star-1-6").addClass('star-checked');
				$("#star-2-6").addClass('star-checked');
				$("#star-3-6").addClass('star-checked');
				$("#star-4-6").addClass('star-checked');
				$("#star-5-6").addClass('star-checked');
				break;
		}
	}).mouseout(function(){
		//remove the star checked class when mouseout
		$('.star5').removeClass('star-checked');
	});	

     $('.star').click(function(){
		//get the stars index from it id
		var star_index = $(this).attr("id").split("-")[1],
			type = 1, //store the product id in variable
			star_container = $(this).parent(), //get the parent container of the stars
			result_div = $("#result"); //result div
	    var jobid = $("#jobid").val();
	    var freelancerid = $("#freelancerid").val();
	    
		//Built a url to send    
		var info = "star="+star_index+"&star_type="+type+"&jobid="+jobid+"&freelancerid="+freelancerid;
	
		
		$.ajax({
			url: "template/requests/addrating.php",
			type: "POST",
			data: info,
			beforeSend: function(){
				result_div.show().html("Loading..."); //show the result div and display a loadin message
			},
			success: function(data){
				result_div.html(data);
			}
		});
	});	

     $('.star2').click(function(){
		//get the stars index from it id
		var star_index = $(this).attr("id").split("-")[1],
			type = 2, //store the product id in variable
			star_container = $(this).parent(), //get the parent container of the stars
			result_div = $("#result"); //result div
	    var jobid = $("#jobid").val();
	    var freelancerid = $("#freelancerid").val();
	    
		//Built a url to send    
		var info = "star="+star_index+"&star_type="+type+"&jobid="+jobid+"&freelancerid="+freelancerid;
	
		
		$.ajax({
			url: "template/requests/addrating.php",
			type: "POST",
			data: info,
			beforeSend: function(){
				result_div.show().html("Loading..."); //show the result div and display a loadin message
			},
			success: function(data){
				result_div.html(data);
			}
		});
	});	

     $('.star3').click(function(){
		//get the stars index from it id
		var star_index = $(this).attr("id").split("-")[1],
			type = 3, //store the product id in variable
			star_container = $(this).parent(), //get the parent container of the stars
			result_div = $("#result"); //result div
	    var jobid = $("#jobid").val();
	    var freelancerid = $("#freelancerid").val();
	    
		//Built a url to send    
		var info = "star="+star_index+"&star_type="+type+"&jobid="+jobid+"&freelancerid="+freelancerid;
	
		
		$.ajax({
			url: "template/requests/addrating.php",
			type: "POST",
			data: info,
			beforeSend: function(){
				result_div.show().html("Loading..."); //show the result div and display a loadin message
			},
			success: function(data){
				result_div.html(data);
			}
		});
	});	

     $('.star4').click(function(){
		//get the stars index from it id
		var star_index = $(this).attr("id").split("-")[1],
			type = 4, //store the product id in variable
			star_container = $(this).parent(), //get the parent container of the stars
			result_div = $("#result"); //result div
	    var jobid = $("#jobid").val();
	    var freelancerid = $("#freelancerid").val();
	    
		//Built a url to send    
		var info = "star="+star_index+"&star_type="+type+"&jobid="+jobid+"&freelancerid="+freelancerid;
	
		
		$.ajax({
			url: "template/requests/addrating.php",
			type: "POST",
			data: info,
			beforeSend: function(){
				result_div.show().html("Loading..."); //show the result div and display a loadin message
			},
			success: function(data){
				result_div.html(data);
			}
		});
	});	

     $('.star5').click(function(){
		//get the stars index from it id
		var star_index = $(this).attr("id").split("-")[1],
			type = 5, //store the product id in variable
			star_container = $(this).parent(), //get the parent container of the stars
			result_div = $("#result"); //result div
	    var jobid = $("#jobid").val();
	    var freelancerid = $("#freelancerid").val();
	    
		//Built a url to send    
		var info = "star="+star_index+"&star_type="+type+"&jobid="+jobid+"&freelancerid="+freelancerid;
	
		
		$.ajax({
			url: "template/requests/addrating.php",
			type: "POST",
			data: info,
			beforeSend: function(){
				result_div.show().html("Loading..."); //show the result div and display a loadin message
			},
			success: function(data){
				result_div.html(data);
			}
		});
	});	

     $('.star6').click(function(){
		//get the stars index from it id
		var star_index = $(this).attr("id").split("-")[1],
			type = 6, //store the product id in variable
			star_container = $(this).parent(), //get the parent container of the stars
			result_div = $("#result"); //result div
	    var jobid = $("#jobid").val();
	    var freelancerid = $("#freelancerid").val();
	    
		//Built a url to send    
		var info = "star="+star_index+"&star_type="+type+"&jobid="+jobid+"&freelancerid="+freelancerid;
	
		
		$.ajax({
			url: "template/requests/addrating.php",
			type: "POST",
			data: info,
			beforeSend: function(){
				result_div.show().html("Loading..."); //show the result div and display a loadin message
			},
			success: function(data){
				result_div.html(data);
			}
		});
	});	
	$('.star1').click(function(){
		//get the stars index from it id
		var star_index = $(this).attr("id").split("-")[1],
			type = 2, //store the product id in variable
			star_container = $(this).parent(), //get the parent container of the stars
			result_div = $("#result"); //result div
		
		$.ajax({
			url: "store_rating.php",
			type: "POST",
			data: {star:star_index,type:type},
			beforeSend: function(){
				star_container.hide(); //hide the star container
				result_div.show().html("Loading..."); //show the result div and display a loadin message
			},
			success: function(data){
				result_div.html(data);
			}
		});
	});
});