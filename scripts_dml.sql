CREATE FUNCTION get_sons_of(father int)
RETURNS TABLE
(id int, title varchar, tipo char, idpai int) AS $
BEGIN
	RETURN QUERY
	SELECT 
		*
	FROM ( 
			SELECT
				G.id,
				G.title,
				'guia' as tipo,
				G.idpai as pai
			FROM
				public.tb_guia G
		UNION
			SELECT
				SG.id,
				SG.title,
				'item' as tipo,
				SG.idguia as pai
			FROM
				public.tb_item_guia SG
	) A
	WHERE A.pai = father;
END

$ LANGUAGE plpgsql;