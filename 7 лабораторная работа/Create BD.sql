CREATE TABLE bot.subject
(
	id serial PRIMARY KEY,
	name varchar(128) NOT NULL
);

CREATE TABLE bot.subject_type
(
	id serial PRIMARY KEY,
	name varchar(128) NOT NULL
);

CREATE TABLE bot.class
(
	id serial PRIMARY KEY,
	subject int NOT NULL REFERENCES bot.subject(id),
	subject_type int NOT NULL REFERENCES bot.subject_type(id)
);

CREATE TABLE bot.time
(
	id serial PRIMARY KEY,
	start_time varchar(64) NOT NULL
);


CREATE TABLE bot.teacher
(
	id serial PRIMARY KEY,
	full_name varchar(256) NOT NULL
);

CREATE TABLE bot.teacher_subject
(
	id serial PRIMARY KEY,
	teacher int NOT NULL REFERENCES bot.teacher(id),
	class int NOT NULL REFERENCES bot.class(id)
);

CREATE TABLE bot.timetable
(
	id serial PRIMARY KEY,
	week int NOT NULL,
	day int NOT NULL,
	class int NOT NULL REFERENCES bot.class(id),
	class_time int NOT NULL REFERENCES bot.time(id),
	room_number varchar(64) NOT NULL
);
