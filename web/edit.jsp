
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        
        
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                min-height: 100vh;
                background-image: url("img/fondo2.jpg");
                background-size: 100%;
                background-position: center center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        
        
        
        
        
    </head>
    <body>
        
         <%
            //conectando a base de datos
            Connection conexion=null;
            String url="jdbc:mysql://localhost:3306/final_progra";//url de MySQL
            String usuario="root";// usuario de mysql local
            String clave="root"; 
           
            
             Class.forName("com.mysql.jdbc.Driver");
             conexion=DriverManager.getConnection( url, usuario,clave);
             
             //listado de la tabla pero de la fila seleccionada
             
             PreparedStatement ps;
             ResultSet rs;
             
             int id=Integer.parseInt(request.getParameter("id")); 
             
             ps=conexion.prepareStatement("select * from computadora where marca_codigo="+id);
             rs=ps.executeQuery();
             
             
             while(rs.next()){
          
            %>
        
     <div class="container-sm ">              
           
        <form method="POST" id="form" name="form" action="" >
             <div class="for m-group">                       
                        
         
            
            <div  >
   <form class="form-register"   method="POST"  id="form" name="form"  >
               <h1>Modificar registro</h1>
            <div class="form-group">
                <label for="exampleInputName">Modelo</label>
                <input class="form-control" type="text"  name="modelo" readonly="" value="<%= rs.getString("modelo")%>"> 
                <input type="hidden" name="control" value="GUARDAR">
            </div>
            <div class="form-group">
                <label for="exampleInputName">Tamaño pantalla</label>
                <input class="form-control" type="text"  name="tamaño_pantalla"  value="<%= rs.getString("tamaño_pantalla")%>">
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Cantidad ram</label>
              <input class="form-control" type="text"  name="cantidad_ram"  value="<%= rs.getString("cantidad_ram")%>">
         
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Almacenamiento</label>
              <input type="text" class="form-control"  name="almacenamiento"  value="<%= rs.getString("almacenamiento")%>"  >
            </div>
            
            <div class="form-group">
              <label for="exampleInputPassword1">Sistema operativo</label>
              <input type="text" class="form-control"  name="sistema_operativo"  value="<%= rs.getString("sistema_operativo")%>"  >
            </div>
               
               
            
            <select class="form-control" name="marca_codigo" value="<%= rs.getInt("marca_codigo")%>">
              
                <option value="1">MARCA 1</option>
                <option value="2">MARCA 2</option>
            </select><br>
            
            <div>
                <input type="submit" value="Guardar" class="btn btn-primary "/>             
             <a class="btn btn-warning" href="home.jsp" style="float: right;">Atras</a>
                
            </div>
        </form> 
                <% } %>
        </div>
        
    </body>
</html>
<%
        String tamaño_pantalla,cantidad_ram,almacenamiento,sistema_operativo,marca_codigo;
        
       
        tamaño_pantalla=request.getParameter("tamaño_pantalla");
       
  cantidad_ram=request.getParameter("cantidad_ram");
        almacenamiento=request.getParameter("almacenamiento");      
        
        sistema_operativo=request.getParameter("sistema_operativo");
        marca_codigo=request.getParameter("marca_codigo");
        if(tamaño_pantalla!=null)
        {
        ps=conexion.prepareStatement("update computadora set tamaño_pantalla='"+tamaño_pantalla"',cantidad_ram='"+cantidad_ram+"',almacenamiento='"+almacenamiento+"',sistema_operativo='"+sistema_operativo+"',sistema_operativo='"+sistema_operativo+"',marca_codigo='"+marca_codigo+"' where modelo="+id);
        
        ps.executeUpdate();
        response.sendRedirect("home.jsp");
        
        }
%>