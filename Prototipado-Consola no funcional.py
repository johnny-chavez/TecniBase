from src import miConexion, cursor 
def menu_principal():
    while True:
        print("\n========== MENÚ PRINCIPAL ==========")
        print("1. Gestión de clientes")
        print("2. Gestion de Servicio")
        print("3. Control Técnico")
        print("4. Registrar Venta / Factura")
        print("5. Gestión de Inventario")
        print("6. Gestion de Empleados")
        print("7. Gestion de Equipo")
        print("8. Salir")
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
            menu_empleados()
        elif opcion == "7":
            menu_equipo()
        elif opcion == "8":
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

        args = (nombre,None,telefono,correo,cedula,apellido,tipo)

        cursor.callproc("sp_insert_cliente",args)
    elif tipo == "empresa":
        ruc = input("RUC empresa: ")

        args = (nombre,ruc,telefono,correo,cedula,None,None)

        cursor.callproc("sp_insert_cliente",args)
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
    nombre = input("Nombre: ")
    ruc = input("RUC empresa: ")
    telefono = input("Nuevo teléfono: ")
    correo = input("Nuevo correo: ")
    cedula = input("Cédula: ")
    apellido = input("Apellido:")
    tipo = input("Tipo de cliente (persona/empresa): ").lower()

    args = (id_cliente,nombre,ruc,telefono,correo,cedula,apellido,tipo)

    cursor.callproc("sp_update_cliente",args)
    miConexion.commit()

def eliminar_cliente():
    print("\n===== ELIMINAR CLIENTE =====")
    id_cliente = input("ID del cliente a eliminar: ")

    confirmacion = input("¿Seguro que desea eliminar este cliente? (s/n): ").lower()
    if confirmacion != "s":
        print("Operacion cancelada")
        return
    
    cursor.callproc("sp_delete_cliente",(id_cliente,))
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
    fecha = input("Fecha del servicio (YYYY-MM-DD): ")
    id_cliente = input("ID del cliente: ")
    tipo = input("Tipo de servicio (S o V): ")

    args = (fecha,id_cliente,tipo)

    cursor.callproc("sp_insert_servicio_prestado",args)
    miConexion.commit()

    print("Servicio registrado.")


def consultar_servicio():
    cursor.execute("SELECT * FROM servicio_prestado")
    for s in cursor.fetchall():
        print(s)


def editar_servicio():
    id_servicio = input("ID del servicio a editar: ")
    fecha = input("Fecha del servicio (YYYY-MM-DD): ")
    id_cliente = input("ID del cliente: ")
    nuevo_tipo = input("Nuevo tipo de servicio: ")

    args = (id_servicio,fecha,id_cliente,nuevo_tipo)
    cursor.callproc("sp_update_servicio_prestado", args)
    miConexion.commit()

    print("Servicio actualizado.")


def eliminar_servicio():
    id_servicio = input("ID del servicio a eliminar: ")

    cursor.callproc("sp_delete_servicio_prestado",(id_servicio,))

    miConexion.commit()
    print("Servicio eliminado.")


#control tecnico

def control_tecnico():
    while True:
        print("\n----- CONTROL TÉCNICO -----")
        print("1. Visualizar listado de servicios tecnicos")
        print("2. Registrar un servicio tecnico")
        print("3. Actualizar un servicio tecnico")
        print("4. Eliminar un servicio tecnico")
        print("5. Volver")
        op = input("Seleccione: ")

        if op == "1":
            listar_servicio_tecnicos()
        elif op == "2":
            registrar_servicio_tecnico()
        elif op == "3":
            actualizar_servicio_tecnico()
        elif op =="4":
            eliminar_servicio_tecnico()
        elif op == "5":
            break
        else:
            print("Opción inválida")


def listar_servicio_tecnicos():
    print("\n===== LISTADO DE SERVICIOS TECNICOS =====")
    cursor.execute("SELECT * FROM servicio_tecnico")
    clientes = cursor.fetchall()

    if not clientes:
        print("No hay servicios registrados.")
    else:
        for c in clientes:
            print(c)

