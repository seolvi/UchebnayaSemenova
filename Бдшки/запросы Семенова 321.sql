

--------------------лабораторная работа 2----------------
CREATE TABLE Academics
 (
  Id_Academics int CONSTRAINT PK_Full_Academics PRIMARY KEY	IDENTITY,
  FullName_Academics NVARCHAR(MAX),
  DateBorn_Academics DATE,
  Specialization_Academics NVARCHAR(50),
  YearAssigment_Academics INT
 );

INSERT dbo.Academics
VALUES
    ('Аничков Николай Николаевич', '1885-11-03', 'медицина', 1939),
    ('Бартольд Василий Владимирович', '1869-11-15', 'историк', 1913),
    ('Белопольский Аристарх Аполлонович', '1854-07-13', 'астрофизик', 1903),
    ('Бородин Иван Парфеньевич', '1847-01-30', 'ботаник', 1902),
    ('Вальден Павел Иванович', '1863-07-26', 'химик-технолог', 1910),
    ('Вернадский Владимир Иванович', '1863-03-12', 'геохимик', 1908),
    ('Виноградов Павел Гаврилович', '1854-11-30', 'историк', 1914),
    ('Ипатьев Владимир Николаевич', '1867-11-21', 'химик', 1916),
    ('Истрин Василий Михайлович', '1865-02-22', 'филолог', 1907),
    ('Карпинский Александр Петрович', '1847-01-07', 'геолог', 1889),
    ('Коковцов Павел Константинович', '1861-07-01', 'историк', 1906),
    ('Курнаков Николай Семёнович', '1860-12-06', 'химик', 1913),
    ('Марр Николай Яковлевич', '1865-01-06', 'лингвист', 1912),
    ('Насонов Николай Викторович', '1855-02-26', 'зоолог', 1906),
    ('Ольденбург Сергей Фёдорович', '1863-09-26', 'историк', 1903),
    ('Павлов Иван Петрович', '1849-09-26', 'физиолог', 1907),
    ('Перетц Владимир Николаевич', '1870-01-31', 'филолог', 1914),
    ('Соболевский Алексей Иванович', '1857-01-07', 'лингвист', 1900),
    ('Стеклов Владимир Андреевич', '1864-01-09', 'математик', 1912);

 --задание
--1.	Вывести ФИО, специализацию и дату рождения всех академиков.
SELECT a.FullName_Academics, a.Specialization_Academics, a.DateBorn_Academics
FROM Academics a

--2.	Создать вычисляемое поле «О присвоении звания», которое содержит
--информацию об академиках в виде: «Петров Петр Петрович получил звание в 1974».
SELECT
a.FullName_Academics + ' получил звание в ' + CAST(a.YearAssigment_Academics AS NVARCHAR(10)) AS 'О присвоении звания'
FROM Academics a

--3.	Вывести ФИО академиков и вычисляемое поле «Через 5 лет после присвоения звания».
SELECT
a.FullName_Academics, (a.YearAssigment_Academics + 5) AS 'Через 5 лет после присвоения звания'
FROM Academics a
--4.	Вывести список годов присвоения званий, убрав дубликаты.
SELECT DISTINCT a.YearAssigment_Academics FROM Academics a
--5.	Вывести список академиков, отсортированный по убыванию даты рождения.
 SELECT * FROM Academics a
 ORDER BY (a.DateBorn_Academics) DESC

--6.	Вывести список академиков, отсортированный в обратном алфавитном порядке специализаций,
--по убыванию года присвоения звания, и в алфавитном порядке ФИО.
 SELECT * FROM Academics a
 ORDER BY (a.Specialization_Academics) DESC

 SELECT * FROM Academics a
 ORDER BY (a.YearAssigment_Academics) DESC

SELECT * FROM Academics a
 ORDER BY (a.FullName_Academics) ASC
--7.	Вывести первую строку из списка академиков, отсортированного в обратном ал-фавитном порядке ФИО.
SELECT TOP 1 * FROM Academics a
 ORDER BY (a.FullName_Academics) DESC
--8.	Вывести фамилию академика, который раньше всех получил звание.
 SELECT TOP 1 a.FullName_Academics FROM Academics a
 ORDER BY (a.YearAssigment_Academics) ASC
--9.	Вывести первые 10% строк из списка академиков, отсортированного в алфавитном порядке ФИО.
SELECT TOP 10 PERCENT * FROM Academics a
 ORDER BY (a.FullName_Academics) ASC
--10.	Вывести из таблицы «Академики», отсортированной по возрастанию года присво-ения звания,
--список академиков, у которых год присвоения звания – один из первых пяти в отсортированной таблице.
SELECT TOP 5  WITH TIES *
FROM Academics a
 ORDER BY (a.YearAssigment_Academics) ASC
--11.	Вывести, начиная с десятого, список академиков, отсортированный по возраста-нию даты рождения.
 SELECT * FROM Academics a
 ORDER BY (a.DateBorn_Academics) ASC
 OFFSET 9 ROWS
--12.	Вывести девятую и десятую строку из списка академиков, отсортированного в ал-фавитном порядке ФИО.
SELECT * FROM Academics a
 ORDER BY (a.FullName_Academics) ASC
 OFFSET 8 ROWS 
 FETCH NEXT 2 ROWS ONLY


 -----------------------ЛАБОРАТОРНАЯ РАБОТА 3-------------------
 CREATE TABLE  Countries
 (
 Id_Country int CONSTRAINT PK_Id_Country PRIMARY KEY IDENTITY,
 Name_Country nvarchar(30),
 Capital_Country nvarchar(30),
 Square_Country int,
 Population_Country int,
 Continent_Country nvarchar(30)
 )

  
INSERT dbo.Countries
VALUES
    ('Австрия', 'Вена', 83858, 8741753, 'Европа'),
    ('Азербайджан', 'Баку', 86600, 9705600, 'Азия'),
    ('Албания', 'Тирана', 28748, 2866026, 'Европа'),
    ('Алжир', 'Алжир', 2381740, 39813722, 'Африка'),
    ('Ангола', 'Луанда', 1246700, 25831000, 'Африка'),
    ('Аргентина', 'Буэнос-Айрес', 2766890, 43847000, 'Южная Америка'),
    ('Афганистан', 'Кабул', 647500, 29822848, 'Азия'),
    ('Бангладеш', 'Дакка', 144000, 160221000, 'Азия'),
    ('Бахрейн', 'Манама', 701, 1397000, 'Азия'),
    ('Белиз', 'Бельмопан', 22966, 377968, 'Северная Америка'),
    ('Белоруссия', 'Минск', 207595, 9498400, 'Европа'),
    ('Бельгия', 'Брюссель', 30528, 11250585, 'Европа'),
    ('Бенин', 'Порто-Ново', 112620, 11167000, 'Африка'),
    ('Болгария', 'София', 110910, 7153784, 'Европа'),
    ('Боливия', 'Сукре', 1098580, 10985059, 'Южная Америка'),
    ('Ботсвана', 'Габороне', 600370, 2209208, 'Африка'),
    ('Бразилия', 'Бразилиа', 8511965, 206081432, 'Южная Америка'),
    ('Буркина-Фасо', 'Уагадугу', 274200, 19034397, 'Африка'),
    ('Бутан', 'Тхимпху', 47000, 784000, 'Азия'),
    ('Великобритания', 'Лондон', 244820, 65341183, 'Европа'),
    ('Венгрия', 'Будапешт', 93030, 9830485, 'Европа'),
    ('Венесуэла', 'Каракас', 912050, 31028637, 'Южная Америка'),
    ('Восточный Тимор', 'Дили', 14874, 1167242, 'Азия'),
    ('Вьетнам', 'Хано', 329560, 91713300, 'Азия');

--задание
--1.	Вывести названия и столицы пяти наибольших стран по площади.
SELECT c.Name_Country, c.Capital_Country
FROM Countries c
WHERE c.Square_Country  > 1000000

--2.	Вывести список африканских стран, население которых не превышает 1 млн. чел.
SELECT * FROM Countries c
WHERE (c.Continent_Country = 'Африка') AND (c.Population_Country < 1000000)
--3.	Вывести список стран, население которых больше 5 млн. чел., а площадь меньше
--100	тыс. кв. км, и они расположены не в Европе.

--4.	Вывести список стран Северной и Южной Америки, население которых больше
--20	млн. чел., или стран Африки, у которых население больше 30 млн. чел.
SELECT * FROM Countries c
WHERE (c.Continent_Country = 'Северная Америка') AND (c.Continent_Country = 'Южная Америка') AND (c.Population_Country > 20000000) AND (c.Square_Country < 100000)
OR (c.Continent_Country = 'Африка') AND (c.Population_Country > 30000000)
--5.	Вывести список стран, население которых составляет от 10 до 100 млн. чел., 
--а пло-щадь не больше 500 тыс. кв. км.
SELECT * FROM Countries c
WHERE (c.Population_Country >= 10000000 AND c.Population_Country <= 100000000) AND (c.Square_Country <= 500000)
--6.	Вывести список стран, названия которых не начинаются с буквы «К».
SELECT * FROM Countries c
WHERE c.Name_Country NOT LIKE 'K%'
--7.	Вывести список стран, в названии которых третья буква – «а», а предпоследняя «и».
SELECT * FROM Countries c
WHERE c.Name_Country LIKE '__а%и_'
--8.	Вывести список стран, в названии которых вторая буква – гласная.
SELECT * FROM Countries c
WHERE c.Name_Country LIKE '_[аеёоиуыэюя]%'
--9.	Вывести список стран, названия которых начинаются с букв от «К» до «П».
SELECT * FROM Countries c
WHERE c.Name_Country LIKE '[К-П]%'
--10.	Вывести список стран, названия которых начинаются с букв от «А» до «Г», но не с буквы «Б».
SELECT * FROM Countries c
WHERE c.Name_Country LIKE '[А-Г]%' AND c.Name_Country NOT LIKE '[Б]%'
--11.	Вывести список стран, столицы которых есть в базе.
SELECT * FROM Countries c
WHERE c.Capital_Country IS NOT NULL
--12.	Вывести список стран Африки, Северной и Южной Америки.
SELECT * FROM Countries c
WHERE c.Continent_Country IN ('Африка', 'Северная Америка', 'Южная Америка')

