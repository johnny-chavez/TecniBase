from src import miConexion, cursor 
def menu_principal():
    while True:
        print("\n========== MENÚ PRINCIPAL ==========")
        print("1. Gestión de clientes")
        print("2. Registrar Servicio")
        print("3. Control Técnico")
        print("4. Registrar Venta / Factura")
        print("5. Gestión de Inventario")
        print("6. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            menu_cliente()
        elif opcion == "2":
            registrar_servicio()
        elif opcion == "3":
            control_tecnico()
        elif opcion == "4":
            registrar_venta()
        elif opcion == "5":
            menu_equipo()
        elif opcion == "6":
            print("Saliendo...")
            break
        else:
            print("Opción inválida")


def menu_cliente():
    while True:
        print("\n====== GESTIÓN DE CLIENTES ======")
        print("1. Registrar cliente")
        print("2. Listar clientes")
        print("3. Editar cliente")
        print("4. Eliminar cliente")
        print("5. Volver")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            registrar_cliente()   
        elif opcion == "2":
            listar_clientes()     
        elif opcion == "3":
            editar_cliente()     
        elif opcion == "4":
            eliminar_cliente()    
        elif opcion == "5":
            break
        else:
            print("Opción inválida")



# Opciones del menú clientes
def registrar_cliente():
    print("\n----- REGISTRAR CLIENTE -----")
    tipo = input("Tipo de cliente (persona/empresa): ").lower()
    nombre = input("Nombre: ")
    telefono = input("Teléfono: ")
    correo = input("Correo electrónico: ")

    if tipo == "persona":
        apellido = input("Apellido:")
        cedula = input("Cédula: ")

        sql = """ INSERT INTO cliente (nombre, apellido_persona, cedula_persona, telefono, correo, tipo_cliente)
        VALUES (%s, %s, %s, %s, %s, %s) """

        cursor.execute(sql, (nombre, apellido, cedula, telefono, correo, tipo ))
    elif tipo == "empresa":
        ruc = input("RUC empresa: ")
        
        sql = """ INSERT INTO cliente (nombre, RUC_empresa, telefono, correo, tipo_cliente)
        VALUES (%s, %s, %s, %s, %s)"""

        cursor.execute(sql, (nombre, ruc, telefono, correo, tipo))
    else:
        print("Tipo invalido")
        return
    
    miConexion.commit()
    print("Cliente registrado.")

def listar_clientes():
    print("\n===== LISTADO DE CLIENTES =====")
    cursor.execute("SELECT * FROM cliente")
    clientes = cursor.fetchall()

    if not clientes:
        print("No hay clientes registrados.")
    else:
        for c in clientes:
            print(c)

def editar_cliente():
    print("\n===== EDITAR CLIENTE =====")
    id_cliente = input("ID del cliente a editar: ")
    telefono = input("Nuevo teléfono: ")
    correo = input("Nuevo correo: ")

    sql = """ 
    UPDATE cliente
    SET telefono = %s, correo = %s
    WHERE id_cliente = %s
    """
    cursor.execute(sql, (telefono, correo, id_cliente))
    miConexion.commit()

    if cursor.rowcount == 0:
        print("No existe un cliente con ese ID")
    else:
        print("Cliente actualizado correctamente")

def eliminar_cliente():
    print("\n===== ELIMINAR CLIENTE =====")
    id_cliente = input("ID del cliente a eliminar: ")

    confirmacion = input("¿Seguro que desea eliminar este cliente? (s/n): ").lower()
    if confirmacion != "s":
        print("Operacion cancelada")
        return
    
    sql = "DELETE FROM cliente WHERE id_cliente = %s"
    cursor.execute(sql, (id_cliente,))
    miConexion.commit()
    
    if cursor.rowcount == 0:
        print("No existe un cliente con ese ID")
    else:
        print ("Cliente eliminado correctamente")

#Opciones Del menú servicios

def menu_servicio():
    while True:
        print("\n----- REGISTRAR SERVICIO -----")
        print("1. Registrar servicio")
        print("2. Consultar servicios")
        print("3. Editar servicio")
        print("4. Eliminar servicio")
        print("5. Volver")

        op = input("Seleccione: ")

        if op == "1":
            registrar_servicio()
        elif op == "2":
            consultar_servicio()
        elif op == "3":
            editar_servicio()
        elif op == "4":
            eliminar_servicio()
        elif op == "5":
            break
        else:
            print("Opción inválida")


def registrar_servicio():
    print("\n----- REGISTRAR SERVICIO -----")
    id_cliente = input("ID del cliente: ")
    id_equipo = input("ID del equipo: ")
    tipo = input("Tipo de servicio: ")
    id_tecnico = input("ID del técnico asignado: ")
    otro = input("¿Agregar otro equipo? (S/N): ")

    sql = """INSERT INTO servicio 
    (id_cliente, id_equipo, tipo_servicio, id_tecnico, otro_equipo)
    VALUES (%s,%s,%s,%s,%s)"""

    cursor.execute(sql, (id_cliente, id_equipo, tipo, id_tecnico, otro))
    miConexion.commit()

    print("Servicio registrado.")


def consultar_servicio():
    cursor.execute("SELECT * FROM servicio")
    for s in cursor.fetchall():
        print(s)


def editar_servicio():
    id_servicio = input("ID del servicio a editar: ")
    nuevo_tipo = input("Nuevo tipo de servicio: ")

    sql = "UPDATE servicio SET tipo_servicio=%s WHERE id_servicio=%s"
    cursor.execute(sql, (nuevo_tipo, id_servicio))
    miConexion.commit()

    print("Servicio actualizado.")


def eliminar_servicio():
    id_servicio = input("ID del servicio a eliminar: ")
    cursor.execute("DELETE FROM servicio WHERE id_servicio=%s", (id_servicio,))
    miConexion.commit()
    print("Servicio eliminado.")

#control tecnico

def control_tecnico():
    while True:
        print("\n----- CONTROL TÉCNICO -----")
        print("1. Visualizar estado del servicio")
        print("2. Registrar consumo y costo de productos")
        print("3. Volver")
        op = input("Seleccione: ")

        if op == "1":
            input("ID del servicio: ")
            print("Mostrando estado del servicio...")
        elif op == "2":
            input("ID del servicio: ")
            input("ID del producto utilizado: ")
            input("Cantidad utilizada: ")
            input("Costo por unidad: ")
            print("Consumo registrado.")
        elif op == "3":
            break
        else:
            print("Opción inválida")

#registrar venta/factura
def menu_venta_factura():
    while True:
        print("\n----- REGISTRAR VENTA / FACTURA -----")
        print("1. Registrar venta")
        print("2. Consultar ventas")
        print("3. Editar venta")
        print("4. Eliminar venta")
        print("----------------------")
        print("5. Registrar factura")
        print("6. Consultar facturas")
        print("7. Editar factura")
        print("8. Eliminar factura")
        print("9. Volver")

        op = input("Seleccione: ")

        if op == "1":
            registrar_venta()
        elif op == "2":
            consultar_venta()
        elif op == "3":
            editar_venta()
        elif op == "4":
            eliminar_venta()
        elif op == "5":
            registrar_factura()
        elif op == "6":
            consultar_factura()
        elif op == "7":
            editar_factura()
        elif op == "8":
            eliminar_factura()
        elif op == "9":
            break
        else:
            print("Opción inválida")


def registrar_venta():
    print("\n----- REGISTRAR VENTA / FACTURA -----")
    total = input("Costo total: ")
    fecha = input("Fecha de pago: ")
    metodo = input("Método de pago: ")
    id_servicio = input("ID del servicio solicitado: ")

    sql = "INSERT INTO venta (total, fecha_pago, metodo_pago, id_servicio) VALUES (%s,%s,%s,%s)"
    cursor.execute(sql, (total, fecha, metodo, id_servicio))
    miConexion.commit()

    print("Pago registrado y factura generada.")


def consultar_venta():
    cursor.execute("SELECT * FROM venta")
    for v in cursor.fetchall():
        print(v)


def editar_venta():
    id_venta = input("ID de la venta: ")
    nuevo_total = input("Nuevo costo total: ")

    sql = "UPDATE venta SET total=%s WHERE id_venta=%s"
    cursor.execute(sql, (nuevo_total, id_venta))
    miConexion.commit()

    print("Venta actualizada.")


def eliminar_venta():
    id_venta = input("ID de la venta: ")
    cursor.execute("DELETE FROM venta WHERE id_venta=%s", (id_venta,))
    miConexion.commit()
    print("Venta eliminada.")


def registrar_factura():
    id_venta = input("ID de la venta: ")
    fecha = input("Fecha de factura: ")

    sql = "INSERT INTO factura (id_venta, fecha) VALUES (%s,%s)"
    cursor.execute(sql, (id_venta, fecha))
    miConexion.commit()

    print("Factura registrada.")


def consultar_factura():
    cursor.execute("SELECT * FROM factura")
    for f in cursor.fetchall():
        print(f)


def editar_factura():
    id_factura = input("ID de la factura: ")
    nueva_fecha = input("Nueva fecha: ")

    sql = "UPDATE factura SET fecha=%s WHERE id_factura=%s"
    cursor.execute(sql, (nueva_fecha, id_factura))
    miConexion.commit()

    print("Factura actualizada.")


def eliminar_factura():
    id_factura = input("ID de la factura: ")
    cursor.execute("DELETE FROM factura WHERE id_factura=%s", (id_factura,))
    miConexion.commit()
    print("Factura eliminada.")


#gestion inventario
def menu_equipo():
    while True:
        print("\n----- GESTIÓN DE INVENTARIO -----")
        print("1. Registrar equipo")
        print("2. Consultar equipo")
        print("3. Editar equipo")
        print("4. Eliminar equipo")
        print("5. Volver")

        op = input("Seleccione: ")

        if op == "1":
            gestion_equipo()
        elif op == "2":
            consultar_equipo()
        elif op == "3":
            editar_equipo()
        elif op == "4":
            eliminar_equipo()
        elif op == "5":
            break
        else:
            print("Opción inválida")


def gestion_equipo():
    print("\n----- GESTIÓN DE INVENTARIO -----")
    marcha = input("Registrar marca del equipo: ")
    modelo = input("Registrar modelo del equipo: ")
    numero_serial = input("Registrar numero serial del equipo: ")
    opcion_equipo = int(input("Ingrese el tipo de equipo, ingresando el numero de la opcion de la siguiente lista: \n 1)computadora \n 2)celular \n 3)impresora \n 4)No especificado"))
    TIPO_DE_EQUIPO = { 1:"computadora", 2:"celular",3:"impresora",4:None}
    if opcion_equipo < 1 or opcion_equipo > 4:
        print("Operacion cancelada, el numero de opcion no es valido")
        return
    tipo_equipo = TIPO_DE_EQUIPO[opcion_equipo]
    estado_equipo = input("Registrar estado del equipo: ")    
    if estado_equipo == "": estado_equipo = None
    descripcion = input("Registrar descripcion del equipo: ")
    if descripcion == "": descripcion = None
    codigo_seguridad = input("Registrar codigo de seguridad del equipo: ")
    if codigo_seguridad == "": codigo_seguridad = None
    id_cliente = input("Registrar id del cliente del equipo: ")
    if id_cliente == "": id_cliente = None
    sql = "INSERT INTO equipo (marcha, modelo, numero_serial, tipo_equipo, estado_equipo, descripcion, codigo_seguridad,id_cliente) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    cursor.execute(sql, (marcha, modelo, numero_serial, tipo_equipo,estado_equipo,descripcion, codigo_seguridad,id_cliente))
    miConexion.commit()

    print("Inventario actualizado.")


def consultar_equipo():
    cursor.execute("SELECT * FROM equipo")
    for i in cursor.fetchall():
        print(i)


def editar_equipo():
    id_equipo = input("ID del equipo: ")

    if cursor.rowcount == 0:
        print("No existe un equipo con ese ID")
    else:
        print ("Equipo editado correctamente")
    
    campo_equipo_a_editar = int(input("Seleccione campo a editar del equipo, Ingrese el numero de la opcion de la siguiente lista: \n 1) marcha \n 2) modelo \n 3) numero_serial \n 4) tipo_equipo \n 5) estado_equipo \n 6) descripcion \n 7) codigo_seguridad \n 8) id_cliente"))
    CAMPOS={ 1:"marcha",2:"modelo",3:"numero_serial",4:"tipo_equipo",5:"estado_equipo",6:"descripcion",7:"codigo_seguridad",8:"id_cliente"}
    if campo_equipo_a_editar < 1 or campo_equipo_a_editar > 8:
        print("Operacion cancelada, el numero de opcion no es valido")
        return
    campo_a_editar = CAMPOS[campo_equipo_a_editar]
    if campo_a_editar == "tipo_equipo":
        opcion_equipo = int(input("Ingrese el tipo de equipo, ingresando el numero de la opcion de la siguiente lista: \n 1)computadora \n 2)celular \n 3)impresora \n 4)No especificado \n "))
        TIPO_DE_EQUIPO = { 1:"computadora", 2:"celular",3:"impresora",4:None}
        if opcion_equipo < 1 or opcion_equipo > 4:
            print("Operacion cancelada, el numero de opcion no es valido")
            return
        tipo_equipo = TIPO_DE_EQUIPO[opcion_equipo]

        sql = "UPDATE equipo SET tipo_equipo=%s WHERE id_equipo=%s"
        cursor.execute(sql, (tipo_equipo, id_equipo))
        miConexion.commit()

    elif campo_a_editar == "id_cliente":
        id_cliente = input("Registrar id del cliente del equipo: ")
        if id_cliente == "": id_cliente = None

        sql = "UPDATE equipo SET id_cliente=%s WHERE id_equipo=%s"
        cursor.execute(sql, (id_cliente, id_equipo))
        miConexion.commit()
    else:
        dato = input("Ingrese dato: ")
        sql = f"UPDATE equipo SET {campo_a_editar}=%s WHERE id_equipo=%s"
        cursor.execute(sql, (dato, id_equipo))
        miConexion.commit()

    print("Inventario actualizado.")

def eliminar_equipo():
    id_equipo = input("ID del equipo a eliminar: ")

    confirmacion = input("¿Seguro que desea eliminar este cliente? (s/n): ").lower().strip()
    if confirmacion != "s":
        print("Operacion cancelada")
        return
    
    try:
        cursor.execute(
            "DELETE FROM servicio_tecnico WHERE id_equipo = %s",
            (id_equipo,)
        )

        cursor.execute(
            "DELETE FROM equipo WHERE id_equipo = %s",
            (id_equipo,)
        )

        miConexion.commit()
        print("Equipo eliminado correctamente")

    except Exception as e:
        miConexion.rollback()
        print("Error al eliminar:", e)

    if cursor.rowcount == 0:
        print("No existe un equipo con ese ID")
    else:
        print ("Equipo eliminado correctamente")


menu_principal()