def registrar_servicio_tecnico():
    id_servicio = input("Ingrese id del servicio prestado: ")
    tipo = input("Ingrese el tipo de servicio: ")
    descripcion = input("Ingrese su descripcion: ")
    piezas_utilizadas = input("Ingrese piezas utilizadas: ")
    id_equipo = input("Ingrese Id del equipo reparado: ")
    id_empleado = input("Ingrese id del empleado dueño del equipo: ")

    args = (id_servicio,tipo,descripcion,piezas_utilizadas,id_equipo,id_empleado)

    cursor.callproc("sp_insert_servicio_tecnico",args)

    miConexion.commit()
    print("Servicio tecnico Registrado.")

def actualizar_servicio_tecnico():
    id_servicio = input("Ingrese id del servicio tecnico: ")
    tipo = input("Ingrese el tipo de servicio: ")
    descripcion = input("Ingrese su descripcion: ")
    piezas_utilizadas = input("Ingrese piezas utilizadas: ")
    id_equipo = input("Ingrese Id del equipo reparado: ")
    id_empleado = input("Ingrese id del empleado dueño del equipo: ")

    args = (id_servicio,tipo,descripcion,piezas_utilizadas,id_equipo,id_empleado)

    cursor.callproc("sp_update_servicio_tecnico",args)

    miConexion.commit()
    print("Servicio tecnico Actualizado.")

def eliminar_servicio_tecnico():
    id_servicio_tec = input("ID del servicio tecnico a eliminar: ")

    cursor.callproc("sp_delete_servicio_tecnico",(id_servicio_tec,))

    miConexion.commit()
    print("Servicio tecnico eliminado.")


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
    print("\n----- REGISTRAR VENTA -----")

    id_servicio = input("ID del servicio solicitado: ")
    tipo_pago = input("Método de pago: ")
    id_cajero = input("ID del cajero: ")

    args = (id_servicio,tipo_pago,id_cajero)

    cursor.callproc("sp_insert_venta",args)
    miConexion.commit()

    print("Pago registrado y factura generada.")


def consultar_venta():
    cursor.execute("SELECT * FROM venta")
    for v in cursor.fetchall():
        print(v)


def editar_venta():
    id_venta = input("ID de la venta: ")
    tipo_pago = input("Nuevo método de pago: ")
    id_cajero = input("ID del cajero: ")

    args = (id_venta,tipo_pago,id_cajero)
    cursor.callproc("sp_update_venta", args)
    miConexion.commit()

    print("Venta actualizada.")


def eliminar_venta():
    id_venta = input("ID de la venta: ")
    cursor.callproc("sp_delete_venta", (id_venta,))
    miConexion.commit()
    print("Venta eliminada.")


def registrar_factura():
    print("Tenga en cuenta que solo puede existir una factura por servicio prestado")
    print("")
    id_servicio = input("ID del servicio: ")
    nro = input("Número de factura: ")
    fecha = input("Fecha de emisión (YYYY-MM-DD): ")
    total = input("Monto total: ")

    args = (id_servicio,nro,fecha,total)

    cursor.callproc("sp_insert_factura",args)
    miConexion.commit()

    print("Factura registrada.")


def consultar_factura():
    cursor.execute("SELECT * FROM factura")
    for f in cursor.fetchall():
        print(f)


def editar_factura():
    id_factura = input("ID del servicio: ")
    nro = input("Nuevo número de factura: ")
    fecha = input("Nueva Fecha de emisión (YYYY-MM-DD): ")
    total = input("Nuevo Monto total: ")

    args = (id_factura,nro,fecha,total)
    cursor.callproc("sp_update_factura",args)
    miConexion.commit()

    print("Factura actualizada.")


def eliminar_factura():
    id_servicio = input("ID del servicio: ")
    cursor.callproc("sp_delete_factura",(id_servicio,))
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
    
    args = (id_catalogo,marca,descripcion,costo,proveedor,inventario)
    cursor.callproc("sp_insert_producto",args)
    miConexion.commit()

    print("Producto registrado correctamente")


