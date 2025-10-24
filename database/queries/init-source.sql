INSERT INTO source (name, description)
VALUES ('건희소스', '하이디라오 기본 픽 모두가 아는 건희소스!');

INSERT INTO source_item (name, amount, unit, source_id) VALUES
('마장(땅콩)소스', '1', '스푼', (SELECT source_id FROM source WHERE name='건희소스')),
('칠리소스', '2', '스푼', (SELECT source_id FROM source WHERE name='건희소스')),
('마늘', '0.5', '스푼', (SELECT source_id FROM source WHERE name='건희소스')),
('다진 파', '0.5', '스푼', (SELECT source_id FROM source WHERE name='건희소스')),
('깨', '1', '티스푼', (SELECT source_id FROM source WHERE name='건희소스')),
('땅콩가루', '1', '티스푼', (SELECT source_id FROM source WHERE name='건희소스')),
('고춧가루', '1', '티스푼', (SELECT source_id FROM source WHERE name='건희소스')),
('설탕', '1', '티스푼', (SELECT source_id FROM source WHERE name='건희소스')),
('볶음 소고기장', '1', '티스푼', (SELECT source_id FROM source WHERE name='건희소스'));

INSERT INTO source (name, description) VALUES ('마라마라소스', '마라가 너무 좋아서 만들었습니다');
INSERT INTO source (name, description) VALUES ('토마토탕전용소스', '토마토탕이랑 잘어울려용~~~');
INSERT INTO source (name, description) VALUES ('자신있으면드루와소스', '매운거 쫌 치십니까?');
INSERT INTO source (name, description) VALUES ('엄청난소스', '아무튼 엄청난 맛이 납니다. 궁금하면 츄라이츄라이..!');
INSERT INTO source (name, description) VALUES ('시고쓰고매운소스', '호불호 끝판왕입니다!');

INSERT INTO source_item (name, amount, unit, source_id) VALUES
('마장(땅콩)소스', '1', '스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스')),
('칠리소스', '2', '스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스')),
('마늘', '0.5', '스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스')),
('다진 파', '0.5', '스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스')),
('깨', '1', '티스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스')),
('땅콩가루', '1', '티스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스')),
('고춧가루', '1', '티스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스')),
('설탕', '1', '티스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스')),
('볶음 소고기장', '1', '티스푼', (SELECT source_id FROM source WHERE name='시고쓰고매운소스'));
