<#import "template.ftl" as layout>
<@layout.mainLayout active='log' bodyClass='log'; section>
<header class="pageHeading shadow">
    <h1 class="title">${msg("accountLogHtmlTitle")}</h1>
</header>
<div class="pageLayout standard">
    <div class="bp3-card">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>${msg("date")}</th>
                <th>${msg("event")}</th>
                <th>${msg("ip")}</th>
                <th>${msg("details")}</th>
            </tr>
            </thead>
            <tbody>
            <#list log.events as event>
                <tr>
                    <td>${event.date?datetime}</td>
                    <td>${event.event}</td>
                    <td>${event.ipAddress}</td>
                    <td><#list event.details as detail>${detail.key} = ${detail.value} <#if detail_has_next>, </#if></#list></td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
</@layout.mainLayout>
