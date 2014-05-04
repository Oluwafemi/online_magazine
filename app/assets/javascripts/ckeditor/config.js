if (typeof(CKEDITOR) != 'undefined')
{
  CKEDITOR.editorConfig = function(config) {
    //config.uiColor = "#AADC6E";
    config.toolbar = [
    [ 'Source', '-', 'NewPage', 'Preview', '-', 'Templates' ],
    [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ],
    [ 'Bold', 'Italic' ]
    ];
    config.disableNativeSpellChecker = false;
    config.toolbarCanCollapse = true;
    config.pasteFromWordRemoveFontStyles = false;
    config.scayt_autoStartup = true;
  }
} else{
  console.log("ckeditor not loaded")
}