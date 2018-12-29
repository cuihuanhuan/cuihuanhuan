    case 1 "嵌套表：建表" 0
CREATE TYPE animal_ty AS OBJECT (
breed varchar2(25),
name varchar2(25),
birthdate date)
/
CREATE TYPE animals_nt as table of animal_ty
/
create table breeder(
num number (10),
breedername varchar2(25),
animals animals_nt)
nested table animals store as animals_nt_tab
/


    case 2 "嵌套表：INSERT" 0
CREATE TYPE animal_ty AS OBJECT (
breed varchar2(25),
name varchar2(25),
birthdate date)
/
CREATE TYPE animals_nt as table of animal_ty
/
create table breeder(
num number (10),
breedername varchar2(25),
animals animals_nt)
nested table animals store as animals_nt_tab
/
insert into breeder
values('1','mary',animals_nt(animal_ty('dog','butch','31-MAR-97'),
animal_ty('dog','rover','31-MAR-97'),
animal_ty('dog','julio','31-MAR-97')))
/
insert into breeder
values('2','jane',animals_nt(animal_ty('cat','an','31-MAR-97'),
animal_ty('cat','jame','31-MAR-97'),
animal_ty('cat','killer','31-MAR-97')))
/



        
    case 3 "嵌套表：UPDATE" 0
CREATE TYPE animal_ty AS OBJECT (
breed varchar2(25),
name varchar2(25),
birthdate date)
/
CREATE TYPE animals_nt as table of animal_ty
/
create table breeder(
num number (10),
breedername varchar2(25),
animals animals_nt)
nested table animals store as animals_nt_tab
/
insert into breeder
values('1','mary',animals_nt(animal_ty('dog','butch','31-MAR-97'),
animal_ty('dog','rover','31-MAR-97'),
animal_ty('dog','julio','31-MAR-97')))
/
insert into breeder
values('2','jane',animals_nt(animal_ty('cat','an','31-MAR-97'),
animal_ty('cat','jame','31-MAR-97'),
animal_ty('cat','killer','31-MAR-97')))
/
update table(select animals from breeder where num='1')x set x.breed='puppy' where x.name='butch'
/
update breeder set breedername='lily' where num='1'
/


    case 4 "嵌套表：DELETE" 0

CREATE TYPE animal_ty AS OBJECT (
breed varchar2(25),
name varchar2(25),
birthdate date)
/
CREATE TYPE animals_nt as table of animal_ty
/
create table breeder(
num number (10),
breedername varchar2(25),
animals animals_nt)
nested table animals store as animals_nt_tab
/
insert into breeder
values('1','mary',animals_nt(animal_ty('dog','butch','31-MAR-97'),
animal_ty('dog','rover','31-MAR-97'),
animal_ty('dog','julio','31-MAR-97')))
/
insert into breeder
values('2','jane',animals_nt(animal_ty('cat','an','31-MAR-97'),
animal_ty('cat','jame','31-MAR-97'),
animal_ty('cat','killer','31-MAR-97')))
/
update breeder set breedername='lily' where num='1'
/
update table(select animals from breeder where num='1')x set x.breed='puppy' where x.name='butch'
/
drop table breeder
/
drop  TYPE animal_ty
/
drop  TYPE animals_nt
/

