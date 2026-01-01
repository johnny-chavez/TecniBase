def menu_principal():
    while True:
        print("\n========== MENÚ ==========")
        print("1. Registrar Cliente")
        print("2. Registrar Servicio")
        print("3. Control Técnico")
        print("4. Registrar Venta / Factura")
        print("5. Gestión de Inventario")
        print("6. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            registrar_cliente()
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


def registrar_cliente():
    print("\n----- REGISTRAR CLIENTE -----")
    input("ID del cliente: ")
    input("Nombre: ")
    input("Dirección: ")
    input("Teléfono: ")
    input("Correo electrónico: ")
    print("Cliente registrado.")


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
