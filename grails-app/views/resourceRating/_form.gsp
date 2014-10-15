<%@ page import="com.linkSharing.ResourceRating" %>



<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'resource', 'error')} required">
	<label for="resource">
		<g:message code="resourceRating.resource.label" default="Resource" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="resource" name="resource.id" from="${com.linkSharing.Resource.list()}" optionKey="id" required="" value="${resourceRatingInstance?.resource?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="resourceRating.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${resourceRatingInstance.score}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="resourceRating.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.linkSharing.User.list()}" optionKey="id" required="" value="${resourceRatingInstance?.user?.id}" class="many-to-one"/>

</div>

