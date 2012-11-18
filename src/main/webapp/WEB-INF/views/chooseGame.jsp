<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="chooseGame.css">
<link rel="stylesheet" type="text/css" href="jquery-ui-1.9.1.custom.css" />

<script src="jquery-1.8.2.js"></script>
<script src="jquery-ui-1.9.1.custom.min.js"></script>
<script src="chooseGame.js"></script>
</head>

<body>
	<div id="login-dialog" title="Login to Jaluxx">
		<p class="validateTips">Please enter your name and a password</p>
		<span id="loginError"></span>
		<form:form id="login-form" method="post" action="login.html"
			modelAttribute="player">
			<fieldset>
				<label for="name">Name</label>
				<form:input type="text" path="name" name="name" id="name"
					class="text ui-widget-content ui-corner-all" />
				<label for="password">Password</label>
				<form:input type="password" path="password" name="password"
					id="password" value="" class="text ui-widget-content ui-corner-all" />
			</fieldset>
		</form:form>
	</div>

	<div id="container" class="ui-widget">

		<div id="banner">JALUXX</div>

		<div id="tickerTape">
			<c:forEach var="action" items="${actions}">
				<c:out value="${action}" />
				<br>
				<br>
			</c:forEach>
		</div>

		<div id="gamesBanner">
			Games
			<c:if test="${not empty me.name && empty me.game}">
				<button id="startNewGameButton" type="submit" value="Submit">Start New Game</button>
			</c:if>
		</div>

		<div id="gamesList">
			<c:forEach var="game" items="${games}">
				<div class="gamePanel">
					<div class="gamePanelLeft">
					Jaluxx
					<c:out value="${game.playing ? ' (Playing)' : ' (Not Started)'}"/>
					<br>
					
					<c:forEach var="player" items="${game.players}">
						<span class="playerName">
						<c:out value="${player.name}" /> <c:out value="${player.status.status == 'Ready To Play' ? ' (Ready)' : ' (Joined)'}"/>
						<c:if test="${player == me}"> (ME)</c:if>
						</span>
						<br>
					</c:forEach>
					
					</div>
				
					
					<div class="gamePanelRight">
					<c:if test="${not empty me.name && empty me.game && me.status.status == 'Not In Game'}">
						<button id="${game.gameId}" class="joinGameButton" type="submit" value="Submit">Join Game</button>
					</c:if>
					<c:if test="${not empty me.name && not empty me.game && me.game == game && me.status.status == 'Joined Game'}">
						<button class="readyToPlayButton" type="submit" value="Submit">Ready To Play</button>
					</c:if>
					</div>
				</div>
			</c:forEach>
		</div>

		<div id="playersBanner">
			Players Logged-in

			<c:if test="${empty me.name}">
				<button id="loginButton" type="submit" value="Submit">Log
					In</button>
			</c:if>

		</div>

		<div id="playersList">
			<c:forEach var="player" items="${registeredPlayers}">
				<c:if test="${empty player.value.game}">
					<c:out value="${player.key}" />
					<c:if test="${player.value == me}"> (ME)</c:if>
					<br>
				</c:if>
			</c:forEach>
		</div>

	</div>

<span id="indexStart" style="display:none"><c:out value="${actions.size()-1}"/></span>
</body>
</html>
