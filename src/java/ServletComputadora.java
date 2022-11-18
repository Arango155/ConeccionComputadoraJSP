
import Clases.Computadora;
import Clases.ComputadoraController;
import Clases.ConexionBaseDeDatos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/ServletComputadora"})
public class ServletComputadora extends HttpServlet {
    Computadora computadora;
    ComputadoraController registroComputadora;
     Computadora[] ComputadoraRegistrado;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter respuesta = response.getWriter()) {            
            computadora=new Computadora(
               request.getParameter("modelo"),
                request.getParameter("tamanio_pantalla"),
                request.getParameter("cantidad_ram"),
                request.getParameter("almacenamiento"),
                request.getParameter("sistema_operativo"),
                   Integer.parseInt( request.getParameter("marca_codigo"))
                
            );               
                        
            if(registroComputadora==null){
                 registroComputadora=new ComputadoraController();
            }
           
            registroComputadora.guardarComputadora(computadora);//almacenarlo en el array
            
           if(registroComputadora.getComputadora2(computadora)){//almacenarlo en BD
               respuesta.println(1);
           }else{
               respuesta.println(0);
           }
            ComputadoraRegistrado= registroComputadora.getComputadora();           
           
           
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
