<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex, nofollow">
    <title>${msg("manageAccount")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.png" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>
<body class="baseLayout">
    <#if message?has_content>
        <div class="bp3-callout bp3-intent-${message.type}">
            <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>
            <#if message.type=='error' ><span class="pficon pficon-error-octagon"></span><span class="pficon pficon-error-exclamation"></span></#if>
            ${kcSanitize(message.summary)?no_esc}
        </div>
    </#if>
    <nav class="navBar" role="navigation">
        <a class="logo" href="/"></a>

        <#--  <a class="navBarButton bp3-button bp3-minimal <#if active=='account'>bp3-active</#if>" href="${url.accountUrl}">
            <span class="bp3-button-text">${msg("account")}</span>
        </a>  -->
        <a class="navBarButton bp3-button bp3-minimal <#if active=='password'>bp3-active</#if>" href="${url.passwordUrl}">
            <span class="bp3-button-text">${msg("password")}</span>
        </a>
        <a class="navBarButton bp3-button bp3-minimal <#if active=='sessions'>bp3-active</#if>" href="${url.sessionsUrl}">
            <span class="bp3-button-text">${msg("sessions")}</span>
        </a>
        <#--  <a class="navBarButton bp3-button bp3-minimal <#if active=='applications'>bp3-active</#if>" href="${url.applicationsUrl}">
            <span class="bp3-button-text">${msg("applications")}</span>
        </a>  -->
        <#if features.log>
        <a class="navBarButton bp3-button bp3-minimal <#if active=='log'>bp3-active</#if>" href="${url.logUrl}">
            <span class="bp3-button-text">${msg("log")}</span>
        </a>
        </#if>
        <#if realm.userManagedAccessAllowed && features.authorization>
        <a class="navBarButton bp3-button bp3-minimal <#if active=='authorization'>bp3-active</#if>" href="${url.resourceUrl}">
            <span class="bp3-button-text">${msg("myResources")}</span>
        </a>
        </#if>
        <a class="navBarButton bp3-button bp3-minimal" href="/" onClick="backToApp(event)">
            <span class="bp3-button-text">${msg("backToApp")}</span>
        </a>
        <div class="rightLinks">
            <a class="navBarButton bp3-button bp3-minimal" href="${url.logoutUrl}">
                <span icon="log-out" class="bp3-icon bp3-icon-log-out">
                    <svg data-icon="log-out" width="16" height="16" viewBox="0 0 16 16">
                        <desc>log-out</desc>
                        <path fill="white" d="M7 14H2V2h5c.55 0 1-.45 1-1s-.45-1-1-1H1C.45 0 0 .45 0 1v14c0 .55.45 1 1 1h6c.55 0 1-.45 1-1s-.45-1-1-1zm8.71-6.71l-3-3a1.003 1.003 0 00-1.42 1.42L12.59 7H6c-.55 0-1 .45-1 1s.45 1 1 1h6.59l-1.29 1.29c-.19.18-.3.43-.3.71a1.003 1.003 0 001.71.71l3-3c.18-.18.29-.43.29-.71 0-.28-.11-.53-.29-.71z"></path>
                    </svg>
                </span>
                <span class="bp3-button-text">${msg("doSignOut")}</span>
            </a>
        </div>
    </nav>
    <#nested "content">
    <script>
    sessionStorage.setItem('referingApp', !document.referrer.includes('keycloak') ? document.referrer : sessionStorage.getItem('referingApp') || '/');

    function backToApp(event) {
        event.preventDefault();
        window.location = sessionStorage.getItem('referingApp');
    }
    </script>
</body>
</html>
</#macro>
