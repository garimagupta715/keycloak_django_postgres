<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>
<header class="pageHeading shadow">
    <h1 class="title">${msg("changePasswordHtmlTitle")}</h1>
</header>
<div class="pageLayout extraNarrow">
    <form action="${url.passwordUrl}" class="passwordForm bp3-card" method="post">
        <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

        <#if password.passwordSet>
            <div class="bp3-form-group">
                <label for="password" class="bp3-label">${msg("currentPassword")}</label>
                <input required type="password" class="bp3-input" id="password" name="password" autofocus autocomplete="current-password">
            </div>
        </#if>

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <div class="bp3-form-group">
            <label for="password-new" class="bp3-label">${msg("passwordNew")}</label>
            <input
                required
                pattern="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])\S{6,}"
                onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must consist of 6 characters including upper and lower case and a number.' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;"
                type="password"
                class="bp3-input"
                id="password-new"
                name="password-new"
                autocomplete="new-password"
            >
        </div>

        <div class="bp3-form-group">
            <label for="password-confirm" class="bp3-label" class="two-lines">${msg("passwordConfirm")}</label>
            <input
                required
                onchange="this.setCustomValidity(this.value !== document.getElementById('password-new').value ? 'Please enter the same Password as above' : '');"
                type="password"
                class="bp3-input"
                id="password-confirm"
                name="password-confirm"
                autocomplete="new-password"
            >
        </div>

        <button type="submit" class="bp3-button bp3-intent-primary bp3-fill" name="submitAction" value="Save">${msg("doSave")}</button>
    </form>
</div>
</@layout.mainLayout> 
