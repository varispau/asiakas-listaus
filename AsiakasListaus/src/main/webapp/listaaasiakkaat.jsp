<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Asiakaslistaus ja haku</title>
<style>
.vasemmalle{
	text-align: left;
	background-color: rgba(246, 6, 229, 0.48);
	padding: 5px;
}
.keskelle{
	text-align: center;
	color: white;
	background-color: rgba(192, 23, 230);
	padding: 3px;
}

</style>
</head>
<body>
<table id="listaus">
	<thead>	
		<tr>
			<th class="keskelle" colspan="2">Hakusana:</th>
			<th class="keskelle" colspan="2"><input type="text" id="hakusana"></th>
			<th class="keskelle"><input type="button" value="Hae" id="hakunappi"></th>
		</tr>			
		<tr>
			<th class="vasemmalle">Asiakas id</th>
			<th class="vasemmalle">Etunimi</th>
			<th class="vasemmalle">Sukunimi</th>
			<th class="vasemmalle">Puhelinnumero</th>
			<th class="vasemmalle">S�hk�postiosoite</th>							
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>
$(document).ready(function(){
	
	haeAsiakkaat();
	$("#hakunappi").click(function(){		
		haeAsiakkaat();
	});
	$(document.body).on("keydown", function(event){
		  if(event.which==13){ //Enteri� painettu, ajetaan haku
			  haeAsiakkaat();
		  }
	});
	$("#hakusana").focus();//vied��n kursori hakusana-kentt��n sivun latauksen yhteydess�
});	

function haeAsiakkaat(){
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){//Funktio palauttaa tiedot json-objektina		
		$.each(result.asiakkaat, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.asiakasid+"</td>"
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td>"+field.sposti+"</td>";
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
}

</script>
</body>
</html>