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
            menu_servicio()
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
    try:
        
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
        
        print("Cliente registrado.")

    except Exception as e:
                print(e)

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
    try:
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
    except Exception as e:
            print(e)

def eliminar_cliente():
    try:
        print("\n===== ELIMINAR CLIENTE =====")
        id_cliente = input("ID del cliente a eliminar: ")

        confirmacion = input("¿Seguro que desea eliminar este cliente? (s/n): ").lower()
        if confirmacion != "s":
            print("Operacion cancelada")
            return
    
        cursor.callproc("sp_delete_cliente",(id_cliente,))

        if cursor.rowcount == 0:
            print("No existe un cliente con ese ID")
        else:
            print ("Cliente eliminado correctamente")
    except Exception as e:
            print(e)

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
    try:
        print("\n----- REGISTRAR SERVICIO -----")
        fecha = input("Fecha del servicio (YYYY-MM-DD): ")
        id_cliente = input("ID del cliente: ")
        tipo = input("Tipo de servicio (S o V): ")

        args = (fecha,id_cliente,tipo)

        cursor.callproc("sp_insert_servicio_prestado",args)

        print("Servicio registrado.")
    except Exception as e:
            print(e)

def consultar_servicio():

    print("\n===== LISTADO DE SERVICIOS =====")
    cursor.execute("SELECT * FROM servicio_prestado")
    servicios = cursor.fetchall()

    if not servicios:
        print("No hay servicios registrados.")
    else:
        for c in servicios:
            print(c)


def editar_servicio():
    try:
        id_servicio = input("ID del servicio a editar: ")
        fecha = input("Fecha del servicio (YYYY-MM-DD): ")
        id_cliente = input("ID del cliente: ")
        nuevo_tipo = input("Nuevo tipo de servicio: ")

        args = (id_servicio,fecha,id_cliente,nuevo_tipo)
        cursor.callproc("sp_update_servicio_prestado", args)

        print("Servicio actualizado.")
    except Exception as e:
            print(e)


def eliminar_servicio():
    try:
        id_servicio = input("ID del servicio a eliminar: ")

        cursor.callproc("sp_delete_servicio_prestado",(id_servicio,))

        print("Servicio eliminado.")
    except Exception as e:
            print(e)


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
        print("No hay servicios tecnicos registrados.")
    else:
        for c in clientes:
            print(c)

def registrar_servicio_tecnico():
    try:
        id_servicio = input("Ingrese id del servicio prestado: ")
        tipo = input("Ingrese el tipo de servicio: ")
        descripcion = input("Ingrese su descripcion: ")
        piezas_utilizadas = input("Ingrese piezas utilizadas: ")
        id_equipo = input("Ingrese Id del equipo reparado: ")
        id_empleado = input("Ingrese id del empleado dueño del equipo: ")

        args = (id_servicio,tipo,descripcion,piezas_utilizadas,id_equipo,id_empleado)

        cursor.callproc("sp_insert_servicio_tecnico",args)

        print("Servicio tecnico Registrado.")

    except Exception as e:
            print(e)

def actualizar_servicio_tecnico():
    try:
        id_servicio = input("Ingrese id del servicio tecnico: ")
        tipo = input("Ingrese el tipo de servicio: ")
        descripcion = input("Ingrese su descripcion: ")
        piezas_utilizadas = input("Ingrese piezas utilizadas: ")
        id_equipo = input("Ingrese Id del equipo reparado: ")
        id_empleado = input("Ingrese id del empleado dueño del equipo: ")

        args = (id_servicio,tipo,descripcion,piezas_utilizadas,id_equipo,id_empleado)

        cursor.callproc("sp_update_servicio_tecnico",args)

        print("Servicio tecnico Actualizado.")

    except Exception as e:
            print(e)

