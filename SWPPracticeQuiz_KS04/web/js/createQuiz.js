// delete option
$(document).on('click', '#removeinnerQuestion', function () {
    $(this).closest('#innerQuestion').remove();
    var arr = document.getElementById("titleQuiz").value;
    for (var n = 0; n < arr.length; n++) {
    classOptionContent = "option-content" + arr[n];
}
});

// delete question
$(document).on('click', '#removeCurrentQuestion', function () {
    $(this).closest('#currentQuestion').remove();
});

let i = 1;
let o = 1;

//remove Question
function removeQuestion(s){
    document.getElementById(s).remove();
    numberQuestion();
}
function numberQuestion(){
    className = "questionnumber";
    var arr = document.getElementsByClassName(className);
    console.log(arr.length);
    var j = 1;
    for (var i = 0, max = arr.length; i < max; i++) {
            document.getElementsByClassName(className)[i].textContent = j;
            j++;
    }
}
// remove Option
function removeOption(s){
    var option = "";
    option += s;
    var id = option.substring(8,s.indexOf('_'));
    document.getElementById(s).remove();
//    $(this).closest('#innerQuestion').remove();
    numberOption(s);
}
function numberOption(s){
    var option = "";
    option += s;
    var id = option.substring(8,s.indexOf('_'));
    className = 'optionnumber'+ id;
    var arr = document.getElementsByClassName(className);
    console.log(id);
    console.log(arr.length);
    var j = 1;
    for (var i = 0, max = arr.length; i < max; i++) {
            document.getElementsByClassName(className)[i].textContent = j;
            j++;
    }
    
}
//add option
function addOption(string) {
//    console.log(string);
    o++;
    var option = "";
    option += string;
    var id = option.substring(12, option.length);
    var classOptionContent = "option-content" + id;
    var numberOfOption = document.getElementsByClassName(classOptionContent);
    var optionnumber = numberOfOption.length +1;
    var html1 = '';
    html1 += `<div id='question${id}_option${o}' class="innerQuestion${id}">
                                                                                    <div>
                                                                                        <div>
                                                                                            <label for="option">Option <span><p class="optionnumber${id}">${optionnumber}</p></span></label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="td-form-item" >
                                                                                        <div class="form-item-wrap">
                                                                                            <div class="form-textarea-wrapper form-item">
                                                                                                <textarea style="height: 60px; padding-top: 5px;" required="" name="option" id="answer" class="option-content${id}"></textarea>
                                                                                            </div>
                                                                                            <div class="form-item form-checkbox checkbox-style">
                                                                                                <input type="checkbox" id='que${id}_option${o}' name="right_option${id}" class="right_option${id}" value="ON" >
                                                                                                <label for="que${id}_option${o}">
                                                                                                    <i style="width:30px;height: 30px; margin-top: 15px;" class="icon-checkbox icon md-check-1"></i>
                                                                                                </label>
                                                                                            </div>
                                                                                            <div class="course-region-tool">
                                                                                                <button style="width:30px;height: 30px;font-size: 30px; margin-top: 12px;" class="delete" type="button" onclick="removeOption('question${id}_option${o}')" id='removeinnerQuestion${id}' title="delete" value="${optionnumber}"><i class="icon md-recycle"></i></button>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>
                                                                                </div>`;

    $(`#${string}`).append(html1);
}

