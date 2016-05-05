CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar, "last_name" varchar, "email" varchar, "occupation" varchar, "organization" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "facilitators" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "locations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "address" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "trainings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start_date" date, "end_date" date, "code" varchar, "early_cost" decimal(8,2), "late_cost" decimal(8,2), "staff_cost" decimal(8,2), "new_registration_closed" date, "early_registration_cutoff" date, "min_attendees" integer, "max_attendees" integer, "course_id" integer, "facilitator_id" integer, "location_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_trainings_on_course_id" ON "trainings" ("course_id");
CREATE INDEX "index_trainings_on_facilitator_id" ON "trainings" ("facilitator_id");
CREATE INDEX "index_trainings_on_location_id" ON "trainings" ("location_id");
INSERT INTO schema_migrations (version) VALUES ('20160504223233'), ('20160505014012'), ('20160505014050'), ('20160505014123'), ('20160505015155');