def eliminar_servicio_tecnico():
    try:
        id_servicio_tec = input("ID del servicio tecnico a eliminar: ")

        cursor.callproc("sp_delete_servicio_tecnico",(id_servicio_tec,))

        print("Servicio tecnico eliminado.")

    except Exception as e:
            print(e)

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
    try:

        print("\n----- REGISTRAR VENTA -----")

        id_servicio = input("ID del servicio solicitado: ")
        tipo_pago = input("Método de pago: ")
        id_cajero = input("ID del cajero: ")

        args = (id_servicio,tipo_pago,id_cajero)

        cursor.callproc("sp_insert_venta",args)

        print("Pago registrado y factura generada.")

    except Exception as e:
            print(e)


def consultar_venta():
    print("\n===== LISTADO DE VENTAS =====")
    cursor.execute("SELECT * FROM venta")
    venta = cursor.fetchall()

    if not venta:
        print("No hay ventas registradas.")
    else:
        for c in venta:
            print(c)


def editar_venta():
    try:

        id_venta = input("ID de la venta: ")
        tipo_pago = input("Nuevo método de pago: ")
        id_cajero = input("ID del cajero: ")

        args = (id_venta,tipo_pago,id_cajero)
        cursor.callproc("sp_update_venta", args)

        print("Venta actualizada.")

    except Exception as e:
            print(e)


def eliminar_venta():
    try:
        p_id_venta = input("ID de la venta: ")
        cursor.callproc("sp_delete_venta", (p_id_venta,))
        
        print("Venta eliminada.")

    except Exception as e:
            print(e)


def registrar_factura():
    try:

        print("Tenga en cuenta que solo puede existir una factura por servicio prestado")
        print("")
        id_servicio = input("ID del servicio: ")
        nro = input("Número de factura: ")
        fecha = input("Fecha de emisión (YYYY-MM-DD): ")
        total = input("Monto total: ")

        args = (id_servicio,nro,fecha,total)

        cursor.callproc("sp_insert_factura",args)

        print("Factura registrada.")

    except Exception as e:
            print(e)


def consultar_factura():

    print("\n===== LISTADO DE FACTURAS =====")
    cursor.execute("SELECT * FROM factura")
    factura = cursor.fetchall()

    if not factura:
        print("No hay facturas registradas.")
    else:
        for c in factura:
            print(c)


def editar_factura():
    try:

        id_factura = input("ID del servicio: ")
        nro = input("Nuevo número de factura: ")
        fecha = input("Nueva Fecha de emisión (YYYY-MM-DD): ")
        total = input("Nuevo Monto total: ")

        args = (id_factura,nro,fecha,total)
        cursor.callproc("sp_update_factura",args)

        print("Factura actualizada.")

    except Exception as e:
            print(e)


def eliminar_factura():
    try:
        
        id_servicio = input("ID del servicio: ")
        cursor.callproc("sp_delete_factura",(id_servicio,))
        
        print("Factura eliminada.")

    except Exception as e:
            print(e)

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
    try:

        print("\n===== REGISTRAR PRODUCTO =====")
        id_catalogo = input("ID del catálogo: ")
        marca = input("Marca: ")
        descripcion = input("Descripción: ")
        costo = input("Costo: ")
        proveedor = input("Proveedor: ")
        inventario = input("Cantidad en inventario: ")
        
        args = (id_catalogo,marca,descripcion,costo,proveedor,inventario)
        cursor.callproc("sp_insert_producto",args)

        print("Producto registrado correctamente")
    
    except Exception as e:
            print(e)


def consultar_inventario():

    print("\n===== LISTADO DE PRODUCTOS =====")
    cursor.execute("SELECT * FROM Producto")
    productos = cursor.fetchall()

    if not productos:
        print("No hay productos registrados.")
    else:
        for c in productos:
            print(c)



def editar_inventario():
    try:
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

        if cursor.rowcount == 0:
            print("No existe un producto con ese ID.")
        else:
            print("Producto actualizado correctamente.")

    except Exception as e:
            print(e)


