<html>
    <head>
        <title>Welcome to Grails</title>
		<meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'sandbox.css')}" />
    </head>
    <body>
		<div id="nav">
			<div class="homePagePanel">
				<div class="panelTop">

				</div>
				<div class="panelBody">
					<h1>Application Status</h1>
					<ul>
						<li>App version: <g:meta name="app.version"></g:meta></li>
						<li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
						<li>JVM version: ${System.getProperty('java.version')}</li>
						<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
						<li>Domains: ${grailsApplication.domainClasses.size()}</li>
						<li>Services: ${grailsApplication.serviceClasses.size()}</li>
						<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
					</ul>
					<h1>Installed Plugins</h1>
					<ul>
						<g:set var="pluginManager"
						       value="${applicationContext.getBean('pluginManager')}"></g:set>

						<g:each var="plugin" in="${pluginManager.allPlugins}">
							<li>${plugin.name} - ${plugin.version}</li>
						</g:each>
					</ul>
				</div>
				<div class="panelBtm">
				</div>
			</div>


		</div>
		<div id="pageBody">
	        <h1>Welcome to Grails</h1>
	        <p>Congratulations, you have successfully started your first Grails application! At the moment
	        this is the default page, feel free to modify it to either redirect to a controller or display whatever
	        content you may choose. Below is a list of controllers that are currently deployed in this application,
	        click on each to execute its default action:</p>

	        <div id="Filter Tests" class="dialog">
				<h2>Filter Tests</h2>
				<ul>
				    <!-- TODO Change to createLink calls... -->
				    <li><a href="filterTest/target">filterTest/target</a></li>
				    <li><a href="filterTest/target?one=on">filterTest/target?one=on</a></li>
				    <li><a href="filterTest/target?two=on">filterTest/target?two=on</a></li>
				    <li><a href="filterTest/target?one=on&two=on">filterTest/target?one=on&amp;two=on</a></li>
				    <li><a href="filterTest/target?three=on">filterTest/target?three=on</a></li>
				    <li><a href="filterTest/target?one=on&three=on">filterTest/target?one=on&amp;three=on</a></li>
				    <li><a href="filterTest/target?two=on&three=on">filterTest/target?two=on&amp;three=on</a></li>
				    <li><a href="filterTest/target?one=on&two=on&three=on">filterTest/target?one=on&amp;two=on&amp;three=on</a></li>
				</ul>
	        </div>
	        <div id="RESTful Grails" class="dialog">
				<h2>RESTful Task API</h2>
	        </div>
		</div>
    </body>
</html>
