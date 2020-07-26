<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="css/paginas/login.css">
    <link rel="stylesheet" href="css/estilos_comunes.css">
</head>
<body class="fondo-uki">
    <div class="contenedor-form">
        <img src="https://i.imgur.com/bYacHHK.png" alt="" class="logo">
        <h1 class="titulo">Ukianime</h1>
        <br>
        <br>
        <p>Si a�n no tienes cuenta</p>
        <input type="submit" value="Reg�strate" class="botonr" onclick="boton_loco()">
    </div>
    <div class="contenedor-form2">
        <h2>BIENVENIDO</h2>
        <div class="formulario">
            <p>Ingrese sus datos</p>
            <form action="#">
                <input type="email" placeholder="Correo Electronico" required>
                <input type="password" placeholder="Contrase�a" required>

                <input type="submit" value="Iniciar Sesi�n">
            </form>
        </div>
    </div>
    
    <script>
        function boton_loco(){
            window.location.href = 'registro-usuario.jsp';
        }
    </script>
</body>
</html>