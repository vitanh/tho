package tho;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;



@SuppressWarnings("serial")
public class SaveThoughtServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String title = req.getParameter("title");
        String thought = req.getParameter("thought");
        String tags = req.getParameter("tags");
        
        Key thoughtsKey = KeyFactory.createKey("Thoughts", title);
        
        Date date = new Date();
        Entity thoughtRecord = new Entity("Thoughts", thoughtsKey);
        thoughtRecord.setProperty("user", user);
        thoughtRecord.setProperty("date", date);
        thoughtRecord.setProperty("title", title);
        thoughtRecord.setProperty("thought", thought);
        thoughtRecord.setProperty("tags", tags);

        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        datastore.put(thoughtRecord);
        
        resp.sendRedirect("/main.jsp?title=" + title);
    }
}