--------------------ЛАБОРАТОРНАЯ РАБОТА 4--------------
--1.	Вывести список академиков, отсортированный по количеству символов в ФИО.
SELECT * FROM Academics a
ORDER BY LEN(a.FullName_Academics)
--2.	Вывести список академиков, убрать лишние пробелы в ФИО.
SELECT TRIM(a.FullName_Academics) AS ФИО, a.DateBorn_Academics,
a.Specialization_Academics, a.YearAssigment_Academics
FROM Academics a
--3.	Найти позиции «ов» в ФИО каждого академика. Вывести ФИО и номер позиции.
SELECT a.FullName_Academics, CHARINDEX('ов',a.FullName_Academics) AS Позиция_ов
FROM Academics a
--4.	Вывести ФИО и последние две буквы специализации для каждого академика.
SELECT a.FullName_Academics, RIGHT(a.Specialization_Academics, 2) AS Спец_2 
FROM Academics a
--5.	Вывести список академиков, ФИО в формате Фамилия и Инициалы.

--6.	Вывести список специализаций в правильном и обратном виде. Убрать дубликаты.
SELECT DISTINCT a.Specialization_Academics
FROM Academics a
ORDER BY a.Specialization_Academics ASC;

-- Обратный порядок
SELECT DISTINCT a.Specialization_Academics
FROM Academics a
ORDER BY a.Specialization_Academics DESC;
--vid
SELECT DISTINCT a.Specialization_Academics, REVERSE(a.Specialization_Academics) FROM Academics a
--7.	Вывести свою фамилию в одной строке столько раз, сколько вам лет.
SELECT REPLICATE('СеменоваСирачова ', 20) AS ETO_MY;

--8.	Вывести абсолютное значение функций2 (2) −   (3  2) с точностью два знака
--после десятичной запятой. -- пропустить 
--9.	Вывести количество дней до конца семестра.
SELECT DATEDIFF(DAY, GETDATE(), '20231229') AS количество_дней
--10.	Вывести количество месяцев от вашего рождения.
SELECT DATEDIFF(MONTH, '20040101', GETDATE()) AS KOLVO
--11.	Вывести ФИО и високосность года рождения каждого академика.
SELECT a.FullName_Academics, a.DateBorn_Academics,
IIF(YEAR(a.DateBorn_Academics)%4 = 0, 'Високосный', 'Невисокосный') AS visokosnost
FROM Academics a
--12.	Вывести список специализаций без повторений. Для каждой специализации вывести «длинный» или «короткий», 
--в зависимости от количества символов.
SELECT
  DISTINCT a.Specialization_Academics,
  CASE
    WHEN LEN(a.Specialization_Academics) > 8 THEN 'длинный'
    ELSE 'короткий'
  END AS длина
FROM Academics a


-------------------------------ЛАБОРАТОРНАЯ РАБОТА 5----------------------------------------
--1.	Вывести минимальную площадь стран.
SELECT MIN(c.Square_Country) as min_sq FROM Countries c
--2.	Вывести наибольшую по населению страну в Северной и Южной Америке.
SELECT MAX(c.Population_Country) as max_p
FROM Countries c
WHERE c.Continent_Country = 'Северная Америка' or c.Continent_Country = 'Южная Америка'
--3.	Вывести среднее население стран. Результат округлить до одного знака.
SELECT 
ROUND(AVG(CAST(c.Population_Country AS FLOAT)), 1) AS Среднее_население
FROM Countries c

--4.	Вывести количество стран, у которых название заканчивается на «ан», кроме стран, 
--у которых название заканчивается на «стан».
SELECT COUNT(*) AS КоличествоСтран
FROM Countries c
WHERE c.Name_Country LIKE '%ан'
  AND c.Name_Country NOT LIKE '%стан'
--5.	Вывести количество континентов, где есть страны, название которых начинается с
--буквы «Р».
SELECT COUNT(DISTINCT c.Continent_Country ) AS Количество_Континентов
FROM Countries c
WHERE c.Name_Country LIKE 'Р%'
--6.	Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей площадью?
SELECT MAX(c.Square_Country)/MIN(c.Square_Country) AS RAZNITCA
FROM Countries c
--7.	Вывести количество стран с населением больше, чем 100 млн. чел. на каждом континенте. 
--Результат отсортировать по количеству стран по возрастанию.
SELECT c.Continent_Country, COUNT(c.Name_Country) AS KOLVO 
FROM Countries c
WHERE c.Population_Country > 100000000
GROUP BY c.Continent_Country
ORDER BY KOLVO ASC
--8.	Вывести количество стран по количеству букв в названии. Результат отсортировать по убыванию.
SELECT COUNT(*) AS kolvo_s, LEN(c.Name_Country) AS kolvo_b 
FROM Countries c
GROUP BY LEN(c.Name_Country)
ORDER BY kolvo_b DESC
--9.	Ожидается, что через 20 лет население мира вырастет на 10%. 
--Вывести список континентов с прогнозируемым населением:
SELECT c.Continent_Country, ROUND(c.Population_Country * 1.1, 0) as cherez_20_let 
FROM Countries c
--10.	Вывести список континентов, где разница по площади между наибольшими 
--и наименьшими странами не более в 1000 раз:
SELECT c.Continent_Country
FROM Countries c
GROUP BY c.Continent_Country
HAVING MAX(c.Square_Country) <= 1000 * MIN(c.Square_Country)
--11.	Вывести среднюю длину названий Африканских стран.
SELECT AVG(LEN(c.Name_Country)) as sred_dlina
FROM Countries c
WHERE c.Continent_Country = 'Африка'
--12.	Вывести список континентов, у которых средняя плотность 
--среди стран с населением более 1 млн. чел. больше, чем 30 чел. на кв. км.
SELECT c.Continent_Country, AVG(CAST(c.Population_Country AS FLOAT)/c.Square_Country) AS PLOTNOST
FROM Countries c
WHERE c.Population_Country > 1000000
GROUP BY c.Continent_Country
HAVING AVG(CAST(c.Population_Country AS FLOAT)/c.Square_Country) > 30
ORDER BY PLOTNOST


-----------ЛАБОРАТОРНАЯ РАБОТА 6------------------
CREATE TABLE Facultet (
    Abb_Facultet NVARCHAR(2) CONSTRAINT PK_Abb_Facultet PRIMARY KEY, 
    Name_Facultet NVARCHAR(50)
);

INSERT INTO Facultet
VALUES 
    ('Ен', 'Естественные науки'),
    ('Гн', 'Гуманитарные науки'),
    ('Ит', 'Информационные технологии'),
    ('Фм', 'Физико-математический');

CREATE TABLE  Kafedra (
    Shifr_Kafedra NVARCHAR(3) CONSTRAINT PK_Shifr_Kafedra PRIMARY KEY,
    Name_Kafedra NVARCHAR(50),
    Abb_Facultet NVARCHAR(2) CONSTRAINT FK_Abb_Facultet FOREIGN KEY (Abb_Facultet) REFERENCES Facultet (Abb_Facultet)
);

INSERT INTO Kafedra
VALUES 
    ('вм', 'Высшая математика', 'ен'),
    ('ис', 'Информационные системы', 'ит'),
    ('мм', 'Математическое моделирование', 'фм'),
    ('оф', 'Общая физика', 'ен'),
    ('пи', 'Прикладная информатика', 'ит'),
    ('эф', 'Экспериментальная физика', 'фм');

	CREATE TABLE Employee (
	Tab_Nomer_Employee INT CONSTRAINT PK_Tab_Nomer_Employee PRIMARY KEY,
    Shifr_Kafedra NVARCHAR(3) CONSTRAINT FK_Shifr_Kafedra FOREIGN KEY (Shifr_Kafedra) REFERENCES Kafedra(Shifr_Kafedra),
	Name_Employee NVARCHAR(100),
	Role_Employee NVARCHAR(100),
	Salary_Employee decimal(7,2),
	Boss_Employee int
	)
	
	
	INSERT INTO Employee
