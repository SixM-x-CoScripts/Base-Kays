var UIActive = false;
var opened = null;
var currentElement = null;
var acceptedCall = '';
var job = '';
var ustatus = null;
var firstname = '';
var lastname = '';
var id = 0;
var callsigns = null;
var jobInfo = [];
var audioPlayer = null;



function playSound(file){
  if (audioPlayer != null) {
	audioPlayer.pause();
  }

  audioPlayer = new Audio("../sounds/" + file + ".ogg");
  audioPlayer.volume = 0.1;
  var didPlayPromise = audioPlayer.play();

  if (didPlayPromise === undefined) {
	audioPlayer = null; //The audio player crashed. Reset it so it doesn't crash the next sound.
  } else {
	didPlayPromise.then(_ => { //This does not execute until the audio is playing.
	}).catch(error => {
	  audioPlayer = null; //The audio player crashed. Reset it so it doesn't crash the next sound.
	})
  }
}

function sendCall(id, call, cool) {

  if (call.type == 'call') {

    var base = '    <div class="rgba-background clearfix colelem alert  call scale-up-right" id="call_' + id + '" data-x="' + call.coords[0] + '" data-y="' + call.coords[1] + '" data-z="' + call.coords[2] + '"><!-- column -->' +
      '     <div class="clearfix colelem" id="pu1231-4"><!-- group -->' +
      '      <div class="rounded-corners clearfix grpelem" id="u1447-4"><!-- content -->' +
      '       <p id="u1231-2">#' + id + '</p>' +
      '      </div>' +
      '      <div class="rounded-corners clearfix grpelem" id="u1233-4"><!-- content -->' +
      '       <p id="u1233-2">' + call.code + '</p>' +
      '      </div>' +
      '      <div class="clearfix grpelem" id="u1230-4"><!-- content -->' +
      '       <p>' + call.title + '</p>' +
      '      </div>' +
      '     </div>' +

      '<div class="infostore">';

    for (i = 0; i < Object.keys(call.extraInfo).length; i++) {
      base = base + '     <div class="clearfix colelem" id="pu1235"><!-- group -->' +
        '      <div class="grpelem" id="u1235"><i class="fas ' + call.extraInfo[i].icon + '"></i><!-- simple frame --></div>' +
        '      <div class="clearfix grpelem" id="u1236-4"><!-- content -->' +
        '       <p>' + String(call.extraInfo[i].info).toUpperCase() + '</p>' +
        '      </div>' +
        '      </div>';
    }


    base = base + '</div>' +


      '      <div class="clearfix grpelem" id="u4538-4"><!-- content -->' +
      '       <p>Appel pris par :</p>' +


      '<div id="u4538-7">';
    for (i = 0; i < Object.keys(call.respondingUnits).length; i++) {
      base = base + '<div class="unit ' + call.respondingUnits[i].type + '">' +getCallSign( call.respondingUnits[i].unit)+ '</div>';
    }

    base = base + '</div>' +
      '      </div>' +

      '    </div>';


    $(base).appendTo("#pu392");

    setTimeout(function () {

      if (!UIActive) {
        $("#call_" + id).fadeOut();
         setTimeout(function () {
          $("#call_" + id).remove();
         }, 2000);
      }
    }, cool);

    playSound('alertaudio');

  }
  else if (call.type == 'message') {


    var base = '<div class="rgba-background clearfix colelem alert scale-up-right message" id="call_' + id + '" data-phone="' + call.phone + '" data-caller="' + call.caller + '" data-x="' + call.coords[0] + '" data-y="' + call.coords[1] + '" data-z="' + call.coords[2] + '"><!-- column -->' +

      '      <div class="rounded-corners clearfix grpelem" id="u1447-4"><!-- content -->' +
      '       <p id="u1447-2">#' + id + '</p>' +
      '      </div>' +
      '      <div class="rounded-corners clearfix grpelem" id="u1449-4"><!-- content -->' +
      '       <p id="u1449-2">20-20</p>' +
      '      </div>' +
      '      <div class="clearfix grpelem" id="u1446-4"><!-- content -->' +
      '       <p>Recieving a message</p>' +
      '      </div>' +

      '     <div class="rgba-background rounded-corners clearfix colelem" id="u1486-4"><!-- content -->' +
      '      <p id="u1486-2">' + call.message + '</p>' +
      '     </div>' +

      '     <div class="clearfix colelem" id="u1450-4"><!-- content -->' +
      '      <p>' + call.phone + '</p>' +
      '     </div>' +

      '      <div  id="u4538-4"><!-- content -->' +
      '       <p>Appel pris par : </p>' +


      '<div id="u4538-7">';
    for (i = 0; i < Object.keys(call.respondingUnits).length; i++) {
      base = base + '<div class="unit ' + jobInfo[call.respondingUnits[i].type].color + '" id="unit_' + call.respondingUnits[i].unit + '">' + getCallSign( call.respondingUnits[i].unit) + '</div>';
    }

    base = base + '</div>' +
      '      </div>' +

      '   </div>';


    $(base).appendTo("#pu392");

    setTimeout(function () {
     if (!UIActive) {
        $("#call_" + id).fadeOut();
         setTimeout(function () {
          $("#call_" + id).remove();
         }, 2000);
      }
    }, cool);

    playSound('alertaudio');

  }

}


