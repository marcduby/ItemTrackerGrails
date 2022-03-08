<%@ page import="com.doobs.item.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="type.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${typeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'colorScheme', 'error')} ">
	<label for="colorScheme">
		<g:message code="type.colorScheme.label" default="Color Scheme" />
		
	</label>
	<g:select id="colorScheme" name="colorScheme.id" from="${com.doobs.item.ColorScheme.list()}" optionKey="id" value="${typeInstance?.colorScheme?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'parentType', 'error')} ">
	<label for="parentType">
		<g:message code="type.parentType.label" default="Parent Type" />
		
	</label>
	<g:if test="${parentList != null }">
		<g:select id="parentType" name="parentType.id" from="${parentList}" optionKey="id" optionValue="displayName" required="" value="${typeInstance?.parentType?.id}" class="many-to-one"/>
	</g:if>
	<g:else>
		<g:select id="parentType" name="parentType.id" from="${typeInstanceList}" optionKey="id" optionValue="displayName" value="${typeInstance?.parentType?.id}" class="many-to-one" noSelection="['null': '']"/>
	</g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="type.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${typeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'subTypes', 'error')} ">
	<label for="subTypes">
		<g:message code="type.subTypes.label" default="Sub Types" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${typeInstance?.subTypes?}" var="s">
    <li><g:link controller="type" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="type" action="create" params="['type.id': typeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'type.label', default: 'Type')])}</g:link>
</li>
</ul>

</div>