VALUES
 (101, 'пи', 'Прохоров П.П.', 'зав. кафедрой', 35000.00, 101),
    (102, 'пи', 'Семенов С.С.', 'преподаватель', 25000.00, 101),
    (105, 'пи', 'Петров П.П.', 'преподаватель', 25000.00, 101),
    (153, 'пи', 'Сидорова С.С.', 'инженер', 15000.00, 102),
    (201, 'ис', 'Андреев А.А.', 'зав. кафедрой', 35000.00, 201),
    (202, 'ис', 'Борисов Б.Б.', 'преподаватель', 25000.00, 201),
    (241, 'ис', 'Глухов Г.Г.', 'инженер', 20000.00, 201),
    (242, 'ис', 'Чернов Ч.Ч.', 'инженер', 15000.00, 202),
    (301, 'мм', 'Басов Б.Б.', 'зав. кафедрой', 35000.00, 301),
    (302, 'мм', 'Сергеева С.С.', 'преподаватель', 25000.00, 301),
    (401, 'оф', 'Волков В.В.', 'зав. кафедрой', 35000.00, 401),
    (402, 'оф', 'Зайцев З.З.', 'преподаватель', 25000.00, 401),
    (403, 'оф', 'Смирнов С.С.', 'преподаватель', 15000.00, 401),
    (435, 'оф', 'Лисин Л.Л.', 'инженер', 20000.00, 402),
    (501, 'вм', 'Кузнецов К.К.', 'зав. кафедрой', 35000.00, 501),
    (502, 'вм', 'Романцев Р.Р.', 'преподаватель', 25000.00, 501),
    (503, 'вм', 'Соловьев С.С.', 'преподаватель', 25000.00, 501),
    (601, 'эф', 'Зверев З.З.', 'зав. кафедрой', 35000.00, 601),
    (602, 'эф', 'Сорокина С.С.', 'преподаватель', 25000.00, 601),
    (614, 'эф', 'Григорьев Г.Г.', 'инженер', 20000.00, 602)

	CREATE TABLE Specialization 
	(
	Number_Spec varchar(8) CONSTRAINT PK_Number_Spec PRIMARY KEY,
	Napravlenie_Spec nvarchar(100),
	Shifr_Kafedra NVARCHAR(3) CONSTRAINT FK_Shifr_Kafedra_Spec FOREIGN KEY (Shifr_Kafedra) REFERENCES Kafedra(Shifr_Kafedra)
	)
	
	INSERT INTO Specialization
	VALUES
    ('01.03.04', 'Прикладная математика', 'мм'),
    ('09.03.02', 'Информационные системы и технологии', 'ис'),
    ('09.03.03', 'Прикладная информатика', 'пи'),
    ('14.03.02', 'Ядерные физика и технологии', 'эф'),
    ('38.03.05', 'Бизнес-информатика', 'ис')

	CREATE TABLE Discipline
	(
	Kod_Discipline int CONSTRAINT PK_Kod_Discipline PRIMARY KEY,
	Volume_Discipline int,
	Name_Discipline nvarchar(50),
	Ispolnitel_Discipline  NVARCHAR(3) CONSTRAINT FK_Ispolnitel_Discipline FOREIGN KEY (Ispolnitel_Discipline) REFERENCES Kafedra(Shifr_Kafedra)
	)

	INSERT INTO Discipline 
	VALUES
    (101, 320, 'Математика', 'вм'),
    (102, 160, 'Информатика', 'пи'),
    (103, 160, 'Физика', 'оф'),
    (202, 120, 'Базы данных', 'ис'),
    (204, 160, 'Электроника', 'эф'),
    (205, 80, 'Программирование', 'пи'),
    (209, 80, 'Моделирование', 'мм')

	CREATE TABLE Zayavka
	(
	Kod_Zayavka int CONSTRAINT FK_Kod_Zayavka FOREIGN KEY (Kod_Zayavka) REFERENCES Discipline(Kod_Discipline),
	Number_Zayavka varchar(8) CONSTRAINT FK_Number_Zayavka FOREIGN KEY (Number_Zayavka) REFERENCES Specialization(Number_Spec)
	)

	INSERT INTO Zayavka 
	VALUES
	(101, '01.03.04'),
	(205, '01.03.04'),
	(209, '01.03.04'),
	(101, '09.03.02'),
	(102, '09.03.02'),
	(103, '09.03.02'),
	(202, '09.03.02'),
	(205, '09.03.02'),
	(209, '09.03.02'),
	(101, '09.03.03'),
	(102, '09.03.03'),
	(103, '09.03.03'),
	(202, '09.03.03'),
	(205, '09.03.03'),
	(101, '14.03.02'),
	(102, '14.03.02'),
	(103, '14.03.02'),
	(204, '14.03.02'),
	(101, '38.03.05'),
	(103, '38.03.05'),
	(202, '38.03.05'),
	(209, '38.03.05')

	CREATE TABLE Zav_Kafedra
	(
	Tab_Number_Zav_Kafedra int CONSTRAINT FK_Tab_Number_Zav_Kafedra FOREIGN KEY (Tab_Number_Zav_Kafedra) REFERENCES Employee(Tab_Nomer_Employee),
	Stazh_Zav_Kafedra int 
	)

	INSERT INTO Zav_Kafedra
	VALUES
	(101,15),
	(201,18),
	(301,20),
	(401,10),
	(501,18),
	(601,8)

	CREATE TABLE Inzhener
	(
	Tab_Number_Inzhener int CONSTRAINT FK_Tab_Number_Inzhener FOREIGN KEY (Tab_Number_Inzhener) REFERENCES Employee(Tab_Nomer_Employee),
	Specialnost_Inzhener nvarchar(30) 
	)

	INSERT INTO Inzhener
	VALUES
	(153,'электроник'),
	(241,'электроник'),
	(242,'программист'),
	(435,'электроник'),
	(614,'программист')

	CREATE TABLE Teacher
	(
	Tab_Number_Teacher int CONSTRAINT FK_Tab_Number_Teacher FOREIGN KEY (Tab_Number_Teacher) REFERENCES Employee(Tab_Nomer_Employee),
	Zvanie_Teacher nvarchar(50),
	Stepen_Teacher varchar(10) 
	)
	INSERT INTO Teacher
	VALUES
	(101, 'профессор', 'д.т.н.'),
    (102, 'доцент', 'к.ф.-м.н.'),
    (105, 'доцент', 'к.т.н.'),
    (201, 'профессор', 'д.ф.-м.н.'),
    (202, 'доцент', 'к.ф.-м.н.'),
    (301, 'профессор', 'д.т.н.'),
    (302, 'доцент', 'к.т.н.'),
    (401, 'профессор', 'д.т.н.'),
    (402, 'доцент', 'к.т.н.'),
    (403, 'ассистент', null),
    (501, 'профессор', 'д.ф.-м.н.'),
    (502, 'профессор', 'д.ф.-м.н.'),
    (503, 'доцент', 'к.ф.-м.н.'),
    (601, 'профессор', 'д.ф.-м.н.')

	CREATE TABLE Student
	(
    Reg_Number_Student int CONSTRAINT PK_Reg_Number_Student PRIMARY KEY,
	Number_Student varchar(8) CONSTRAINT FK_Number_Student FOREIGN KEY (Number_Student) REFERENCES Specialization(Number_Spec),
	SName_Student nvarchar(50)
	)
	INSERT INTO dbo.Student
	VALUES
	(10101, '09.03.03', 'Николаева Н. Н.'),
    (10102, '09.03.03', 'Иванов И. И.'),
    (10103, '09.03.03', 'Крюков К. К.'),
    (20101, '09.03.02', 'Андреев А. А.'),
    (20102, '09.03.02', 'Федоров Ф. Ф.'),
    (30101, '14.03.02', 'Бондаренко Б. Б.'),
    (30102, '14.03.02', 'Цветков К. К.'),
    (30103, '14.03.02', 'Петров П. П.'),
    (50101, '01.03.04', 'Сергеев С. С.'),
    (50102, '01.03.04', 'Кудрявцев К. К.'),
    (80101, '38.03.05', 'Макаров М. М.'),
    (80102, '38.03.05', 'Яковлев Я. Я.');

	CREATE TABLE Examen 
	(
	Date_Examen date,
	Kod_Examen int CONSTRAINT FK_Kod_Examen FOREIGN KEY (Kod_Examen) REFERENCES Discipline(Kod_Discipline),
	Reg_Number_Examen int CONSTRAINT FK_Reg_Number_Examen FOREIGN KEY (Reg_Number_Examen) REFERENCES Student(Reg_Number_Student),
	Tab_Number_Examen int CONSTRAINT FK_Tab_Number_Examen FOREIGN KEY (Tab_Number_Examen) REFERENCES Employee(Tab_Nomer_Employee),
	Auditoria_Examen varchar(4),
	Ocenka_Examen int
	)
	INSERT INTO Examen
	VALUES
	('2015-06-05', 102, 10101, 102, 'т505', 4),
    ('2015-06-05', 102, 10102, 102, 'т505', 4),
    ('2015-06-05', 202, 20101, 202, 'т506', 4),
    ('2015-06-05', 202, 20102, 202, 'т506', 3),
    ('2015-06-07', 102, 30101, 105, 'ф419', 3),
    ('2015-06-07', 102, 30102, 101, 'т506', 4),
    ('2015-06-07', 102, 80101, 102, 'м425', 5),
    ('2015-06-09', 205, 80102, 402, 'м424', 4),
    ('2015-06-09', 209, 20101, 302, 'ф333', 3),
    ('2015-06-10', 101, 10101, 501, 'т506', 4),
    ('2015-06-10', 101, 10102, 501, 'т506', 4),
    ('2015-06-10', 204, 30102, 601, 'ф349', 5),
    ('2015-06-10', 209, 80101, 301, 'э105', 5),
    ('2015-06-10', 209, 80102, 301, 'э105', 4),
    ('2015-06-12', 101, 80101, 502, 'с324', 4),
    ('2015-06-15', 101, 30101, 503, 'ф417', 4),
    ('2015-06-15', 101, 50101, 501, 'ф201', 5),
    ('2015-06-15', 101, 50102, 501, 'ф201', 3),
    ('2015-06-15', 103, 10101, 403, 'ф414', 4),
    ('2015-06-17', 102, 10101, 102, 'т505', 5)
--задание
--1.Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о студентах,
--которые обучаются на данном факультете (например, «ит»).
SELECT s.SName_Student, k.Name_Kafedra
FROM Student s INNER JOIN Specialization sp ON s.Number_Student = sp.Number_Spec
INNER JOIN Kafedra k ON sp.Shifr_Kafedra = k.Shifr_Kafedra
--2.Вывести из таблиц «Кафедра», «Специальность» и «Сотрудник» данные о выпускающих
--кафедрах (факультет, шифр, название, фамилию заведующего). Выпускающей считается та кафедра,
--на которую есть ссылки в таблице «Специальность».
SELECT s.SName_Student, k.Name_Kafedra
FROM Student s INNER JOIN Specialization sp ON s.Number_Student = sp.Number_Spec
INNER JOIN Kafedra k ON sp.Shifr_Kafedra = k.Shifr_Kafedra
--3.Вывести в запросе для каждого сотрудника номер и фамилию его непосредственного руководителя.
--Для заведующих кафедрами поле руководителя оставить пустым.
SELECT e.Name_Employee,
CASE
	WHEN e.Tab_Nomer_Employee != zk.Tab_Number_Zav_Kafedra THEN e1.Name_Employee
	ELSE NULL
	END
	AS 'Руководитель'
