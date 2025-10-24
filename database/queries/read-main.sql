SELECT
  s.source_id,
  s.name        AS source_name,
  s.description,
  -- 재료 "이름 [수량 단위]"를 ", "로 이어 붙이기
  STRING_AGG(
    si.name || COALESCE(' ' || NULLIF(CONCAT_WS(' ', si.amount, si.unit), ''), ''),
    ', ' ORDER BY si.source_item_id
  ) AS items_line
FROM source AS s
LEFT JOIN source_item AS si
  ON si.source_id = s.source_id
GROUP BY s.source_id, s.name, s.description
ORDER BY s.source_id;
