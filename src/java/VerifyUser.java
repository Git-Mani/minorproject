import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String uname=request.getParameter("uname");
        String password=request.getParameter("password");
        String utype=request.getParameter("utype");
        String name="adminpage";
        if(utype.equals("admin")){
            if(uname.equals("admin@gmail.com") && password.equals("indore")){
                 
               
    
        //success!
        //save the user data in session scope
        HttpSession session = request.getSession();
       
        
        session.setAttribute("user", uname);
        Cookie username1=new Cookie("utype",utype);
        username1.setMaxAge(60*60*24*7);
        response.addCookie(username1);
         String ch=request.getParameter("c1");
        //do your forward or redirect...
      if(ch!=null){
                        //step-1 (create cookie object)
                        Cookie c1=new Cookie("id",uname);
                        Cookie c2=new Cookie("pw",password);
                        //step-2 (set the maximum age)
                        c1.setMaxAge(60*60*24*7);
                        c2.setMaxAge(60*60*24*7);
                        //step-3 (add cookie to response)
                        response.addCookie(c1);
                        response.addCookie(c2);
                    }else if(ch==null){
                    
                    Cookie c1= new Cookie ("id",null);
                    Cookie c2= new Cookie ("pw",null);
                        response.addCookie(c1);
                        response.addCookie(c2);
                    }
               
              response.sendRedirect("adminpage.jsp");
            }else{
                response.sendRedirect("index.jsp");
                out.println("Invalid Admin Credentials");
            }
        }else if(utype.equals("user")){
            
            String sql="SELECT * FROM user where uname=? AND password=?";     
            try{
                Connection con=Data.connect();
                PreparedStatement ps=con.prepareStatement(sql);
                ps.setString(1, uname);
                ps.setString(2, password);
                ResultSet rs=ps.executeQuery();
                boolean b=rs.next();
                if(b==true){
                    
                    //storing email in session
                    
                    //step-1 (fetch the sessio)
                    HttpSession session=request.getSession();
                    //step-2 (store the data in session)
                    session.setAttribute("user", uname);
                    
                    
                    
                    
                    
                    String ch=request.getParameter("c1");
                    if(ch!=null){
                        //step-1 (create cookie object)
                        Cookie c1=new Cookie("id",uname);
                        Cookie c2=new Cookie("pw",password);
                        //step-2 (set the maximum age)
                        c1.setMaxAge(60*60*24*7);
                        c2.setMaxAge(60*60*24*7);
                        //step-3 (add cookie to response)
                        response.addCookie(c1);
                        response.addCookie(c2);
                    }
                    
                    
                   response.sendRedirect("user.jsp");
                }else{
                    response.sendRedirect("index.jsp");
                   
                }
                con.close();
            }catch(Exception e){
                out.println(e);
            }
          }
        
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
  
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
