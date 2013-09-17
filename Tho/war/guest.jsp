<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    UserService userService = UserServiceFactory.getUserService();
    
%>
 
<!DOCTYPE html>
<html>
  <head>
    <title>mv</title>
    <style type="text/css">
      .background{
        background-image: url(wall.jpg);
        background-size: cover;
      }
      .transparent-div{
        background: no-repeat center center fixed #DFDFDF;
        border-radius: 10px;
        margin-top: 20%;
      }

    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">  
  </head>
  <body class="background"> 
   <div class="container"> 
    <div class="row">
      <div class="span4 offset2 transparent-div">
        <h1>Hello, dolly!</h1>
        <p>Hello,fassfsdlly2!</p>
      </div>
      <div class="span4 transparent-div">
        <a href="<%= userService.createLoginURL("/") %>">
         <img src="https://developers.google.com/+/images/branding/sign-in-buttons/Red-signin_Medium_base_44dp.png">
       </a>
      </div>
    </div>
   </div>

    <script src="js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery.js"></script>
  </body>
</html>