FROM Employee e 
JOIN Employee e1 on e.Boss_Employee = e1.Tab_Nomer_Employee
JOIN Zav_Kafedra zk  on e1.Tab_Nomer_Employee = zk.Tab_Number_Zav_Kafedra
--4.Вывести список студентов, сдавших минимум два экзамена.
SELECT s.SName_Student FROM Student s
INNER JOIN Examen e ON s.Reg_Number_Student = e.Reg_Number_Examen
GROUP BY s.SName_Student
HAVING COUNT(e.Kod_Examen) >= 2
--5.Вывести список инженеров с зарплатой, меньшей 20000 руб.
SELECT * FROM Inzhener i
INNER JOIN dbo.Employee e ON i.Tab_Number_Inzhener = e.Tab_Nomer_Employee
WHERE e.Salary_Employee < 20000
--6.Вывести список студентов, сдавших экзамены в заданной аудитории.
SELECT s.SName_Student, e.Auditoria_Examen FROM Student s
INNER JOIN Examen e ON s.Reg_Number_Student = e.Reg_Number_Examen 
--7.Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии студентов,
--а также количество сданных экзаменов и средний балл для каждого студента только для тех студентов,
--у которых средний балл не меньше заданного (например, 4).
SELECT s.SName_Student, COUNT(e.Ocenka_Examen) AS 'Количество экзаменов', AVG(e.Ocenka_Examen) AS 'Средний балл' FROM Student s
INNER JOIN Examen e ON s.Reg_Number_Student = e.Reg_Number_Examen
GROUP BY s.SName_Student
HAVING AVG(e.Ocenka_Examen) >= 3
--8.Вывести список заведующих кафедрами и их зарплаты, и степень.
 SELECT e.Name_Employee, e.Salary_Employee, t.Stepen_Teacher FROM Employee e
 INNER JOIN Teacher t ON e.Tab_Nomer_Employee = t.Tab_Number_Teacher
--9.Вывести список профессоров.
 SELECT e.Name_Employee FROM Employee e
 INNER JOIN Teacher t ON e.Tab_Nomer_Employee = t.Tab_Number_Teacher
 WHERE t.Zvanie_Teacher = 'профессор'
--10.Вывести название дисциплины, фамилию, должность и степень преподавателя, дату и место
--проведения экзаменов в хронологическом порядке в заданном интервале даты.
SELECT DISTINCT d.Name_Discipline, em.Name_Employee, em.Role_Employee,
t.Stepen_Teacher, e.Date_Examen, e.Auditoria_Examen FROM Examen e
INNER JOIN Discipline d ON e.Kod_Examen = d.Kod_Discipline
INNER JOIN Employee em ON e.Tab_Number_Examen = em.Tab_Nomer_Employee
INNER JOIN Teacher t ON e.Tab_Number_Examen = t.Tab_Number_Teacher
ORDER BY e.Date_Examen
--11.Вывести фамилию преподавателей, принявших более трех экзаменов.
SELECT em.Name_Employee, COUNT(e.Date_Examen) AS Kolvo_ex FROM Examen e
INNER JOIN Employee em ON e.Tab_Number_Examen = em.Tab_Nomer_Employee
GROUP BY em.Name_Employee
HAVING COUNT(e.Date_Examen)>3
--12.	Вывести список студентов, не сдавших ни одного экзамена в указанной дате.
SELECT s.SName_Student FROM Student s
LEFT OUTER JOIN	Examen e ON e.Reg_Number_Examen = s.Reg_Number_Student AND e.Date_Examen = '12.06.2015'
WHERE e.Reg_Number_Examen IS NULL
---------------------------------Лаботаротная работа 7---------------------------------
--задание
--1.Вывести объединенный результат выполнения запросов, которые выбирают страны с площадью меньше 500 кв. км
--и с площадью больше 5 млн. кв. км:
SELECT c.Name_Country , c.Square_Country
FROM Countries c
WHERE c.Square_Country < 500
UNION
SELECT c.Name_Country, c.Square_Country
FROM Countries c
WHERE c.Square_Country > 5000000
--2.Вывести список стран с площадью больше 1 млн. кв. км, исключить страны с населением меньше 100 млн. чел.:
SELECT c.Name_Country, c.Population_Country, c.Square_Country
FROM Countries c
WHERE c.Square_Country > 1000000
EXCEPT
SELECT c.Name_Country, c.Population_Country, c.Square_Country
FROM Countries c
WHERE c.Population_Country < 100000000
--3.	Вывести список стран с площадью меньше 500 кв. км и с населением меньше 100	тыс. чел.
SELECT c.Name_Country, c.Population_Country, c.Square_Country
FROM Countries c
WHERE c.Square_Country < 500
UNION
SELECT c.Name_Country, c.Population_Country, c.Square_Country
FROM Countries c
WHERE c.Population_Country < 100000
----------------------------------Лаботаротная работа 8---------------------------------
--задание
--1.Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.
SELECT c.Name_Country, c.Capital_Country, c.Square_Country, 
c.Population_Country, c.Continent_Country, ROUND(CAST(c.Square_Country AS FLOAT)*100/
(SELECT SUM(c.Square_Country)FROM Countries c),3) AS Процент 
FROM Countries c
ORDER BY Процент DESC
--2.Вывести список стран мира, плотность населения которых больше, чем средняя плотность 
--населения всех стран мира.
SELECT c.Name_Country, (c.Population_Country/c.Square_Country) AS [Плотность населения] 
FROM Countries c
GROUP BY c.Name_Country, (c.Population_Country/c.Square_Country)  
HAVING (c.Population_Country/c.Square_Country) > (SELECT AVG(c.Population_Country/c.Square_Country) FROM Countries c)

--3.С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.
SELECT * FROM (SELECT *
FROM Countries c
WHERE c.Continent_Country = 'Европа') A
WHERE Population_Country > 5000000
--4.Вывести список стран и процентное соотношение их площади к суммарной пло-щади той части мира,
--где они находятся.
SELECT c1.Name_Country, c1.Capital_Country, c1.Square_Country, 
c1.Population_Country, c1.Continent_Country, ROUND(CAST(c1.Square_Country AS FLOAT)*100/
(SELECT SUM(c2.Square_Country)FROM Countries c2
WHERE c1.Continent_Country=c2.Continent_Country),3) AS Процент 
FROM Countries c1
ORDER BY Процент DESC
--5.Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света,
--где они находятся.
SELECT * FROM Countries c1
WHERE c1.Square_Country>(SELECT AVG(c2.Square_Country) FROM Countries C2
WHERE c2.Continent_Country=c1.Continent_Country)
--6.Вывести список стран мира, которые находятся в тех частях света, средняя плотность населения
--которых превышает общемировую.
SELECT * FROM Countries c
WHERE c.Continent_Country IN (SELECT c.Continent_Country FROM Countries c
GROUP BY c.Continent_Country
HAVING AVG(c.Population_Country/c.Square_Country)>(SELECT AVG(c.Population_Country/c.Square_Country) FROM Countries c))
--7.Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.
SELECT * FROM Countries c
WHERE c.Continent_Country = 'Южная Америка' AND c.Population_Country > ALL
(SELECT c.Population_Country FROM Countries c
WHERE c.Continent_Country = 'Африка')
--8.Вывести список африканских стран, в которых живет больше людей, чем хотя бы
--в	одной южноамериканской стране.
SELECT * FROM Countries c
WHERE c.Continent_Country = 'Африка' AND c.Population_Country > ANY
(SELECT c.Population_Country FROM Countries c
WHERE c.Continent_Country = 'Южная Америка')
--9.Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список
--всех африканских стран.
SELECT * FROM Countries c
WHERE c.Continent_Country = 'Африка' AND EXISTS 
(SELECT * FROM Countries c
WHERE c.Continent_Country = 'Африка' AND c.Square_Country>2000000)
--10.Вывести список стран той части света, где находится страна «Фиджи».
SELECT * FROM Countries c
WHERE c.Continent_Country = (SELECT c.Continent_Country FROM Countries c
WHERE c.Name_Country = 'Фиджи')
--11.Вывести список стран, население которых не превышает население страны «Фиджи».
SELECT * FROM Countries c
WHERE c.Population_Country !> (SELECT c.Population_Country FROM Countries c
WHERE c.Name_Country = 'Фиджи')
--12.Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.
SELECT * FROM Countries c
INNER JOIN (SELECT Continent_Country ,MIN(Square_Country) AS Min_Square
FROM Countries 
GROUP BY Continent_Country) c2 ON c.Continent_Country = c2.Continent_Country AND  c.Square_Country= c2.Min_Square
WHERE c.Population_Country = (SELECT MAX(Population_Country) AS Max_Population FROM Countries 
WHERE Continent_Country = c.Continent_Country AND Square_Country = c.Square_Country)
---------------------------------Лабораторная работа 9------------------------------------------------------
ALTER TABLE Countries
ADD Tip_Managment_Country int


INSERT INTO Countries
VALUES
('Афганистан', 'Кабул', 647, 20340, 'Азия', 3),
('Монголия', 'Улан-Батор', 1565, 1555, 'Азия', 4),
('Япония', 'Токио', 372, 114276, 'Азия', 1),
('Франция', 'Париж', 551, 53183, 'Европа', 3),
('Швеция', 'Стокгольм', 450, 8268, 'Европа', 1),
('Египет', 'Каир', 1001, 38740, 'Африка', 3),
('Сомали', 'Могадишо', 638, 3350, 'Африка', NULL),
('США', 'Вашингтон', 9363, 217700, 'Америка', 3),
('Мексика', 'Мехико', 1973, 62500, 'Америка', 4),
('Мальта', 'Валлетта', 3000, 330, 'Европа', 4),
('Монако', 'Монако', 2000, 25, 'Европа', 1)

CREATE TABLE Management
(
ID_Management int CONSTRAINT PK_ID_Management PRIMARY KEY,
Vid_Management nvarchar(30)
)

INSERT INTO Management
VALUES
(1,'Конституционная монархия'),
(2,'Абсолютная монархия'),
(3,'Президентская республика'),
(4,'Парламентская республика'),
(5,'Военная хунта')

