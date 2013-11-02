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
      }

    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">  
  </head>
  <body class="background"> 
   <div class="container"> 
    <div class="row">
      <div class="span6 transparent-div">
        <div class="margin-idea">
          <h1>Mary Vitanh</h1>
          <p>Your last five thoughts:</p>
          <ul>
<%
   DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			
		// creating query
		Query query = new Query("Thoughts");
		
		List<Entity> allEntities = ds.prepare(query).asList(
				FetchOptions.Builder.withLimit(5)); 
		for(Entity e : allEntities){
			out.println("<li><a href=\"?thought=" + e.getProperty("title") + "\">" + e.getProperty("title") + "</a></li>");
		}
		out.println(request.getParameter("title"));
%>
	
          </ul>
          <p><a href="#">See all your thoughts</a></p>
        </div>
      </div>
      <div class="span6 transparent-div">
        <div class="margin-idea">
          <h2>Write thought</h2>
          <form action="save" method="post">
            <input class="input-xlarge" type="text" placeholder="Title" name="title">
            <textarea class="textarea-width" rows="12" name="thought"></textarea>
            <input class="input-xlarge" type="text" placeholder="Tags (separated by comma)" name="tags">
            <br>
            <input class="btn btn-large btn-centered" type="submit" value="Save">
          </form>
        </div>
      </div>
    </div>
   </div>

    <script src="js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery.js"></script>
  </body>
</html>