function populateCalls(calls) {
  for (const [key, value] of Object.entries(calls)) {

    if (value != null) {

      for (i = 0; i < Object.keys(value.job).length; i++) {

        if (value.job[i] == job) {

          if (value.type == "call") {

            if (!$('#call_' + value.id).length) {

              var base = '    <div class="rgba-background clearfix colelem alert call scale-up-right" id="call_' + value.id + '" data-x="' + value.coords[0] + '" data-y="' + value.coords[1] + '" data-z="' + value.coords[2] + '"><!-- column -->' +
                '     <div class="clearfix colelem" id="pu1231-4"><!-- group -->' +
                '      <div class="rounded-corners clearfix grpelem" id="u1447-4"><!-- content -->' +
                '       <p id="u1231-2">#' + value.id + '</p>' +
                '      </div>' +
                '      <div class="rounded-corners clearfix grpelem" id="u1233-4"><!-- content -->' +
                '       <p id="u1233-2">' + value.code + '</p>' +
                '      </div>' +
                '      <div class="clearfix grpelem" id="u1230-4"><!-- content -->' +
                '       <p>' + value.title + '</p>' +
                '      </div>' +
                '     </div>' +

                '<div class="infostore">';

              for (i = 0; i < Object.keys(value.extraInfo).length; i++) {
                base = base + '     <div class="clearfix colelem" id="pu1235"><!-- group -->' +
                  '      <div class="grpelem" id="u1235"><i class="fas ' + value.extraInfo[i].icon + '"></i><!-- simple frame --></div>' +
                  '      <div class="clearfix grpelem" id="u1236-4"><!-- content -->' +
                  '       <p>' + String(value.extraInfo[i].info).toUpperCase() + '</p>' +
                  '      </div>' +
                  '      </div>';
              }


              base = base + '</div>' +


                '      <div class="clearfix grpelem" id="u4538-4"><!-- content -->' +
                '       <p>Appel pris par : </p>' +


                '<div id="u4538-7">';
              for (i = 0; i < Object.keys(value.respondingUnits).length; i++) {
                base = base + '<div class="unit ' + jobInfo[value.respondingUnits[i].type].color + '" id="unit_' + value.respondingUnits[i].unit + '">' +getCallSign( value.respondingUnits[i].unit) + '</div>';
              }

              base = base + '</div>' +
                '      </div>' +


                '    </div>';


              $("#pu392").append(base);


            }


          }
          else if (value.type == "message") {


            if (!$('#call_' + value.id).length) {


              var base = '<div class="rgba-background clearfix colelem alert scale-up-right message" id="call_' + value.id + '" data-phone="' + value.phone + '" data-caller="' + value.caller + '" data-x="' + value.coords[0] + '" data-y="' + value.coords[1] + '" data-z="' + value.coords[2] + '"><!-- column -->' +

                '      <div class="rounded-corners clearfix grpelem" id="u1447-4"><!-- content -->' +
                '       <p id="u1447-2">#' + value.id + '</p>' +
                '      </div>' +
                '      <div class="rounded-corners clearfix grpelem" id="u1449-4"><!-- content -->' +
                '       <p id="u1449-2">20-20</p>' +
                '      </div>' +
                '      <div class="clearfix grpelem" id="u1446-4"><!-- content -->' +
                '       <p>Recieving a message</p>' +
                '      </div>' +

                '     <div class="rgba-background rounded-corners clearfix colelem" id="u1486-4"><!-- content -->' +
                '      <p id="u1486-2">' + value.message + '</p>' +
                '     </div>' +

                '     <div class="clearfix colelem" id="u1450-4"><!-- content -->' +
                '      <p">' + value.phone + '</p>' +
                '     </div>' +

                '      <div  id="u4538-4"><!-- content -->' +
                '       <p>Appel pris par : </p>' +


                '<div id="u4538-7">';
              for (i = 0; i < Object.keys(value.respondingUnits).length; i++) {
                base = base + '<div class="unit ' + jobInfo[value.respondingUnits[i].type].color + '" id="unit_' + value.respondingUnits[i].unit + '">' + getCallSign( value.respondingUnits[i].unit) + '</div>';
              }

              base = base + '</div>' +
                '      </div>' +

                '   </div>';

              $("#pu392").append(base);


            }
          }
        }
      }

    }

  }

  if (acceptedCall != '') {
    $(document).find('.alert').css('opacity', '0.5');
    $("#" + acceptedCall).css('opacity', '1.0');
  }

}