--задание
--1.Создать таблицу «Управление_ВашаФамилия». Определить основной ключ, иден-тификатор, значение по умолчанию
CREATE TABLE Managament_SS
(
ID_Managament_SS int CONSTRAINT PK_ID_Managament_SS PRIMARY KEY IDENTITY,
Vid_Managament_SS varchar(20) CONSTRAINT DF_Vid_Managament_SS  DEFAULT 'NULL'
)
--2.Создать таблицу «Страны_ВашаФамилия». Определить основной ключ, разреше-ние / запрет на NULL, условие на вводимое значение.
CREATE TABLE Countries_SS
(
ID_Countries_SS int CONSTRAINT PK_ID_Countries_SS PRIMARY KEY,
Name_Countries_SS nvarchar(30) NOT NULL,
Population_Countries_SS int CONSTRAINT CK_Population_Countries_SS CHECK (Population_Countries_SS!=0)
)
--3.Создать таблицу «Цветы_ВашаФамилия». Определить основной ключ, значения столбца «ID» сделать уникальными, 
--для столбца «Класс» установить значение по умолчанию «Двудольные».
CREATE TABLE Flowers_SS
(
ID_Flowers_SS int CONSTRAINT PK_ID_Flowers_SS PRIMARY KEY IDENTITY,
Name_Flowers_SS nvarchar(100),
Class_Flowers_SS nvarchar(50) CONSTRAINT DF_Class_Flowers_SS DEFAULT 'Двудвольные'
)
--4.Создать таблицу «Животные_ВашаФамилия». Определить основной ключ, значе-ния столбца «ID» сделать уникальными,
--для столбца «Отряд» установить значение по умол-чанию «Хищные».
CREATE TABLE Animals_SS
(
ID_Animals_SS int CONSTRAINT PK_ID_Animals_SS PRIMARY KEY IDENTITY,
Name_Animals_SS nvarchar(50),
Detachment_Animals_SS nvarchar(50) CONSTRAINT DF_Detachment_Animals_SS DEFAULT 'Хищные'
)
-------------------------------------------Лабораторная работа 10--------------------------------------------------
CREATE TABLE Ucheniki
(
Id_Ucheniki int CONSTRAINT PK_ID_Ucheniki PRIMARY KEY IDENTITY,
Familiya_Ucheniki varchar(50) NOT NULL,
Subject_Ucheniki varchar(50) NOT NULL,
School_Ucheniki varchar(50) NOT NULL,
Scores_Ucheniki float CONSTRAINT CK_Scores_Ucheniki CHECK ((Scores_Ucheniki>=0) AND (Scores_Ucheniki<=100)) NULL 
)

INSERT INTO Ucheniki
VALUES
('Иванова', 'Математика', 'Лицей', 98.5),
('Петров', 'Физика', 'Лицей', 99),
('Сидоров', 'Математика', 'Лицей', 88),
('Полухина', 'Физика', 'Гимназия', 78),
('Матвеева', 'Химия', 'Лицей', 92),
('Касимов', 'Химия', 'Гимназия', 68),
('Нурулин', 'Математика', 'Гимназия', 81),
('Авдеев', 'Физика', 'Лицей', 87),
('Никитина', 'Химия', 'Лицей', 94),
('Барышева', 'Химия', 'Лицей', 88)

--задание
--1.В таблицу «Ученики» внести новую запись для ученика школы № 18 Трошкова,
--оценка которого по химии неизвестна.
INSERT INTO Ucheniki
VALUES
('Трошкова', 'Химия', 'Школа №18', NULL)
--2.В таблицу «Ученики» внести три строки.
INSERT INTO Ucheniki
VALUES
('Сирачова', 'Математика', 'Гимназия', 98),
('Семенова','Химия','Гимназия',80),
('Гараев','Информатика','Гимназия', 74)
--3.В таблице «Ученики» изменить данные Трошкова,
--школу исправить на № 21, предмет на математику, а оценку на 56.
UPDATE Ucheniki
SET Subject_Ucheniki = 'Математика', School_Ucheniki = 'Школа №21', Scores_Ucheniki = 56
WHERE Familiya_Ucheniki ='Трошкова'
--4.В таблице «Ученики» изменить данные всех учеников по химии,
--оценку увеличить на 10%, если она ниже 60 баллов.
UPDATE Ucheniki
SET Scores_Ucheniki = CASE
    WHEN (Subject_Ucheniki = 'Химия' AND Scores_Ucheniki < 60)
    THEN Scores_Ucheniki * 1.1
    ELSE Scores_Ucheniki
    END
WHERE Subject_Ucheniki = 'Химия'
--5.В таблице «Ученики» удалить данные всех учеников из школы №21.
DELETE FROM Ucheniki 
WHERE School_Ucheniki = 'Школа №21'
--6.Создать таблицу «Гимназисты» и скопировать туда данные всех гимназистов, кроме тех,
--которые набрали меньше 60 баллов.
CREATE TABLE Gymnasists
(
Id_Gymnasists int CONSTRAINT PK_ID_Gymnasists PRIMARY KEY IDENTITY,
Familiya_Gymnasists varchar(50) NOT NULL,
Scores_Gymnasists float CONSTRAINT CK_Scores_Gymnasists 
CHECK (Scores_Gymnasists >= 0 AND Scores_Gymnasists <= 100) NULL
)

INSERT INTO Gymnasists (Familiya_Gymnasists, Scores_Gymnasists)
SELECT Familiya_Ucheniki, Scores_Ucheniki
FROM Ucheniki
WHERE School_Ucheniki = 'Гимназия' AND Scores_Ucheniki >= 60
--7.Очистить таблицу «Гимназисты».
DELETE FROM Gymnasists
------------------------------Лабораторная работа 11------------------------------------

--1.	Даны числа A и B. Найти и вывести их произведение.
DECLARE @a INT, @b INT, @c INT
SET @a = 18
SET @b = 19
SET @c = @a * @b
PRINT @c

--2.	В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов.
  DECLARE @licey FLOAT, @gimn FLOAT, @diff FLOAT
  SET @licey = ( 
  SELECT AVG(u.Scores_Ucheniki) FROM dbo.Ucheniki u
  WHERE u.School_Ucheniki = 'Лицей')
  SET @gimn = ( 
  SELECT AVG(u.Scores_Ucheniki) FROM dbo.Ucheniki u
  WHERE u.School_Ucheniki = 'Гимназия')
  SET @diff = ABS(@licey - @gimn)
  PRINT @diff

--3.	В таблице «Ученики» проверить на четность количество строк.
DECLARE @RowCount INT
SELECT @RowCount = COUNT(*) FROM Ucheniki
IF @RowCount % 2 = 0
    PRINT 'Количество строк в таблице четное'
ELSE
    PRINT 'Количество строк в таблице нечетное'

--4.	Дано четырехзначное число. Вывести сумму его цифр.
DECLARE @number INT = 8456;
DECLARE @sum INT = 0;

WHILE @number > 0
BEGIN
    SET @sum = @sum + (@number % 10);
    SET @number = @number / 10;
END

SELECT @sum AS SumOfDigits;
--5.	Даны случайные целые числа a, b и c. Найти наименьшее из них. -ПЕРЕСМОТРЕТЬ
DECLARE @Q INT = RAND() * 100, @W INT = RAND() * 100, @E INT = RAND() * 100
IF @Q > @W 
BEGIN
    PRINT '@Q = ' + CAST(@Q AS VARCHAR(3)) 
    IF @W > @E
        PRINT '@E = ' + CAST(@E AS VARCHAR(3)) 
    ELSE
        PRINT '@W = ' + CAST(@W AS VARCHAR(3)) 
END
ELSE
BEGIN
    PRINT '@W = ' + CAST(@W AS VARCHAR(3)) 
    IF @Q > @E
        PRINT '@E = ' + CAST(@E AS VARCHAR(3)) 
    ELSE
        PRINT '@Q = ' + CAST(@Q AS VARCHAR(3)) 
END
--6.	Дано случайное целое число a. Проверить, делится ли данное число на 11.
                       
     DECLARE @as  INT = RAND() * 100
     IF @as % 11 = 0
	 PRINT CAST(@as AS VARCHAR(3)) + ' делится на 11'
     ELSE
     PRINT CAST(@as AS VARCHAR(3)) + ' не делится на 11'

--7.	Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет».
        DECLARE @n INT = RAND() * 1000
        WHILE @n % 3 = 0
        SET @n = @n / 3
        IF @n = 1
           PRINT 'Да'
        ELSE
           PRINT 'Нет'

--8.	Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК).
DECLARE @r INT
DECLARE @t INT
SET @r = 19
SET @t = 18

DECLARE @gcd INT
DECLARE @temp_r INT = @r;
DECLARE @temp_t INT = @t;

WHILE @temp_t != 0
BEGIN
    SET @gcd = @temp_t;
    SET @temp_t = @temp_r % @temp_t;
    SET @temp_r = @gcd;
END

DECLARE @lcm INT
SET @lcm = (@r * @t) / @gcd;

SELECT @lcm AS НОК
--9.	Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно.
    DECLARE @d INT = 852, @e INT = 8596, @s INT = 0
    WHILE @d <= @e
	BEGIN
	SET @s = @s + @d
	SET @d = @d + 1
	END
	PRINT 'Сумма = ' + CAST(@s AS VARCHAR(10))
--10.	Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7.
DECLARE @num INT
SET @num = 1

WHILE (1=1)
BEGIN
    IF (@num % 2 = 1 AND @num % 3 = 1 AND @num % 4 = 1 AND @num % 5 = 1 AND @num % 6 = 1 AND @num % 7 = 0)
    BEGIN
        PRINT 'Первое число: ' + CAST(@num AS NVARCHAR(10))
        BREAK
    END

    SET @num += 1
END
   
--11.	Вывести свою фамилию на экран столько раз, сколько в нем букв.

			DECLARE @L INT, @M CHAR(100) = 'СеменоваСирачова'
			SET @L = LEN(@M)
			WHILE @L > 0
			BEGIN
			PRINT @M
			SET @L=@L-1
			END

--12.	Напишите код для вывода на экран с помощью цикла: 

DECLARE @Text NVARCHAR(max) = 'Нижневартовск'
DECLARE @Length INT = LEN(@Text)

DECLARE @i INT = 0

WHILE @i <= @Length
BEGIN
    PRINT (REPLICATE(' ', LEN(@Text) - @i) + REVERSE(left(@Text, @i))) + SUBSTRING(@Text, 2, @i-1)
    SET @i = @i + 1
END

---------ЛАБОРАТОРНАЯ РАБОТА 12-----------
--задание

