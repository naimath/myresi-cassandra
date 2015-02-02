$('#profileImageOverlay').click(function(){
    $('input[name=imageUploder]').trigger('click');
});

$('input[name=imageUploder]').change(function(){
    console.log('Change Event fired');
    var form1 = new FormData($('#imageform')[0]);
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
               $('#profileImage').css('background-image','url(/uploads/'+data.success+')')
            }
        }
    });
});

/*
 Ajax To Validate and POST the Skills Form.
 * */

$('#editSkills')
    .on('invalid.fndtn.abide', function () {
        return false;
    })
    .on('valid.fndtn.abide', function () {
        $.ajax({
            type: "POST",
            url: '/users/editSkills',
            data: $('#editSkills').serialize(),
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
                    $('#loginModal').foundation('reveal', 'close');
                    $( "#secondModal" ).remove();
                    $('body').append("<div id=\"secondModal\" class=\"reveal-modal tiny\" data-reveal>"+
                        "<h2>Success</h2><hr>"+
                        "<p>"+data.success+"</p>"+
                        "<a class=\"close-reveal-modal\">&#215;</a>"+
                        "</div>");
                    $('#secondModal').foundation('reveal', 'open');
                }
            }
        });
        return false;
    });

/*
 END Ajax To Validate and POST the Registration Form.
 * */

var expertSkillArray = [];
var intermediateSkillArray = [];
var familiarSkillArray = [];
var skillArray = [];

var $select = $('#expertSkills, #intermediateSkills, #familiarSkills').selectize({
    maxItems: null,
    valueField: 'id',
    labelField: 'title',
    searchField: 'title',
    persist:true,
    onItemAdd:function(){
    console.log('On Item Add Called');
        console.log(this);

        console.log(this.items[this.items.length-1]);

        if($(this)[0].eventNS == '.selectize1'){
            console.log('On Item Add Called IN expertskills');
            selectize1.removeItem(this.items[this.items.length-1]);
            //selectize1.removeOption(this.items[this.items.length-1]);
            selectize2.removeItem(this.items[this.items.length-1]);
            //selectize2.removeOption(this.items[this.items.length-1]);


        }else if($(this)[0].eventNS == '.selectize2'){

            selectize.removeItem(this.items[this.items.length-1]);
            //selectize1.removeOption(this.items[this.items.length-1]);
            selectize2.removeItem(this.items[this.items.length-1]);
            //selectize1.removeOption(this.items[this.items.length-1]);

        }else{

            selectize.removeItem(this.items[this.items.length-1]);
            //selectize1.removeOption(this.items[this.items.length-1]);
            selectize1.removeItem(this.items[this.items.length-1]);
            //selectize1.removeOption(this.items[this.items.length-1]);

        }
    },
    onItemRemove:function(){
        console.log($(this));

        if($(this)[0].items.length < 1){

            if($(this)[0].eventNS == '.selectize1'){

                selectize.addOption({
                    id: '1000000000000000000',
                    title: "."
                });
                selectize.addItem('1000000000000000000');
                selectize.close();

            }else if($(this)[0].eventNS == '.selectize2'){

                selectize1.addOption({
                    id: '1000000000000000000',
                    title: "."
                });
                selectize1.addItem('1000000000000000000');

            }else{

                selectize2.addOption({
                    id: '1000000000000000000',
                    title: "."
                });
                selectize2.addItem('1000000000000000000');

            }

        }else{
            console.log('Meh');
        }

    },
    create:function(input) {

        var count = 0;
        for(id in this.options)
        {
            count++;

        }

            if($(this)[0].eventNS == '.selectize1'){

                if(expertSkillArray.indexOf(input) == -1 && intermediateSkillArray.indexOf(input) == -1  && familiarSkillArray.indexOf(input) == -1 ){

                    selectize.addOption({id: count+1, title: input });
                    selectize1.addOption({id: count+1, title: input });
                    selectize2.addOption({id: count+1, title: input });

                    //alert('Cannot Have Duplicates');

                    return{
                        id: count+1,
                        title: input
                    };
                }else{
                    return false;
                }



            }else if($(this)[0].eventNS == '.selectize2'){

                if(expertSkillArray.indexOf(input) == -1 && intermediateSkillArray.indexOf(input) == -1  && familiarSkillArray.indexOf(input) == -1 ){

                    selectize.addOption({id: count+1, title: input });
                    selectize1.addOption({id: count+1, title: input });
                    selectize2.addOption({id: count+1, title: input });

                    //alert('Cannot Have Duplicates');

                    return{
                        id: count+1,
                        title: input
                    };
                }else{
                    return false;
                }
            }else{

                if(expertSkillArray.indexOf(input) == -1 && intermediateSkillArray.indexOf(input) == -1  && familiarSkillArray.indexOf(input) == -1 ){

                    selectize.addOption({id: count+1, title: input });
                    selectize1.addOption({id: count+1, title: input });
                    selectize2.addOption({id: count+1, title: input });

                    alert('Cannot Have Duplicates');

                    return{
                        id: count+1,
                        title: input
                    };
                }else{
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
                selectize.addOption({
                    id: i,
                    title: data.skills[i]
                });
                expertSkillArray.push(data.skills[i]);
                selectize1.addOption({
                    id: i,
                    title: data.skills[i]
                });
                intermediateSkillArray.push(data.skills[i]);
                selectize2.addOption({
                    id: i,
                    title: data.skills[i]
                });
                familiarSkillArray.push(data.skills[i]);
            }

            $('.item').draggable({
                refreshPositions:true,
                appendTo: "body",
                axis: "y",
                snap:true,
                snapMode: "inner",
                snapTolerance:40,
                helper: function(){
                    return '<div class="draggableItem"> ' + $(this).text() + ' </div> '
                },
                start: function() {
                    $('input[type=text]').attr('disabled');
                    $(this).css('z-index','10000');
                    $(this).css('overflow', 'visible');
                }
            });

            console.log(expertSkillArray);
            console.log(intermediateSkillArray);
            console.log(familiarSkillArray);
        }
    });

});