function changeCallsign(t) {

  var text = $(t).parent().find("#inputin").val();

   $.post('https://kay_dispatch/changecallsign', JSON.stringify({callsign: text}));
     closeMenu();

}

function openCallsigns() {


        var base =  '<div id="darken" ></div>' + '<div id="input">' +


        
        '<div id="inputfield" class="slide-left">' +

'        <p id="inputtext">Numéro de patrouille</p>'+
'<i class="fas fa-id-badge fa-lg" id="inputdollar"></i>' +
'<input type="text" id="inputin" placeholder="0"></input>' +
'     <button class="rounded-corners  grpelem ripple" onclick="changeCallsign(this)" id="u673-5"><!-- content -->'+
'      <p id="u673-2">Confirmée</p>'+
'     </button>'+
        
        '</div>' +
        '</div>';

        $("#activeunits").append(base);


}

function populateUnits(units) {
  var location = '';
  var unitinfo = '';
  var unitstatus = '';
  var unitstatuslabel = '';

  for (const [key, value] of Object.entries(units)) {

      var base = '';
      //console.log(value.job)

      if (jobInfo[value.job] != null) {

        if (jobInfo[value.job].column == 1) {
          location = '#u1129';
          //unitinfo = jobInfo[value.job].color;
        }
        if (jobInfo[value.job].column == 2) {
          location = '#u1162';
          //unitinfo = jobInfo[value.job].color;
        }
        if (jobInfo[value.job].column == 3) {
          location = '#u1195';
          //unitinfo = jobInfo[value.job].color;
        }

        base = base + '<div class="rounded-corners unitgroup" id="u1408">' +
          '<i class="fas ' + value.type + ' vehiclesign"></i>' +
          '<div class="unitgrid">';

        for (i = 0; i < Object.keys(value.units).length; i++) {

       

          if (ustatus[String(value.units[i].id) ] != null) {

            unitstatus = ustatus[String(value.units[i].id) ];
            unitstatuslabel = ustatus[String(value.units[i].id) ];
          }
          else {
            unitstatuslabel = 'Patrouille';
          }
          //console.log(value.units[i].job)
          unitinfo = jobInfo[value.units[i].job].color;

          base = base + '<div class="unit tooltip ' + unitinfo + ' ' + unitstatus + '">' + getCallSign(value.units[i].id) +
            '<div class="tooltiptext">' + value.units[i].name + ' - ' + unitstatuslabel + '</div>' +
            '</div>';
        }

        base = base + '</div>' +
          '</div>';

        $(location).append(base);
    }
  }
}

