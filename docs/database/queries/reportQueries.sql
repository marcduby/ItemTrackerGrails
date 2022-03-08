
-- items
select count(item.item_id), typ.type_id
from item_item item, item_type typ
where item.type_id = typ.type_id
group by typ.type_id


-- locations
select count(item.item_id) as counter, loc.location_id
from item_item item, item_location loc
where item.location_id = loc.location_id
group by loc.location_id;