$('.selectize-input').droppable({
    greedy: true,
    tolerance:'fit',
    drop:function(event, ui){
        selectize1.open();
        console.log('Dropped!');
        var instance = $(this).droppable( "instance" );
        //console.log(instance.uuid);
        //console.log(ui);
        if($(this).droppable("instance").uuid == 0){

            selectize.addItem(ui.draggable[0].dataset.value );
            console.log('Item fromdrop');
            expertSkillArray.push(ui.draggable.context.innerHTML);
            //expertSkillArray.splice(ui.draggable[0].dataset.value, 1);

        }else if($(this).droppable("instance").uuid == 1){

            selectize1.addItem(ui.draggable[0].dataset.value );
            intermediateSkillArray.push(ui.draggable.context.innerHTML);
            //intermediateSkillArray.splice(ui.draggable[0].dataset.value, 1);

        }else if($(this).droppable("instance").uuid == 2){

            selectize2.addItem(ui.draggable[0].dataset.value );
            familiarSkillArray.push(ui.draggable.context.innerHTML);
            //familiarSkillArray.splice(ui.draggable[0].dataset.value, 1);
        }

    },
    out: function( event, ui ) {
        console.log('Dragged Out!');
        console.log($(this)[0].childNodes.length);
        if($(this)[0].childNodes.length < 1){
            console.log('Empty now :(');
            /*
            selectize.addOption({
                id: '1000000000000000000',
                title: "."
            });
            selectize.addItem('1000000000000000000');*/
        }

        if($(this).droppable("instance").uuid == 0){

            selectize.removeItem(ui.draggable.context.dataset.value);
            //selectize.removeOption(ui.draggable.context.dataset.value);
            expertSkillArray.splice(ui.draggable.context.dataset.value, 1);

        }else if($(this).droppable("instance").uuid == 1){

            selectize1.removeItem(ui.draggable.context.dataset.value);
            //selectize1.removeOption(ui.draggable.context.dataset.value);
            intermediateSkillArray.splice(ui.draggable.context.dataset.value, 1);


        }else if($(this).droppable("instance").uuid == 2){

            selectize2.removeItem(ui.draggable.context.dataset.value);
            //selectize2.removeOption(ui.draggable.context.dataset.value);
            familiarSkillArray.splice(ui.draggable.context.dataset.value, 1);

        }
    }

});



selectize.on('item_add', function(){
    $('.item').draggable({
        refreshPositions:true,
        appendTo: "body",
        revert:function(is_valid_drop){
            if(!is_valid_drop){
                console.log($(this));
                selectize2.addItem($(this).context.dataset.value);
            }

        },
        snap:true,
        grid: [ 60, 60 ],
        snapMode: "inner",
        helper: function(){
            return '<div class="draggableItem"> ' + $(this).text() + ' </div> '
        },
        start: function() {
            $('.selectize-input').attr('disabled');
            $(this).css('z-index','10000');
            $(this).css('overflow', 'visible');
        }
    });
});


selectize1.on('item_add', function(){
    $('.item').draggable({
        refreshPositions:true,
        appendTo: "body",
        revert:function(is_valid_drop){
            if(!is_valid_drop){
                console.log($(this));
                selectize2.addItem($(this).context.dataset.value);
            }

        },
        snap:true,
        snapMode: "inner",
        helper: function(){
            return '<div class="draggableItem"> ' + $(this).text() + ' </div> '
        },
        start: function() {
            $(this).css('z-index','10000');
            $(this).css('overflow', 'visible');
        }
    });
});

selectize2.on('item_add', function(){
    $('.item').draggable({
        refreshPositions:true,
        revert:function(is_valid_drop){
            if(!is_valid_drop){
                console.log($(this));
                selectize2.addItem($(this).context.dataset.value);
            }

        },
        appendTo: "body",
        snap:true,
        snapMode: "inner",
        helper: function(){
            return '<div class="draggableItem"> ' + $(this).text() + ' </div> '
        },
        start: function() {
            $(this).css('z-index','10000');
            $(this).css('overflow', 'visible');
        }
    });
});
