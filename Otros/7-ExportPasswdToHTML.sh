#!/bin/bash

# Crear la cabecera HTML. Uso también un estilo de CSS.
header="<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<table>
  <tr>
    <th>Usuario</th>
    <th>Password</th>
    <th>UID</th>
    <th>GID</th>
    <th>Info de Usuario</th>
    <th>Directorio Home</th>
    <th>Shell</th>
  </tr>"

# Crear el cuerpo del HTML. Por cada linea crea una fila en la tabla.
body=$(awk -F: '{print "<tr><td>" $1 "</td><td>" $2 "</td><td>" $3 "</td><td>" $4 "</td><td>" $5 "</td><td>" $6 "</td><td>" $7 "</td></tr>"}' /etc/passwd)

# Crear el pie del HTML. Es decir, cerrar la tabla, el cuerpo y el documento.
footer="</table>
</body>
</html>"

# Exportar los datos a un fichero html.
echo "$header$body$footer" > passwd.html

echo "Datos exportados al fichero passwd.html"

