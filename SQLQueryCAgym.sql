--creating Trainer table

create table Trainer
(
TrainerID int identity(1,1),
FirstName varchar(40),
Surname varchar(50),
Pps varchar(15),
Address varchar(200),
PhoneNumber varchar(20),
MainSkill varchar(50),
Primary key (TrainerID)
);


--creating table Member

create table Member
(
MemberID int identity(1,1),
FirstName varchar(40),
Surname varchar(50),
Photo image,
PaymentOptions varchar(10),
Email varchar(50),
Address varchar(200),
PhoneNumber varchar(20),
LetsGetFitText varchar(1),
LetsGetFitData varchar(1),
ActiveMember varchar(1),
Primary key (MemberID)
);


--creating table MembershipCard

create table MembershipCard
(
CardID int identity(1,1),
MemberID int,
DataAssigned date,
isActive varchar(1),
Primary key (CardID),
Foreign key (MemberID) references Member(MemberID) on delete set null
);

--creating table Activity

create table Activity
(
ActivityID int identity(1,1),
CardID int,
UsedOn date,
ActivityDetails varchar(20),
Primary key (ActivityID),
Foreign key (CardID) references MembershipCard(CardID)
);

--creating table Payment

create table Payment
(
PaymentID int identity(1,1) primary key,
MemberID int foreign key references Member(MemberID) on delete set null,
PaymentDate date not null,
Amount decimal not null
);
 
--creating table Program

create table Program
(
ProgramID int identity(1,1) primary key,
ProgramName varchar(50),
ProgramDetails varchar(200)
);

--creating table ProgramSession

create table PersonalizedProgram
(
SessionID int identity(1,1) primary key,
TrainerID int foreign key references Trainer(TrainerID),
MemberID int foreign key references Member(MemberID) on delete set null,
ProgramID int foreign key references Program(ProgramID),
DateStarted date
);

--creating some data for testing

--inserting data to Trainer

insert into Trainer 
values('Mike','Stone','87896543','47 Sea Park, Santry, Dublin, Ireland','+35385234234','Working well with old people'),
('Philip','Noret','54327815','58 Townside, Cabra, Dublin, Ireland','+35386123123','Cardio'),
('John','Saign','43569732','87 Tunk street, Gliss, Wonderland','+57554327642','Machins'),
('Steven','Floren','36782178','43 Poskin road, Titin, Walesco','+3218743213','Joga'),
('Aoife','Darre','54328732','58 Oskin road, Dorting, Ousaner','+8563212334','Cardio'),
('Niko','Scoton','89876543','48 Kaston road, Belewingin, Iskjerso','+7965321233','Cardio'),
('Pati','Skonil','54337213','75 Sky road, Haskin, Oskionski','+5433729123','Machines');


--inserting data to Program

insert into Program
values('Cardio, swimming, light weights','Weight loose'),
('Light weight, swimming, mat', 'Injures recovery'),
('Heavy weight, machines treining','Muscle grow'),
('Joga, mat exercises','Any age');

--inserting data to Member

insert into Member
values
('Sonny','Biston',null,'Quarterly','Sonny@email.com','40 Mindview road, Insertin, Dosonder','+5343221234',0,0,1),
('Fiona','Ontas',null,'Annualy','Fiona@email.com','34 Flowerland, Erin, Forkington','+347873212',1,0,1),
('Apollo','Androm',null,'Monthly','Apollo@email.com','8 Infinity Road, Sunternia, Tastinum','+534213678',1,1,0),
('Jennifer','Portin',null,'Monthly','Jennifer@email.com','3 Sea road, Inster, Porturon','+654377221',1,1,1),
('Tom','Kirn',null,'Annualy','Tom@email.com','7 Inside street, Nulon, Uran','+876352441',0,0,1),
('Piter','Fronk',null,'Monthly','Piter@email.com','8 Newtown, Windornet, Sinoria','+987345212',1,0,0),
('Andi','Konsot',null,'Quarterly','Andi@email.com','24 Sinoria road, Inskini, Saturn','002343212988',0,0,1);

--inserting data to MembershipCard

