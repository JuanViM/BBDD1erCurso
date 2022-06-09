# 1. Obtener el nombre y teléfono de los clientes que han comprado el producto con código “C124”.
Select nombre,tfno from cliente cli,compra com where cli.dni = com.dni and com.codigo="C124";

# 2. Obtener los productos que suministra el proveedor con nif “27275621X”.
Select prod.nombre from producto prod,suministra sum where sum.codigo = prod.codigo and nif = "27275621X";

# 3. Obtener el nombre de los proveedores que han suministrado los productos que compra el cliente con dni “12563465F”. Debe eliminar duplicados.
select distinct pro.nombre from proveedor pro,compra com,suministra su where su.codigo = com.codigo and com.dni = "12563465F";

# 4. Obtener cuántos clientes han comprado el producto con código “C125”.
select count(cli.nombre) from cliente cli, compra com where cli.dni = com.dni and com.codigo = "C125";

#5. Obtener el producto que tiene mayor precio.
SELECT nombre FROM producto WHERE precio = (SELECT max(precio) FROM producto);

# 6. Obtener la media de los precios de los productos suministrados por el proveedor con cif “75268547G”.
select avg(precio) from producto pro,suministra su where pro.codigo = su.codigo and su.nif = "75268547G";