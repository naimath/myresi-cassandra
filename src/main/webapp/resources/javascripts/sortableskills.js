var $select = $('.skillsInput').selectize({
    maxItems: null,
    delimiter: ' ',
    persist: true,
    valueField: 'id',
    labelField: 'title',
    searchField: 'title',
    create: function(input) {

        return {
            id: input,
            title: input
        };

    },
    onItemAdd: function (input) {
        console.log('--------------------------------------------------------------------------------------------------');
        console.log(input);
        console.log('onItemAdd Called!');

        if(this.eventNS == '.selectize1'){

            if(selectize1.getValue().indexOf(input) == -1 && selectize2.getValue().indexOf(input) == -1 ){

                console.log('Duplicate Not Found!');
                console.log('--------------------------------------------------------------------------------------------------');

            }else{

                selectize.removeItem(input);
                console.log('Duplicate Value Found!');
                console.log('--------------------------------------------------------------------------------------------------');
                $('#duplicateWarning1').css('display','block');
                setTimeout(function(){ $('#duplicateWarning1').css('display','none'); }, 2000);
                return false;
            }

        }else if(this.eventNS == '.selectize2'){

            if(selectize.getValue().indexOf(input) == -1 && selectize2.getValue().indexOf(input) == -1 ){

                console.log('Duplicate Not Found!');
                console.log('--------------------------------------------------------------------------------------------------');

            }else{

                selectize1.removeItem(input);
                console.log('Duplicate Value Found!');
                console.log('--------------------------------------------------------------------------------------------------');
                $('#duplicateWarning2').css('display','block');
                setTimeout(function(){ $('#duplicateWarning2').css('display','none'); }, 2000);
                return false;
            }

        }else{

            if(selectize.getValue().indexOf(input) == -1 && selectize1.getValue().indexOf(input) == -1 ){

                console.log('Duplicate Not Found!');
                console.log('--------------------------------------------------------------------------------------------------');

            }else{

                selectize2.removeItem(input);
                console.log('Duplicate Value Found!');
                console.log('--------------------------------------------------------------------------------------------------');
                $('#duplicateWarning3').css('display','block');
                setTimeout(function(){ $('#duplicateWarning3').css('display','none'); }, 2000);
                return false;
            }

        }


    }

});

var selectize = $select[0].selectize;
var selectize1 = $select[1].selectize;
var selectize2 = $select[2].selectize;

selectize.load(function (callback) {
    $.ajax({
        url: '/users/allskills',
        type: 'GET',
        error: function (e) {
            console.error(e.responseText);
            callback();
        },
        success: function (data) {

            for(var i = 0; i < data.skills.length; i++){
                console.log(data.skills[i]);
                //if(i <= 1){
                    selectize.addOption({
                        id: data.skills[i],
                        title: data.skills[i]
                    });
                    //selectize.addItem(data.skills[i]);
                //}else if(i <= 3){
                    selectize1.addOption({
                        id: data.skills[i],
                        title: data.skills[i]
                    });
                    //selectize1.addItem(data.skills[i]);
                //}else if(i > 3 ){
                    selectize2.addOption({
                        id: data.skills[i],
                        title: data.skills[i]
                    });
                    //selectize2.addItem(data.skills[i]);
                //}


            }

        }
    });
});



$( ".selectize-input" ).sortable({
    appendTo: 'body',
    helper: function(event, ui){

        return '<div class="draggableItem"> ' + $(ui).text() + ' </div> '
    },
    connectWith: ".selectize-input",
    start: function(event, ui) {
        console.log('Drag Event Fired');
        $('.selectize-input').css('border-color','#000');
        $('.draggableItem').css('z-index','10000');
    },
    over:function(event, ui){

        console.log('Outed.');

        if($(this)[0].offsetParent.previousElementSibling.id == 'expertSkills'){
            selectize.removeItem(ui.item.context.innerText);
        }else if($(this)[0].offsetParent.previousElementSibling.id == 'intermediateSkills'){
            selectize1.removeItem(ui.item.context.innerText);
        }else{
            selectize2.removeItem(ui.item.context.innerText);
        }

    },
    receive: function( event, ui ) {

        console.log('Recieved.');
        $('.selectize-input').css('border-color','#d0d0d0');

        if($(this)[0].offsetParent.previousElementSibling.id == 'expertSkills'){
            selectize.addOption({
                id:ui.item.context.innerText,
                title:ui.item.context.innerText
            });
            selectize.addItem(ui.item.context.innerText);
        }else if($(this)[0].offsetParent.previousElementSibling.id == 'intermediateSkills'){
            selectize1.addOption({
                id:ui.item.context.innerText,
                title:ui.item.context.innerText
            });
            selectize1.addItem(ui.item.context.innerText);
        }else{
            selectize2.addOption({
                id:ui.item.context.innerText,
                title:ui.item.context.innerText
            });
            selectize2.addItem(ui.item.context.innerText);
        }

    }
});





/*
selectize.on('item_add', function() {
    var test = selectize.getValue();
    alert(test);
});

selectize1.on('item_add', function() {
    var test = selectize1.getValue();
    alert(test);
});

selectize2.on('item_add', function() {
    var test = selectize2.getValue();
    alert(test);
});*/


function addSkills(){
    var skillArray = ["One","Two","Three","Four","Five"];

    for(var i=0;i<skillArray.length;i++){
        selectize2.addOption({
            id:skillArray[i],
            title:skillArray[i]
        });
        selectize2.addItem(skillArray[i]);
    }

}

