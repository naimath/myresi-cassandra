var expertSkillArray = new Array();
var intermediateSkillArray = new Array();
var familiarSkillArray = new Array();
var skillArray = [];
var badwords =["4r5e", "5h1t", "5hit", "a55", "anal", "anus", "ar5e", "arrse", "arse", "ass", "ass-fucker", "asses", "assfucker", "assfukka", "asshole", "assholes", "asswhole", "a_s_s", "b!tch", "b00bs", "b17ch", "b1tch", "ballbag", "balls", "ballsack", "bastard", "beastial", "beastiality", "bellend", "bestial", "bestiality", "bi+ch", "biatch", "bitch", "bitcher", "bitchers", "bitches", "bitchin", "bitching", "bloody", "blow job", "blowjob", "blowjobs", "boiolas", "bollock", "bollok", "boner", "boob", "boobs", "booobs", "boooobs", "booooobs", "booooooobs", "breasts", "buceta", "bugger", "bum", "bunny fucker", "butt", "butthole", "buttmuch", "buttplug", "c0ck", "c0cksucker", "carpet muncher", "cawk", "chink", "cipa", "cl1t", "clit", "clitoris", "clits", "cnut", "cock", "cock-sucker", "cockface", "cockhead", "cockmunch", "cockmuncher", "cocks", "cocksuck", "cocksucked", "cocksucker", "cocksucking", "cocksucks", "cocksuka", "cocksukka", "cok", "cokmuncher", "coksucka", "coon", "cox", "crap", "cum", "cummer", "cumming", "cums", "cumshot", "cunilingus", "cunillingus", "cunnilingus", "cunt", "cuntlick", "cuntlicker", "cuntlicking", "cunts", "cyalis", "cyberfuc", "cyberfuck", "cyberfucked", "cyberfucker", "cyberfuckers", "cyberfucking", "d1ck", "damn", "dick", "dickhead", "dildo", "dildos", "dink", "dinks", "dirsa", "dlck", "dog-fucker", "doggin", "dogging", "donkeyribber", "doosh", "duche", "dyke", "ejaculate", "ejaculated", "ejaculates", "ejaculating", "ejaculatings", "ejaculation", "ejakulate", "f u c k", "f u c k e r", "f4nny", "fag", "fagging", "faggitt", "faggot", "faggs", "fagot", "fagots", "fags", "fanny", "fannyflaps", "fannyfucker", "fanyy", "fatass", "fcuk", "fcuker", "fcuking", "feck", "fecker", "felching", "fellate", "fellatio", "fingerfuck", "fingerfucked", "fingerfucker", "fingerfuckers", "fingerfucking", "fingerfucks", "fistfuck", "fistfucked", "fistfucker", "fistfuckers", "fistfucking", "fistfuckings", "fistfucks", "flange", "fook", "fooker", "fuck", "fucka", "fucked", "fucker", "fuckers", "fuckhead", "fuckheads", "fuckin", "fucking", "fuckings", "fuckingshitmotherfucker", "fuckme", "fucks", "fuckwhit", "fuckwit", "fudge packer", "fudgepacker", "fuk", "fuker", "fukker", "fukkin", "fuks", "fukwhit", "fukwit", "fux", "fux0r", "f_u_c_k", "gangbang", "gangbanged", "gangbangs", "gaylord", "gaysex", "goatse", "God", "god-dam", "god-damned", "goddamn", "goddamned", "hardcoresex", "hell", "heshe", "hoar", "hoare", "hoer", "homo", "hore", "horniest", "horny", "hotsex", "jack-off", "jackoff", "jap", "jerk-off", "jism", "jiz", "jizm", "jizz", "kawk", "knob", "knobead", "knobed", "knobend", "knobhead", "knobjocky", "knobjokey", "kock", "kondum", "kondums", "kum", "kummer", "kumming", "kums", "kunilingus", "l3i+ch", "l3itch", "labia", "lmfao", "lust", "lusting", "m0f0", "m0fo", "m45terbate", "ma5terb8", "ma5terbate", "masochist", "master-bate", "masterb8", "masterbat*", "masterbat3", "masterbate", "masterbation", "masterbations", "masturbate", "mo-fo", "mof0", "mofo", "mothafuck", "mothafucka", "mothafuckas", "mothafuckaz", "mothafucked", "mothafucker", "mothafuckers", "mothafuckin", "mothafucking", "mothafuckings", "mothafucks", "mother fucker", "motherfuck", "motherfucked", "motherfucker", "motherfuckers", "motherfuckin", "motherfucking", "motherfuckings", "motherfuckka", "motherfucks", "muff", "mutha", "muthafecker", "muthafuckker", "muther", "mutherfucker", "n1gga", "n1gger", "nazi", "nigg3r", "nigg4h", "nigga", "niggah", "niggas", "niggaz", "nigger", "niggers", "nob", "nob jokey", "nobhead", "nobjocky", "nobjokey", "numbnuts", "nutsack", "orgasim", "orgasims", "orgasm", "orgasms", "p0rn", "pawn", "pecker", "penis", "penisfucker", "phonesex", "phuck", "phuk", "phuked", "phuking", "phukked", "phukking", "phuks", "phuq", "pigfucker", "pimpis", "piss", "pissed", "pisser", "pissers", "pisses", "pissflaps", "pissin", "pissing", "pissoff", "poop", "porn", "porno", "pornography", "pornos", "prick", "pricks", "pron", "pube", "pusse", "pussi", "pussies", "pussy", "pussys", "rectum", "retard", "rimjaw", "rimming", "s hit", "s.o.b.", "sadist", "schlong", "screwing", "scroat", "scrote", "scrotum", "semen", "sex", "sh!+", "sh!t", "sh1t", "shag", "shagger", "shaggin", "shagging", "shemale", "shi+", "shit", "shitdick", "shite", "shited", "shitey", "shitfuck", "shitfull", "shithead", "shiting", "shitings", "shits", "shitted", "shitter", "shitters", "shitting", "shittings", "shitty", "skank", "slut", "sluts", "smegma", "smut", "snatch", "son-of-a-bitch", "spac", "spunk", "s_h_i_t", "t1tt1e5", "t1tties", "teets", "teez", "testical", "testicle", "tit", "titfuck", "tits", "titt", "tittie5", "tittiefucker", "titties", "tittyfuck", "tittywank", "titwank", "tosser", "turd", "tw4t", "twat", "twathead", "twatty", "twunt", "twunter", "v14gra", "v1gra", "vagina", "viagra", "vulva", "w00se", "wang", "wank", "wanker", "wanky", "whoar", "whore", "willies", "willy", "xrated", "xxx"];

