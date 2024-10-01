COMMENT ON TABLE person_discounts IS 'Таблица с персональными скидками для клиентов в различных пиццериях';
COMMENT ON COLUMN person_discounts.id IS 'Столбец c идентификатором персональной скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'Столбец c идентификатором клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Столбец c идентификатором пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Столбец с значением скидки в процентах';
