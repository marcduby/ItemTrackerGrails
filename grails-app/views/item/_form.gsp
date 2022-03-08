<%@ page import="com.doobs.item.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="item.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${itemInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="item.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${typeList != null }">
		<g:select id="type" name="type.id" from="${typeList}" optionKey="id" optionValue="displayName" required="" value="${itemInstance?.type?.id}" class="many-to-one"/>
	</g:if>
	<g:else>
		<g:select id="type" name="type.id" from="${com.doobs.item.Type.list()}" optionKey="id" required="" value="${itemInstance?.type?.id}" class="many-to-one"/>
	</g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="item.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${locationList != null }">
		<g:select id="location" name="location.id" from="${locationList}" optionKey="id" optionValue="displayName" required="" value="${itemInstance?.location?.id}" class="many-to-one"/>
	</g:if>
	<g:else>
		<g:select id="location" name="location.id" from="${com.doobs.item.Location.list()}" optionKey="id" optionValue="displayName" required="" value="${itemInstance?.location?.id}" class="many-to-one"/>
	</g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'colorScheme', 'error')} ">
	<label for="colorScheme">
		<g:message code="item.colorScheme.label" default="Color Scheme" />
		
	</label>
	<g:select id="colorScheme" name="colorScheme.id" from="${com.doobs.item.ColorScheme.list()}" optionKey="id" value="${itemInstance?.colorScheme?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'condition', 'error')} ">
	<label for="condition">
		<g:message code="item.condition.label" default="Condition" />
		
	</label>
	<g:textField name="condition" value="${itemInstance?.condition}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="item.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${itemInstance?.description}"/>
</div>

