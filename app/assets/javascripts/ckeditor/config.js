if (typeof(CKEDITOR) != 'undefined')
{
  CKEDITOR.editorConfig = function(config) {
    config.toolbar = [
    [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', 'Undo', 'Redo' ],
    [ 'Find', 'Replace', 'SelectAll', 'Scayt' ],    
    [ 'NumberedList', 'BulletedList', 'Outdent', 'Indent', 'Blockquote', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', 'BidiLtr', 'BidiRtl' ],
    [ 'Link', 'Unlink'],
    [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'RemoveFormat' ],
    [ 'TextColor', 'BGColor' ]
    ];
    config.disableNativeSpellChecker = false;
    config.toolbarCanCollapse = true;
    config.pasteFromWordRemoveFontStyles = false;
    config.scayt_autoStartup = true;
    //config.uiColor = "#AADC6E";
  }
} else{
  console.log("ckeditor not loaded")
}