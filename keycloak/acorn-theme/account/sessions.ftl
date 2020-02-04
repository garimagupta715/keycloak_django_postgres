<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>
<header class="pageHeading shadow">
    <h1 class="title">${msg("sessionsHtmlTitle")}</h1>
</header>
<div class="pageLayout standard">
    <div class="bp3-card">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>${msg("ip")}</th>
                <th>${msg("started")}</th>
                <th>${msg("lastAccess")}</th>
                <th>${msg("expires")}</th>
            </tr>
            </thead>
            <tbody>
            <#list sessions.sessions as session>
                <tr>
                    <td>${session.ipAddress}</td>
                    <td>${session.started?datetime}</td>
                    <td>${session.lastAccess?datetime}</td>
                    <td>${session.expires?datetime}</td>
                </tr>
            </#list>
            </tbody>
        </table>
        <br />
        <form action="${url.sessionsUrl}" method="post">
            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
            <button id="logout-all-sessions" class="bp3-button">${msg("doLogOutAllSessions")}</button>
        </form>
    </div>
</div>

</@layout.mainLayout>
