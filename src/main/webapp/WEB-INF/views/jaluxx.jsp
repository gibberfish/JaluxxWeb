<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="jquery-ui-1.9.1.custom.css">
		<link rel="stylesheet" type="text/css" href="jaluxx.css">	
		<script src="jquery-1.8.2.js"></script>
		<script src="jquery-ui-1.9.1.custom.min.js"></script>
		<script src="jaluxx.js"></script>
	</head>
	
	<body>
		<div id="screen">
		
			<div id="banner">
			JALUXX
			</div>
			
			<div id="oppositionPanel">
			    <ul>
					<c:forEach var="player" items="${me.game.players}">
						<c:if test="${player != me}">
							<li><a href="#<c:out value='${player.name}'/>-panel"><span><c:out value="${player.name}" /></span></a></li>
						</c:if>
					</c:forEach>
			    </ul>

				<c:forEach var="player" items="${me.game.players}">
					<c:if test="${player != me}">
						<div id="<c:out value='${player.name}'/>-panel">
						
							<div class="card pack">
								<div class="cardName">
									<c:out value="${player.hand.size()}" />
								</div>
								<img class="cardImageCentre" src="img/fluxx_cover.jpg"/>
							</div>
					    </div>
					</c:if>
				</c:forEach>
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
						<div class="card pack">
							<div class="cardName">
								<c:out value="${player.game.drawPile.size()}" />
							</div>
							<img class="cardImageCentre" src="img/fluxx_cover.jpg"/>
						</div>
					</div>
				</div>
			</div>
			
			<div id="myPanel">
				<div id="myScroll">
					<div id="myContent">
						<c:forEach var="card" items="${me.hand}">
							<c:if test="${card.cardType.text == 'Action'}">
								<div class="card action">
							</c:if>
							<c:if test="${card.cardType.text == 'Goal'}">
								<div class="card goal">
							</c:if>
							<c:if test="${card.cardType.text == 'Keeper'}">
								<div class="card keeper">
							</c:if>
							<c:if test="${card.cardType.text == 'Rule'}">
								<div class="card rule">
							</c:if>
							
								<div class="cardName">
									<c:out value="${card.name}" />
								</div>
								<img class="cardImageCentre" src="<c:out value='${card.image}' />"/>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
