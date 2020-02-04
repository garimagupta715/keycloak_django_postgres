<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
<#if section = "header">
<#--  ${msg("doLogIn")}  -->
<#elseif section = "form">
    <#if realm.password>
        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <div class="bp3-form-group">
                <label for="username" class="bp3-label">
                    <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                </label>
                <#if usernameEditDisabled??>
                    <input class="bp3-input" id="username" name="username" value="${(login.username!'')}" type="text" disabled />
                <#else>
                    <input class="bp3-input" id="username" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                </#if>
            </div>
            <div class="bp3-form-group">
                <label for="password" class="bp3-label">${msg("password")}</label>
                <input class="bp3-input" id="password" name="password" type="password" autocomplete="off" />
            </div>
            <div class="${properties.kcFormOptionsWrapperClass!}">
                <#if realm.resetPasswordAllowed>
                    <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                </#if>
            </div>
            <button class="bp3-button bp3-intent-primary bp3-fill" name="login" type="submit" form="kc-form-login">
                ${msg("doLogIn")}
            </button>
            <#if realm.password && social.providers??>
                <div class="ssoDivider"><span>${msg("useSSO")}</span></div>
                <#list social.providers as p>
                    <a href="${p.loginUrl}" id="zocial-${p.alias}" class="bp3-button bp3-fill"><span>${p.displayName}</span></a>
                </#list>
                </div>
            </#if>
        </form>
    </#if>
<#elseif section = "info" >
    <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
        <div id="kc-registration">
            <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
        </div>
    </#if>
</#if>
</@layout.registrationLayout>
