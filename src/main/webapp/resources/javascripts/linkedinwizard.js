var someArray = [];
function onLinkedInLoad() {
    if(IN.User.isAuthorized() == true ){
       onLinkedInAuth();
    }else{
        IN.User.authorize(onLinkedInAuth);

    }
}
function onLinkedInAuth() {
    IN.API.Profile("me").fields("skills").result(displayProfiles);
}
function displayProfiles(profiles) {
    member = profiles.values[0];
    for(i=0; i < member.skills.values.length; i++){
        someArray[i] = member.skills.values[i].skill.name;
        //console.log(someArray);
        //document.getElementById( "yeah" ).innerHTML += "<div class=\"panel\"><input type=\"checkbox\" name=\"skills\" value="+member.skills.values[i].skill.name+" checked>"+member.skills.values[i].skill.name+"</div><br/>"
    }


    display();
}

function display(){
    console.log(someArray);

    $('#myModal').foundation('reveal', 'open');

    for(i=0; i < someArray.length; i++){
        document.getElementById( "skillContainer" ).innerHTML += "<div class=\"large-3 columns\"><div class=\"panel\"><input style=\"width:20px;\" type=\"checkbox\" name=\"skills\" value="+someArray[i]+" checked>"+someArray[i]+"</div></div>"
        $('#importedSkills').val($('#importedSkills').val()+' '+ someArray[i]);
        //console.log($('#importedSkills').val());
    }

    $( "input[type=checkbox]" ).change(function(){
        if($(this).prop('checked') === false){
            console.log($(this).val());
            someArray.splice(someArray.indexOf($(this).val()),1);
            console.log(someArray);
        }else{
            someArray.push($(this).val());
            console.log(someArray);
        }

    });
}

function addLinkedinSkills(){

    selectize.load(function (callback) {

        for(var i=0; i < someArray.length; i++){
            selectize2.addOption({
                id: someArray[i],
                title: someArray[i]
            });
            selectize2.addItem(someArray[i]);
            console.log(someArray[i])
        }

    });

    $('.linked-inButton').css('display','none');

}