var $select = $('#expertSkills, #intermediateSkills, #familiarSkills').selectize({
    maxItems: null,
    valueField: 'title',
    labelField: 'title',
    searchField: 'title',
    persist:true,
    onItemAdd:function(input){
        console.log('OnItemAddCalled');
        console.log(input);
         if($(this)[0].eventNS == '.selectize1'){

             if(intermediateSkillArray.indexOf(input) == -1  && familiarSkillArray.indexOf(input) == -1  && badwords.indexOf(input) ){

                 expertSkillArray.push(input);
                 console.log(expertSkillArray);
                 console.log(input);

             }else{
                 selectize.removeItem(input);
                 expertSkillArray.splice(input, 1)
             }

        }

         if($(this)[0].eventNS == '.selectize2'){

             if(expertSkillArray.indexOf(input) == -1  && familiarSkillArray.indexOf(input) == -1 && badwords.indexOf(input) == -1 ){

                 intermediateSkillArray.push(input);
                 console.log(intermediateSkillArray);
                 console.log(input);
             }
             else{
                 selectize1.removeItem(input);
                 intermediateSkillArray.splice(input, 1)
             }
         }

         if($(this)[0].eventNS == '.selectize3'){

             if(expertSkillArray.indexOf(input) == -1  && intermediateSkillArray.indexOf(input) == -1  && badwords.indexOf(input) == -1 ){

                 familiarSkillArray.push(input);
                 console.log(familiarSkillArray);
                 console.log(input);

             }
             else{
                 selectize2.removeItem(input);
                 familiarSkillArray.splice(input, 1)
             }


         }

     },
    onItemRemove:function(){
        console.log($(this)[0].eventNS);
    },
    create:function(input) {


        if($(this)[0].eventNS == '.selectize1'){

            if(intermediateSkillArray.indexOf(input) == -1  && familiarSkillArray.indexOf(input) == -1  && badwords.indexOf(input) ){

                //expertSkillArray.push(input);
                console.log(expertSkillArray);
                console.log(input);
                return {
                    id: input,
                    title:input
                }

            }else{
                return false;
            }

        }

        if($(this)[0].eventNS == '.selectize2'){

            if(expertSkillArray.indexOf(input) == -1  && familiarSkillArray.indexOf(input) == -1 && badwords.indexOf(input) == -1 ){

                //intermediateSkillArray.push(input);
                console.log(intermediateSkillArray);
                console.log(input);
                    return {
                        id: input,
                        title:input
                    }

            }else{
                return false;
            }

        }

        if($(this)[0].eventNS == '.selectize3'){

            if(expertSkillArray.indexOf(input) == -1  && intermediateSkillArray.indexOf(input) == -1  && badwords.indexOf(input) == -1 ){

                //familiarSkillArray.push(input);
                console.log(familiarSkillArray);
                console.log(input);
                return {
                    id: input,
                    title:input
                }

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
                if(i <= 1){
                    selectize.addOption({
                        id: data.skills[i],
                        title: data.skills[i]
                    });
                    selectize.addItem(data.skills[i]);
                    //expertSkillArray.push(data.skills[i]);
                }else if(i <= 3){
                    selectize1.addOption({
                        id: data.skills[i],
                        title: data.skills[i]
                    });
                    selectize1.addItem(data.skills[i]);
                    //intermediateSkillArray.push(data.skills[i]);
                }else if(i > 3 ){
                    selectize2.addOption({
                        id: data.skills[i],
                        title: data.skills[i]
                    });
                    selectize2.addItem(data.skills[i]);
                    //familiarSkillArray.push(data.skills[i]);
                }

                $('.item').draggable({
                    appendTo: "body",
                    revert:'invalid',
                    snap:true,
                    snapMode: "outer",
                    helper: function(){
                        return '<div class="draggableItem"> ' + $(this).text() + ' </div> '
                    },
                    start: function() {
                        $('.selectize-input').attr('disabled');
                        $(this).css('z-index','10000');
                        $(this).css('overflow', 'visible');
                    }
                });

            }

        }
    });

});


