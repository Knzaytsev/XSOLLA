/*�������� ������� � ��������*/
create table Reviews(
    reviews_id integer primary key,
    cmnt varchar2(255) not null,
    date_play date not null,
    mark integer check(mark in (1, 2, 3, 4, 5)),
    game varchar2(255)
    constraint fk_game references games(game_name) unique
    );

/*�������� ������� � ������*/
create table Games(
    game_name varchar2(255) primary key,
    description varchar2(255) not null,
    publisher varchar2(255) not null,
    publisher_year date not null,
    genre varchar2(255) not null
    );
    
/*���������� ������� ������� � ������*/
insert all
    into Games values('Dishonored',	'������������ ���� � ����� �����-����� �� ������� ���� � ���������� RPG', 'Bethesda Softworks', 
        to_date('09.10.2012', 'DD.MM.YYYY'), 'Stealth')
    into Games values('Dishonored 2', '������������ ���� � ����� �����-����� �� ������� ���� � ���������� RPG',	'Bethesda Softworks',
    	to_date('11.11.2016', 'DD.MM.YYYY'),	'Action-adventure, Stealth')
    into Games values('Far Cry', '������������ ���� � ����� ������-��������������� ������ �� ������� ����', 'Ubisoft', 
        to_date('23.03.2004', 'DD.MM.YYYY'), 'Shooter')
    into Games values('Far Cry 2', '������������������ ��������� � ����� ����� �� ������� ���� � �������� ����', 'Ubisoft', 
        to_date('21.10.2008', 'DD.MM.YYYY'), 'Shooter')
    into Games values('Far Cry 3', '������������������� ��������� � ����� Action � �������� ���, � ���������� RPG', 'Ubisoft' ,
        to_date('29.11.2012', 'DD.MM.YYYY'),	'Shooter, RPG')
    into Games values('Mafia: The City of Lost Heaven', 
        '������������ ���� � ����� ������ �� �������� ���� � ���������� ��������������', 'Take-Two Interactive', 
        to_date('28.08.2002', 'DD.MM.YYYY'), 'Shooter, racing video game')
    into Games values('Metal Gear Solid', '������������ ���� � ����� �����-�����', 'Konami', 
        to_date('03.09.1998', 'DD.MM.YYYY'), 'Stealth')
    into Games values('The Witcher', '������������ ������� ����', 'CD Projekt',	
        to_date('24.10.2007', 'DD.MM.YYYY'), 'RPG')
    into Games values('The Witcher 2: Assassins of Kings', 
        '������������ ������� ����, ������������� �������� ��������� CD Projekt RED .',
        'CD Projekt', to_date('16.05.2011', 'DD.MM.YYYY'), 'Hack and slash, RPG')
    into Games values('The Witcher 3: Wild Hunt', 
        '������������������� ������������ ���� � ����� action/RPG, ������������� �������� ������� CD Projekt RED.',
        'CD Projekt', to_date('19.05.2015', 'DD.MM.YYYY'), 'Action, RPG')
select * from dual;
    
/*���������� ������� ������� � ��������*/
insert all
    into Reviews values(1, '������', to_date('05.09.2019', 'DD.MM.YYYY'), 4, 'Dishonored')
    into Reviews values(2, '������', to_date('09.05.2018', 'DD.MM.YYYY'), 1, 'Dishonored 2')
    into Reviews values(3, '�������', to_date('05.10.2019', 'DD.MM.YYYY'), 5, 'Metal Gear Solid')
    into Reviews values(4, '�������������', to_date('09.01.2018', 'DD.MM.YYYY'), 5, 'Far Cry')
select * from dual;

/*������ 2*/
select game_name, publisher_year from Games 
where  game_name not in (select game from reviews);

/*������ 3*/
select Games.*, Mark from Games join Reviews on Games.game_name = Reviews.game
where lower(Genre) like lower('%Stealth%')
order by Mark desc
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

/*������ 4*/
select regexp_replace(regexp_substr(game_name, '^(\d*(\w*[^0-9:])*)'), '\s$', '') as "�����", count(*) as "����������" from Games 
where game_name in (select game from reviews)
and
lower(publisher) like lower('%Bethesda%')
group by regexp_replace(regexp_substr(game_name, '^(\d*(\w*[^0-9:])*)'), '\s$', '');
