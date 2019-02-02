<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label">User Name: </label>
            <div class="col-sm-6">
                <input type="text"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       name="username"
                       value="<#if user??>${user.username}</#if>"
                       placeholder="User name"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       name="password" placeholder="Password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Confirm Password:</label>
                <div class="col-sm-6">
                    <input type="password"
                           class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           name="password2" placeholder="Confirm Password"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>

        <#if isRegisterForm>
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Email:</label>
                <div class="col-sm-6">
                    <input type="email"
                           name="email"
                           value="<#if user??>${user.email}</#if>"
                           class="form-control ${(mailError??)?string('is-invalid', '')}"
                           placeholder="Email"/>
                    <#if mailError??>
                        <div class="invalid-feedback">
                            ${mailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
        <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Sign Out</button>
    </form>
</#macro>