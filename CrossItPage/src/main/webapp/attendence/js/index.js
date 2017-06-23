//this function was provided by Udacity! You can find their GitHub repo here: https://github.com/udacity/ud989-school-attendance

(function() {
  if (!localStorage.attendance) {
    console.log('Creating attendance records...');
    function getRandom() {
      return (Math.random() >= 0.5);
    }

    var nameColumns = $('tbody .name-col'),
    attendance = {};

    nameColumns.each(function() {
      var name = this.innerText;
      attendance[name] = [];

      for (var i = 0; i <= 11; i++) {
        attendance[name].push(getRandom());
      }
    });

    localStorage.attendance = JSON.stringify(attendance);
  }
}());
//end of Udacity-provided function

//my code
$(function(){
  var model = {
      attendanceArray: [
      {
        name : '이진용',
        daysMissed : 12,
        id: '이진용'
      },
      {
        name : '구동림',
        daysMissed : 12,
        id: '구동림'
      },
      {
        name : '김성재',
        daysMissed : 12,
        id: '김성재'
      },
      {
        name : '김재석',
        daysMissed : 12,
        id: '김재석'
      },
      {
        name : '김지영',
        daysMissed : 12,
        id: '김지영'
      },
      {
        name : '김진우',
        daysMissed : 12,
        id: '김진우'
      },
      {
        name : '동인',
        daysMissed : 12,
        id: '동인'
      },
      {
        name : '박재현',
        daysMissed : 12,
        id: '박재현'
      },
      {
        name : '스리',
        daysMissed : 12,
        id: '스리'
      },
      {
        name : '신윤희',
        daysMissed : 12,
        id: '신윤희'
      },
      {
        name : '오혜은',
        daysMissed : 12,
        id: '오혜은'
      },
      {
        name : '우영',
        daysMissed : 12,
        id: '우영'
      },
      {
        name : '유인준',
        daysMissed : 12,
        id: '유인준'
      },
      {
        name : '유태양',
        daysMissed : 12,
        id: '유태양'
      },
      {
        name : '윤준일',
        daysMissed : 12,
        id: '윤준일'
      },
      {
        name : '이동건',
        daysMissed : 12,
        id: '이동건'
      },
      {
        name : '이승태',
        daysMissed : 12,
        id: '이승태'
      },
      {
        name : '이현빈',
        daysMissed : 12,
        id: '이현빈'
      },
      {
        name : '장철운',
        daysMissed : 12,
        id: '장철운'
      },
      {
        name : '최영준',
        daysMissed : 12,
        id: '최영준'
      },
      {
        name : '최은영',
        daysMissed : 12,
        id: '최은영'
      },
      {
        name : '화영',
        daysMissed : 12,
        id: '화영'
      },
      {
        name : '한솔',
        daysMissed : 12,
        id: '한솔'
      },
        {
        name : '한혜수',
        daysMissed : 12,
        id: '한혜수'
      },
      {
        name : '여경',
        daysMissed : 12,
        id: '여경'
      },
      ]
    };


var octopus = {
  init: function() {
    view.init(model.attendanceArray);
    view.initChecks();
  },

  updateAttendance: function(studentId, daysAttended) {
    // get student obj by student id
    var updatedRecord = $.grep(model.attendanceArray, function(e, i) {  
      if (e.id === studentId){
        //get index of record
        model.attendanceArray[i].daysAttended = daysAttended;
        return true;
      }
    });    
    view.updateRecords(updatedRecord[0]);    
  }
};

var view = {
  init: function(data) { 
    var tbody$ = $('tbody');
    data.forEach(function(data) {
      var noSpaceName = data.name.replace(/ /g,'');
      //create row that will house student records
      tRow = $('<tr />', { class: 'student ', id: noSpaceName}).prependTo(tbody$);
      //add student name
      $('<td />', { html: data.name, 'class': 'name-col'}).prependTo(tRow);
      //add checkboxes
      var i = 0;
      for (i; i < data.daysMissed; i++) {
        $('<td />', { html: '<input type="checkbox" class=' + noSpaceName + ' />', 'class': 'attend-col'}).appendTo(tRow);
      }   
      //add missed days   
      $('<td />', { html: data.daysMissed, 'class': 'missed-col'}).appendTo(tRow);
    });
  },

  initChecks: function(){
    var chckBoxArr = [];
    var cks = $(':checkbox');
    var chckBoxes = $(cks).each(function(i) {
      chckBoxArr.push( $(this) );
    });

    for (var i = 0; i < chckBoxArr.length; i++){
      chckBox = chckBoxArr[i];
      chckBox.on('click', (function(chckCopy) {              
          return function() {
            view.countAttendance(chckCopy);
          };
      })(chckBox));
    }
  },

  countAttendance: function(recordToCheck){
    var studentName = recordToCheck[0].getAttribute('class');
    //future update: change to data attr
    //loop through the parents to find matching record
    $('.student').each(function(){
      var this$ = $(this);
      var numOfDays;
      if ( this$.attr('id') === studentName ) {
      //loop through checkboxes to get checked
        this$.find('.attend-col :checked').each(function(i){
          //+1 to account for zero
         numOfDays = (i+1);
        });

        if (numOfDays === undefined || null){
          octopus.updateAttendance(studentName, 0);

        } else {
          octopus.updateAttendance(studentName, numOfDays);
        }
      }
    });
  },

  updateRecords: function(recordToUpdate){
    var id = recordToUpdate.id;
    var missed = recordToUpdate.daysMissed;
    var daysAttended = recordToUpdate.daysAttended;

    $('#' + id).find('.missed-col').html(missed-daysAttended); 
  }
};

octopus.init();
});