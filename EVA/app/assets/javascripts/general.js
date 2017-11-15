function TogglePMenu(){
	var sidebar = document.getElementById("sidebar");
	if (sidebar.style.display == "none"){
		sidebar.style.display = "block";
	}else{
		sidebar.style.display = "none";
	}
}
$("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("active");
});


  $( function() {
    $( ".datepicker" ).datepicker({ dateFormat: 'dd/mm/yy' }).val();
  } );