#  mysql -u root -phar526 dmind_wp < clean-login.sql

delete from wp_options where option_name = 'cl_login_redirect_url';
delete from wp_options where option_name = 'cl_login_url';
delete from wp_options where option_name = 'cl_logout_redirect_url';
delete from wp_options where option_name = 'cl_register_url';
delete from wp_options where option_name = 'cl_restore_url';
delete from wp_options where option_name = 'cl_edit_url';

insert into wp_options (option_name, option_value) values ('cl_login_redirect_url', 'https://dmind.org/payment');
insert into wp_options (option_name, option_value) values ('cl_login_url', 'https://dmind.org/account/register-login');
insert into wp_options (option_name, option_value) values ('cl_logout_redirect_url', 'https://dmind.org/');
insert into wp_options (option_name, option_value) values ('cl_register_url', 'https://dmind.org/account/register-create');
insert into wp_options (option_name, option_value) values ('cl_restore_url', 'https://dmind.org/account/register-recover');
insert into wp_options (option_name, option_value) values ('cl_edit_url', 'https://dmind.org/account/register-edit');

