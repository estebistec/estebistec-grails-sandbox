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
				</div>
				<div class="panelBtm">
				</div>
			</div>
		</div>
		<div id="pageBody">
	        <h1>Target view for Filter Tests</h1>
	        <dl>
	            <dt>one</dt>
	            <dd>${params.one}</dd>
	            <dt>two</dt>
	            <dd>${params.two}</dd>
	            <dt>three</dt>
	            <dd>${params.three}</dd>
	        </dl>
		</div>
    </body>
</html>
