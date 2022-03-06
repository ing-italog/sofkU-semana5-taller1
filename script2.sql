-- -----------------------------------------------------
--[Consulta SQL donde pueda obtener los productos vendidos 
-- digitando tipo de documento y número de documento del cliente]
-- -----------------------------------------------------
USE small_ferreteria;
SELECT list_item.item_id , list_item.ordered_units,  list_item.final_price, item.name
FROM list_item 
INNER JOIN item 
ON list_item.item_id = item.item_id WHERE invoice_id
IN
(SELECT inv_id FROM invoice WHERE costumer_id 
IN 
(SELECT cost_id FROM costumer WHERE num_doc = 1219644818 AND id_type = 3));



-- -----------------------------------------------------
--[Consultar productos por medio del nombre, el cual debe 
-- mostrar quien o quienes han sido sus proveedores]
-- -----------------------------------------------------
USE small_ferreteria;
SELECT rut, name, adreess, phone, email
FROM provider
WHERE pro_id
IN
(SELECT provider_id FROM provider_list_product WHERE item_id
IN
(SELECT item_id FROM item WHERE name = "martillo"));



-- -----------------------------------------------------
--[PLUS no obligatorio] Crear una consulta que me permita
-- ver qué producto ha sido el más vendido y en qué 
-- cantidades de mayor a menor]
-- -----------------------------------------------------
USE small_ferreteria;
SELECT list_item.item_id, item.name,SUM(list_item.ordered_units) 
AS unts_vendidas
FROM list_item 
INNER JOIN item
ON list_item.item_id = item.item_id
GROUP BY item_id
ORDER BY unts_vendidas 
DESC;