<%@ page errorPage="error.jsp"%>
<html>
<head>
	<title>Sign Off</title>
</head>
<body>

<table cellspacing="0" cellpadding="5" width="100%">
    <%--HEADER--%>
	<tr>
		<td colspan="3">
			<jsp:include page="common/header.jsp"/>
		</td>
	</tr>

	<tr>
        <%--NAVIGATION--%>
        <td valign="top" width="20%">
    		<jsp:include page="common/navigation.jsp"/>
    	</td>

        <td align="left" valign="top" width="60%">
        <%--CENTRAL BODY--%>

            <P align=middle><strong>You are signed out.</strong></P>
            <P align=middle>Thank you for shopping.</P>
            <P align=middle>You may <A href=<%= request.getContextPath() %>/signon.jsp> sign on </A> again.</P>

    <%--FOOTER--%>
    	</td>
        <td></td>
    </tr>
    <tr>
    	<td colspan="3">
    		<jsp:include page="common/footer.jsp"/>
    	</td>
    </tr>
</table>
</body>
</html>