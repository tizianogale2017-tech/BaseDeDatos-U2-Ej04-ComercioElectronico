# ComercioElectronico

Base de Datos - Unidad 1 - Ejercicio 0X

## Consigna
Modelar el esquema de datos de una plataforma de comercio electrónico, contemplando categorías de productos (con subcategorías), productos, clientes, direcciones de envío, pedidos, el detalle de cada pedido y el transportista que lo despacha.

## Lógica
- **CATEGORIA** se autorrelaciona (`subcat`, 1:N) para permitir categorías padre/hijo, y se relaciona 1:N con **PRODUCTO** (`clasifica`), ya que una categoría agrupa varios productos.
- **CLIENTE** se relaciona 1:N con **DIRECCION** (`registra`, un cliente puede tener varias direcciones) y 1:N con **PEDIDO** (`genera`).
- **DIRECCION** se relaciona 1:N con **PEDIDO** (`recibe`), indicando a qué dirección se envía cada pedido.
- **TRANSPORTISTA** se relaciona 1:N con **PEDIDO** (`despacha`).
- La relación M:N entre **PEDIDO** y **PRODUCTO** se resolvió con la entidad intermedia **DETALLE_PEDIDO**, conectada con 1:N a **PEDIDO** (`contiene`) y 1:N a **PRODUCTO** (`incluye`). Esta entidad guarda los datos propios de esa línea de pedido (cantidad, precio al momento de la compra, etc.), ya que el precio del producto puede cambiar con el tiempo y necesitamos el valor histórico.

## Resultado
<img width="2340" height="2100" alt="BaseDeDatos-U1-Ej04-ComercioElectronico" src="https://github.com/user-attachments/assets/f753e430-1822-4816-83de-df9d41524b9c" />