def consultar_inventario():
    print("\n===== CONSULTA DE INVENTARIO =====")
    print("1. Ver todos los productos")
    print("2. Ver productos por proveedor")

    opcion = input("Seleccione una opción (1 o 2): ").strip()

    if opcion == "1":
        sql = "SELECT * FROM Producto"
        cursor.execute(sql)
        productos = cursor.fetchall()

    elif opcion == "2":
        proveedor = input("Ingrese el nombre del proveedor: ").strip()

        sql = """
            SELECT *
            FROM Producto
            WHERE LOWER(proveedor) = LOWER(%s)
        """
        cursor.execute(sql, (proveedor,))
        productos = cursor.fetchall()

    else:
        print("Opción inválida.")
        return

    if len(productos) == 0:
        print("No existen productos para mostrar.")
    else:
        print("\nProductos encontrados:")
        for p in productos:
            print(p)


def editar_inventario():
    print("\n===== EDITAR PRODUCTO EN EL INVENTARIO=====")
    id_producto = input("ID del producto: ")
    id_catalogo = input("Nuevo ID del catálogo: ")
    marca = input("Nueva Marca: ")
    descripcion = input("Nueva Descripción: ")
    costo = input("Nuevo Costo: ")
    proveedor = input("Nuevo Proveedor: ")
    inventario = input("Nueva Cantidad en inventario: ")
    
    args = (id_producto,id_catalogo,marca,descripcion,costo,proveedor,inventario)
    cursor.callproc("sp_update_producto",args)
    miConexion.commit()

    if cursor.rowcount == 0:
        print("No existe un producto con ese ID.")
    else:
        print("Producto actualizado correctamente.")


def eliminar_inventario():
    print("\n===== ELIMINAR PRODUCTO EN EL INVENTARIO=====")
    id_producto = input("ID del producto a eliminar: ")

    cursor.callproc("sp_delete_producto",(id_producto,))
    miConexion.commit()

    if cursor.rowcount == 0:
        print("No existe un producto con ese ID.")
    else:
        print("Producto eliminado correctamente.")
    
#gestion Empleados
def menu_empleados():
    while True:
        print("\n----- GESTIÓN DE Empleados -----")
        print("1. Registrar Empleado")
        print("2. Consultar Empleado")
        print("3. Editar Empleado")
        print("4. Eliminar Empleado")
        print("5. Volver")

        op = input("Seleccione: ")

        if op == "1":
            gestion_empleado()
        elif op == "2":
            consultar_empleados()
        elif op == "3":
            editar_empleado()
        elif op == "4":
            eliminar_empleado()
        elif op == "5":
            break
        else:
            print("Opción inválida")


def gestion_empleado():
    print("\n===== REGISTRAR EMPLEADO =====")
    nombre = input("nombre del empleado: ")
    apellido = input("apellido del empleado: ")
    cedula = input("cedula del empleado: ")
    telefono = input("telefono del empleado: ")
    tipo = input("tipo de del empleado (tecnico/cajero): ").lower()
    
    args = (nombre,apellido,cedula,telefono,tipo)
    cursor.callproc("sp_insert_empleado",args)
    miConexion.commit()

    print("Producto registrado correctamente")


def consultar_empleados():
    print("\n===== LISTADO DE EMPLEADOS =====")

    sql = "SELECT * FROM empleado"
    cursor.execute(sql)
    productos = cursor.fetchall()

    if len(productos) == 0:
        print("No existen empleados registrados.")
    else:
        print("Productos registrados:")
        for p in productos:
            print(p)


