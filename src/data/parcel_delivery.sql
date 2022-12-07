INSERT INTO lockers(city, street, number, zipcode, coordinates) VALUES
('Berlin', 'Prenzlauer Berg', '17', '10405', POINT(52.5284203, 13.421829384656661)),
('Berlin',  'Prenzlauer Berg', '18', '10405', POINT(52.52824190780016, 13.422743445690562));

INSERT INTO cells(locker_id) VALUES
(1),
(2),
(2),
(2),
(1),
(1),
(2),
(2),
(1),
(2);

INSERT INTO parcels(parcel_id, cell_id, size, description, image_url) VALUES
('ec311e9d-809a-4d39-a1ff-98eb837250b1' , NULL, 'small', 'small parcel 1', 'https://avatars.githubusercontent.com/u/32607881?s=200&v=4'),
('93885a32-1710-455e-8ef7-0660599d3f62' , NULL, 'small', 'small parcel 2', 'https://avatars.githubusercontent.com/u/32607881?s=200&v=4'),
('bdb688b4-cac7-493c-9341-90d075bcccd3' , NULL, 'large', 'large parcel 2', 'https://avatars.githubusercontent.com/u/32607881?s=200&v=4');

