var jsonHelper = {
  get: function(url, func){
    var response = false;
    $.ajaxSetup({ async: false });
    $.getJSON(url, function(json, textStatus) {
      response = json;
    })
    .fail(function() {
      console.log( "Error al obtener el archivo " + url );
    });
    $.ajaxSetup({ async: true });
    return response;
  }
}