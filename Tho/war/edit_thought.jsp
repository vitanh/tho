<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Query.FilterPredicate" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.appengine.api.datastore.Query.Filter" %>

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
      	background: url(wall.jpg) no-repeat center center fixed; 
		    -webkit-background-size: cover;
		    -moz-background-size: cover;
		    -o-background-size: cover;
        background-size: cover;
      }
      .transparent-div{
        background: no-repeat center center fixed #DFDFDF;
        border-radius: 10px;
        margin-top: 7%;
      }
      .textarea-width{
        width: 270px;
      }
      .margin-idea{
        margin-left: 85px;
        margin-right: 85px;
      }
      .data{
      	padding-left: 40px;
      	padding-bottom: 10px;
      }
      .control-groups{
		padding-left: 30px;      
      }

    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">  
  </head>
  <body class="background"> 
   <div class="container"> 
    <div class="row">


      <div class="span6 offset3 transparent-div">
        <div class="margin-idea">
          <h2><% out.println(request.getParameter("title")); %></h2>
<%
    	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Key authorKey = KeyFactory.createKey("thoughts", request.getParameter("title"));
		String thoughtString = null;
		String tagsString = null;
		try {
			Entity thought = ds.get(authorKey);
			//out.println(thought.getProperty("title").toString());
			//out.println("<hr />" + thought.getProperty("thought").toString());
			thoughtString = thought.getProperty("thought").toString();
			tagsString = thought.getProperty("tags").toString();
			//out.println("<hr />" + thought.getProperty("tags").toString());
			//out.println("<hr /><div class=\"data\">" + thought.getProperty("date").toString() + "<br /><br />");
		} catch (Exception e){
			//resp.getOutputStream().println("not");
		}
%>

		  <form action="/edit" method="post">
		    <input class="input-xlarge" type="hidden" placeholder="Title" name="title" value="<% out.print(request.getParameter("title").toString()); %>">
            <textarea class="textarea-width" rows="12" name="thought"><% out.print(thoughtString);%></textarea>
            <input class="input-xlarge" type="text" placeholder="Tags (separated by comma)" name="tags" value="<% out.print(tagsString); %>">
            <br>
            <input class="btn btn-large btn-centered" type="submit" value="Save">
          </form>
	       
		</div>
        </div>
      </div>
    </div>
   </div>

    <script src="js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery.js"></script>
  </body>
</html>
