
<%@ page import="org.estebistec.grails.sandbox.Document" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'document.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="mimeType" title="${message(code: 'document.mimeType.label', default: 'Mime Type')}" />
                        
                            <g:sortableColumn property="contents" title="${message(code: 'document.contents.label', default: 'Contents')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${documentInstanceList}" status="i" var="documentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: documentInstance, field: "mimeType")}</td>
                        
                            <td>${fieldValue(bean: documentInstance, field: "contents")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${documentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
