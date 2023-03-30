UPDATE PUBLIC.campaign_statuses
SET NAME = 'Draft'
WHERE id = 'f8dcbcdd-8ab9-4eeb-8f4c-81c23778f8a8';


UPDATE PUBLIC.season_statuses
SET NAME = 'Draft'
WHERE id = '59bcfb98-f3f0-4c93-8fa5-caf39a554451';


DELETE
FROM PUBLIC.season_statuses
WHERE id = '69b393e2-08b8-4a10-a5f3-8ef15011b642';


INSERT INTO PUBLIC.campaign_statuses (id, NAME, created_date, updated_date, deleted_date)
VALUES ('e912dd11-7a87-46a4-a039-550c9bf68c8a', 'WaitingAdminsApproval', Now(), NULL, NULL),
       ('42beec31-d0bc-4812-b564-ef6dbbbf81c9', 'DeniedByAdmins', Now(), NULL, NULL),
       ('bedc0598-7b8b-4285-b40e-ba75299e9d67', 'ApprovedByAdmins', Now(), NULL, NULL),
       ('ba29a7c8-9cdb-48b6-8cc0-ae1b9e25f0f7', 'Active', Now(), NULL, NULL);


INSERT INTO PUBLIC.season_statuses (id, NAME, created_date, updated_date, deleted_date)
VALUES ('62f34f5f-99c1-49b8-b1ea-6a17049f43cf', 'WaitingAdminsApproval', Now(), NULL, NULL),
       ('23761aa0-0b5f-42a4-a29d-8981747d63cd', 'DeniedByAdmins', Now(), NULL, NULL),
       ('530ae30c-bcc7-4076-a3fd-e6858af33fd2', 'ApprovedByAdmins', Now(), NULL, NULL),
       ('74058bc5-2c07-4a14-aba9-b64e33253e18', 'Published', Now(), NULL, NULL),
       ('df0161a1-7312-48d1-931c-47b762d3e359', 'Auction', Now(), NULL, NULL),
       ('42901df9-3ed7-475d-ba8b-1cc2f6b01344', 'Auctioned', Now(), NULL, NULL);
