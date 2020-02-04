<#macro registrationLayout displayInfo=false displayMessage=true displayWide=false>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex, nofollow">
    <title>${msg("login")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.png" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
          <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
      <#list properties.scripts?split(' ') as script>
        <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
      </#list>
    </#if>
</head>
<body>
  <div class="background">
    <div class="landing">
      <header>
        <div class="logo"></div>
        <h1 class="heading">OakNorth</h1>
      </header>
      <div class="bp3-card">
        <#if displayMessage && message?has_content>
          <div class="message bp3-callout bp3-intent-danger">
              <span class="kc-feedback-text">${message.summary?no_esc}</span>
          </div>
        </#if>
        <#nested "form">
      </div>
    </div>
  </div>
</body>
</html>
</#macro>
