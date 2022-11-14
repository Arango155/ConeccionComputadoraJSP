

import Clases.ConexionBaseDeDatos;
import Clases.Libro;
import Clases.LibroController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/NewServletLibro"})
public class NewServletLibro extends HttpServlet {
    Libro libro;
    LibroController registroLibro;
     Libro[] librosRegistrados;

    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        try ( PrintWriter respuesta = response.getWriter()) {            
            libro=new Libro(
                Integer.parseInt(request.getParameter("codigo_libro")),
                request.getParameter("nombre"),
                request.getParameter("fecha_lanzamiento"),
                request.getParameter("autor"),
                request.getParameter("tipo_pasta_id")
                
            );               
                        
            if(registroLibro==null){
                 registroLibro=new LibroController();
            }
           
            registroLibro.guardarLibro(libro);//almacenarlo en el array
            
           if(registroLibro.getLibro2(libro)){//almacenarlo en BD
               respuesta.println(1);
           }else{
               respuesta.println(0);
           }
            librosRegistrados= registroLibro.getLibro();           
           
            for (int i = 0; i < librosRegistrados.length; i++){
                    if(librosRegistrados[i].getCodigo_libro()>0){
                       respuesta.println("<tr><td>" + librosRegistrados[i].getCodigo_libro()+ "</td>");
                       respuesta.println("<td>" + librosRegistrados[i].getNombre() + "</td>");
                       respuesta.println("<td>" + librosRegistrados[i].getFecha_lanzamiento()+ "</td>");
                       respuesta.println("<td>" + librosRegistrados[i].getAutor()+ "</td>");
                       respuesta.println("<td>" + librosRegistrados[i].getTipo_pasta_id()+ "</td>");
                       respuesta.println("<td>"
                               + "<button type=\"button\" class=\"btn btn-warning\"></i>Editar</button> "
                               + "<button type=\"button\" class=\"btn btn-danger\" onclick=\"eliminarAlumno()\">Eliminar</button>"
                               + "</td></tr>");
                    }
                }
            //respuesta.println(1);
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
