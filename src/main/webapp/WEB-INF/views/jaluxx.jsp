<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="jaluxx.css">
	</head>
	
	<body>
		<div id="screen">
		
			<div id="banner">
			JALUXX
			</div>
			
			<div id="selectPlayersPanel">
				<div id="selectPlayersBanner">
				Opposing Players
				</div>
				<div id="selectPlayersContent">
					<c:forEach var="player" items="${me.game.players}">
						<c:if test="${player != me}">
							<span class="playerName">
								<c:out value="${player.name}" />
							</span>
							<br>
						</c:if>
					</c:forEach>
				</div>
			</div>
			
			<div id="oppositionPanel">
				<div id="oppositionScroll">
					<div id="oppositionContent">
					</div>
				</div>
			</div>

			<div id="tickerTapePanel">
				<div id="tickerTapeScroll">
					<div id="tickerTapeContent">
					</div>
				</div>
			</div>

			<div id="gamePanel">
				<div id="gameScroll">
					<div id="gameContent">
					</div>
				</div>
			</div>
			
			<div id="myPanel">
				<div id="myScroll">
					<div id="myContent">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