insert into MembershipCard
values
('4',Convert(date,'11/11/2018',103),1),
('7',Convert(date,'08/10/2019',103),1),
('1',Convert(date,'04/05/2018',103),1),
('2',Convert(date,'17/07/2018',103),1),
('5',Convert(date,'22/01/2019',103),1),
('3',Convert(date,'10/10/2018',103),0),
('6',Convert(date,'12/09/2019',103),0);


--inserting data to ProgramSession

insert into PersonalizedProgram
values
('1','1','2',CONVERT(date, '04/05/2018',103)),
('3','1','1',CONVERT(date, '04/07/2018',103)),
('2','1','2',CONVERT(date, '04/09/2018',103)),
('5','1','3',CONVERT(date, '04/11/2018',103)),
('1','1','1',CONVERT(date, '04/01/2019',103)),
('4','1','4',CONVERT(date, '04/03/2019',103)),
('3','1','2',CONVERT(date, '04/05/2020',103)),
('2','1','3',CONVERT(date, '04/07/2020',103)),
('3','1','2',CONVERT(date, '04/09/2020',103)),
('1','1','1',CONVERT(date, '04/11/2020',103)),
('3','2','1', Convert(date,'17/07/2018',103)),
('2','2','1', Convert(date,'17/09/2018',103)),
('4','2','2', Convert(date,'17/11/2018',103)),
('5','2','4', Convert(date,'17/01/2019',103)),
('3','2','3', Convert(date,'17/03/2019',103)),
('2','2','4', Convert(date,'17/05/2019',103)),
('3','2','1', Convert(date,'17/07/2019',103)),
('3','2','3', Convert(date,'17/09/2019',103)),
('4','2','1', Convert(date,'17/11/2019',103)),
('5','2','1', Convert(date,'17/01/2020',103)),
('5','2','4', Convert(date,'17/03/2020',103)),
('5','2','3', Convert(date,'17/05/2020',103)),
('3','2','1', Convert(date,'17/07/2020',103)),
('4','2','2', Convert(date,'17/09/2020',103)),
('3','2','1', Convert(date,'17/11/2020',103)),
('2','3','3', Convert(date,'10/10/2018',103)),
('4','3','2', Convert(date,'10/12/2018',103)),
('4','4','4', Convert(date,'11/11/2018',103)),
('1','4','3', Convert(date,'11/09/2020',103)),
('2','4','1', Convert(date,'11/11/2020',103)),
('5','5','4', Convert(date,'22/01/2019',103)),
('5','5','3', Convert(date,'22/03/2019',103)),
('5','5','2', Convert(date,'22/05/2019',103)),
('5','5','1', Convert(date,'22/07/2019',103)),
('4','5','4', Convert(date,'22/09/2019',103)),
('2','5','4', Convert(date,'22/11/2019',103)),
('3','5','4', Convert(date,'22/01/2020',103)),
('3','5','2', Convert(date,'22/03/2020',103)),
('3','5','1', Convert(date,'22/05/2020',103)),
('2','5','2', Convert(date,'22/07/2020',103)),
('1','5','4', Convert(date,'22/09/2020',103)),
('5','5','3', Convert(date,'22/11/2020',103)),
('1','6','1', Convert(date,'12/09/2019',103)),
('2','7','3', Convert(date,'08/10/2019',103)),
('2','7','4', Convert(date,'08/12/2019',103)),
('1','7','3', Convert(date,'08/02/2020',103)),
('2','7','1', Convert(date,'08/04/2020',103)),
('5','7','3', Convert(date,'08/06/2020',103)),
('4','7','2', Convert(date,'08/08/2020',103)),
('1','7','4', Convert(date,'08/10/2020',103));


--inserting data to Payment

