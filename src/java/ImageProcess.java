/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.*;
import java.sql.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author oogeyman
 */
public class ImageProcess extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
           
        Connection conn=null;
PreparedStatement ps = null;
ResultSet rs=null;
//String url="jdbc:mysql://localhost:3306/criminalrecord", "root", "root";
FileInputStream fis=null;
DiskFileItemFactory ft=new DiskFileItemFactory();
 ServletFileUpload upload = new ServletFileUpload(ft);
 byte b[]= null;
String s1="", s2="" , s3="" , s4="" , s5="" , s7="";
 try{
List<FileItem>item=upload.parseRequest(new ServletRequestContext(request));

for(int i=0;i<item.size();i++){
  FileItem items=item.get(i);  
String name=items.getFieldName();
if(name.equals("cid")){
s1= items.getString();

}else if(name.equals("cname"))
{
s2= items.getString();

}else if(name.equals("cdob"))
{
s3= items.getString();

}else if(name.equals("myimg"))
{

b= items.get();
    
}else if (name.equals("cadhaar")){
s4= items.getString();


}else if(name.equals("ccrime")){
s5= items.getString();

}else if(name.equals("cdate")){
s7= items.getString();

}
}

}catch(Exception e){

e.printStackTrace();
}
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
 
//out.print("First Name :"+fname+"myloc="+myloc);
try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/criminalrecord", "root", "root");
//File image= new File(myloc);
String sql="insert into creminal2 values(?,?,?,?,?,?,?,?)";
ps = conn.prepareStatement(sql);

            ps.setString(1, s1);
            ps.setString(2, s2);
          
            //java.sql.Date da= new java.sql.Date(da.getTime());
            ps.setString(3,  s3);
            ps.setString(4, s4);
            ps.setString(5, s5);
            ps.setInt(6,s6);
            ps.setString(7,  s7);
            ps.setBytes(8, b);
 
//fis=new FileInputStream(image);
//ps.setBinaryStream(8, (InputStream) fis, (int) (image.length()));

int count = ps.executeUpdate();
if(count>0)
{
out.println("insert successfully");
}
else
{
out.println("not successfully");
}
}
catch(Exception ex)
{
ex.printStackTrace();
}
finally{
try{
if(rs!=null){
rs.close();
rs= null;
}
if(ps !=null)
{
ps.close();
ps=null;
}
if(conn!=null)
{
conn.close();
conn=null;
}
}
catch(Exception e)
{
e.printStackTrace();
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
