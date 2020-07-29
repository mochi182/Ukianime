<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resgitro de usuario</title>
    <link rel="stylesheet" href="css/paginas/estilo-registro.css">
</head>
<body onload="pestana(event, 'Personales')">    
    <div class="tab">
      <button class="tablinks" onclick="pestana(event, 'Personales')">1. Datos Personales</button>
      <button class="tablinks" onclick="pestana(event, 'Cuenta')">2. Datos de la cuenta</button>
      <button class="tablinks" onclick="pestana(event, 'Pago')">3. Método de pago</button>
    </div>
    <form id="formulario" class="formulario" method="POST" action="formulario.jsp">

        <section id="Personales" class="tabcontent">
            <div class="contenido">
                    <h3>PASO 1 - DATOS PERSONALES</h3>
                        <input type="text" name="nombre" id="nombre" placeholder="Nombre" required>
                        <input type="text" name="apellido" id="apellido" placeholder="Apellido" required>
                        <input type="date" name="fechanacimiento" id="Fechanacimiento" min="1920-04-08" max="2015-04-08" required>
                        <input type="text" name="telefono" class="telefono" placeholder="Teléfono" required>
                        <p>Seleccione su región: </p>
                        <label><input type="radio" id="region" name="region" value="Norteamerica"> Norteamérica</label> <br>
                        <label><input type="radio" id="region" name="region" value="Latinoamerica"> Latinoamérica</label> <br>
                        <label><input type="radio" id="region" name="region" value="Europa"> Europa</label> <br>

                        
                    
                        <input type="button" value="Siguiente" onclick="pestana(event, 'Cuenta')">
                        <a href="login.html" class="salir">Salir</a>
            </div>       
        </section>
    
        <section id="Cuenta" class="tabcontent">
            <div class="contenido">
                <h3>PASO 2 - DATOS DE LA CUENTA</h3>
                    <input type="email" id="email" name="email" placeholder="Correo Electrónico" required>
                    <input type="text" id="usuario" name="usuario" placeholder="Usuario" required>
                    <input type="password" id="password" name="password" placeholder="Contraseña" required>
                    <input type="password" id="password2" name="password2" placeholder="Repetir Contraseña" required>
                
                    <input type="button" value="Siguiente"  onclick="pestana(event, 'Pago')">
                    <a class="salir" onclick="pestana(event, 'Personales')"> Regresar </a>
                    <a href="login.jsp" class="salir" >Salir</a>
            </div>
        </section>
    
        <section id="Pago" class="tabcontent">
            <div class="contenido">
                <h3>PASO 3 - DATOS DE LA CUENTA</h3>

                <p class="textos"">Tipo de cuenta</p>
                <input type="radio" id="cuenta" class="cuenta" name="cuenta" value="basica">
                <label for="Basica">Básica...   20.00$</label><br>
                <input type="radio" id="cuenta" class="cuenta" name="cuenta" value= "Premiun">
                <label for="Premiun">Premiun... 50.00$</label><br>

                <p class="textos"">Método de Pago</p>
                <input type="radio" id="metodo" class="metodo" name="metodo" value="Visa" required>
                <label for="Visa">Visa</label><br>
                <input type="radio" id="metodo" class="metodo" name="metodo" value= "MasterCard" required>
                <label for="MasterCard">MasterCard</label><br>

                <p class="textos"">Número de tarjeta</p> <br>
                <input type="text" id="tarjeta" name="tarjeta1" class="tarke" placeholder="xxxx" maxlength="4" required>
                <input type="text" id="tarjeta" name="tarjeta2" class="tarke" placeholder="xxxx" maxlength="4" required>
                <input type="text" id="tarjeta" name="tarjeta3" class="tarke" placeholder="xxxx" maxlength="4" required>
                <input type="text" id="tarjeta" name="tarjeta4" class="tarke" placeholder="xxxx" maxlength="4" required>

                
                <input type="text" id="seguridad" name="seguridad" class="tarke1" placeholder="xxxxxx" maxlength="6" required>

                <input type="text" id="fecha" name="fecha" class="tarkes" placeholder="mes" maxlength="2" required>
                <span>/</span>
                <input type="text" id="dia" name="dia" class="tarkes" placeholder="año" maxlength="2" required> <br>

                <span class="textoag">Código de Seguridad </span>    
                <span class="textoag">Fecha de Expiración </span>
                <br>

                <p class="textos">Forma de cobro</p>
                <input type="radio" id="cobro" class="manual" name="cobro" value="Manual" required>
                <label for="Manual">Manual</label><br>
                <input type="radio" id="cobro" class="automatico" name="cobro" value= "Automatico" required>
                <label for="Automï¿½tico">Automático</label><br>

                


                <input type="submit" value="Confirmación">  

                <a class="salir" onclick="pestana(event, 'Cuenta')"> Regresar </a>
                <a href="login.html" class="salir">Salir</a>
            </div>
        </section>

    </form>
    
    <script src="js/script-registro.js"></script>
</body>
</html>