--1.	Напишите функцию для вывода названия страны с заданной столицей, и вызовите ее.
			CREATE FUNCTION Primer1f
			(
			@country AS VARCHAR(50)
			)
			RETURNS VARCHAR(50)
			AS
			BEGIN
			DECLARE @S AS VARCHAR(50)
			SELECT
			@S = c.Capital_Country
			FROM Countries c 
			WHERE
			c.Name_Country = @country	
			RETURN @S
			END

			SELECT dbo.Primer1f('Монако') AS [Название столицы для вашей страны]

--2.	Напишите функцию для перевода населения в млн. чел. и вызовите ее.
		CREATE FUNCTION Primer2f 
		(
		@Population FLOAT
		)
		RETURNS FLOAT
		AS
		BEGIN
			DECLARE @PopulationMillions FLOAT

			SET @PopulationMillions = ROUND(@Population / 1000000, 2)

			RETURN @PopulationMillions
		END

		SELECT c.Capital_Country, c.Continent_Country, c.Population_Country,
		dbo.Primer2f (c.Population_Country) AS [Население (млн. чел)]
		FROM dbo.Countries c	
--3.	Напишите функцию для вычисления плотности населения заданной части света и вызовите ее.
	CREATE FUNCTION Primer3f
	(
	@Население AS INT,
	@Площадь AS FLOAT
	)
	RETURNS FLOAT
	AS
	BEGIN
	DECLARE @P AS FLOAT
	SET @P = ROUND(CAST(@Население AS FLOAT) / @Площадь, 2)
	RETURN @P
	END

	SELECT
	c.Continent_Country,
	SUM(c.Population_Country)AS 'Кол-во людей в континенте',
	SUM(c.Square_Country) AS 'Площадь континента',
	dbo.Primer3f(SUM(c.Population_Country), SUM(c.Square_Country)) AS Плотность
	FROM Countries c
	where c.Continent_Country = 'Азия'
	group by c.Continent_Country
	ORDER BY
	Плотность DESC
--4.	Напишите функцию для поиска страны, третьей по населению и вызовите ее.
CREATE FUNCTION Primer4f()
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @P AS VARCHAR(100)
    DECLARE @M1 AS FLOAT
    
    SELECT @M1 = MAX(c.Square_Country)
    FROM Countries c

    SELECT @P = Name_Country
    FROM (
        SELECT c.Name_Country, ROW_NUMBER() OVER (ORDER BY c.Square_Country DESC) AS RowNum
        FROM Countries c
        WHERE c.Square_Country < @M1) AS Subquery
    WHERE RowNum = 3;
    
    RETURN @P
END

SELECT  dbo.Primer4f() AS [Третья по площади страна]
--5.	Напишите функцию для поиска страны с максимальным населением в заданной
--части света и вызовите ее. Если часть света не указана, выбрать Азию.
CREATE FUNCTION Primer5f
(
@Континент AS VARCHAR(50) = 'Европа'
)
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @P AS VARCHAR(50)
DECLARE @M AS FLOAT
SELECT @M = MAX(c.Square_Country) FROM Countries c
WHERE c.Continent_Country = @Континент
SELECT @P = c.Name_Country FROM Countries c
WHERE c.Continent_Country = @Континент
AND
c.Square_Country = @M
RETURN @P
END

SELECT dbo.Primer5f('Азия') AS [Наименьшая по площади страна в Азии]