insert into Payment
values
(1, CONVERT(date, '04/05/2018',103), 250),
(1, CONVERT(date, '04/08/2018',103), 250),
(1, CONVERT(date, '04/11/2018',103), 250),
(1, CONVERT(date, '04/02/2019',103), 250),
(1, CONVERT(date, '04/05/2020',103), 250),
(1, CONVERT(date, '04/08/2020',103), 250),
(1, CONVERT(date, '04/11/2020',103), 250),
(2, Convert(date,'17/07/2018',103), 1000),
(2, Convert(date,'17/07/2019',103), 1000),
(2, Convert(date,'17/07/2020',103), 1000),
(3, Convert(date,'10/10/2018',103), 100),
(3, Convert(date,'10/11/2018',103), 100),
(3, Convert(date,'10/12/2018',103), 100),
(4, Convert(date,'11/11/2018',103), 100),
(4, Convert(date,'11/12/2018',103), 100),
(4, Convert(date,'11/09/2020',103), 100),
(4, Convert(date,'11/10/2020',103), 100),
(4, Convert(date,'11/11/2020',103), 100),
(5, Convert(date,'22/01/2019',103), 1000),
(5, Convert(date,'22/01/2020',103), 1000),
(6, Convert(date,'12/09/2019',103), 100),
(6, Convert(date,'12/10/2019',103), 100),
(7, Convert(date,'08/10/2019',103), 250),
(7, Convert(date,'08/01/2020',103), 250),
(7, Convert(date,'08/04/2020',103), 250),
(7, Convert(date,'08/07/2020',103), 250),
(7, Convert(date,'08/10/2020',103), 250);


--inserting data to Avtivity

