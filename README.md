# Ejercicio Grupal: RECITRONIC

## 📋 Contexto
Un grupo de 3 amigos ha creado un emprendimiento llamado **RECITRONIC**, dedicado al reciclaje de electrónicos. Actualmente gestionan pedidos manualmente en un cuaderno, lo que genera:
- Sobrecarga de trabajo
- Citas duplicadas  
- Falta de control sobre artículos reciclados

---

## 🎯 Requerimientos de la Actividad

### 🗃️ Base de Datos y Tablas
Crear las siguientes tablas con sus respectivas estructuras:

#### Tabla `Clientes`
| Campo        | Tipo         | Restricciones               |
|--------------|--------------|-----------------------------|
| `id_cliente` | INT          | PK, AUTO_INCREMENT          |
| `nombre`     | VARCHAR      |                             |
| `telefono`   | VARCHAR      |                             |
| `direccion`  | VARCHAR      |                             |

#### Tabla `Artículos`
| Campo           | Tipo    | Restricciones                            |
|-----------------|---------|------------------------------------------|
| `id_articulo`   | INT     | PK, AUTO_INCREMENT                       |
| `id_cliente`    | INT     | FK (REFERENCIA a Clientes)               |
| `tipo_articulo` | VARCHAR |                                          |
| `estado`        | VARCHAR |                                          |

#### Tabla `Citas`
| Campo         | Tipo      | Restricciones                            |
|---------------|-----------|------------------------------------------|
| `id_cita`     | INT       | PK, AUTO_INCREMENT                       |
| `id_cliente`  | INT       | FK (REFERENCIA a Clientes)               |
| `fecha_hora`  | DATETIME  |                                          |

#### Tabla `Pagos`
| Campo        | Tipo      | Restricciones                            |
|--------------|-----------|------------------------------------------|
| `id_pago`    | INT       | PK, AUTO_INCREMENT                       |
| `id_cliente` | INT       | FK (REFERENCIA a Clientes)               |
| `monto`      | DECIMAL   |                                          |
| `fecha_pago` | DATETIME  |                                          |

---

## ⚙️ Manipulación de Datos (DML)

### 📥 Insertar Información
- Registros de clientes solicitantes del servicio
- Artículos reciclados por cada cliente
- Citas para agendar retiros de artículos
- Pagos realizados por los clientes

### 🔄 Actualizar Información  
- Modificar fechas de citas por conflictos de horarios
- Cambiar estado de artículos (ej: de *"pendiente"* a *"reciclado"*)

### 🗑️ Eliminar Información
- Eliminar artículos ingresados por error
- Cancelar citas eliminando sus registros

---

## 🛡️ Restricciones y Transacciones

### 🔗 Restricciones
- Integridad referencial entre tablas
- Validación de existencia de clientes antes de crear citas
- Restricciones `NOT NULL`, `FOREIGN KEY`, etc.

### 🔄 Secuencias
- Identificadores únicos automáticos para:
  - Citas
  - Clientes  
  - Pagos

### 💾 Transacciones ACID
- **Atomicidad**: Operaciones completas o revertidas
- **Consistencia**: Validación de reglas pre/post transacción
- **Aislamiento**: Ejecución independiente de transacciones
- **Durabilidad**: Persistencia de cambios confirmados

### ⚠️ Ejemplo de Rollback/Commit
Transacción demostrativa con:
- Confirmación (`COMMIT`) si todas las operaciones son exitosas
- Reversión (`ROLLBACK`) si ocurre cualquier error

---

## 🚀 Pasos a Seguir

### 1. Creación de Base de Datos y Tablas
- Diseñar estructura con claves primarias y foráneas
- Implementar restricciones de integridad

### 2. Manipulación de Datos con SQL
- Insertar datos de ejemplo
- Realizar actualizaciones y eliminaciones

### 3. Demostración de Transacciones  
- Crear transacción con operaciones múltiples
- Validar atomicidad con rollback/commit

### 4. Implementación de Secuencias
- Generar IDs automáticos con secuencias
- Vincular con tablas correspondientes

---

## 📊 Componentes para Evaluar

| Componente               | Descripción                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| **Uso de DML**           | Correcta inserción, actualización y eliminación de registros                |
| **Secuencias**           | Generación automática de identificadores únicos                            |
| **Integridad Referencial** | Consistencia en relaciones entre tablas                                   |
| **Transacciones SQL**    | Implementación de operaciones atómicas con COMMIT/ROLLBACK                  |
| **Restricciones**        | Uso de NOT NULL, FOREIGN KEY y validaciones adicionales                     |
| **Confirmación**         | Manejo correcto de confirmaciones y reversiones de transacciones            |
