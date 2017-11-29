$(document).ready(function() {
  getPageName()
     $('#SecondContainer').hide();
   $('#sectionC').hide();

$('#btnCloseDetails').on('click', function() {
 $('#SecondContainer').hide();
   $('#sectionC').hide();
   $('#FirstContainer').attr('class', 'col-md-12 block');
});
$('.redo').click( function() { 
  //alert("redo");
  //location.reload(true);
});
 $( ".datepicker" ).datepicker({ dateFormat: 'dd/mm/yy' }).val();
$('a').click( function(e) {

  location.reload(true);
   } );
});
function PaintRedRow(r){
  $(r).css("background-color", "#000000");
}

var selID = false;
function cargarDataTables() { //data-src
  $('.table').each(function() {
    if (!$(this).hasClass('noDataTable')) {
      $(this).DataTable();
    }
    if(this.hasAttribute('data-src')){
      var auxtable = this;
      $(this).on('click', 'tbody tr', function() {
        ctrl = $(this).closest('table').attr('data-src').trim();
        //selID = $(this).closest('tr').find('td').first().html().trim();
        selID = $(this).closest('tr').attr('selID').trim();
        console.log("click " + selID);
        $('.selectedRow').removeClass('selectedRow');
        
        $(this).closest('tr').addClass('selectedRow');

        var json_path = `http://${window.location.hostname}:${window.location.port}/${ctrl}`;
          json_path += `/${selID}.json`;


        console.log(json_path);
        json_path.replace('//','/');

        $.ajax({
          url: json_path,
          type: 'GET',
          success: function(data) {
            //console.log("Respuesta");
            //console.log(data);

            if($(auxtable).hasClass('parent')){
              $('#sectionfields').html('');
              for (var key in data) {
                //console.log(data[key]);
                var tr = $('<tr>');
                $('<td>').html(data[key].id).appendTo(tr)
                $('<td>').html(data[key].name).appendTo(tr)
                $('<td>').html(data[key].field_type).appendTo(tr)
                $('<td>').html(data[key].required).appendTo(tr)
                $('<td>').html(data[key].min_lenght).appendTo(tr)
                $('<td>').html(data[key].max_lenght).appendTo(tr)
                $('<td>').html(data[key].active).appendTo(tr)
                var options = $('<td>');
                var a = $('<a>').attr('href', '/section_fields/'+data[key].id+'/edit').html('edit');
                options.append(a);
                  switch(data[key].field_type){
                    case 'Selection':
                      options.append(' | ');
                      var config = $('<a>').attr('href', '/config_field/'+data[key].id).html('Config');
                      options.append(config);
                      break;
                  }
                options.appendTo(tr);
                $(('#sectionfields')).append(tr);
              }
              //$('.table').DataTable();
            }
            else {
              $('#RowDetails').html('');
              for (var key in data) {
                if (data.hasOwnProperty(key) && key.toLowerCase() != 'id') {
                  var detail = $('<p>').html(key.replace('_',' ') + ": ").append($('<span>').html(data[key])).appendTo('#RowDetails');
                }
              }
            }
          }
        });
        if(!$(this).hasClass('scroll')){
          $(this).parent('table').addClass('scroll')
        }
        if(selID){
          $('#FirstContainer').attr('class', 'col-md-8 block');
          $('#SecondContainer').show('slow', function() {});
           $('#sectionC').show();
        }
      });
      
    }
    
    if(this.hasAttribute('data-show')){
      $(this).on('click', 'tbody tr', function() {
        campo = $(this).closest('table').attr('data-show');
        value = $(this).closest('tr').find('td').first().next().html();
        selID = $(this).closest('tr').find('td').first().html();
        $('.selectedRow').removeClass('selectedRow');
        $(this).closest('tr').addClass('selectedRow');
        $('#txt' + campo).val(value);
        $('#_txt' + campo).html(value);
      });
    }

    

    /*if(this.hasAttribute('data-reminders')){
      $(this).on('click', 'tbody tr', function() {
        selID = $(this).closest('tr').find('td').first().html();
        var json_path = `http://${window.location.hostname}:${window.location.port}/accountReminders`;
        json_path += `/${selID}.json`;
        $.ajax({
          url: json_path,
          type: 'GET',
          success: function(data) {

            $("#dbtaaccountRecordatorios").find("tbody").first().html("");
             console.log(data);
            for (var i = 0; i < data.length; i++) {
              $("#dbtaaccountRecordatorios").find("tbody").first().append("<tr><td>"+ data[i].id  + "</td><td>" + data[i].nrdate + "</td><td>" + data[i].description + "</td></tr>")
          };
          }
        }); 
      });
    }*/


  });
}

var auxSel
function obtenerDtAccount(){
     $('.table').each(function() {
      if (!$(this).hasClass('noDataTable')) {
        $(this).DataTable();
      }
      if(this.hasAttribute('data-sr')){
        var auxdbt = $(this).attr('data-sr');

        if (auxdbt == "recordatorios") {
          $(this).on('click', 'tbody tr', function() {
            auxSel = $(this).closest('tr').find('td').first().html().trim();
            $('#create').attr('onclick','modal.reminders.add()');
            $('#updateA').attr('onclick','controles.reminders.update()');
            $('#deleterow').attr('href','/reminders/'+auxSel);
            $('#deleterow').removeClass("hidden");
          });
        };    

        if (auxdbt == "contactos") {
          var auxtable = this;
          $(this).on('click', 'tbody tr', function() {
            auxSel = $(this).closest('tr').find('td').first().html().trim();
              
            $('#create').attr('onclick','modal.contacts.add()');
            $('#updateA').attr('onclick','controles.contacts.update()');
            $('#deleterow').attr('href','/contacts/'+auxSel);
            $('#deleterow').removeClass("hidden");

          });
          
        };
      }
    })
  };

var controles = {
  reminders: {
    update: function(){
      if (!auxSel)
        alert("Seleccione un renglon  de la tabla recordatorios")

      else
        window.location = "/reminders/"+auxSel+"/edit";
    },
  },

  contacts: {
    update: function(){
      if (!auxSel)
        alert("Seleccione un renglon  de la tabla contactos")
      else
        window.location = "/contacts/"+auxSel+"/edit";
    }
  }
}


function cargarDatePickers() {
  $('.datepicker').each(function() {
    $(this).datepicker({ dateFormat: "yy-mm-dd" });
  });
}

function cargarSelects() {
  $('.select2').each(function() {
    $(this).select2();
  });
}

function hideHideables() {
  $('.hideable').each(function() {
    $(this).hide();
  });
}

function showByClass(clase) {
  $('.' + clase).each(function() {
    $(this).show();
  });
}

function cargarColorPickers() {
  jscolor.installByClassName('jscolor');
}

function getPageName(){
  var x = window.location.pathname.substr(1)
  var ind = x.indexOf('/')
  if (ind > 0)
    x = x.substr(0, ind);
  else
    x = x.substr(0);
  x = x.toUpperCase()
  x = x.replace("-"," / ")

  if (x != "")
    $('#header').find('h1').first().html(x);
  else
    $('#header').find('h1').first().html('EAGLE CRM');
}

String.prototype.replaceAll = function(find, replace) {
  var replaceString = this;
  while(replaceString.indexOf(find) >= 0){
    replaceString = replaceString.replace(find, replace);
  }
  return replaceString;
};