insert into Activity
values
(1, CONVERT(date, '04/05/2018',103),'Door nr 1'),
(1, CONVERT(date, '14/05/2018',103),'Door nr 1'),
(1, CONVERT(date, '04/06/2018',103),'Door nr 1'),
(1, CONVERT(date, '18/06/2018',103),'Door nr 1'),
(1, CONVERT(date, '04/07/2018',103),'Door nr 1'),
(1, CONVERT(date, '17/07/2018',103),'Door nr 1'),
(1, CONVERT(date, '04/08/2018',103),'Door nr 1'),
(1, CONVERT(date, '20/07/2018',103),'Door nr 1'),
(1, CONVERT(date, '04/09/2018',103),'Door nr 1'),
(1, CONVERT(date, '22/09/2018',103),'Door nr 1'),
(1, CONVERT(date, '04/11/2018',103),'Door nr 1'),
(1, CONVERT(date, '21/11/2018',103),'Door nr 1'),
(1, CONVERT(date, '04/12/2018',103),'Door nr 1'),
(1, CONVERT(date, '19/12/2018',103),'Door nr 1'),
(1, CONVERT(date, '04/01/2019',103),'Door nr 1'),
(1, CONVERT(date, '12/01/2019',103),'Door nr 1'),
(1, CONVERT(date, '04/02/2019',103),'Door nr 1'),
(1, CONVERT(date, '14/02/2019',103),'Door nr 1'),
(1, CONVERT(date, '04/03/2019',103),'Door nr 1'),
(1, CONVERT(date, '04/05/2020',103),'Door nr 1'),
(1, CONVERT(date, '12/05/2020',103),'Door nr 1'),
(1, CONVERT(date, '04/07/2020',103),'Door nr 1'),
(1, CONVERT(date, '11/07/2020',103),'Door nr 1'),
(1, CONVERT(date, '04/09/2020',103),'Door nr 1'),
(1, CONVERT(date, '11/09/2020',103),'Door nr 1'),
(1, CONVERT(date, '04/11/2020',103),'Door nr 1'),
(2, Convert(date,'17/07/2018',103),'Door nr 1'),
(2, Convert(date,'22/07/2018',103),'Door nr 1'),
(2, Convert(date,'30/07/2018',103),'Door nr 1'),
(2, Convert(date,'02/08/2018',103),'Door nr 1'),
(2, Convert(date,'10/08/2018',103),'Door nr 1'),
(2, Convert(date,'12/08/2018',103),'Door nr 1'),
(2, Convert(date,'17/08/2018',103),'Door nr 1'),
(2, Convert(date,'17/11/2018',103),'Door nr 1'),
(3, Convert(date,'10/10/2018',103),'Door nr 1'),
(3, Convert(date,'12/10/2018',103),'Door nr 1'),
(3, Convert(date,'14/10/2018',103),'Door nr 1'),
(3, Convert(date,'18/10/2018',103),'Door nr 1'),
(3, Convert(date,'25/10/2018',103),'Door nr 1'),
(3, Convert(date,'05/11/2018',103),'Door nr 1'),
(3, Convert(date,'08/11/2018',103),'Door nr 1'),
(3, Convert(date,'10/12/2018',103),'Door nr 1'),
(4, Convert(date,'11/11/2018',103),'Door nr 1'),
(4, Convert(date,'14/11/2018',103),'Door nr 1'),
(4, Convert(date,'17/11/2018',103),'Door nr 1'),
(4, Convert(date,'11/09/2020',103),'Door nr 1'),
(4, Convert(date,'15/09/2020',103),'Door nr 1'),
(4, Convert(date,'22/09/2020',103),'Door nr 1'),
(4, Convert(date,'01/10/2020',103),'Door nr 1'),
(4, Convert(date,'10/10/2020',103),'Door nr 1'),
(4, Convert(date,'17/10/2020',103),'Door nr 1'),
(4, Convert(date,'11/11/2020',103),'Door nr 1'),
(5, Convert(date,'22/01/2019',103),'Door nr 1'),
(5, Convert(date,'24/01/2019',103),'Door nr 1'),
(5, Convert(date,'25/01/2019',103),'Door nr 1'),
(5, Convert(date,'01/02/2019',103),'Door nr 1'),
(5, Convert(date,'22/05/2019',103),'Door nr 1'),
(5, Convert(date,'22/11/2019',103),'Door nr 1'),
(5, Convert(date,'22/01/2020',103),'Door nr 1'),
(5, Convert(date,'22/05/2020',103),'Door nr 1'),
(5, Convert(date,'27/05/2020',103),'Door nr 1'),
(6, Convert(date,'12/09/2019',103),'Door nr 1'),
(6, Convert(date,'15/09/2019',103),'Door nr 1'),
(6, Convert(date,'20/09/2019',103),'Door nr 1'),
(6, Convert(date,'22/09/2019',103),'Door nr 1'),
(6, Convert(date,'27/09/2019',103),'Door nr 1'),
(6, Convert(date,'02/10/2019',103),'Door nr 1'),
(6, Convert(date,'12/10/2019',103),'Door nr 1'),
(6, Convert(date,'15/10/2019',103),'Door nr 1'),
(7, Convert(date,'08/10/2019',103),'Door nr 1'),
(7, Convert(date,'11/10/2019',103),'Door nr 1'),
(7, Convert(date,'18/10/2019',103),'Door nr 1'),
(7, Convert(date,'28/10/2019',103),'Door nr 1'),
(7, Convert(date,'08/01/2020',103),'Door nr 1'),
(7, Convert(date,'18/05/2020',103),'Door nr 1'),
(7, Convert(date,'12/07/2020',103),'Door nr 1');

--end of creating data for testing



--creating view which will return all active Members, 
--their Program details and Trainer details

go
create view viewActiveMembers
as
select top (Select count(*) from Member where ActiveMember=1) Member.FirstName+' '+ 
Member.Surname as MemberFullName, Trainer.FirstName+' '+Trainer.Surname 
as TrainerFullName, Trainer.MainSkill 
as TrainerMainSkill, Trainer.PhoneNumber as TrainerPhoneNumber, Program.ProgramDetails, Program.ProgramName 
from PersonalizedProgram
inner join Member on Member.MemberID=PersonalizedProgram.MemberID
inner join Trainer on Trainer.TrainerID=PersonalizedProgram.TrainerID
inner join Program on Program.ProgramID=PersonalizedProgram.ProgramID
where Member.ActiveMember=1 order by DateStarted desc;

go
-- testing view viewActiveMembers
select * from viewActiveMembers;

go


--creating view to see not active members that ticked GDPR box for marketing propose 

Create view viewNotActiveMembersGdprTicked
as
select * from Member 
where (Member.ActiveMember=0 and Member.LetsGetFitData=1);
go

--testing view viewNotActiveMembersGdprTicked

