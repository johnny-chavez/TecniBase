import mysql.connector
miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='josue2005*', db='tecnibase' )
if miConexion.is_connected():
    print("✅ Conexión exitosa a la base de datos")
else:
    print("❌ No se pudo conectar")
cursor = miConexion.cursor()
