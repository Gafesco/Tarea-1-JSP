<%-- 
    Document   : index
    Created on : 28/09/2022, 22:05:30
    Author     : HP
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Sangre" %>
<%@page import="modelo.Estudiante" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiantes </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Menu de Navegacion</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Inicio <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Nosotros <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Contactos<span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="#">Ubicacion<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          MenuDesplegable
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Inicio</a>
          <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="#">Nosotros</a>
         <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="#">Contactos</a>
         <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="#">Ubicacion</a>
          

        </div>
      </li>
    </ul>
  </div>
</nav>
        
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_estudiante" onclick="limpiar()">
Nuevo
</button>

<!-- Modal -->
<div class="modal fade" id="modal_estudiante" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Estudiantes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container"> 
        <h1>Formulario Estudiantes</h1>
        
            <form action="sr_estudiante" method="post" class="form-group">
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" value="0" class="form-control" readonly>  
                <label for="lbl_carne"><b>Carné:</b></label>
                <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="Ejemplo: E001" required pattern="[E]{1}[0-9]{3}">
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1  Nombre2" required>           
               <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1  Apellido2" required>   
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: Guatemala Zona1 6ta avenida" required>  
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 56565151" required>  
               <label for="lbl_correo"><b>Correo Electronico:</b></label>
                <input type="text" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: ejemplo@gmail.com" required>  
                <label for="lbl_fn"><b>Fecha de Nacimiento:</b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>  
                <label for="lbl_sangre"><b>Tipo de Sangre:</b></label>
                <select name="drop_sangre" id="drop_sangre" class="form-control">
                    <% 
                        Sangre sangre = new Sangre();
                        HashMap<String,String> drop = sangre.drop_sangre();
                        for (String i : drop.keySet()){
                        out.println(" <option value='"+ i +"'> " + drop.get(i) +" </option>");
                        }

                        %>
                    
                    
                    
                    
                </select>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-success">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-info">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
            </form>
                        
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 <table class="table table-success table-striped">
                        <thead>
                            <tr>
                                <th>Carné</th> 
                                <th>Nombres</th> 
                                <th>Apellidos</th> 
                                <th>Direccion</th> 
                                <th>Telefono</th> 
                                <th>Correo Electrónico</th> 
                                <th>Fecha de Nacimiento</th> 
                                <th>Sangre</th> 
                                <th>ID Tipo Sangre</th>
                            </tr>
                            </thead>
                            <tbody id="tbl_estudiantes">
               
                                <% Estudiante estudiante = new Estudiante();
                                DefaultTableModel tabla = new DefaultTableModel();
                                tabla = estudiante.leer();
                                for(int t=0;t<tabla.getRowCount();t++){
                                
                                out.println("<tr data-id="+ tabla.getValueAt(t, 0)+" data-id_p="+ tabla.getValueAt(t, 8)+">");
                                out.println("<td>"+ tabla.getValueAt(t, 1)+ "</td>");
                                out.println("<td>"+ tabla.getValueAt(t, 2)+ "</td>");
                                out.println("<td>"+ tabla.getValueAt(t, 3)+ "</td>");
                                out.println("<td>"+ tabla.getValueAt(t, 4)+ "</td>");
                                out.println("<td>"+ tabla.getValueAt(t, 5)+ "</td>");
                                out.println("<td>"+ tabla.getValueAt(t, 6)+ "</td>");
                                out.println("<td>"+ tabla.getValueAt(t, 9)+ "</td>");
                                out.println("<td>"+ tabla.getValueAt(t, 7)+ "</td>");
                                out.println("<td>"+ tabla.getValueAt(t, 8)+ "</td>");
                                out.println("</tr>");
                                
                                    }
                                    

                                    %>
                                
                            </tbody>
                            </table>       
        
        
             <script src="https://code.jquery.com/jquery-3.6.1.slim.js" integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk=" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script>
    function limpiar(){
         $('#txt_id').val(0);
        $('#drop_sangre').val('');
        $('#txt_carne').val('');
        $('#txt_nombres').val('');
        $('#txt_apellidos').val('');
        $('#txt_direccion').val('');
        $('#txt_telefono').val('');
        $('#txt_correo').val('');
        $('#txt_fn').val('');
        
    }
    $('#tbl_estudiantes').on('click','tr td',function(evt){
        var target,id,id_p,carne,nombres,apellidos,direccion,telefono,correo,nacimiento;
        target = $(event.target);
        id = target.parent().data('id');
        id_p = target.parent().data('id_p');
        carne = target.parent("tr").find("td").eq(0).html();
        nombres = target.parent("tr").find("td").eq(1).html();
        apellidos = target.parent("tr").find("td").eq(2).html();
        direccion = target.parent("tr").find("td").eq(3).html();
        telefono = target.parent("tr").find("td").eq(4).html();
        correo = target.parent("tr").find("td").eq(5).html();
        nacimiento = target.parent("tr").find("td").eq(6).html();
        $('#txt_id').val(id);
        $('#drop_sangre').val(id_p);
        $('#txt_carne').val(carne);
        $('#txt_nombres').val(nombres);
        $('#txt_apellidos').val(apellidos);
        $('#txt_direccion').val(direccion);
        $('#txt_telefono').val(telefono);
        $('#txt_correo').val(correo);
        $('#txt_fn').val(nacimiento);
        $('#modal_estudiante').modal('show');
        
        
        
    });
    </script>
    </body>
</html>
