
<%@ page import="com.doobs.item.Type" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'type.label', default: 'Type')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-type" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-type" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list type">
			
				<g:if test="${typeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="type.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${typeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.displayName}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="type.name.label" default="Display Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${typeInstance}" field="displayName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.colorScheme}">
				<li class="fieldcontain">
					<span id="colorScheme-label" class="property-label"><g:message code="type.colorScheme.label" default="Color Scheme" /></span>
					
						<span class="property-value" aria-labelledby="colorScheme-label"><g:link controller="colorScheme" action="show" id="${typeInstance?.colorScheme?.id}">${typeInstance?.colorScheme?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.parentType}">
				<li class="fieldcontain">
					<span id="parentType-label" class="property-label"><g:message code="type.parentType.label" default="Parent Type" /></span>
					
						<span class="property-value" aria-labelledby="parentType-label"><g:link controller="type" action="show" id="${typeInstance?.parentType?.id}">${typeInstance?.parentType?.displayName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="type.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${typeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="type.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${typeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="type.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${typeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.subTypes}">
				<li class="fieldcontain">
					<span id="subTypes-label" class="property-label"><g:message code="type.subTypes.label" default="Sub Types" /></span>
					
						<g:each in="${typeInstance.subTypes}" var="s">
						<span class="property-value" aria-labelledby="subTypes-label"><g:link controller="type" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${typeInstance?.id}" />
					<g:link class="edit" action="edit" id="${typeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
