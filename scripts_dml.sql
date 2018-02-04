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