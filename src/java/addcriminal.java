

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class addcriminal extends HttpServlet {

     
        
    private Connection con;
    private PreparedStatement ps;
    
    public void init(){
        try{
            con=Data.connect();
            String sql="insert into criminal values(?,?,?,?,?,?,?)";
            ps=con.prepareStatement(sql);        
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void destroy(){
        try{
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        
        PrintWriter out=response.getWriter();
        
        //reads the request
        String s1=request.getParameter("cid");
        String s2=request.getParameter("cname");
        
        //java.util.Date date=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("cdob"));
        String s3=request.getParameter("cdob");     
 // date=request.getParameter("cdate");
//java.sql.Date s4=new java.sql.Date(date.getTime());
        String s4=request.getParameter("cadhaar");
        String s5=request.getParameter("ccrime");
      int s6=0;
       switch(s5){  
        case "murder":  
            s6=5;  
            break;  
        case "kidnap":  
            s6=4; 
            break;  
        case "theft":  
            s6=3;
            break;
        case "other":  
            s6=2;
            break;
        default :
                s6=1;
                break;
        }  
        
        
        
         String s7=request.getParameter("cdate");
         java.text.DateFormat format = new java.text.SimpleDateFormat("MM/dd/yyyy");
        
     
        
        //process the request
        try{
            
            ps.setString(1, s1);
            ps.setString(2, s2);
          
            //java.sql.Date da= new java.sql.Date(da.getTime());
            ps.setString(3,  s3);
            ps.setString(4, s4);
            ps.setString(5, s5);
            ps.setInt(6,s6);
            ps.setString(7,  s7);
            
            ps.executeUpdate();
            out.println("REGISTRATION COMPLETED");
            
            HttpSession session = request.getSession();
            
            session.getAttribute("user");
            
            response.sendRedirect("successaddcriminal.jsp");
            
        }catch(Exception e){
            out.println(e);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(addcriminal.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(addcriminal.class.getName()).log(Level.SEVERE, null, ex);
        }
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
