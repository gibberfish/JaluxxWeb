var lastIndex = -1;

$(function(){
	lastIndex = $("#indexStart").text();
	
	timer = setTimeout ("pageRefresh()", 3000);
	
	$( "#loginButton" )
     .button()
     .click(function() {
         $( "#login-dialog" ).dialog( "open" );
    });
	
	$( "#startNewGameButton" )
     .button()
     .click(function() {
			$.get('newGame.html',
				      function(data) {
					  });

    });

	$( ".joinGameButton" ).each (function (index) {
		$(this)
		.button()
		.click(function() {
			$.get('joinGame.html',
					{ gameId : $(this).attr('id') },
					function(data) {
					});
		});
	});
	
	$( ".readyToPlayButton" ).each (function (index) {
		$(this)
		.button()
		.click(function() {
			$.get('readyToPlay.html',
					function(data) {
					});
		});
	});
	
	$( "#login-dialog" ).dialog({
        autoOpen: false,
        height: 240,
        width: 320,
        modal: true,
        buttons: {
            "Register": function() {
            	$.post("login.html",
            	$('#login-form').serialize(),
       			function (data, status) {
       				if (data == 'OK') {
       					window.location.reload();
       				} else {
       					$("#loginError").text(data);
       				}
       			});
            },
            Cancel: function() {
                $( this ).dialog( "close" );
            }
        },
        close: function() {
            allFields.val( "" ).removeClass( "ui-state-error" );
        }
	});
	
});

function pageRefresh() {
	if ($("#login-dialog").is(":hidden")) {
		
		$.get('pollGameMgr.html',
			  { lastIndex : lastIndex },
		      function(data) {
				  if (data > lastIndex) {
					  lastIndex = data;
 					  window.location.reload();
 				  }
			  });
		
		timer = setTimeout ("pageRefresh()", 3000);
	}
}