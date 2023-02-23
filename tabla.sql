CREATE TABLE "ca_categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

CREATE TABLE "ca_roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

CREATE TABLE "tb_courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "category" int NOT NULL,
  "title" int NOT NULL,
  "descritpion" varchar(200) NOT NULL,
  "level" varchar(15) NOT NULL,
  "teacher" int NOT NULL
);

CREATE TABLE "tb_courses_video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course" int NOT NULL,
  "title" varchar(50) NOT NULL,
  "url" varchar(100) NOT NULL
);

CREATE TABLE "tb_users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "rol" int NOT NULL,
  "name" varchar(50) NOT NULL,
  "email" varchar(50) NOT NULL,
  "password" varchar(15) NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "tb_users_courses" (
  "id_user" int NOT NULL,
  "id_course" int NOT NULL
);

CREATE TABLE "tb_teachers" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(50) NOT NULL
);

ALTER TABLE "tb_users" ADD FOREIGN KEY ("rol") REFERENCES "ca_roles" ("id");

ALTER TABLE "tb_users_courses" ADD FOREIGN KEY ("id_user") REFERENCES "tb_users" ("id");

ALTER TABLE "tb_users_courses" ADD FOREIGN KEY ("id_course") REFERENCES "tb_courses" ("id");

ALTER TABLE "tb_courses" ADD FOREIGN KEY ("category") REFERENCES "ca_categories" ("id");

ALTER TABLE "tb_courses" ADD FOREIGN KEY ("title") REFERENCES "tb_courses_video" ("id");

ALTER TABLE "tb_courses" ADD FOREIGN KEY ("teacher") REFERENCES "tb_teachers" ("id");

INSERT INTO tb_courses_video (course, title, url) VALUES (1, 'React', 'react.com'), (2, 'Node', 'Node.com');

INSERT INTO tb_teachers (name) VALUES ('Alejandra'), ('Enrique');

INSERT INTO ca_roles (name) VALUES ('student'), ('teacher');

INSERT INTO tb_courses (category, title, description, level, teacher) VALUES (1, 2, 'Aprenderemos Node', 'advanced', 2), (2, 1, 'Aprenderemos React', 'medium', 2);

INSERT INTO ca_categories (name) VALUES ('Programming');

INSERT INTO tb_users (rol, name, email, password, age) VALUES (1, 'Gerardo', 'gerardo@gmail', 'password', 27), (2, 'Enrique', 'enrique@gmail', 'password', 35);

INSERT INTO tb_users_courses (id_user, id_course) VALUES (1, 1), (2, 2);