select * from viewNotActiveMembersGdprTicked
go

--creating stored procedure to create Trainer

create procedure spCreateTrainer
(
@FirstName as varchar(40), 
@Surname as varchar(50),
@Pps as varchar(15), 
@Address as varchar(200), 
@PhoneNumber as varchar(20),
@MainSkill as varchar(50)
)
as
begin
Insert into Trainer
values
(@FirstName,@Surname,@Pps,@Address,@PhoneNumber,@MainSkill);
end

--testing procedure spCreateTrainer
execute spCreateTrainer'Neptun','Uranus','876353421','256 Park road, Indoskin','+3675271821','Machines';

go
select * from Trainer
go

--creating stored procedure for creating member and their program

create procedure spCreateMemberAndProgram
(
@FirstName as varchar(40),
@Surname as varchar(50),
@Photo as image,
@PaymentOption as varchar(10),
@Email as varchar(50),
@Address as varchar(200),
@PhoneNumber as varchar(20),
@LetsGetFitText as varchar(1),
@LetsGetFitData as varchar(1),
@ActiveMember as varchar(1),
@ProgramID as int,
@TrainerID as int,
@ProgramDateStarted as date
)
as
begin

insert into Member
values
(@FirstName,@Surname,@Photo,@PaymentOption,@Email,@Address,@PhoneNumber,
@LetsGetFitText,@LetsGetFitData,@ActiveMember);

declare @MemberID int;
set @MemberID = (Select MemberID from Member where Member.FirstName=@FirstName and 
Member.Surname=@Surname and Member.Email=@Email and Member.PhoneNumber=@PhoneNumber)

insert into PersonalizedProgram
values
(@TrainerID,@MemberID,@ProgramID,@ProgramDateStarted);

end
go

--testing stored procedure spCreateMemberAndProgram

execute spCreateMemberAndProgram 'Gudin','Mostano',null,'Monthly',
'Gudin@email.com','85 Kand road, Mustarke, Nidelka','+432535463',1,1,1,3,7,
'2020/11/11';

--query to see if member is added and program created
select * from Member
inner join PersonalizedProgram on PersonalizedProgram.MemberID=Member.MemberID where Member.Surname='Mostano';
go

--creating stored procedure  to delete a Member and foreign key records associated 
--with this Member if they have made their final 
--payment and requested their details be deleted, as per GDPR compliance, i.e. 
--they did not tick the box. This data must be FULLY deleted, i.e. a
--“hard delete”, delete member within 30 days after end of membership 
--but if member ticket GDPR box will be set to not active(soft delete)


go
create procedure spHardDelete @MemberID as int
as
begin


declare @PaymentOption varchar(10)

if exists(select Member.PaymentOptions from Member 
	where Member.MemberID=@MemberID)
	set @PaymentOption=(select Member.PaymentOptions from Member 
	where Member.MemberID=@MemberID)
else
	Print 'Member doesnt exist'
	

declare @DateOfLastPayment date
set @DateOfLastPayment=(select top(1) Payment.PaymentDate from Payment 
where Payment.MemberID=@MemberID order by Payment.PaymentDate desc)

declare @CurrentDate date
set @CurrentDate= GETDATE()

declare @daysToAddReadyForDelete int

declare @dateReadyforDelete date

if @PaymentOption='Monthly'
	begin
	set @daysToAddReadyForDelete=30
	set @dateReadyForDelete=DATEADD(day, @daysToAddReadyForDelete, @DateOfLastPayment)
	end
else if @PaymentOption='Quarterly'
	begin
	set @daysToAddReadyForDelete=90
	set @dateReadyForDelete=DATEADD(day, @daysToAddReadyForDelete, @DateOfLastPayment)
	end
else if @PaymentOption='Annualy'
	begin
	set @daysToAddReadyForDelete=365
	set @dateReadyForDelete=DATEADD(day, @daysToAddReadyForDelete, @DateOfLastPayment)
	end
else
	Print 'Member doesnt have Payment Options set'
	

declare @MemberIdDidntTickGdpr int

