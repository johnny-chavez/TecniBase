import mysql.connector
miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='josue2005*', db='tecnibase' )
if miConexion.is_connected():
    print("✅ Conexión exitosa a la base de datos")
else:
    print("❌ No se pudo conectar")
cursor = miConexion.cursor()
print()
print("Tabla Cliente")
cursor.execute("SELECT * FROM cliente")

resultados = cursor.fetchall()

for fila in resultados:
    print(fila)

print()
print("Tabla servicio tecnico")
cursor.execute("SELECT * FROM servicio_tecnico")

resultados = cursor.fetchall()

for fila in resultados:
    print(fila)

cursor.close()
miConexion.close()