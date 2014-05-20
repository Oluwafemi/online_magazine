if (typeof(CKEDITOR) != 'undefined')
{
  CKEDITOR.editorConfig = function(config) {
    config.toolbar_Full = [
    [ 'Source', '-', 'Preview' ],
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
    config.toolbar_ToolsNoImage = [
    ['Source', '-', 'Preview' ],
    [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', 'Undo', 'Redo' ],
    [ 'Find', 'Replace', 'SelectAll', 'Scayt' ],    
    [ 'NumberedList', 'BulletedList', 'Outdent', 'Indent', 'Blockquote', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', 'BidiLtr', 'BidiRtl' ],
    [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'RemoveFormat' ],
    [ 'TextColor', 'BGColor' ],
    [ 'Link', 'Unlink'],
    [ 'Styles', 'Format' ],
    [ 'ShowBlocks' ]
    ];
    config.disableNativeSpellChecker = false;
    config.toolbarCanCollapse = true;
    config.pasteFromWordRemoveFontStyles = false;
    config.scayt_autoStartup = true;
    config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
    config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
    config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";
    config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
    config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
    config.filebrowserImageUploadUrl = "/ckeditor/pictures";
    config.filebrowserUploadUrl = "/ckeditor/attachment_files";
    //config.uiColor = "#AADC6E";
  }
} else{
  console.log("ckeditor not loaded")
}