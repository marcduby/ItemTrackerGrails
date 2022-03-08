<%@ page import="com.doobs.item.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="location.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${locationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'parentLocation', 'error')} ">
	<label for="parentLocation">
		<g:message code="location.parentLocation.label" default="Parent Location" />
		
	</label>
	<g:select id="parentLocation" name="parentLocation.id" from="${com.doobs.item.Location.list()}" optionKey="id" value="${locationInstance?.parentLocation?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="location.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${locationInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'subLocations', 'error')} ">
	<label for="subLocations">
		<g:message code="location.subLocations.label" default="Sub Locations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${locationInstance?.subLocations?}" var="s">
    <li><g:link controller="location" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="location" action="create" params="['location.id': locationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'location.label', default: 'Location')])}</g:link>
</li>
</ul>

</div>

