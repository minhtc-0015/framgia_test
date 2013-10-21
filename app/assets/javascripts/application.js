// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

function ajaxDownload(url){
    $.ajax({
        type: 'POST',
        url: url,
        success: function(data){
            alert(data);
        }
    });
    return false;
}

function readURL(input,image) {
    if (input.files && input.files[0]) {//Check if input has files.
        var reader = new FileReader(); //Initialize FileReader.

        reader.onload = function (e) {
            $(image).attr('src', e.target.result);
            $(image).resizable({ aspectRatio: true, maxHeight: 300 });
        };
        reader.readAsDataURL(input.files[0]);
    }
}