def eliminar_inventario():
    try:

        print("\n===== ELIMINAR PRODUCTO EN EL INVENTARIO=====")
        id_producto = input("ID del producto a eliminar: ")

        cursor.callproc("sp_delete_producto",(id_producto,))

        if cursor.rowcount == 0:
            print("No existe un producto con ese ID.")
        else:
            print("Producto eliminado correctamente.")

    except Exception as e:
            print(e)
    
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
    try:

        print("\n===== REGISTRAR EMPLEADO =====")
        nombre = input("nombre del empleado: ")
        apellido = input("apellido del empleado: ")
        cedula = input("cedula del empleado: ")
        telefono = input("telefono del empleado: ")
        tipo = input("tipo de del empleado (tecnico/cajero): ").lower()
        
        args = (nombre,apellido,cedula,telefono,tipo)
        cursor.callproc("sp_insert_empleado",args)

        print("Producto registrado correctamente")

    except Exception as e:
            print(e)

def consultar_empleados():

    print("\n===== LISTADO DE EMPLEADOS =====")
    cursor.execute("SELECT * FROM empleado")
    empleados = cursor.fetchall()

    if not empleados:
        print("No hay empleados registrados.")
    else:
        for c in empleados:
            print(c)


def editar_empleado():
    try:

        print("\n===== EDITAR EMPLEADO =====")
        id_empleado = input("Ingrese el id del empleado: ")
        nombre = input("nombre del empleado: ")
        apellido = input("apellido del empleado: ")
        cedula = input("cedula del empleado: ")
        telefono = input("telefono del empleado: ")
        tipo = input("tipo de del empleado (tecnico/cajero): ").lower()
        
        args = (id_empleado,nombre,apellido,cedula,telefono,tipo)
        cursor.callproc("sp_update_empleado",args)

        if cursor.rowcount == 0:
            print("No existe un empleado con ese ID.")
        else:
            print("Empleado actualizado correctamente.")

    except Exception as e:
            print(e)


def eliminar_empleado():
    try:

        print("\n===== ELIMINAR EMPLEADO =====")
        cedula_empleado = input("CEDULA del empleado a eliminar: ")

        cursor.callproc("sp_delete_empleado",(cedula_empleado,))

        if cursor.rowcount == 0:
            print("No existe un empleado con esa Cedula.")
        else:
            print("Empleado eliminado correctamente.")

    except Exception as e:
            print(e)

    
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
    try:
        print("\n----- REGISTRO DE EQUIPO -----")
        marcha = input("Registrar marca del equipo: ")
        modelo = input("Registrar modelo del equipo: ")
        numero_serial = input("Registrar numero serial del equipo: ")
        # Codigo para obtener la opcion de equipo
        opcion_equipo = int(input("Ingrese el tipo de equipo, ingresando el numero de la opcion de la siguiente lista: \n 1)computadora \n 2)celular \n 3)impresora \n 4)No especificado \n"))
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

        print("Inventario actualizado.")

    except Exception as e:
            print(e)

def consultar_equipo():
    
    print("\n===== LISTADO DE EQUIPOS =====")
    cursor.execute("SELECT * FROM equipo")
    equipos = cursor.fetchall()

    if not equipos:
        print("No hay equipos registrados.")
    else:
        for c in equipos:
            print(c)



def editar_equipo():
    try:
        id_equipo = input("ID del equipo: ")
        
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

        print("Inventario actualizado.")

    except Exception as e:
            print(e)

def eliminar_equipo():
    id_equipo = input("ID del equipo a eliminar: ")

    confirmacion = input("¿Seguro que desea eliminar este cliente? (s/n): ").lower().strip()
    if confirmacion != "s":
        print("Operacion cancelada")
        return
    
    try:

        cursor.callproc(
            "sp_delete_equipo",
            (id_equipo,)
        )

    except Exception as e:
        print(e)

    if cursor.rowcount == 0:
        print("No existe un equipo con ese ID")
    else:
        print ("Equipo eliminado correctamente")

menu_principal()
