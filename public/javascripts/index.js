(function($, window, document){
  var sheet_link;
  
  $(document).ready(function(){
    Form.run();
    //GSpreadsheet.getColumns();
  });

  var Form = {
    mainSelector : 'form'

    ,run: function(){
    }
    ,render_input: function(args){
      var template = $('#template').html();
      var data = {
        name: args[0],
        id: args[0].toLowerCase().replace(' ', '_'), 
        type: args[1]
      }

      Mustache.parse(template);
      var rendered = Mustache.render(template, data)
      $(this.mainSelector).append(rendered);
    }
  }

  window.render_input = $.proxy(Form.render_input, Form);

  // LET RUBY TALK WITH GOOGLE DRIVE 
  // REMOVE JAVASCRIPT FUNCTIONS TALKING WITH 
  // GOOGLE SPREADSHEET

  // function render_page(columns){
  //   for (var index in columns){

  //     var template = $('#template').html();
  //     var column = columns[index];
  //     var view = {column: column, id: column.toLowerCase().replace(' ', '_')}
  //     Mustache.parse(template);
  //     var rendered = Mustache.render(template, view);
  //     $('.form').append(rendered);      
  //   }
  // };

  // var GSpreadsheet = {
      
  //   sheet_link : "https://spreadsheets.google.com/tq?key=",
  //   columns : [],

  //   getSheetData: function(url, callback){
  //     var _this = this;
  //     var query = new google.visualization.Query(url);
  //     query.setQuery("SELECT *");
  //     query.send($.proxy(callback, _this));
  //   }

  //   ,getColumns: function(){
  //     var _this = this;
  //     var url = _this.sheet_link + "&gid=1&headers=1";
  //     this.getSheetData(url, this.setColumns);
  //   }

  //   ,setColumns: function(query_response){
  //     var _this = this;
  //     var data = _this.jsonifyResponse(query_response);
  //     _this.columns = $.map(data.rows, function(row, index){
  //       return row.c[0].v;
  //     });
  //     render_page(_this.columns);
  //   }
    
  //   ,jsonifyResponse: function(query_response){
  //     return JSON.parse(query_response.getDataTable().toJSON());
  //   }

  // };

})(jQuery, window, window.document);
