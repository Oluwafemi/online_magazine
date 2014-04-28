if (typeof(CKEDITOR) != 'undefined')
{
  CKEDITOR.editorConfig = function(config) {
    config.uiColor = "#AADC6E";
    //config.toolbar = [ [ 'Source', 'Bold' ], ['CreatePlaceholder'] ];
  }
} else{
  console.log("ckeditor not loaded")
}