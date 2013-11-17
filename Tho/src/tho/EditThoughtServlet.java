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
public class EditThoughtServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String title = req.getParameter("title");
        String thought = req.getParameter("thought");
        String tags = req.getParameter("tags");
        
        DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Key authorKey = KeyFactory.createKey("thoughts", req.getParameter("title"));
		try {
			Entity thoughtToEdit = ds.get(authorKey);
			thoughtToEdit.setProperty("thought", thought);
			thoughtToEdit.setProperty("tags", tags);
			ds.put(thoughtToEdit);
			
		} catch (Exception e){
			//resp.getOutputStream().println("not");
		}
        
        resp.sendRedirect("/thought.jsp?title=" + title);
    }
}