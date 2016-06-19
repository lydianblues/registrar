CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "wp_first_name" varchar, "wp_last_name" varchar, "wp_email" varchar, "wp_id" integer, "occupation" varchar, "organization" varchar, "wp_login" varchar, "wp_display_name" varchar, "email_list" boolean, "student_discount" boolean DEFAULT 'f', "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "facilitators" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "locations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "street_1" varchar, "street_2" varchar, "city" varchar, "state" varchar, "zip" varchar, "country" varchar, "notes" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "trainings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start_date" date, "end_date" date, "code" varchar, "regular_price" integer, "group_price" integer, "student_price" integer, "early_regular_price" integer, "early_group_price" integer, "early_student_price" integer, "min_group_size" integer DEFAULT 5, "new_registration_closed" date, "early_registration_cutoff" date, "min_attendees" integer, "max_attendees" integer, "course_id" integer, "facilitator_id" integer, "location_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_trainings_on_course_id" ON "trainings" ("course_id");
CREATE INDEX "index_trainings_on_facilitator_id" ON "trainings" ("facilitator_id");
CREATE INDEX "index_trainings_on_location_id" ON "trainings" ("location_id");
CREATE TABLE "registrations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "registerable_type" varchar, "registerable_id" integer, "training_id" integer, "code" integer, "paid_for" boolean, "amt_paid" decimal(8,2), "sign_up_date" date, "auth_code" varchar, "refunded" boolean, "reg_type" varchar, "owner_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_registrations_on_registerable_type_and_registerable_id" ON "registrations" ("registerable_type", "registerable_id");
CREATE INDEX "index_registrations_on_training_id" ON "registrations" ("training_id");
CREATE INDEX "index_registrations_on_owner_id" ON "registrations" ("owner_id");
CREATE TABLE "groups" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "owner_id" integer, "tag" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_groups_on_owner_id" ON "groups" ("owner_id");
CREATE TABLE "groups_students" ("group_id" integer NOT NULL, "student_id" integer NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "admin" boolean, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "transactions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "registration_id" integer, "owner_id" integer, "status" varchar, "payment_instrument_type" varchar, "amount" decimal(8,2) DEFAULT 0.0, "transaction_id" varchar, "transaction_type" varchar, "customer_id" varchar, "processor_authorization_code" varchar, "processor_response_code" varchar, "processor_response_text" varchar, "customer_first_name" varchar, "customer_last_name" varchar, "billing_first_name" varchar, "billing_last_name" varchar, "authorization_id" varchar, "capture_id" varchar, "payer_first_name" varchar, "payer_last_name" varchar, "payer_id" varchar, "payment_id" varchar, "transaction_fee_amount" varchar, "bin" varchar, "card_type" varchar, "cardholder_name" varchar, "last_4" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_transactions_on_registration_id" ON "transactions" ("registration_id");
CREATE INDEX "index_transactions_on_owner_id" ON "transactions" ("owner_id");
CREATE TABLE "organizations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20160504223233'), ('20160505014012'), ('20160505014050'), ('20160505014123'), ('20160505015155'), ('20160509030222'), ('20160509030600'), ('20160509032020'), ('20160512181222'), ('20160527021958'), ('20160619012836');