SELECT dbo.Primer5f(DEFAULT) AS [Наименьшая по площади страна в Европе]
--6.	Напишите функцию для замены букв в заданном слове от третьей до 
--предпоследней на “тест” и примените ее для столицы страны.
CREATE FUNCTION Primer6f
(
@letter AS VARCHAR(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
RETURN left(@letter, 2) + 'тест' + right(@letter, 1)
END

SELECT c.Name_Country, dbo.Primer6f(c.Capital_Country ) AS [Замена букв],
c.Continent_Country, c.Square_Country, c.Population_Country
FROM Countries c
--7.	Напишите функцию, которая возвращает количество стран, не содержащих
--в названии заданную букву.
CREATE FUNCTION Primer7f
(
@C AS CHAR(1)
)
RETURNS INT
AS
BEGIN
DECLARE @K AS INT
SELECT @K = COUNT(*)
FROM Countries c
WHERE CHARINDEX(@C, c.Name_Country) > 0
RETURN @K
END

SELECT dbo.Primer7f('К') AS [Кол-во стран]

--8.	Напишите функцию для возврата списка стран с площадью меньше заданного
--числа и вызовите ее.
CREATE FUNCTION Primer8f
(
@N AS INT
)
RETURNS TABLE
AS
RETURN (SELECT c.Name_Country, c.Capital_Country, c.Square_Country, c.Population_Country, c.Continent_Country
FROM Countries c
WHERE c.Population_Country < @N)

SELECT * FROM dbo.Primer8f(100000)
--9.	Напишите функцию для возврата списка стран с населением в интервале
--заданных значений и вызовите ее.
CREATE FUNCTION Primer9f
(
@A AS FLOAT,
@B AS FLOAT
)
RETURNS TABLE
AS
RETURN (
SELECT c.Name_Country, c.Capital_Country, c.Square_Country, c.Population_Country, c.Continent_Country
FROM Countries c
WHERE
c.Population_Country BETWEEN @A AND @B
)

SELECT * FROM dbo.Primer9f(100000, 2000000)
--10.	Напишите функцию для возврата таблицы с названием континента и суммарным
--населением и вызовите ее.
Create FUNCTION Primer10f()
RETURNS @Ст_Плот TABLE
(Continent VARCHAR(50),
People FLOAT)
AS 
BEGIN
INSERT @Ст_Плот
SELECT c.Continent_Country, sum(c.Population_Country)from dbo.Countries c
group by c.Continent_Country
RETURN
END

SELECT * FROM dbo.Primer10f()
--11.	Напишите функцию IsPalindrom(P) целого типа, возвращающую 1, если целый
--параметр P (P > 0) является палиндромом, и 0 в противном случае.
CREATE FUNCTION IsPalindrom(@P INT)
RETURNS INT
AS
BEGIN
    DECLARE @NumberString VARCHAR(10);
    SET @NumberString = CAST(@P AS VARCHAR(10));

    DECLARE @IsPalindrom INT;
    SET @IsPalindrom = 1;

    DECLARE @Length INT;
    SET @Length = LEN(@NumberString); 

    DECLARE @Counter INT;
    SET @Counter = 1;

    WHILE @Counter <= @Length / 2
    BEGIN
        IF SUBSTRING(@NumberString, @Counter, 1) <> SUBSTRING(@NumberString, @Length - @Counter + 1, 1)
        BEGIN
            SET @IsPalindrom = 0; 
            BREAK;
        END
        SET @Counter = @Counter + 1;
    END
    RETURN @IsPalindrom;
END
--12.	Напишите функцию Quarter(x, y) целого типа, определяющую номер координатной
--четверти, содержащей точку с ненулевыми вещественными координатами (x, y).
CREATE FUNCTION Quarter(@x FLOAT, @y FLOAT)
RETURNS INT
AS
BEGIN
    DECLARE @Quadrant INT;
    IF @x > 0 AND @y > 0
        SET @Quadrant = 1;
    ELSE IF @x < 0 AND @y > 0
        SET @Quadrant = 2;
    ELSE IF @x < 0 AND @y < 0
        SET @Quadrant = 3
    ELSE IF @x > 0 AND @y < 0
        SET @Quadrant = 4;
    ELSE
        SET @Quadrant = 0;

    RETURN @Quadrant;
END;
--13.	Напишите функцию IsPrime(N) целого типа, возвращающую 1, если целый 
--параметр N (N > 1) является простым числом, и 0 в противном случае.
CREATE FUNCTION IsPrime(@N INT)
RETURNS INT
AS
BEGIN
    IF @N <= 1
        RETURN 0;

    DECLARE @IsPrime INT;
    SET @IsPrime = 1;

    DECLARE @Divisor INT;
    SET @Divisor = 2;

    WHILE @Divisor <= SQRT(@N)
    BEGIN
        IF @N % @Divisor = 0
        BEGIN
            SET @IsPrime = 0;
            BREAK;
        END

        SET @Divisor = @Divisor + 1;
    END
    RETURN @IsPrime;
END;
--14.	Напишите код для удаления созданных вами функций 
DROP FUNCTION Primer1f, Primer2f, Primer3f, Primer4f, Primer5f, Primer6f, Primer7f, Primer8f, Primer9f, Primer10f, IsPalindrom, Quarter, IsPrime

	-------------лабораторная работа 13-----------
--1.	Создайте представление, содержащее список африканских стран, население которых больше 10 млн. чел.,
--а площадь больше 500 тыс. кв. км, и используйте его.
CREATE VIEW Primer1v
AS
SELECT * FROM Countries c
WHERE c.Continent_Country = 'Африка' AND c.Population_Country > 10000000
AND c.Square_Country > 500000

SELECT * FROM Primer1v
--2.	Создайте представление, содержащее список континентов, среднюю площадь стран, которые находятся на нем,
--среднюю плотность населения, и используйте его.
CREATE VIEW Primer2v
AS
SELECT c.Continent_Country, avg(c.Square_Country) AS Сред_площадь, ROUND((c.Population_Country/c.Square_Country), 2) AS Плотность
FROM Countries c
WHERE c.Square_Country!= 0
GROUP BY c.Continent_Country, c.Population_Country, c.Square_Country

SELECT * FROM Primer2v
--3.	Создайте представление, содержащее фамилии преподавателей, их должность, звание, степень, место работы,
--количество их экзаменов, и используйте его.
CREATE VIEW Primer3v
AS
SELECT e.Name_Employee, e.Role_Employee,t.Zvanie_Teacher, t.Stepen_Teacher, k.Name_Kafedra, COUNT(e2.Kod_Examen) AS KOLVO_EXAMS
FROM Employee e
INNER JOIN Teacher t ON e.Tab_Nomer_Employee = t.Tab_Number_Teacher 
INNER JOIN Kafedra k ON e.Shifr_Kafedra = k.Shifr_Kafedra
INNER JOIN	dbo.Examen e2 ON e.Tab_Nomer_Employee = e2.Tab_Number_Examen
GROUP BY e.Name_Employee, e.Role_Employee,t.Zvanie_Teacher, t.Stepen_Teacher, k.Name_Kafedra 

SELECT * FROM Primer3v
--4.	Создайте табличную переменную, содержащую три столбца («Номер месяца», «Название месяца», «Количество дней»),
--заполните ее для текущего года, и используйте ее.
DECLARE @November TABLE
(
Number_Month int,
Name_Month varchar(20),
Dates_Month int
)
INSERT INTO @November
VALUES (11, N'Ноябрь', 31)

SELECT * FROM @November
--5.	Создайте табличную переменную, содержащую список стран, площадь которых в
--100	раз меньше, чем средняя площадь стран на континенте, где они находятся, и используйте ее.
DECLARE @Countries TABLE 
(
    [Name_Country] NVARCHAR(100),
    [Capital_Country] NVARCHAR(100),
	[Square_Country] FLOAT,
	[Population_Country] BIGINT,
    [Continent_Country] NVARCHAR(100)
)
INSERT INTO @Countries 

SELECT c.Name_Country, c.Capital_Country, c.Square_Country, c.Population_Country, c.Continent_Country
FROM Countries c
WHERE c.Square_Country < (SELECT AVG(Square_Country) / 100 
FROM Countries WHERE Continent_Country = c.Continent_Country)


--6.	Создайте локальную временную таблицу, имеющую три столбца («Номер недели», «Количество экзаменов»,
--«Количество студентов»), заполните и используйте ее.
CREATE TABLE #TempTable 
(
    [Номер недели] INT,
    [Количество экзаменов] INT,
    [Количество студентов] INT
)

INSERT INTO #TempTable
VALUES
    (1, 10, 50),
    (2, 15, 60),
    (3, 12, 55),
    (4, 8, 45);

SELECT * FROM #TempTable

--7.	Создайте глобальную временную таблицу, содержащую название континентов, наибольшую и
--наименьшую площадь стран на них, заполните и используйте ее.
CREATE TABLE ##ContinentsData 
(
    Continent NVARCHAR(255),
    MaxArea FLOAT,
    MinArea FLOAT
)

INSERT INTO ##ContinentsData
VALUES
    (N'Continent1', 1500, 500),
    (N'Continent2', 2000, 800),
    (N'Continent3', 1200, 400)

SELECT * FROM ##ContinentsData
--8.	С помощью обобщенных табличных выражений напишите запрос для вывода списка сотрудников,
--чьи зарплаты меньше, чем средняя зарплата по факультету, их зарплаты и назва-ние факультета.
WITH EmployeeSalaries 
AS 
(
    SELECT e.Name_Employee, e.Salary_Employee, e.Role_Employee
    FROM Employee e
),
 AverageSalariesByFaculty AS (
    SELECT Role_Employee, AVG(Salary_Employee) AS AvgSalary
    FROM EmployeeSalaries
    GROUP BY Role_Employee
)

SELECT * FROM EmployeeSalaries em
JOIN AverageSalariesByFaculty a ON  em.Role_Employee= a.Role_Employee
WHERE em.Salary_Employee < a.AvgSalary
--9.	Напишите команды для удаления всех созданных вами представлений.
DROP VIEW Primer1v, Primer2v, Primer3v
DROP TABLE #TempTable, ##ContinentsData
---------------ЛАБОРАТОРНАЯ РАБОТА 14---------------------------------------
--1.	Создайте курсор, содержащий отсортированные по баллам фамилии и баллы учеников, откройте его, 
-- выведите первую строку, закройте и освободите курсор.(11 ученика мы удалили в запросах выше!!!)
DECLARE MyCursor CURSOR
FOR 
SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.Scores_Ucheniki
FROM Ucheniki u
ORDER BY u.Scores_Ucheniki
OPEN MyCursor
FETCH MyCursor
CLOSE MyCursor
DEALLOCATE MyCursor
--2.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, 
-- выведите пятую, предыдущую, с конца четвертую, следующую, первую строку, закройте и освободите курсор.
DECLARE MyCursor_2 CURSOR SCROLL
FOR
SELECT * FROM Ucheniki u
OPEN MyCursor_2
FETCH ABSOLUTE 5 FROM MyCursor_2
FETCH PRIOR FROM MyCursor_2
FETCH ABSOLUTE -4 FROM MyCursor_2
FETCH NEXT FROM MyCursor_2
FETCH FIRST FROM MyCursor_2
CLOSE MyCursor_2
DEALLOCATE MyCursor_2
--3.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, 
-- выведите последнюю, шесть позиций назад находящуюся, четыре позиций вперед находящуюся
--строку, закройте и освободите курсор.
DECLARE MyCursor_3 CURSOR SCROLL
FOR
SELECT * FROM Ucheniki u
OPEN MyCursor_3
FETCH LAST FROM MyCursor_3
FETCH ABSOLUTE -6 FROM MyCursor_3
FETCH ABSOLUTE 4 FROM MyCursor_3
CLOSE MyCursor_3
DEALLOCATE MyCursor_3
--4.	С помощью курсора, вычислите сумму баллов у учеников с наибольшим и наименьшим баллом.
DECLARE MyCursor_4 CURSOR SCROLL
FOR
SELECT u.Scores_Ucheniki FROM Ucheniki u
ORDER BY u.Scores_Ucheniki DESC
DECLARE @F FLOAT = 0, @B4 FLOAT
OPEN MyCursor_4
FETCH FIRST FROM MyCursor_4 INTO @B4
SET @F=@F+@B4
FETCH LAST FROM MyCursor_4 INTO @B4
SET @F=@F+@B4
print 'Сумма = ' + CAST(@F as Nvarchar(20))
CLOSE MyCursor_4
DEALLOCATE MyCursor_4
--5.	С помощью курсора, сгенерируйте строку вида 
-- «Ученики <список фамилий и названий предметов, разделенных запятыми> участвовали в олимпиаде».
DECLARE MyCursor_5 CURSOR SCROLL FOR
SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki
FROM Ucheniki u
DECLARE @ученики VARCHAR(100), @фамилии VARCHAR(50), @предметы VARCHAR(50)
OPEN MyCursor_5
SET @ученики = 'Ученики'
FETCH NEXT FROM MyCursor_5 INTO @фамилии, @предметы
WHILE @@FETCH_STATUS = 0
BEGIN
SET @ученики=@ученики+','+@фамилии+' по предмету"'+@предметы+'"'
FETCH NEXT FROM MyCursor_5 INTO @фамилии, @предметы
END
SET @ученики=@ученики + ' участвовали на олимпиаде.'
PRINT @ученики
CLOSE MyCursor_5
DEALLOCATE MyCursor_5
--6.	Создайте курсор, содержащий список учеников, с его помощью выведите учеников 
--с нечетной позицией.
DECLARE MyCursor_6 CURSOR SCROLL--здесь 12 строка равна 11, а 14 равна 13
FOR
SELECT * FROM Ucheniki u
OPEN MyCursor_6
FETCH ABSOLUTE 1 FROM MyCursor_6
WHILE @@FETCH_STATUS = 0
BEGIN
FETCH RELATIVE 2 FROM MyCursor_6
END
CLOSE MyCursor_6
DEALLOCATE MyCursor_6

--7.	Создайте курсор, содержащий отсортированный по убыванию баллов список учеников, откройте его, 
-- для каждого ученика выведите фамилию, предмет, школу, баллы и процентное соотношение 
--баллов с предыдущим учеником.
DECLARE MyCursor_7 CURSOR SCROLL FOR
SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki
FROM Ucheniki u
DECLARE @F7 VARCHAR(50)
DECLARE @P7 VARCHAR(50)
DECLARE @S7 VARCHAR(50)
DECLARE @B7 FLOAT
DECLARE @O7 FLOAT = 0
OPEN MyCursor_7
FETCH NEXT FROM MyCursor_7 INTO @F7, @P7, @S7, @B7
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT
@F7 AS Фамилия
,@P7 AS Предмет
,@S7 AS Школа
,@B7 AS Баллы
,ABS(@B7 - @O7) AS Разница
SET @O7 = @B7
FETCH NEXT FROM MyCursor_7 INTO @F7, @P7, @S7, @B7
END
CLOSE MyCursor_7
DEALLOCATE MyCursor_7
-------------------ЛАБОРАТОРНАЯ РАБОТА 15-----------------------
--zadanie
--1.	Вывести список учеников и разницу между баллами ученика и максимальным баллом в каждой строке.
				SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
				u.Scores_Ucheniki - MAX(u.Scores_Ucheniki) OVER() AS Разница
				FROM Ucheniki u
--2.	Вывести список учеников и процентное соотношение к среднему баллу в каждой строке.
			
			SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
			U.Scores_Ucheniki*100/ AVG(U.Scores_Ucheniki) OVER() AS Процент
			FROM Ucheniki u

--3.	Вывести список учеников и минимальный балл в школе в каждой строке.
		SELECT  , 
		MIN(u.Scores_Ucheniki) OVER(PARTITION BY u.School_Ucheniki) as min_b
		FROM Ucheniki u
--4.	Вывести список учеников и суммарный балл в школе в каждой строке, отсортировать по школам в оконной функции.
		SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
		SUM(u.Scores_Ucheniki) OVER(PARTITION BY u.School_Ucheniki ORDER BY u.School_Ucheniki) AS SUMMMM
		FROM Ucheniki u
--5.	Вывести список учеников и номер строки при сортировке по фамилиям в обратном алфавитном порядке.
		SELECT ROW_NUMBER() OVER(ORDER BY u.Familiya_Ucheniki DESC) AS Номер_строки,
		u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki
		FROM Ucheniki u 
--6.	Вывести список учеников, номер строки внутри школы и количество учеников в школе при сортировке по баллам по убыванию.
		SELECT  ROW_NUMBER() OVER(PARTITION BY u.School_Ucheniki ORDER BY u.Scores_Ucheniki DESC) AS Номер_строки,
        u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
		COUNT(*) OVER () AS Количество
		FROM Ucheniki u
--7.	Вывести список учеников и ранг по баллам.
		SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
		RANK() OVER(ORDER BY u.Scores_Ucheniki DESC) AS Ранг
		FROM Ucheniki u
--8.	Вывести список учеников и сжатый ранг по баллам. Результат отсортировать по фамилии в алфавитном порядке.
		SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
		DENSE_RANK() OVER(ORDER BY u.Scores_Ucheniki DESC) AS Сж_Ранг
		FROM Ucheniki u
		ORDER BY u.Familiya_Ucheniki ASC
--9.	Вывести список учеников, распределенных по пяти группам по фамилии.
		SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
		NTILE(5) OVER(ORDER BY u.Familiya_Ucheniki) AS Гр_Фам
		FROM Ucheniki u
--10.	Вывести список учеников, распределенных по трем группам по баллам внутри школы.
		SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
		NTILE(3) OVER(PARTITION BY u.School_Ucheniki ORDER BY u.Familiya_Ucheniki) AS Гр_Фам
		FROM Ucheniki u
--11.	Вывести список учеников и разницу с баллами ученика, находящегося выше на три позиции при сортировке по возрастанию баллов.
		SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
		u.Scores_Ucheniki - LAG(u.Scores_Ucheniki,3) OVER(ORDER BY u.Scores_Ucheniki ASC) AS Разница
		FROM Ucheniki u

--12.	Вывести список учеников и разницу с баллами следующего ученика при сорти-ровке по убыванию баллов, значение по умолчанию использовать 0.
		SELECT u.Familiya_Ucheniki, u.Subject_Ucheniki, u.School_Ucheniki, u.Scores_Ucheniki,
		u.Scores_Ucheniki - LEAD(u.Scores_Ucheniki,1,0) OVER(ORDER BY u.Scores_Ucheniki DESC) AS Разница
		FROM Ucheniki u
-------------------ЛАБОРАТОРНАЯ РАБОТА 16-----------------------
--1.Напишите запрос, который выводит максимальный балл учеников по школам, по каждому предмету по каждой школе и промежуточные итоги.

		SELECT u.Subject_Ucheniki, u.School_Ucheniki,  MAX(u.Scores_Ucheniki) AS max_b
		FROM Ucheniki u
		GROUP BY u.Subject_Ucheniki, u.School_Ucheniki
		WITH ROLLUP
--2.Напишите запрос, который выводит минимальный балл учеников по школам и по предметам, и промежуточные итоги.
		SELECT u.Subject_Ucheniki, u.School_Ucheniki, MIN(u.Scores_Ucheniki) AS MIN_b
		FROM Ucheniki u
		GROUP BY u.Subject_Ucheniki, u.School_Ucheniki
		WITH CUBE
--3.Напишите запрос, который выводит средний балл учеников по школам и по предметам.
		SELECT u.Subject_Ucheniki, u.School_Ucheniki, avg(u.Scores_Ucheniki) AS sred_b
		FROM Ucheniki u
		GROUP BY 
		GROUPING SETS (u.Subject_Ucheniki, u.School_Ucheniki)
		
--4.Напишите запрос, который выводит количество учеников по каждой школе по предметам и промежуточные итоги. NULL значения заменить на соответствующий текст.
		SELECT COALESCE(u.Subject_Ucheniki, 'ИТОГО') AS Предмет,
		COALESCE(u.School_Ucheniki, 'Итого')  AS Школа,
		COUNT(u.Familiya_Ucheniki) AS Количество
		FROM Ucheniki u
		GROUP BY 
		 ROLLUP (u.Subject_Ucheniki, u.School_Ucheniki)
--5.Напишите запрос, который выводит суммарный балл учеников по школам и по пред-метам, и промежуточные итоги. В итоговых строках NULL значения заменить на соответству-ющий текст в зависимости от группировки.
			SELECT
			IIF(GROUPING(u.Subject_Ucheniki)=1, 'ИТОГО',u.Subject_Ucheniki ) AS Предмет,
			IIF(GROUPING(u.School_Ucheniki)=1, 'Итого',u.School_Ucheniki) AS Школа,
			SUM(u.Scores_Ucheniki) AS Сумма
			FROM
			Ucheniki U
			GROUP BY
			CUBE(u.Subject_Ucheniki, u.School_Ucheniki)

--6.Напишите запрос, который выводит максимальный балл учеников по школам и по предметам. В итоговых строках NULL значения заменить на соответствующий текст в зависимости от уровней группировки.
			SELECT
			CASE GROUPING_ID(u.Subject_Ucheniki, u.School_Ucheniki)
			WHEN 1 THEN 'Итого по предметам'
			WHEN 3 THEN 'Итого'
			ELSE ''
			END AS Итого,
			ISNULL(u.Subject_Ucheniki, '') AS Предмет,
			ISNULL(u.School_Ucheniki, '') AS Школа,
			MAX(u.Scores_Ucheniki) AS Количество
			FROM
			Ucheniki u
			GROUP BY
			ROLLUP(u.Subject_Ucheniki, u.School_Ucheniki)

--7.Напишите запрос, который выводит средний балл учеников по школам в столбцы.
			SELECT
			'Средний балл' AS [Средний балл учеников по школам], Лицей, Гимназия
			FROM
			(
				SELECT
				School_Ucheniki, Scores_Ucheniki
				FROM Ucheniki 
			) AS SOURCE_TABLE
			PIVOT
			(
				AVG(Scores_Ucheniki)
				FOR School_Ucheniki IN (Лицей, Гимназия)) AS PIVOT_TABLE
--8.Напишите запрос, который выводит средний балл учеников по школам в столбцы и по предметам в строки.
				SELECT
				  School_Ucheniki, Математика, Физика, Химия
				FROM
				(
					SELECT
					School_Ucheniki, Subject_Ucheniki, Scores_Ucheniki
					FROM
					Ucheniki 
				) AS SOURCE_TABLE
				PIVOT
				(
					AVG(Scores_Ucheniki)
					FOR Subject_Ucheniki IN (Математика, Физика, Химия)
				) AS PIVOT_TABLE
--9.Напишите запрос, который выводит названия предметов, фамилии учеников и школы в один столбец.
				SELECT
				Familiya_Ucheniki, [Предмет или школа]
				FROM Ucheniki
				UNPIVOT (
				[Предмет или школа] FOR Значение IN (Subject_Ucheniki, School_Ucheniki)
				) unpvt
-------------------ЛАБОРАТОРНАЯ РАБОТА 17-----------------------
--1.Создайте и запустите динамический SQL-запрос, выбирающий первые N строк из заданной таблицы.
DECLARE @DSQL VARCHAR(100)
DECLARE @TN VARCHAR(50)
SET @TN = 'Ucheniki'
SET @DSQL = 'SELECT TOP 5 * FROM ' + @TN
EXECUTE (@DSQL)
--2.Создайте и запустите динамический SQL-запрос, выбирающий все страны из таблицы «Страны», 
--последняя буква названия которых расположена в заданном диапазоне.
DECLARE @DSQL NVARCHAR(100)
DECLARE @TN NVARCHAR(50)
SET @TN = N'[а-я]'
SET @DSQL = N'SELECT Name_Country FROM Countries WHERE Name_Country LIKE N''%'+@TN+'''';
EXECUTE (@DSQL)
--3.Создайте временную таблицу #Temp и добавьте к ней название столбцов таблицы «Страны». 
--Создайте курсор, который, построчно читая таблицу #Temp, выбирает каждый раз соответствующий столбец из таблицы «Страны».
CREATE TABLE #TEMP
(
columnname NVARCHAR(50)
)

INSERT INTO #TEMP
VALUES
('Id_Country'), ('Name_Country'),
('Capital_Country'), ('Square_Country'), ('Continent_Country')

DECLARE TC CURSOR
FOR SELECT columnname FROM #TEMP
	OPEN TC
	DECLARE @TNN VARCHAR(50)
	FETCH FROM TC INTO @TNN
	WHILE @@FETCH_STATUS = 0
		BEGIN
		EXECUTE ('SELECT '+@TNN+' FROM Countries')
		FETCH FROM TC INTO @TNN
	END
	CLOSE TC
DEALLOCATE TC
DROP TABLE #TEMP
--4.Создайте процедуру, которая принимает как параметр список столбцов, название таблицы и выбирает 
--заданные столбцы из заданной таблицы.
CREATE PROCEDURE Primer4P
    @columns NVARCHAR(MAX),
    @table NVARCHAR(128)
AS
BEGIN
    DECLARE @query NVARCHAR(MAX);
    SET @query = 'SELECT ' + @columns + ' FROM ' + @table
    EXEC sp_executesql @query
END
EXEC Primer4P 'Id_Country, Name_Country', 'Countries'
--5.Создайте процедуру, принимающую как параметр список столбцов, название таб-лицы, название 
--проверяемого столбца, знак сравнения, значение проверки и выбирающую заданные столбцы из заданной таблицы в заданных условиях.
CREATE PROCEDURE Primer5P
    @columns_list NVARCHAR(MAX),
    @table_name NVARCHAR(128),
	@check_column NVARCHAR(128),
	@check_op NVARCHAR(128),
	@check_arg NVARCHAR(50)
AS
BEGIN
    DECLARE @query NVARCHAR(MAX)
    SET @query = 'SELECT ' + @columns_list + ' FROM ' + @table_name + ' WHERE ' + @check_column + ' '+ @check_op + ' ' + @check_arg
    EXEC sp_executesql @query
END

EXEC Primer5P 'Id_Countries, Name_Countries', 'Countries', 'Name_Countries', 'like', '''%н'''
--6.Выберите список европейских стран из таблицы «Страны» и экспортируйте в RAW формате XML.
SELECT * FROM Countries c
WHERE c.Continent_Country = N'Европа'
FOR XML  RAW
--7.Выберите список стран с населением больше 100 млн. чел. из таблицы «Страны» и экспортируйте в PATH формате XML.
SELECT * FROM Countries c
WHERE c.Population_Country >100000000
FOR XML  PATH
--8.Выберите список учеников из школы «Лицей» из таблицы «Ученики» и экспорти-руйте в PATH формате JSON
SELECT * FROM Ucheniki u
WHERE u.School_Ucheniki = 'Лицей'
FOR JSON  PATH

