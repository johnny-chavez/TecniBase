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
            gestion_inventario()
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

def registrar_servicio():
    print("\n----- REGISTRAR SERVICIO -----")
    input("ID del cliente: ")
    input("ID del equipo: ")
    input("Tipo de servicio: ")
    input("ID del técnico asignado: ")
    input("¿Agregar otro equipo? (S/N): ")
    print("Servicio registrado.")


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


def registrar_venta():
    print("\n----- REGISTRAR VENTA / FACTURA -----")
    input("Costo total: ")
    input("Fecha de pago: ")
    input("Método de pago: ")
    input("ID del servicio solicitado: ")
    print("Pago registrado y factura generada.")


def gestion_inventario():
    print("\n----- GESTIÓN DE INVENTARIO -----")
    input("Registrar materia prima (nombre): ")
    input("Cantidad: ")
    input("Costo por unidad: ")
    input("Datos del proveedor: ")
    print("Inventario actualizado.")


menu_principal()