//add option
function addQuestion() {
//    console.log(string);
    i++;
    var html = '';
    var arr = new Array();
    var j = 0;
    for (var k = 1; k <= i; k++) {
        if (!!document.getElementById("questionTitle" + k) === true) {
            arr[j] = k;
            j++;
            console.log(k);
        } else {
            continue;
        }
    }
    console.log("Number of questions : " + arr.length);
    html += `<div class="dc-assignment-info dc-course-item" id='currentQuestion${i}'>
                                                                <div class="dc-content-title">
                                                                    <h5 class="xsm black">Question <span class='questionnumber'> ${j+1}</span></h5>
                                                                    <div class="course-region-tool">
                                                                        <button onclick="removeQuestion('currentQuestion${i}')" id='removeCurrentQuestion${i}' class="delete" title="delete"><i class="icon md-recycle"></i></button>
                                                                    </div>
                                                                </div>

                                                                <div class="assignment-body dc-item-body">
                                                                    <div class="tb-course">
                                                                        <div>
                                                                            <div class="tb-unit-title">
                                                                                <div>
                                                                                    <label for="">Title</label>
                                                                                </div>
                                                                                <div class="td-form-item">
                                                                                    <div class="form-textarea-wrapper">
                                                                                        <textarea style="height: 40px;" rows="1" required="" name='questionTitle'  id='questionTitle${i}'></textarea>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="tb-desc">
                                                                                <div>
                                                                                    <label for="">Instruction</label>
                                                                                </div>
                                                                                <div class="td-form-item">
                                                                                    <div class="form-textarea-wrapper" >
                                                                                        <textarea name="instruction"  id='ques-instruc${i}' ></textarea>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div id='createOption${i}'>
                                                                                <div id='question${i}_option${o}' class="innerQuestion${i}">
                                                                                    <div>
                                                                                        <div>
                                                                                            <label for="option">Option </label> <span><p class="optionnumber${i}"> 1</p></span></label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="td-form-item" >
                                                                                        <div class="form-item-wrap">
                                                                                            <div class="form-textarea-wrapper form-item">
                                                                                                <textarea style="height: 60px; padding-top: 5px;" required="" name="option" id="answer" class="option-content${i}"></textarea>
                                                                                            </div>
                                                                                            <div class="form-item form-checkbox checkbox-style">
                                                                                                <input type="checkbox" id='que${i}_option${o}' name="right_option${i}" class="right_option${i}" value="ON" >
                                                                                                <label for="que${i}_option${o}">
                                                                                                    <i style="width:30px;height: 30px; margin-top: 15px;" class="icon-checkbox icon md-check-1"></i>
                                                                                                </label>
                                                                                            </div>
                                                                                            <div class="course-region-tool">
                                                                                                <button style="width:30px;height: 30px;font-size: 30px; margin-top: 12px;" class="delete" type="button" onclick="removeOption('question${i}_option${o}')" id='removeinnerQuestion${i}' title="delete"><i class="icon md-recycle"></i></button>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div>
                                                                                <div>

                                                                                </div>
                                                                                <div>
                                                                                    <div class="btn-add">
                                                                                        <button type="button" onclick="addOption('createOption${i}')" >
                                                                                            <i class="icon md-plus"></i>
                                                                                            Add Option
                                                                                        </button>
                                                                                    </div> 
                                                                                </div>
                                                                                <div class="form-item form-checkbox checkbox-style" style="margin-top: 10px;">
                                                                                                <input type="checkbox" checked id='randomOption${i}' name="randomOption${i}" class="randomOption1" value="on">
                                                                                                <label for="randomOption${i}">
                                                                                                    <i style="width: 18px; height: 18px; font-size: 16px;" class="icon-checkbox icon md-check-1"></i>Random Option Position?
                                                                                                </label>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                </div>
    
                                                            </div>`;
    $(`#createQuestion`).append(html);
}

$(document).on('click', '#getAll', function getAll(event) {
    var arr = new Array();
    var j = 0;
    var k = 1;
    for (k = 1; k <= i; k++) {
        if (!!document.getElementById("questionTitle" + k) === true) {
            arr[j] = k;
            j++;
            console.log(k);
        } else {
            continue;
        }
    }

    console.log("Number of questions : " + arr.length);
    var listQuestion = new Array();
    var listOption = new Array();
    for (var n = 0; n < arr.length; n++) {
//        console.log(" question : " + arr[n]);
        var question = new Object();
        question.questionID = n + 1;
        if (document.getElementById("questionTitle" + arr[n]).value === '') {
            continue;
        }
        
        question.questionTitle = document.getElementById("questionTitle" + arr[n]).value;
        question.questionInstruction = document.getElementById("ques-instruc" + arr[n]).value;
        question.questionRandom = document.getElementById("randomOption" + arr[n]).checked;
        listQuestion.push(question);
    }

    var check = 'T';
    for (var n = 0; n < arr.length; n++) {
        var questionNumber = "innerQuestion" + arr[n];
        var countCheckbox = 0;
        for (var m = 0; m < document.getElementsByClassName(questionNumber).length; m++) {

            classRightOption = "right_option" + arr[n];
            classOptionContent = "option-content" + arr[n];

            var option = new Object();
            option.questionID = n + 1;
            option.optionID = m + 1;
            option.checkbox = document.getElementsByClassName(classRightOption)[m].checked;
            option.optionDescription = document.getElementsByClassName(classOptionContent)[m].value;
            listOption.push(option);
        }
        for (var m = 0; m < document.getElementsByClassName(questionNumber).length; m++) {
            if (document.getElementsByClassName(classRightOption)[m].checked) {
                countCheckbox++;
            }
        }
        if (countCheckbox === 0) {
            check = 'F';
        }
    }
    if (arr.length === 0) {
        alert('At least one question is created.');
        event.preventDefault();
    } else if (check === 'F') {
        alert('At least one option in a question is true.');
        event.preventDefault();
    }


    var questionList = JSON.stringify(listQuestion, null, '@@@##@@@');
    var optionList = JSON.stringify(listOption, null, '@@@##@@@');
    document.getElementById("HiddenInput").value += questionList;
    document.getElementById("HiddenInputOption").value += optionList;


}
);   