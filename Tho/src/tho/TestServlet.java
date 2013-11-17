package tho;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.CompositeFilter;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


public class TestServlet extends HttpServlet {
    @SuppressWarnings("deprecation")
	@Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	String title = req.getParameter("title");
    	UserService userService = UserServiceFactory.getUserService();
    	String user = userService.getCurrentUser().getEmail();
    	
    	Query query = new Query("item");
    	query.addFilter("title", FilterOperator.EQUAL, title);
    	query.addFilter("user", FilterOperator.EQUAL, user);
		
    	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Entity thought = ds.prepare(query).asSingleEntity();
		resp.getOutputStream().println(user);
		resp.getOutputStream().println(thought.getProperty("title").toString());
    	
    	//    	UserService userService = UserServiceFactory.getUserService();
//        User user = userService.getCurrentUser();
//
//        
//        if (user != null) {
//            resp.sendRedirect("main.jsp");
//        } else {
//            resp.sendRedirect("guest.jsp");
//        }
    }
}