function getCallSign(id) {
  if (callsigns[id -1] != null) {
    return String(callsigns[id-1].toUpperCase());
  } 
  return id;
}

function OpenBase() {
  
  var base = '   <div class="clearfix grpelem " id="pu1129"><!-- group -->' +


    '<div class="rgba-background status " id="u1489"><!-- simple frame -->' +
    '   <div class="rounded-corners" id="u1490"><!-- simple frame --></div>' +
    '   <div class="clearfix" id="u1495-4"><!-- content -->' +
    '    <p>' + firstname.toUpperCase() + ' ' + lastname.toUpperCase() + '</p>' +
    '   </div>' +
    '   <div class="rounded-corners clearfix" onclick="openCallsigns()" id="u1498-4"><!-- content -->' +
    '    <p id="u1498-2">' + getCallSign(id) + '</p>' +
    '   </div>' +
    '   <div id="u1501" onclick="toggleOffduty()"><i class="fas fa-power-off fa-lg"></i></div>' +
    '   <div id="u1504" onclick="togglecallblips()"><i class="fas fa-map-marked fa-lg"></i></div>' +
    '   <div id="u1507" onclick ="toggleAlerts()"><i class="fas fa-bell-slash fa-lg"></i></div>' +
    '   <div id="u1513" onclick ="toggleUnitBlips()"><i class="fas fa-car fa-lg"></i><!-- simple frame --></div>' +
    '   <div class="rounded-corners clearfix" id="u1516-4"><!-- content -->' +
    '    <p id="u1516-2">' + jobInfo[job].label.toUpperCase() + '</p>' +
    '   </div></div>' +
    '    <div class="rgba-background column" data-column="1" id="u1129"><!-- simple frame -->' +
    '<div style="margin-bottom: 40px;"></div>' +


    '</div>' +
    '    <div class="rounded-corners" id="u1132"><!-- simple frame --></div>' +
    '    <div class="clearfix" id="u1135-4"><!-- content -->' +
    '     <p>SASP SUD</p>' +

    '    </div>' +


    '   <div class="clearfix grpelem" id="pu1162"><!-- group -->' +
    '    <div class="rgba-background column" data-column="2" id="u1162"><!-- simple frame -->' +
    '<div style="margin-bottom: 40px;"></div>' +


    '</div>' +
    '</div>' +


    '</div>' +
    '    <div class="rounded-corners" id="u1163"><!-- simple frame --></div>' +
    '    <div class="clearfix" id="u1164-4"><!-- content -->' +
    '     <p>SAMS</p>' +
    '    </div>' +


    '    <div class="rgba-background column" data-column="3" id="u1195">' +
    '<div style="margin-bottom: 40px;"></div>' +


    '</div>' +
    '</div>' +

    '</div>' +
    '    <div class="rounded-corners" id="u1196"><!-- simple frame --></div>' +
    '    <div class="clearfix" id="u1197-4"><!-- content -->' +
    '     <p>TOWING</p>' +
    '    </div>' +


    '   </div>';


  $("#activeunits").html(base);

}

function closeMenu() {
  $.post('https://kay_dispatch/close', JSON.stringify({}));

   

    $("#pu392").fadeOut("slow", function () {
      $("#pu392").html("").fadeIn();
    });
    $("#activeunits").fadeOut("slow", function () {

      $("#activeunits").html("").fadeIn();
    });
    UIActive = false;

   
    $("#dropdown").remove();
}

