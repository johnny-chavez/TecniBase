from src import miConexion, cursor 
def menu_principal():
    while True:
        print("\n========== MENÚ PRINCIPAL ==========")
        print("1. Gestión de clientes")
        print("2. Gestion de Servicio")
        print("3. Control Técnico")
        print("4. Registrar Venta / Factura")
        print("5. Gestión de Inventario")
        print("6. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            menu_cliente()
        elif opcion == "2":
            menu_servicio
        elif opcion == "3":
            control_tecnico()
        elif opcion == "4":
            menu_venta_factura()
        elif opcion == "5":
            menu_inventario()
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

    fecha = input("Fecha del servicio (YYYY-MM-DD): ")

    sql = """INSERT INTO servicio_prestado (fecha, id_cliente, tipo_servicio)
    VALUES (%s,%s,%s)"""

    cursor.execute(sql, (fecha, id_cliente, tipo))
    miConexion.commit()

    print("Servicio registrado.")


def consultar_servicio():
    cursor.execute("SELECT * FROM servicio_prestado")
    for s in cursor.fetchall():
        print(s)


def editar_servicio():
    id_servicio = input("ID del servicio a editar: ")
    nuevo_tipo = input("Nuevo tipo de servicio: ")

    sql = "UPDATE servicio_prestado SET tipo_servicio=%s WHERE id_servicio=%s"
    cursor.execute(sql, (nuevo_tipo, id_servicio))
    miConexion.commit()

    print("Servicio actualizado.")


def eliminar_servicio():
    id_servicio = input("ID del servicio a eliminar: ")
    cursor.execute("DELETE FROM servicio_prestado WHERE id_servicio=%s", (id_servicio,))
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
    tipo_pago = input("Método de pago: ")
    id_servicio = input("ID del servicio solicitado: ")
    id_cajero = input("ID del cajero: ")

    sql = "INSERT INTO venta (id_servicio, tipo_pago, id_cajero) VALUES (%s,%s,%s)"
    cursor.execute(sql, (id_servicio, tipo_pago, id_cajero))
    miConexion.commit()

    print("Pago registrado y factura generada.")


def consultar_venta():
    cursor.execute("SELECT * FROM venta")
    for v in cursor.fetchall():
        print(v)


def editar_venta():
    id_venta = input("ID de la venta: ")
    nuevo_pago = input("Nuevo método de pago: ")

    sql = "UPDATE venta SET tipo_pago=%s WHERE id_venta=%s"
    cursor.execute(sql, (nuevo_pago, id_venta))
    miConexion.commit()

    print("Venta actualizada.")


def eliminar_venta():
    id_venta = input("ID de la venta: ")
    cursor.execute("DELETE FROM venta WHERE id_venta=%s", (id_venta,))
    miConexion.commit()
    print("Venta eliminada.")


def registrar_factura():
    id_servicio = input("ID del servicio: ")
    nro = input("Número de factura: ")
    fecha = input("Fecha de emisión (YYYY-MM-DD): ")
    total = input("Monto total: ")

    sql = "INSERT INTO factura (id_servicio, nro_factura, fecha_emision, monto_total) VALUES (%s,%s,%s,%s)"
    cursor.execute(sql, (id_servicio, nro, fecha, total))
    miConexion.commit()

    print("Factura registrada.")


def consultar_factura():
    cursor.execute("SELECT * FROM factura")
    for f in cursor.fetchall():
        print(f)


def editar_factura():
    id_servicio = input("ID del servicio: ")
    nuevo_total = input("Nuevo monto total: ")

    sql = "UPDATE factura SET monto_total=%s WHERE id_servicio=%s"
    cursor.execute(sql, (nuevo_total, id_servicio))
    miConexion.commit()

    print("Factura actualizada.")


def eliminar_factura():
    id_servicio = input("ID del servicio: ")
    cursor.execute("DELETE FROM factura WHERE id_servicio=%s", (id_servicio,))
    miConexion.commit()
    print("Factura eliminada.")
    

#gestion inventario
def menu_inventario():
    while True:
        print("\n----- GESTIÓN DE INVENTARIO -----")
        print("1. Registrar producto")
        print("2. Consultar inventario")
        print("3. Editar producto")
        print("4. Eliminar producto")
        print("5. Volver")

        op = input("Seleccione: ")

        if op == "1":
            gestion_inventario()
        elif op == "2":
            consultar_inventario()
        elif op == "3":
            editar_inventario()
        elif op == "4":
            eliminar_inventario()
        elif op == "5":
            break
        else:
            print("Opción inválida")


def gestion_inventario():
    print("\n===== REGISTRAR PRODUCTO =====")
    id_catalogo = input("ID del catálogo: ")
    marca = input("Marca: ")
    descripcion = input("Descripción: ")
    costo = input("Costo: ")
    proveedor = input("Proveedor: ")
    inventario = input("Cantidad en inventario: ")

    sql = """
    INSERT INTO Producto (id_catalogo, marca, descripcion, costo, proveedor, inventario)
    VALUES (%s, %s, %s, %s, %s, %s)
    """
    cursor.execute(sql, (id_catalogo, marca, descripcion, costo, proveedor, inventario))
    miConexion.commit()

    print("Producto registrado correctamente")


def consultar_inventario():
    print("\n===== LISTADO DE PRODUCTOS =====")

    sql = "SELECT * FROM Producto"
    cursor.execute(sql)
    productos = cursor.fetchall()

    if len(productos) == 0:
        print("No existen productos registrados.")
    else:
        print("Productos registrados:")
        for p in productos:
            print(p)


def editar_inventario():
    print("\n===== EDITAR PRODUCTO EN EL INVENTARIO=====")
    id_producto = input("ID del producto a editar: ")
    costo = input("Nuevo costo: ")
    inventario = input("Nuevo inventario: ")

    sql = """
    UPDATE Producto
    SET costo = %s, inventario = %s
    WHERE id_producto = %s
    """
    cursor.execute(sql, (costo, inventario, id_producto))
    miConexion.commit()

    if cursor.rowcount == 0:
        print("No existe un producto con ese ID.")
    else:
        print("Producto actualizado correctamente.")


def eliminar_inventario():
    print("\n===== ELIMINAR PRODUCTO EN EL INVENTARIO=====")
    id_producto = input("ID del producto a eliminar: ")

    sql = "DELETE FROM Producto WHERE id_producto = %s"
    cursor.execute(sql, (id_producto,))
    miConexion.commit()

    if cursor.rowcount == 0:
        print("No existe un producto con ese ID.")
    else:
        print("Producto eliminado correctamente.")

menu_principal()
