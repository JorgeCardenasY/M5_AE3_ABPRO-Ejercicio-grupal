# 🗃️ M5_AE3_ABPRO-Ejercicio grupal[Actividad Evaluada]  

### ✅ Requisitos de finalización  
**Hecho**: 👀 Ver  
**Por hacer**: 🛠️ Hacer un envío  

---

## 👥 Ejercicio grupal  

### 📌 Contexto  
Un grupo de 3 amigos ha creado un emprendimiento llamado **“RECITRONIC”** ♻️, dedicado al reciclaje de electrónicos. Reciben pedidos para retirar artículos electrónicos en desuso, pero no tienen un sistema de gestión para coordinar las citas de manera eficiente. El proceso se lleva a cabo manualmente en un cuaderno 📓, lo que ha ocasionado:  
- 🚚 Sobrecarga de trabajo  
- 📅 Citas duplicadas  
- ❌ Falta de control sobre los artículos reciclados  

---

## 🎯 Requerimientos de la Actividad  

### 🗄️ Base de Datos y Tablas:  
Crear las siguientes tablas en una base de datos:  
- **Clientes**: 📇 Almacenar información de clientes.  
- **Artículos**: 💻 Registrar artículos electrónicos para reciclar.  
- **Citas**: 🗓️ Registrar citas agendadas para retiros.  
- **Pagos**: 💰 Registrar pagos por servicios.  

---

### ⚡ Manipulación de Datos (DML):  
#### 📥 Insertar Información:  
- Insertar registros de clientes.  
- Insertar artículos reciclados por cliente.  
- Insertar citas para retiros.  
- Insertar pagos realizados.  

#### 🔄 Actualizar Información:  
- Actualizar fechas de citas por conflictos 🚧.  
- Actualizar estado de artículos (ej: de "pendiente" a "reciclado") ✅.  

#### 🗑️ Eliminar Información:  
- Eliminar artículos ingresados por error ❌.  
- Eliminar citas canceladas 🚫.  

---

### 🔒 Restricciones y Transacciones:  
- Usar restricciones para integridad referencial 🔗.  
- Usar secuencias para IDs únicos 🔢.  
- Usar transacciones para operaciones seguras ⚙️.  
- Garantizar propiedades ACID 🧪.  
- Ejemplo de **commit** ✅ y **rollback** ↩️.  

---

## 🚀 Pasos a Seguir  
1. **Crear Base de Datos y Tablas** 🗃️:  
   - Diseñar BD y tablas (Clientes, Artículos, Citas, Pagos).  
   - Definir PKs, FKs y restricciones.  

2. **Manipulación de Datos con SQL** 💾:  
   - Insertar registros.  
   - Actualizar información.  
   - Eliminar registros.  

3. **Transacciones** 🔄:  
   - Crear transacciones atómicas.  

4. **Secuencias y Restricciones** 🔢:  
   - Generar IDs automáticamente.  
   - Garantizar integridad referencial.  

5. **Ejemplo de Rollback y Commit** ⚠️:  
   - Demostrar confirmación o reversión de transacciones.  

---

## 🏗️ Estructura de la Base de Datos  
| Tabla       | Columnas               | Tipo         | Restricción          |
|-------------|------------------------|--------------|----------------------|
| **Clientes** | id_cliente             | INT          | PK, AUTO_INCREMENT 🆔 |
|             | nombre                 | VARCHAR      |                      |
|             | telefono               | VARCHAR      |                      |
|             | direccion              | VARCHAR      |                      |
| **Artículos**| id_articulo            | INT          | PK, AUTO_INCREMENT 🆔 |
|             | id_cliente             | INT          | FK 🔗                 |
|             | tipo_articulo          | VARCHAR      |                      |
|             | estado                 | VARCHAR      |                      |
| **Citas**   | id_cita                | INT          | PK, AUTO_INCREMENT 🆔 |
|             | id_cliente             | INT          | FK 🔗                 |
|             | fecha_hora             | DATETIME     |                      |
| **Pagos**   | id_pago                | INT          | PK, AUTO_INCREMENT 🆔 |
|             | id_cliente             | INT          | FK 🔗                 |
|             | monto                  | DECIMAL      |                      |
|             | fecha_pago             | DATETIME     |                      |

---

## 📋 Componentes para Evaluar  
- ✅ Uso correcto de DML (Insertar, Actualizar, Borrar).  
- 🔢 Implementación de secuencias.  
- 🔗 Integridad referencial.  
- ⚙️ Transacciones SQL.  
- 🚫 Restricciones (NOT NULL, FOREIGN KEY, etc.).  
- ↩️✅ Uso de COMMIT y ROLLBACK.  