$(document).keyup(function (e) {
  if (e.keyCode === 27) {

    closeMenu();

  }


});


window.onclick = function (event) {

  var element = null;

  playSound('clickaudio') 

  if ($(event.target).parents('.alert').length) {
    element = $(event.target).parents('.alert')[0];

  }
  else if ($(event.target).hasClass("alert")) {

    element = event.target;
  }


  if (element != null) {

    if ($(element).hasClass('call')) {
      if (element.style.height != '150px') {

        $(element).animate({
            height: 150
          },
          300, 'swing');


      }
      else {
        $(element).animate({
            height: 60
          },
          300, 'swing');
      }
    }
    else {

      if (element.style.height != '150px') {

        $(element).animate({
            height: 150
          },
          300, 'swing');


      }
      else {
        $(element).animate({
            height: 80
          },
          300, 'swing');
      }

    }

  }


  if (opened != null) {
    opened.style.display = "none";
    opened.remove();
    opened = null;
  }

}


function forwardCall(num) {


  for (const [key, value] of Object.entries(jobInfo)) {
    if (value.column == num) {
      $.post('https://kay_dispatch/forwardCall', JSON.stringify({
        id: currentElement.id,
        job: key
      }));
    }
  }


}

function copyNumber() {

  const el = document.createElement('textarea');
  el.value = currentElement.dataset.phone;
  document.body.append(el);
  el.select();
  document.execCommand("copy");
  document.body.removeChild(el);
  $.post('https://kay_dispatch/copynumber', JSON.stringify({}));
}

function toggleOffduty() {

  $.post('https://kay_dispatch/toggleoffduty', JSON.stringify({}));

}

function togglecallblips() {
  $.post('https://kay_dispatch/togglecallblips', JSON.stringify({}));
}

function toggleUnitBlips() {
  $.post('https://kay_dispatch/toggleunitblips', JSON.stringify({}));
}

function toggleAlerts() {

  $.post('https://kay_dispatch/togglealerts', JSON.stringify({}));

}

function changeToBusy() {
  $.post('https://kay_dispatch/updatestatus', JSON.stringify({
    id: id,
    status: 'Occupé'
  }));
}

function changeToPatrol() {
  $.post('https://kay_dispatch/updatestatus', JSON.stringify({
    id: id,
    status: null
  }));
}

function dismissCall() {
  $(document).find('.alert').css('opacity', '1.0');
  acceptedCall = '';
  $.post('https://kay_dispatch/dismissCall', JSON.stringify({
    id: currentElement.id
  }));

  $(currentElement).find("#unit_" + id).remove();

  $.post('https://kay_dispatch/updatestatus', JSON.stringify({
    id: id,
    status: null
  }));
}

function removeCall() {
  //$(currentElement).fadeOut();
  $.post('https://kay_dispatch/removeCall', JSON.stringify({
    id: currentElement.id
  }));
}

function removeCallClient() {
  $(currentElement).fadeOut();
}

function acceptCall() {
  $(document).find('.alert').css('opacity', '0.5');
  $(currentElement).css('opacity', '1.0');
  $.post('https://kay_dispatch/acceptCall', JSON.stringify({
    id: currentElement.id,
    x: currentElement.dataset.x,
    y: currentElement.dataset.y,
    z: currentElement.dataset.z
  }));
}

function acceptCallClient(unit) {
  acceptedCall = currentElement.id;

  $(currentElement).find("#u4538-7").append('<div class="unit ' + jobInfo[job].color + '" id="unit_' + unit + '">' + getCallSign(unit) + '</div>');

  $.post('https://kay_dispatch/sendnotice', JSON.stringify({
    caller: currentElement.dataset.caller
  }));
  $.post('https://kay_dispatch/updatestatus', JSON.stringify({
    id: unit,
    status: 'Reacting'
  }));
}

function requestBackup() {

  var col = currentElement.dataset.column;


  for (const [key, value] of Object.entries(jobInfo)) {
    if (value.column == col) {
      $.post('https://kay_dispatch/reqbackup', JSON.stringify({
        job: key,
        requester: jobInfo[job].label,
        firstname: firstname,
        lastname: lastname
      }));
    }
  }
}