$('.selectize-input').droppable({
    tolerance:'touch',
    activeClass:'ui-state-hover',
    drop:function(event, ui){
        console.log('Dropped!');

        if($(this).droppable("instance").uuid == 0){

            if(intermediateSkillArray.indexOf(ui.draggable[0].innerText) == -1  && familiarSkillArray.indexOf(ui.draggable[0].innerText) == -1  && badwords.indexOf(ui.draggable[0].innerText) ){
                console.log('In Drop IF');
                selectize.addItem(ui.draggable[0].innerText );
                selectize.addOption({'id':'ui.draggable[0].innerText', 'title':'ui.draggable[0].innerText'})
                console.log(ui.draggable[0].innerText);
                expertSkillArray.push(ui.draggable[0].innerText);
                //expertSkillArray.splice(ui.draggable[0].innerText, 1);

            }else{
                console.log('In Drop Else');
                ui.draggable.draggable('option', {revert: true});
            }

        }else if($(this).droppable("instance").uuid == 1){

            //if($(this)[0].eventNS == '.selectize2'){

                if(expertSkillArray.indexOf(ui.draggable[0].innerText) == -1  && familiarSkillArray.indexOf(ui.draggable[0].innerText) == -1 && badwords.indexOf(ui.draggable[0].innerText) == -1 ){

                    selectize1.addItem(ui.draggable[0].innerText );
                    //console.log(ui.draggable[0].innerText);
                    intermediateSkillArray.push(ui.draggable[0].innerText);
                    //intermediateSkillArray.splice(ui.draggable[0].innerText, 1);

                }
                else{
                    ui.draggable.draggable('option', {revert: true});
                }

        }else if($(this).droppable("instance").uuid == 2){

            if(expertSkillArray.indexOf(ui.draggable[0].innerText) == -1  && intermediateSkillArray.indexOf(ui.draggable[0].innerText) == -1  && badwords.indexOf(ui.draggable[0].innerText) == -1 ){

                selectize2.addItem(ui.draggable[0].innerText );
                familiarSkillArray.push(ui.draggable[0].innerText);
                //familiarSkillArray.splice(ui.draggable[0].innerText, 1);

            }

        }
        else{
            ui.draggable.draggable('option', {revert: true});
        }

    },
    out: function( event, ui ) {
        console.log('From the Drag Out Event');
        console.log(ui.draggable[0].innerText);

        if($(this).droppable("instance").uuid == 0){

            selectize.removeItem(ui.draggable[0].innerText);
            expertSkillArray.splice(ui.draggable[0].innerText, 1);
            console.log(expertSkillArray);

        }else if($(this).droppable("instance").uuid == 1){

            selectize1.removeItem(ui.draggable[0].innerText);
            selectize1.removeOption(ui.draggable[0].innerText);
            intermediateSkillArray.splice(ui.draggable[0].innerText, 1);
            console.log(intermediateSkillArray);


        }else if($(this).droppable("instance").uuid == 2){

            selectize2.removeItem(ui.draggable[0].innerText);
            familiarSkillArray.splice(ui.draggable[0].innerText, 1);
            console.log(familiarSkillArray);

        }
    }

});



selectize.on('item_add', function(){
    $('.item').draggable({
        appendTo: "body",
        revert:function(is_valid_drop){
            if(!is_valid_drop){
                console.log($(this));
                selectize.addItem($(this).context.innerText);
                expertSkillArray.push($(this).context.innerText);
            }

        },
        snap:true,
        snapMode: "outer",
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
        appendTo: "body",
        revert:function(is_valid_drop){
            if(!is_valid_drop){
                console.log($(this));
                selectize1.addItem($(this).context.innerText);
                intermediateSkillArray.push($(this).context.innerText);
            }

        },
        snap:true,
        snapMode: "outer",
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

selectize2.on('item_add', function(){
    $('.item').draggable({
        appendTo: "body",
        revert:function(is_valid_drop){
            if(!is_valid_drop){
                console.log($(this));
                selectize2.addItem($(this).context.innerText);
                familiarSkillArray.push($(this).context.innerText);
            }

        },
        snap:true,
        snapMode: "outer",
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