set @MemberIdDidntTickGdpr = (select MemberID from Member where Member.MemberID=@MemberID and
Member.ActiveMember=0 and Member.LetsGetFitData=0);

if @MemberID=@MemberIdDidntTickGdpr and @CurrentDate>@dateReadyforDelete
	begin
	begin try
		delete from Member where MemberID=@MemberID
		Print 'Procedure complete.'
	end try
	begin catch
		SELECT  
			ERROR_NUMBER() AS ErrorNumber   
			,ERROR_PROCEDURE() AS ErrorProcedure  
			,ERROR_LINE() AS ErrorLine  
			,ERROR_MESSAGE() AS ErrorMessage;
	end catch
	end
else if exists(select Member.MemberID from Member 
	where Member.MemberID=@MemberID and Member.ActiveMember=1 and @CurrentDate< @dateReadyforDelete)
	Print 'Member is active'
else if exists(select Member.MemberID from Member 
	where Member.MemberID=@MemberID and Member.ActiveMember=0 and Member.LetsGetFitData=1 and @CurrentDate> @dateReadyforDelete)
	Print 'Member ticked GDPR box and is already not active'
else if exists(select Member.MemberID from Member 
	where Member.MemberID=@MemberID and Member.LetsGetFitData=1 and @CurrentDate>@dateReadyforDelete)
	begin
	update Member
	set ActiveMember=0 where MemberID=@MemberID;
	Print 'Member ticked GDPR data box, set member as not active'
	end
else
	Print 'MemberID doesnt exist'
end


--start testing procedure spHardDelete

--inserting test member to Member table

insert into Member
values
('Jack', 'Fini',null,'Monthly','Jack@email.com', '34 Treepark road, Unsiki, 
Watruti','+7548732211',0,0,0),
('Angela', 'Moore', null, 'Monthly', 'Angela@email.com', '27 Parkside voley, Sindon, Oskino',
'+873526127',1,1,1);

--inserting data about first test member to few tables
go
begin
declare @MemberID as int;
set @MemberID=(select top (1) MemberID from Member where Member.FirstName='Jack' and 
Member.Surname='Fini' and Member.Email='Jack@email.com')

insert into PersonalizedProgram
values
(1,@MemberID,2,convert(date, '2019-10-10'));

insert into Payment
values 
(@MemberID, convert(date, '2019-10-10'),100);

insert into MembershipCard
values 
(@MemberID, convert(date, '2019-10-10'),0);
end

--inserting data about second test member to few tables

go
begin
declare @MemberID as int;
set @MemberID=(select top (1) MemberID from Member where Member.FirstName='Angela' and 
Member.Surname='Moore' and Member.Email='Angela@email.com')

insert into PersonalizedProgram
values
(1,@MemberID,2,convert(date, '2019-09-10'));

insert into Payment
values 
(@MemberID, convert(date, '2019-09-10'),100);

insert into MembershipCard
values 
(@MemberID, convert(date, '2019-09-10'),0);
end

--checking inserted data
select * from Member 
inner join PersonalizedProgram on Member.MemberID=PersonalizedProgram.MemberID
inner join MembershipCard on MembershipCard.MemberID=Member.MemberID
inner join Payment on Member.MemberID=Payment.MemberID
where (Member.FirstName='Jack' or Member.FirstName='Angela') and (Member.Surname='Fini' or Member.Surname='Moore')

--executing stored procedure dHardDelete providing MemberID = test member
--against memebr who left gym and didn't tick GDPR boxe

select * from Member
execute spHardDelete 9; 
select * from Member

--checking if entries are deleted
select * from Member
select * from PersonalizedProgram
select * from Payment
select * from MembershipCard

--executing stored procedure aginst active member

select * from Member
execute spHardDelete 1;
select * from Member

--executing stored procedure aginst not active member who ticked GDPR data box

select * from Member
execute spHardDelete 3;
select * from Member

--executing stored procedure aginst active member who ticked GDPR data box but left gym(soft delete)

select * from Member
execute spHardDelete 10;
select * from Member

--executing stored procedure aginst non existing member

select * from Member
execute spHardDelete 20;

--end testing spHardDelete


--Have a lovely day



