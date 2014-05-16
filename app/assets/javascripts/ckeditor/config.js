if (typeof(CKEDITOR) != 'undefined')
{
  CKEDITOR.editorConfig = function(config) {
    config.toolbar = [
    [ 'Source' ],
    [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', 'Undo', 'Redo' ],
    [ 'Find', 'Replace', 'SelectAll', 'Scayt' ],    
    [ 'NumberedList', 'BulletedList', 'Outdent', 'Indent', 'Blockquote', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', 'BidiLtr', 'BidiRtl' ],
    [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'RemoveFormat' ],
    [ 'TextColor', 'BGColor' ],
    [ 'Link', 'Unlink', 'Anchor'],
    [ 'CreatePlaceholder', 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'InsertPre' ],
    [ 'Styles', 'Format' ],
    [ 'ShowBlocks' ]
    ];
    config.disableNativeSpellChecker = false;
    config.toolbarCanCollapse = true;
    config.pasteFromWordRemoveFontStyles = false;
    config.scayt_autoStartup = true;
    //config.filebrowserBrowseUrl = '/browser/browse.php';
    //config.filebrowserUploadUrl = '/uploader/upload.php';
    //config.uiColor = "#AADC6E";
  }
} else{
  console.log("ckeditor not loaded")
}