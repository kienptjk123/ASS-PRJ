<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.logging.Level" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error Page</title>
</head>
<body>
    <% 
        String errorMessage = (String)request.getAttribute("errorMessage");
        if(errorMessage == null) {
            errorMessage = "";
        }
        Throwable throwable = (Throwable)request.getAttribute("javax.servlet.error.exception");
        String servletName = (String)request.getAttribute("javax.servlet.error.servlet_name");
        if (servletName == null) {
            servletName = "Unknown";
        }

        // Log the error details
        Logger logger = Logger.getLogger("ErrorLogger");
        logger.log(Level.SEVERE, "Error occurred in servlet: " + servletName, throwable);

        // Prepare the stack trace
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        if (throwable != null) {
            throwable.printStackTrace(pw);
        }
        String stackTrace = sw.toString();
    %>
    <h1>Error: <%= errorMessage %></h1>
    <%-- Display stack trace if available --%>
    <% if (throwable != null) { %>
        <h2>Stack Trace:</h2>
        <pre><%= stackTrace %></pre>
    <% } %>
</body>
</html>