def editar_empleado():
    print("\n===== EDITAR EMPLEADO =====")
    id_empleado = input("Ingrese el id del empleado: ")
    nombre = input("nombre del empleado: ")
    apellido = input("apellido del empleado: ")
    cedula = input("cedula del empleado: ")
    telefono = input("telefono del empleado: ")
    tipo = input("tipo de del empleado (tecnico/cajero): ").lower()
    
    args = (id_empleado,nombre,apellido,cedula,telefono,tipo)
    cursor.callproc("sp_update_empleado",args)
    miConexion.commit()
    if cursor.rowcount == 0:
        print("No existe un producto con ese ID.")
    else:
        print("Producto actualizado correctamente.")


def eliminar_empleado():
    print("\n===== ELIMINAR EMPLEADO =====")
    cedula_empleado = input("ID del empleado a eliminar: ")

    cursor.callproc("sp_delete_empleado",(cedula_empleado,))
    miConexion.commit()

    if cursor.rowcount == 0:
        print("No existe un producto con ese ID.")
    else:
        print("Producto eliminado correctamente.")

    
#gestion Equipo
def menu_equipo():
    while True:
        print("\n----- GESTIÓN DE EQUIPOS -----")
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
    print("\n----- REGISTRO DE EQUIPO -----")
    marcha = input("Registrar marca del equipo: ")
    modelo = input("Registrar modelo del equipo: ")
    numero_serial = input("Registrar numero serial del equipo: ")
    # Codigo para obtener la opcion de equipo
    opcion_equipo = int(input("Ingrese el tipo de equipo, ingresando el numero de la opcion de la siguiente lista: \n 1)computadora \n 2)celular \n 3)impresora \n 4)No especificado"))
    TIPO_DE_EQUIPO = { 1:"computadora", 2:"celular",3:"impresora",4:None}

    if opcion_equipo < 1 or opcion_equipo > 4:
        print("Operacion cancelada, el numero de opcion no es valido")
        return
    
    tipo_equipo = TIPO_DE_EQUIPO[opcion_equipo]
    #
    estado_equipo = input("Registrar estado del equipo: ")    
    if estado_equipo == "": estado_equipo = None

    descripcion = input("Registrar descripcion del equipo: ")
    if descripcion == "": descripcion = None

    codigo_seguridad = input("Registrar codigo de seguridad del equipo: ")
    if codigo_seguridad == "": codigo_seguridad = None

    id_cliente = input("Registrar id del cliente del equipo: ")
    if id_cliente == "": id_cliente = None

    args = (marcha,modelo,numero_serial,tipo_equipo,estado_equipo,descripcion,codigo_seguridad,id_cliente)
    cursor.callproc("sp_insert_equipo",args)
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
    
    marcha = input("Registrar marca del equipo: ")
    modelo = input("Registrar modelo del equipo: ")
    numero_serial = input("Registrar numero serial del equipo: ")

    # Codigo para obtener la opcion de equipo
    opcion_equipo = int(input("Ingrese el tipo de equipo, ingresando el numero de la opcion de la siguiente lista: \n 1)computadora \n 2)celular \n 3)impresora \n 4)No especificado"))
    TIPO_DE_EQUIPO = { 1:"computadora", 2:"celular",3:"impresora",4:None}

    if opcion_equipo < 1 or opcion_equipo > 4:
        print("Operacion cancelada, el numero de opcion no es valido")
        return
    
    tipo_equipo = TIPO_DE_EQUIPO[opcion_equipo]
    #
    estado_equipo = input("Registrar estado del equipo: ")    
    if estado_equipo == "": estado_equipo = None

    descripcion = input("Registrar descripcion del equipo: ")
    if descripcion == "": descripcion = None

    codigo_seguridad = input("Registrar codigo de seguridad del equipo: ")
    if codigo_seguridad == "": codigo_seguridad = None

    id_cliente = input("Registrar id del cliente del equipo: ")
    if id_cliente == "": id_cliente = None

    args = (id_equipo,marcha,modelo,numero_serial,tipo_equipo,estado_equipo,descripcion,codigo_seguridad,id_cliente)
    cursor.callproc("sp_update_equipo",args)
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
            "sp_delete_servicio_tecnico",
            (id_equipo,)
        )

        cursor.callproc(
            "sp_delete_equipo",
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
