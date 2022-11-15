



<%@page import="Clases.ConexionBaseDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
          <head>
              
               <title>App Web</title>
               
               
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
       
               
               
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
   
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="script.js" type="text/javascript"></script>
        <link href="estilo.css" rel="stylesheet" type="text/css"/>
       
              
          </head>
          
             <% 
        response.setHeader("Cache-Control", "nocache, no-store, must-revalidate");
        if(session.getAttribute("user")==null){
            response.sendRedirect("/index.jsp");
        }
    %>
    <body>
        
        
                   
                      <%
                              ConexionBaseDeDatos conn = new ConexionBaseDeDatos();
                              Statement smt;
                              ResultSet rs;
                              smt = conn.conectar().createStatement();
                              rs = smt.executeQuery("SELECT * FROM final_progra.computadora");
                    %>
              
              
 
                   
                                            
   <div class="d-flex justify-content-around">
        <div class="p-3 bd-highlight">
       
        <br>
        <form class="form-register"   method="POST"  id="form" name="form"  >
              
        <h1>Formulario</h1>
        <br>
        
            <div class="form-group">
                <label for="exampleInputName">Numero de Modelo</label>
                <input class="form-control" type="text"  name="modelo"  >
            </div>
            <div class="form-group">
                <label for="exampleInputName">Tamaño pantalla</label>
                <input class="form-control" type="text"  name="tamanio_pantalla"  >
            </div>
        
        <div class="form-group">
                <label for="exampleInputName">Cantidad Ram</label>
                <input class="form-control" type="text"  name="cantidad_ram"  >
            </div>
        
         <div class="form-group">
                <label for="exampleInputName">Almacenamiento</label>
                <input class="form-control" type="text"  name="almacenamiento"  >
            </div>
        
        <div class="form-group">
                <label for="exampleInputName">Sistema operativo</label>
                <input class="form-control" type="text"  name="sistema_operativo"  >
            </div>
        
          
          <select class="form-control" name="marca_codigo">
                <option value="1">MARCA 1</option>
                <option value="2">MARCA 2</option>
            </select><br>
           
            
        
            
            <br>
            
        
            
           
            
          <form class="d-flex" role="search">
             
              <button type="submit" onclick="enviarFormularioJS()" class="btn btn-primary">Enviar formulario</button>
              <br>
               <br>
              
                      <a href="Logout" class="btn btn-danger">Cerrar sesion</a>
                
          
          </form> 
                        
        </div>
       <div>
        <c:if test="${error ==1}">
                                        <div class="alert alert-danger" id="error">${message}</div>
                              </c:if>
                              <div class="table-responsive mx-4 my-4">
                                  
                                                                         <form class="d-flex" role="search">
                                                  <input class="form-control me-2" type="text" name="txtSearch">
                                                  <input class="btn btn-warning" type="submit" value="Buscar">

                                        </form>
                                  
                              
                                  
                                                            
                                  
                                          <%
                                                  String nameSearch = request.getParameter("txtSearch");
                                                  if (nameSearch != null) {
                                                            smt = conn.conectar().createStatement();
                                                            rs = smt.executeQuery("SELECT * FROM final_progra.computadora WHERE modelo LIKE" + " '%" + nameSearch + "%' ");
                                                  } else {
                                                            System.err.print("Error");
                                                  }
                                        %>
                              </div>
                                        <table class="table table-hover table-dark">
                                            <thead>
                                                  <tr>
                                                             <th scope="col">Codigo</th>
                                                            <th scope="col">Nombre</th>
                                                            <th scope="col">Fecha</th>
                                                            <th scope="col">Autor</th>
                                                            <th scope="col">Pasta</th>
                                                            <th scope="col">Pasta</th>
                                                            
                                                            <th scope="col">Acciones</th>
                                                            
                                                  </tr>
                                                  <%
                                                            while (rs.next()) {
                                                  %>
                                                  <tr>
                                                            <td><%= rs.getString("modelo")%></td>
                                                            <td><%= rs.getString("tamaño_pantalla")%></td>
                                                            <td><%= rs.getString("cantidad_ram")%></td>
                                                            <td><%= rs.getString("almacenamiento")%></td>
                                                            <td><%= rs.getString("sistema_operativo")%></td>
                                                             <td><%= rs.getString("marca_codigo")%></td>

                                                            <td>
                                                                    
                                                                       <a href="edit.jsp?id=<%= rs.getInt("marca_codigo")%>" class="btn btn-outline-light">Editar</a>
                                                                      <a href="delete.jsp?id=<%= rs.getInt("marca_codigo")%>" class="btn btn-danger">Eliminar</a>
                                                                      
                                                                   
                                                                      
                                                                      
                                                            </td>
                                            <a href="delete.jsp"></a>
                                                  </tr>
                                                  <%}%>
                                            </thead>
                                                  <tbody id="bodyTable">

                    </tbody>  
                                        </table>
                              </div>
                    </div>
        </div>
                                             </div>      
                                            
</html>