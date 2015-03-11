<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.getJSON('getTitle', {
		}, function(response) {
			 	var select = $('#title');
	        	select.find('option').remove();
	        	$.each(response, function(index, value) {
	        		  	var str=JSON.stringify(value);
	        	  		var title_sub=str.substring(1,str.length-1);
	        	  		var title = new Object();
	        	  		title =title_sub.split(",");
	        	  		var i;
				  		for (i = 0; i < title.length; ++i) {
							title[i]=title[i].replace('"',"");
							title[i]=title[i].replace('"',"");
							console.log(title[i]);
							$('<option>').val(title[i]).text(title[i]).appendTo(select);
						} 
	          	});
		});
	
		$("#jobSelect").click(function(){
			var job_title = $("select#title").val();
			console.log(job_title);
			$('#jobtitle').text(job_title);
			$('#job_title').val(job_title);
			$.getJSON('getDesc', {
			job_title : job_title
			}, function(response) {
				 $('#job_desc').text(response.job_title);
			});
		});
		
		$("#delete").click(function(){
			var job_title=$("#title").val();
			console.log(job_title);
			$.getJSON('deleteJobPost', {
				job_title : job_title
			}, function(jsonResponse) {
				alert(jsonResponse.message);
		});
		});
	});
</script>

<script src="js/wow.min.js"></script>

<style type="text/css">

body
{
background-image:url(15.jpg);
color:white;
}

.section-heading
{
	font-size: 20px;
	color:#007f7f;
	
}

#contains
{
margin-left:180px;
width:1250px;
height:670px;
background-image:url(12.jpg);
border:3px solid #fff;
box-shadow:inset 0px 0px 60px 20px rgba(0,0,0,0.3);
-webkit-border-image: -webkit-linear-gradient(left, #c6e2ff  0%, #3acfd5 50%);
	  border-image: linear-gradient(to right, #c6e2ff  0%,#3acfd5  50%);
	  
	  -webkit-border-image: -webkit-linear-gradient(top, #3acfd5 0%, #c6e2ff  60%);
	  border-image: linear-gradient(to bottom, #3acfd5 0%, #c6e2ff  60%);
	  

	  border-image-slice: 1;
	  
}
	  
.btn
{
opacity:0.7;
background-color:#156cff ;
}

.container
{
padding:40px;
}
</style>
</head>
<body>
		<div class="section-heading">
		<center><h2>JOB POSTING</h2></center>
		</div>
<div id="contains">
<div class="container" style="padding-top:40px;padding-left:140px;">		

						<div class="form-group">
						<div class="row">
						<div class="col-sm-2">
                            <label for="email">
                                Job Title</label>
						</div>
						<div class="col-sm-6">
                                <select id="title" name="title" class="form-control">
                                <option value="na" selected="" >Choose One:</option></select>
						</div>
						<div class="col-sm-4 col-md-4">
							<input type="button" value="SUBMIT" id="jobSelect" class="btn btn-primary" />
                        </div>
						</div>
						</div>
						
                        <div class="form-group">
						<div class="row">
						<div class="col-sm-2">
                            <label for="job_desc">
                                Job Description</label>
						</div>
						<div class="col-sm-6">
                                <textarea class="form-control" rows="20" cols="52" name="job_desc" id="job_desc" readonly="readonly" required="required"></textarea>
                        </div>
						</div>
						</div>
						
						<div class="form-group"  style="margin-left:350px;margin-top:30px;">
						<div class="row" >
						<div class="col-sm-2">
                            <input type="submit" value="DELETE" class="btn btn-primary"  id="delete"/>
						</div>
						<div class="col-sm-8">
							<input type="button" class="btn btn-primary" value="BACK" onclick="history.back()"/>
                        </div>
						</div>
						</div>
					
</div>
</div>
</body>
</html>