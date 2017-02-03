<%
    ui.decorateWith("appui", "standardEmrPage")
%>

<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.message("Providers List")}"}
    ];

    jq(function() {

        setTimeout(function() {
            jq("#providers-list_filter input:text").first().focus();
        }, 500);
    });

</script>

<h2>${ ui.message("Manage Providers") }</h2>

<a href="${ ui.pageLink("coreapps", "providermanagement/editProvider") }">
    <button id="create-account-button">${ ui.message("Add Provider") }</button>
</a>
<hr>

<table id="providers-list" width="100%" border="1" cellspacing="0" cellpadding="2">
    <thead>
    <tr>
        <th>${ ui.message("Identifier") }</th>
        <th>${ ui.message("Name") }</th>
        <th>${ ui.message("Gender") }</th>
        <th>${ ui.message("Role") }</th>
    </tr>
    </thead>

    <tbody>
    <% if ((providersList == null) ||
            (providersList != null && providersList.size() == 0)) { %>
    <tr>
        <td colspan="2">${ ui.message("None") }</td>
    </tr>
    <% } %>
    <% providersList.each { provider ->
        def personId = provider.person.personId
        def personName = provider.name
    %>
    <tr id="provider-${ provider.person.personId}">
        <td>${ ui.format(provider.identifier) }</td>
        <td><a href="/${ contextPath }/coreapps/providermanagement/editProvider.page?personId=${ provider.person.personId }">${ ui.format(provider.name) }</a></td>
        <td>${ ui.format(provider.person.gender) }</td>
        <td>${ ui.format(provider.providerRole) }</td>

    </tr>
    <% } %>
    </tbody>
</table>

<% if ( (providersList != null) && (providersList.size() > 0) ) { %>
${ ui.includeFragment("uicommons", "widget/dataTable", [ object: "#providers-list",
                                                         options: [
                                                                 bFilter: true,
                                                                 bJQueryUI: true,
                                                                 bLengthChange: false,
                                                                 iDisplayLength: 10,
                                                                 sPaginationType: '\"full_numbers\"',
                                                                 bSort: false,
                                                                 sDom: '\'ft<\"fg-toolbar ui-toolbar ui-corner-bl ui-corner-br ui-helper-clearfix datatables-info-and-pg \"ip>\''
                                                         ]
]) }
<% } %>