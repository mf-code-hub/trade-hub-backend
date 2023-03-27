INSERT INTO public.networks(id,name,rpc_url,blockchain_id,token_symbol,is_active,is_default,created_date,updated_date,deleted_date) VALUES
('3b472777-956a-4ff7-8355-843f2247143e'::uuid,'Ethereum','https://api.mycryptoapi.com/eth','etherscan','eth',TRUE,TRUE,'2022-04-25 14:07:57.999097+00',NULL,NULL);

INSERT INTO public.time_zones (id, name, abbreviation, country_iso_code, utc_offset, utc_dst_offset, is_default, is_active, created_date, updated_date, deleted_date) VALUES
('816aa2ef-a698-488a-b99e-89408bc67a0e'::uuid, 'America/Sao_Paulo', 'SP', 'BR', '-03:00:00', '-03:00:00', true, true, '2021-06-30T17:28:46.203Z', NULL, NULL);