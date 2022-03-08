<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
		<div class="nav" role="navigation">
		    <ul id="supernav">
			  	<li><g:link class="${request.forwardURI.contains('/about') ? 'current' : ''}" controller="about" action="info">About</g:link></li>
				<li><g:link class="${request.forwardURI.contains('/type') ? 'current' : ''}" controller="type">Types</g:link></li>
				<li><g:link class="${request.forwardURI.contains('/color') ? 'current' : ''}" controller="colorScheme">Color Schemes</g:link></li>
				<li><g:link class="${request.forwardURI.contains('/location') ? 'current' : ''}" controller="location">Locations</g:link></li>
				<li><g:link class="${request.forwardURI.contains('/item') ? 'current' : ''}" controller="item">Items</g:link></li>
		    </ul>				
		</div>
		<g:if test="${request.forwardURI.contains('/item')}">
			<div class="nav" role="navigation">
			    <ul id="subnav">
				  	<li>Quick creates:</li>
					<li><g:link class="create" action="createVehicleItem">Create Vehicles</g:link></li>
					<li><g:link class="create" action="createCWItem">Create CW</g:link></li>
					<li><g:link class="create" action="createEP2Item">Create EP2</g:link></li>
					<li><g:link class="create" action="createEP3Item">Create EP3</g:link></li>
					<li><g:link class="create" action="createEP4Item">Create EP4</g:link></li>
					<li><g:link class="create" action="createSagaItem">Create Saga</g:link></li>
			    </ul>				
			</div>
			<div class="nav" role="navigation">
			    <ul id="subnav">
				  	<li>Quick lists:</li>
					<li><g:link class="list" action="listItems">List All</g:link></li>
					<li><g:link class="list" action="listItemCountByLocation">List by Location</g:link></li>
			    </ul>				
			</div>
		</g:if>
		<g:if test="${request.forwardURI.contains('/type')}">
			<div class="nav" role="navigation">
			    <ul id="subnav">
				  	<li>Quick lists:</li>
					<li><g:link class="list" action="listSpecific" params="[type: 'Vehicles']">List Vehicles</g:link></li>
					<li><g:link class="list" action="listSpecific" params="[type: 'CW']">List CW</g:link></li>
					<li><g:link class="list" action="listSpecific" params="[type: 'EP2']">List EP2</g:link></li>
					<li><g:link class="list" action="listSpecific" params="[type: 'EP3']">List EP3</g:link></li>
					<li><g:link class="list" action="listSpecific" params="[type: 'EP4']">List EP4</g:link></li>
					<li><g:link class="list" action="listSpecific" params="[type: 'Saga']">List Saga</g:link></li>
			    </ul>				
			</div>
			<div class="nav" role="navigation">
			    <ul id="subnav">
				  	<li>Quick creates:</li>
					<li><g:link class="create" action="createForParent" params="[typeId: '3']">Create Vehicles</g:link></li>
					<li><g:link class="create" action="createForParent" params="[typeId: '5']">Create CW</g:link></li>
					<li><g:link class="create" action="createForParent" params="[typeId: '7']">Create EP2</g:link></li>
					<li><g:link class="create" action="createForParent" params="[typeId: '8']">Create EP3</g:link></li>
					<li><g:link class="create" action="createForParent" params="[typeId: '32']">Create EP4</g:link></li>
					<li><g:link class="create" action="createForParent" params="[typeId: '6']">Create Saga</g:link></li>
			    </ul>				
			</div>
		</g:if>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
