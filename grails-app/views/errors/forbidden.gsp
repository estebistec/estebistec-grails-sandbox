<html>
  <head>
	  <title><g:message code="errors.forbidden.header" /></title>
      <link rel="stylesheet" href="${resource(dir:'css',file:'error.css')}" />
  </head>

  <body>
    <h1><g:message code="errors.forbidden.header" /></h1>
    <p><g:message code="errors.forbidden.overview" /></p>
    <p>
        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" /></div>
        </g:if>
    </p>

    <g:if env="development">
    <h2>Error Details</h2>

  	<div class="message">
		<strong>Error ${request.'javax.servlet.error.status_code'}:</strong> ${request.'javax.servlet.error.message'.encodeAsHTML()}<br/>
		<strong>Servlet:</strong> ${request.'javax.servlet.error.servlet_name'}<br/>
		<strong>URI:</strong> ${request.'javax.servlet.error.request_uri'}<br/>
		<g:if test="${exception}">
	  		<strong>Exception Message:</strong> ${exception.message?.encodeAsHTML()} <br />
	  		<strong>Caused by:</strong> ${exception.cause?.message?.encodeAsHTML()} <br />
	  		<strong>Class:</strong> ${exception.className} <br />
	  		<strong>At Line:</strong> [${exception.lineNumber}] <br />
	  		<strong>Code Snippet:</strong><br />
	  		<div class="snippet">
	  			<g:each var="cs" in="${exception.codeSnippet}">
	  				${cs?.encodeAsHTML()}<br />
	  			</g:each>
	  		</div>
		</g:if>
  	</div>
	<g:if test="${exception}">
	    <h2>Stack Trace</h2>
	    <div class="stack">
	      <pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}<br/></g:each></pre>
	    </div>
	</g:if>
	</g:if>
  </body>
</html>