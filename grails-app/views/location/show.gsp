
<%@ page import="com.doobs.item.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-location" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list location">
			
				<g:if test="${locationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="location.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${locationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.displayName}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="location.name.label" default="Display Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${locationInstance}" field="displayName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.parentLocation}">
				<li class="fieldcontain">
					<span id="parentLocation-label" class="property-label"><g:message code="location.parentLocation.label" default="Parent Location" /></span>
					
						<span class="property-value" aria-labelledby="parentLocation-label"><g:link controller="location" action="show" id="${locationInstance?.parentLocation?.id}">${locationInstance?.parentLocation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="location.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${locationInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="location.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${locationInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="location.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${locationInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.subLocations}">
				<li class="fieldcontain">
					<span id="subLocations-label" class="property-label"><g:message code="location.subLocations.label" default="Sub Locations" /></span>
					
						<g:each in="${locationInstance.subLocations}" var="s">
						<span class="property-value" aria-labelledby="subLocations-label"><g:link controller="location" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${locationInstance?.id}" />
					<g:link class="edit" action="edit" id="${locationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