window.oncontextmenu = function (event) {
  if (opened != null) {
    opened.style.display = "none";
    opened.remove();
    opened = null;
  }

  var columnMenu = false
  var statusMenu = false
  var element = null;

  if ($(event.target).parents('.column').length) {
    element = $(event.target).parents('.column')[0];
    columnMenu = true;
  }
  else if ($(event.target).hasClass("column")) {

    element = event.target;
    columnMenu = true;
  }

  if ($(event.target).parents('.status').length) {
    element = $(event.target).parents('.status')[0];
    statusMenu = true;
  }
  else if ($(event.target).hasClass("status")) {

    element = event.target;
    statusMenu = true;
  }

  if ($(event.target).parents('.alert').length) {
    element = $(event.target).parents('.alert')[0];

  }
  else if ($(event.target).hasClass("alert")) {

    element = event.target;
  }

  if (element != null) {

    currentElement = element;

    var html = '<div id="dropdown" class="dropdown-content">';


    if (columnMenu) {

      var col = currentElement.dataset.column;

      if (jobInfo[job].canRequestLocalBackup && col == jobInfo[job].column) {
        html = html + '    <a onclick="requestBackup()">Démander une backup</a>';
      }
      if (jobInfo[job].canRequestOtherJobBackup && col != jobInfo[job].column) {
        html = html + '    <a onclick="requestBackup()">Démander une backup</a>';
      }


    }
    else if (statusMenu) {

      html = html + '    <a onclick="changeToBusy()">être en occupé</a>';
      html = html + '    <a onclick="changeToPatrol()">être en patrouille</a>';


    }
    else {
      if (acceptedCall == '') {
        html = html + '    <a onclick="acceptCall()">Accepté l\'appel</a>';
        if (jobInfo[job].canRemoveCall) {
          html = html + '    <a onclick="removeCall()">Retirer l\'appel</a>';
        }
        if ($(element).hasClass('message')) {
          html = html + '    <a onclick="copyNumber()">Numéro de copie</a>';
        }

      }

      if (acceptedCall != '' && acceptedCall == $(element).attr('id')) {
        html = html + '    <a onclick="dismissCall()">Rejeter l\'appel</a>';
      }


      for (const [key, value] of Object.entries(jobInfo)) {
        if (key != job && jobInfo[job].forwardCall) {
          html = html + '    <a onclick="forwardCall(' + value.column + ')">Transférer au ' + value.label + '</a>';
        }
      }


    }


    html = html + '  </div>';

    $("#page").append(html);

    var dropdown = document.getElementById("dropdown");
    dropdown.style.display = "block";

    var rect = element.getBoundingClientRect();

    if (columnMenu) {
      dropdown.style.top = rect.top;
    }
    else {
      dropdown.style.top = rect.top + (rect.bottom - rect.top);
    }

    dropdown.style.right = screen.width - rect.right;
    dropdown.classList.add("active");


    opened = dropdown;

  }


}


window.addEventListener('message', function (event) {

  var edata = event.data;

  if (edata.type == "Init") {

    firstname = edata.firstname;
    lastname = edata.lastname;
    jobInfo = edata.jobInfo;

  }
  if (edata.type == "call") {
    sendCall(edata.id, edata.call, edata.cooldown);
  }
  if (edata.type == "open") {

    UIActive = true;
    job = edata.job;
    id = edata.id;

    ustatus = edata.ustatus;
    callsigns = edata.callsigns;

    OpenBase();
    populateUnits(edata.units)
    populateCalls(edata.calls)
  }
  if (edata.type == "remove") {
    removeCallClient(edata.id);
  }

  if (edata.type == "accept") {
    acceptCallClient(edata.id);
  }

  $("#u392").click(function () {

    document.getElementById("myDropdown").classList.toggle("show");
  });


});