$(document).foundation();
$('#firstModal').foundation('reveal', 'open');
/*
 Ajax To Validate and POST the Registration Form.
 * *

$('#workDetails')
    .on('invalid.fndtn.abide', function () {
        return false;
    })
    .on('valid.fndtn.abide', function () {
        $.ajax({
            type: "POST",
            url: '/users/editprofile',
            data: $('#workDetails').serialize(),
            success: function(data){
                if(data.error){
                    $('#result').html("<div data-alert class=\"alert-box alert \">"+data.error+"<a href=\"#\" class=\"close\">&times;</a></div>");
                }else{
                    $('#result').html("<div data-alert class=\"alert-box success \">"+data.success+"<a href=\"#\" class=\"close\">&times;</a></div>");
                }
            }
        });
        return false;
    });

/*
 END Ajax To Validate and POST the Registration Form.
 * */



/*
 Ajax To Validate and POST the Skills .
*/

$('#editSkills')
    .on('invalid.fndtn.abide', function () {
        return false;
    })
    .on('valid.fndtn.abide', function () {
        $.ajax({
            type: "POST",
            url: '/SpringCassandra/users/editSkills',
            data: $('#editSkills').serialize(),
            success: function(data){
            	var data = JSON.parse(data);
                if(data.error){
                    $('#result1').html("<div data-alert class=\"alert-box alert \">"+data.error+"<a href=\"#\" class=\"close\">&times;</a></div>");
                }else{
                    $('#fourthModal').foundation('reveal', 'close');
                    window.location.href='/SpringCassandra/users/profile';
                }
            }
        });
        return false;
    });

/*
 END Ajax To Validate and POST the Skills.
 */

/*
 Ajax To Validate and POST the profile .
 */

$('#editProfile')
    .on('invalid.fndtn.abide', function () {
        return false;
    })
    .on('valid.fndtn.abide', function () {
        $.ajax({
            type: "POST",
            url: '/SpringCassandra/users/editprofile',
            data: $('#editProfile').serialize(),
            success: function(data){
            	var data = JSON.parse(data);
                if(data.error){
                    $('#result2').html("<div data-alert class=\"alert-box alert \">"+data.error+"<a href=\"#\" class=\"close\">&times;</a></div>");
                }else{
                    $('#secondModal').foundation('reveal', 'close');
                    $('#thirdModal').foundation('reveal', 'open');
                }
            }
        });
        return false;
    });

/*
 END Ajax To Validate and POST the profile.
 */

/*
 Ajax To Validate and POST the profile .


$('#saveemail')
    .on('invalid.fndtn.abide', function () {
        return false;
    })
    .on('valid.fndtn.abide', function () {
        $.ajax({
            type: "POST",
            url: '/SpringCassandra/users/saveemail',
            data: $('#saveemail').serialize(),
            success: function(data){
                if(data.error){
                    console.log(data.error);
                    $('#resultEmail').html("<div data-alert class=\"alert-box alert \">"+data.error+"<a href=\"#\" class=\"close\">x</a></div>");
                }else{
                    $('#firstModal').foundation('reveal', 'close');
                    $('#secondModal').foundation('reveal', 'open');
                }
            }
        });
        return false;
    });

/*
 END Ajax To Validate and POST the profile.
 */

var files;

//Add events
$('input[type=file]').on('change', prepareUpload);
//Grab the files and set them to our variable
function prepareUpload(event)
{
files = event.target.files;
}

$('#imageUpload').on('submit', uploadFiles);

//Catch the form submit and upload the files
function uploadFiles(event)
{
event.stopPropagation(); // Stop stuff happening
event.preventDefault(); // Totally stop stuff happening

// START A LOADING SPINNER HERE

// Create a formdata object and add the files
var data = new FormData();
$.each(files, function(key, value)
{
    data.append("file", value);
});

$.ajax({
    url: '/SpringCassandra/users/imageupload',
    type: 'POST',
    data: data,
    cache: false,
    dataType: 'json',
    processData: false, // Don't process the files
    contentType: false, // Set content type to false as jQuery will tell the server its a query string request
    success: function(data, textStatus, jqXHR)
    {
        if(typeof data.error === 'undefined')
        {
      	  var el = document.getElementById("profileImagePopup");
			 el.style.backgroundImage = "url(/SpringCassandra/users/image?"+new Date().getTime()+")"; // change it			
			
		
        }
        else
        {
            // Handle errors here
            console.log('ERRORS: ' + data.error);
        }
    },
    error: function(jqXHR, textStatus, errorThrown)
    {
        // Handle errors here
        console.log('ERRORS: ' + textStatus);
        // STOP LOADING SPINNER
    }
});
}





/*
 Image Upload Handler.
 */

$('input[name=imageUploder]').change(function(){
    console.log('Change Event fired');
    var form1 = new FormData($('#editProfile')[0]);
    if($('input[name=imageUploder]').prop('files')){
        console.log('Yeah');
    }else{
        console.log('No');
    }
    //form1.append("image", $('input[name=imageUploder]').prop('files'));
    console.log(form1);
    $.ajax({
        type: "POST",
        url: '/users/imageupload',
        cache: false,
        contentType: false,
        processData: false,
        data: form1,
        success: function(data){
            if(data.error){
                //$('#loginModal').foundation('reveal', 'close');
                $( "#secondModal" ).remove();
                $('body').append("<div id=\"secondModal\" class=\"reveal-modal tiny\" data-reveal>"+
                    "<h2>Error</h2><hr>"+
                    "<p>"+data.error+"</p>"+
                    "<a class=\"close-reveal-modal\">&#215;</a>"+
                    "</div>");
                $('#secondModal').foundation('reveal', 'open');
            }else{
                $('[name=imageUrl]').val('/uploads/'+data.success);
                $('#profileImage').css('background-image','url(/uploads/'+data.success+')')
            }
        }
    });
});


/*
 END Ajax To Validate and POST the Work Details Form.
 * */

$('#workDetails')
    .on('invalid.fndtn.abide', function () {
        return false;
    })
    .on('valid.fndtn.abide', function () {
        $.ajax({
            type: "POST",
            url: '/SpringCassandra/users/editwork',
            data: $('#workDetails').serialize(),
            success: function(data){
            	var data = JSON.parse(data);
                if(data.error){
                    $('#result').html("<div data-alert class=\"alert-box alert \">"+data.error+"<a href=\"#\" class=\"close\">&times;</a></div>");
                }else{
                    $('#thirdModal').foundation('reveal', 'close');
                    $('#fourthModal').foundation('reveal', 'open');
                }
            }
        });
        return false;
    });

/*
 END Ajax To Validate and POST the Registration Form.
 * */

