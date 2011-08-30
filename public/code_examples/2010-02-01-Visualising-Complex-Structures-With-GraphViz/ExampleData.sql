create database GraphVizDebugging
go

use GraphVizDebugging;

create table predicate (
	id uniqueidentifier primary key,
	pred_type nvarchar(20),
	left_child_id uniqueidentifier,
	right_child_id uniqueidentifier,
	root_child_id uniqueidentifier,
	field_spec_id uniqueidentifier,
	compare_type nvarchar(100),
	match_value nvarchar(4000),
	is_deleted bit not null default(0))
	
create table fieldspec (
	id uniqueidentifier primary key,
	name nvarchar(100),
	field_type nvarchar(200),
	is_required bit)
	
insert into fieldspec (id, name, field_type, is_required) values ('DF607D85-5DBA-4087-9675-B5845D387661', 'First name', 'System.String', 1);
insert into fieldspec (id, name, field_type, is_required) values ('100512F9-F3EC-4511-9DDB-1A7607561E7D', 'Last name', 'System.String', 1);
insert into fieldspec (id, name, field_type, is_required) values ('03543586-A35F-4BA9-BC13-45B461960CDF', 'Date of Birth', 'System.DateTime', 0);
insert into fieldspec (id, name, field_type, is_required) values ('D9751B20-817F-44A5-BD40-586D67A7D781', 'Address', 'System.String', 1);
insert into fieldspec (id, name, field_type, is_required) values ('C4BB16DB-1F18-460F-BC6E-029E69BF3D67', 'Location', 'System.String', 0);
insert into fieldspec (id, name, field_type, is_required) values ('46BE2568-54FD-4E9C-A62C-A101F21E1A20', 'Years Experience', 'System.Int32', 1);
insert into fieldspec (id, name, field_type, is_required) values ('578F0FCC-7274-4133-8AA8-E92E71CBA0C1', 'Willing to Relocate', 'System.Bool', 1);

insert into predicate (id, pred_type, compare_type, field_spec_id, match_value) values ('3F9E24A7-964F-475C-9935-E1D791968CC2', 'Compare', 'StringEquals', 'C4BB16DB-1F18-460F-BC6E-029E69BF3D67', 'Reading, UK'); -- Location=Reading
insert into predicate (id, pred_type, compare_type, field_spec_id, match_value) values ('FDDEA17E-40EF-4225-A9B1-44F946C202D5', 'Compare', 'BoolEquals', '578F0FCC-7274-4133-8AA8-E92E71CBA0C1', 'true'); -- Will relocate
insert into predicate (id, pred_type, compare_type, field_spec_id, match_value) values ('57FD6F03-328B-43C5-8317-49B66DFC3877', 'Compare', 'IntGreater', '46BE2568-54FD-4E9C-A62C-A101F21E1A20', '5'); -- More than 5 years experience
insert into predicate (id, pred_type, compare_type, field_spec_id, match_value) values ('E5196EBE-53F3-44C5-A9CC-84C82E598301', 'Compare', 'AgeGreaterThan', '03543586-A35F-4BA9-BC13-45B461960CDF', '21'); -- Older than 21
insert into predicate (id, pred_type, compare_type, field_spec_id, match_value) values ('34D84610-DDC8-4FC1-944C-B9DB44946B9B', 'Compare', 'AgeLessThan', '03543586-A35F-4BA9-BC13-45B461960CDF', '65'); -- Younger than 65
insert into predicate (id, pred_type, left_child_id, right_child_id) values	('58B12BE2-63C7-4E29-B3E3-0BF8ECB6DE40', 'Or', '3F9E24A7-964F-475C-9935-E1D791968CC2', 'FDDEA17E-40EF-4225-A9B1-44F946C202D5'); -- Location ok OR willing to relocate
insert into predicate (id, pred_type, left_child_id, right_child_id, is_deleted) values ('F3AC0BEF-2278-493F-A2C2-9AD5A93414F6', 'And', 'E5196EBE-53F3-44C5-A9CC-84C82E598301', '34D84610-DDC8-4FC1-944C-B9DB44946B9B', 1); -- Older than 21 AND younger than 65, deleted
insert into predicate (id, pred_type, left_child_id, right_child_id) values	('07D6EFE6-23D9-4A9D-86EB-42AC34114CA7', 'And', 'F3AC0BEF-2278-493F-A2C2-9AD5A93414F6', '58B12BE2-63C7-4E29-B3E3-0BF8ECB6DE40'); -- Age ok AND location ok
insert into predicate (id, pred_type, left_child_id, right_child_id) values	('4D32F0B2-A58D-4B33-A269-B9D68E7EC05D', 'And', '07D6EFE6-23D9-4A9D-86EB-42AC34114CA7', '57FD6F03-328B-43C5-8317-49B66DFC3877'); -- Age and location ok AND years experience ok
insert into predicate (id, pred_type, root_child_id) values ('489501F4-F170-48A6-9FE1-180165A37F1B', 'Root', '4D32F0B2-A58D-4B33-A269-B9D68E7EC05D'); -- Root (pointer to first And)