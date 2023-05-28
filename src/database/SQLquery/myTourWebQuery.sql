create database myTourWeb
go

use myTourWeb
go

create table Account(
	acc_ID int identity(1,1),
	acc_F_Name nvarchar(100) not null,
	acc_L_Name nvarchar(10) not null,
	acc_Account varchar(50) not null unique,
	acc_Password varchar(50) not null,
	acc_Email varchar(50) unique,
	acc_Birth varchar(50),
	acc_Phone varchar(10),
	constraint Pk_Account_ID primary key(acc_ID)
)
create table Locations(
	loca_ID int identity(1,1),
	loca_Name nvarchar(100) not null,
	loca_Image varchar(100) not null,
	loca_Description nvarchar(max),
	loca_Slug varchar(50),
	constraint Pk_Localions_ID primary key(loca_ID)
)
create table Tours(
	tours_ID int identity(1,1),
	tours_Name nvarchar(100) not null,
	loca_ID int,
	tours_Date nvarchar(50),
	tours_Day nvarchar(50),
	tours_Price  nvarchar(50),
	tours_Image_1 varchar(50) not null,
	tours_Image_2 varchar(50) not null,
	tours_Image_3 varchar(50) not null,
	tours_Image_4 varchar(50) not null,
	tours_Slug nvarchar(50) not null unique,
	tours_Description nvarchar(max),
	constraint Pk_Tours_ID primary key(tours_ID),
	Constraint Fk_Locations Foreign key(loca_ID) references Locations(loca_ID),
)
create table Booking(
	bo_ID int identity(1,1),
	bo_userName nvarchar(max) not null,
	bo_userEmail nvarchar(50) not null,
	acc_ID int null,
	tours_ID int,
	bo_userPhone nvarchar(50),
	bo_locaName nvarchar(50),
	bo_checkInDate varchar(20),
	bo_numberTourist int,
	bo_note nvarchar(max),
	constraint Pk_Booking_ID primary key(bo_ID),
	Constraint Fk_Account Foreign key(acc_ID) references Account(acc_ID),
	Constraint Fk_2_Locations Foreign key(tours_ID) references Tours(tours_ID),
)

create table bookDetails(
	bo_ID int,
	tours_ID int,
	detail_price Decimal(18,0),
	check(detail_price>0),
	Constraint Fk_Booking_ID Foreign key(bo_ID) references Booking(bo_ID),
	Constraint Fk_Tours_ID Foreign key(tours_ID) references Tours(tours_ID),
)

--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------Account------------------------------------------------------------
insert into Account values ('Nguyễn Văn','A','helloworld','12345','helloworld@gmail.com','2000-01-01','0902134597')
insert into Account values ('Nguyễn Văn','B','baseproject','12345','baseproject@gmail.com','2000-01-01','0904869523')
insert into Account values ('Nguyễn Văn','C','nodejs','12345','nodejs@gmail.com','2000-01-01','0542365879')
select * from Account;
go
drop table Account;
go
--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Locations-------------------------------------------------------------
insert into Locations values ('Da Lat','daLat.jpg','Cho dù được mệnh danh là thành phố ngàn thông, thành phố hoa hay thành phố sương mù… 
thì Đà Lạt vẫn luôn có sức quyến rũ đặc biệt đối với nhiều du khách trong nước và thế giới. Do đó, hành trình đến du lịch Đà Lạt ở miền 
Nam trên dải đất hình chữ S luôn là những chuyến đi lý tưởng được nhiều du khách lựa chọn. Giữa không gian thanh bình và yên tĩnh, 
Đà Lạt hiện lên với khung cảnh mộng mơ và nên thơ nhờ cái lạnh cao nguyên ban đêm, sương mù buổi sáng cùng dải rừng thông bạt ngàn bao quanh. 
Chắc hẳn chỉ nhắc đến đây thôi cũng đủ để làm biết bao tâm hồn tín đồ du lịch phải háo hức trước vẻ đẹp thiên nhiên nơi đây. 
Hãy cùng tour du lịch đến Đà Lạt để tận hưởng nhiều trải nghiệm thú vị về địa điểm này nhé!',
'Da-Lat-Locations')
insert into Locations values ('Vinh Ha Long','vinhHaLong.jpg','Vịnh Hạ Long nằm thuộc bộ phận của vịnh Bắc Bộ, phía Đông Bắc giáp với vịnh 
Bái Tử Long, phía Tây Nam giáp với quần đảo Cát Bà, phía Tây và Tây Bắc giáp với đất liền, phía Đông Nam và phía Nam hướng ra vịnh Bắc Bộ.
Vịnh Hạ Long có tổng diện tích 1553 km2 gồm các vùng lõi, vùng đệm bao gồm 1969 hòn đảo lớn nhỏ trong đó có 989 đảo có tên và 
980 đảo chưa được đặt tên.Du khách trong nước đến du lịch Hạ Long vào tháng 4 – tháng 7 vì đây là thời điểm học sinh, sinh viên được nghỉ hè.
Vào thời điểm này các gia đình thường đến Hạ Long tắm biển, ngắm cảnh sắc của núi đá vôi trên du thuyền, tìm hiểu các hang động nổi bật. ',
'Vinh-Ha-Long-Locations')
insert into Locations values ('SaPa','saPa.jpg','Sapa với diện tích khoảng 678,6 km2 là nơi sinh sống chủ yếu của các dân tộc Mông,
Dao, Tày, giáy, Xá Phó, Kinh, Hoa.  Sapa - một vùng đất khiêm nhường, lặng lẽ nhưng ẩn chứa bao điều kỳ diệu của cảnh sắc thiên nhiên.
Phong cảnh thiên nhiên của Sa Pa được kết hợp với sức sáng tạo của con người cùng với địa hình của núi đồi, màu xanh của rừng, 
như bức tranh có sự sắp xếp theo một bố cục hài hoà tạo nên một vùng có nhiều cảnh sắc thơ mộng hấp dẫn.Chìm trong làn mây bồng 
bềnh thị trấn Sa Pa như một thành phố trong sương huyền ảo, làm cho du khách cữ ngỡ như mình đang lạc trong chốn thần tiên. 
Nơi đây, có thứ tài nguyên vô giá đó là khí hậu trong lành mát mẻ, mang nhiều sắc thái đa dạng.',
'Sa-Pa-Locations')
insert into Locations values ('Phu Quoc','phuQuoc.jpg','Đảo Phú Quốc là hòn đảo lớn nhất trong quần thể 22 đảo nằm trong vịnh Thái Lan, 
thuộc khu dự trữ sinh quyển thế giới được UNESCO công nhận. Phú Quốc hứa hẹn sẽ là một điểm đến tuyệt vời cho những ai đang dự định 
thực hiện một tour du lịch trong nước kỳ thú.Với một chuyến du lịch Phú Quốc, bạn sẽ không để lỡ những địa danh du lịch sinh thái hấp dẫn. 
Hình thức du lịch sinh thái được xem là một chiến lược lâu dài để phát triển kinh tế biển đảo nơi đây một cách bền vững. 
Du khách được ghé thăm vườn quốc gia Phú Quốc, nơi thu hút hàng triệu lượt khách du lịch với những bãi biển hoang sơ tuyệt đẹp 
và hệ động thực vật phong phú, đa dạng đang được bảo tồn, nuôi dưỡng.',
'Phu-Quoc-Location')
insert into Locations values ('Nha Trang','nhaTrang.jpg','Là một trong những thiên đường du lịch biển nổi tiếng nhất Việt Nam, 
thành phố Nha Trang luôn lựa chọn hàng đầu mỗi khi ai đó cần nạp chút không khí biển. Không chỉ có biển đảo mênh mông, 
Nha Trang còn là điểm đến cho những ai yêu văn hóa, lịch sử bởi nơi đây còn lưu lại rất nhiều trầm tích của vương quốc 
Chăm hưng thịnh khi xưa.',
'Nha-Trang-Locations')
insert into Locations values ('Hoi An','hoiAn.jpg','Hội An – nơi mà cuộc sống cứ bình lặng như thế. Hội An – 
nơi mà dường như dòng chảy vô tình của thời gian chẳng thể nào vùi lấp đi cái không khí cổ xưa. 
Những mái ngói cũ phủ đầy rêu phong, những con đường ngập trong sắc đỏ của đèn lồng, những bức 
hoành phi được chạm trổ tinh vi, tất cả như đưa ta về với một thế giới của vài trăm năm trước. 
Đó mới chỉ là một phần dung dị ở khu phố cổ Hội An nhưng cũng đã đủ khiến người ta phải đắm say, đi quên lối.
Là một kiểu cảng thị truyền thống Đông Nam Á duy nhất ở Việt Nam, hiếm có trên thế giới, 
Hội An giữ được gần như nguyên vẹn hơn một nghìn di tích kiến trúc như phố xá, nhà cửa, hội quán, đình, 
chùa, miếu, nhà thờ tộc, giếng cổ, mộ cổ… Đến đây du khách du lịch Hà Nội Đà Nẵng sẽ có dịp chiêm ngưỡng 
các kiến trúc vừa có sắc thái nghệ thuật truyền thống của Việt Nam, vừa thể hiện sự giao lưu hội nhập văn 
hoá với các nước phương Đông và phương Tây. ',
'Hoi-An-Locations')
insert into Locations values ('Da Nang','daNang.jpg','Thành Phố Đà Nẵng năm ở trung độ của Việt Nam. 
Trên trục giao thông huyết mạch Bắc Nam Về cả đường bộ, đường sắt, đường biển và cả đường hàng không. 
Cách Thủ đô Hà Nội 764km về phía Bắc, cách thành phố Hồ Chí Minh 964 km về phía Nam. Là cửa ngõ giao 
thông quan trọng của cả miền trung lẫn Tây Nguyên và cũng là điểm cuối của hành lang kinh tế Đông 
Tây đi qua các nước Myanma, Lào, Thái, Việt Nam. Ngoài ra Đà Nẵng còn là trung điểm của 4 di sản văn 
hóa thế giới nổi tiếng là cố đô Huế, Phố Cổ Hội An, Thánh Địa Mỹ Sơn và cả rừng quốc gia Phong Nha Kẻ Bàng.
','Da-Nang-Locations')
insert into Locations values ('Hue','hue.jpg','Từng là Kinh đô của triều đại nhà Nguyễn, vì thế mà Huế 
được xem là một trong những thành phố có bề dày lịch sử, văn hóa lâu đời nhất ở nước ta. Văn hóa,
di tích, kiến trú đã “lôi cuốn” không ít khách du lịch đến với Huế. Không chỉ dừng lại đó, Huế còn 
quyến rũ du khách bởi bức tranh thiên nhiên hữu tình thi vị và con ngườ địa phương chân chất hiền hòa.',
'Hue-Locations')
insert into Locations values ('Vung Tau','vungTau.jpg','Vũng Tàu là thành phố du lịch lâu đời của Việt Nam, 
nổi tiếng với những bãi biển tuyệt đẹp, hải sản tươi ngon, biển đảo hùng vỹ kết hợp với văn hóa lịch sử lâu 
đời khiến cho thành phố này hấp dẫn đặc biệt trong mắt du khách.Vũng Tàu có đường bờ biển trải dài tới 20km 
với nhiều dáng vẻ, những bãi cát phẳng phiu mịn màng, những bờ đá dựng đứng và những hàng cây xanh tốt quanh 
năm, tiếp liền với vịnh, biển hình cánh cung, mặt nước khá phẳng lặng, tạo nên những bãi tắm nổi tiếng.Vũng Tàu luôn 
là điểm du lịch hấp dẫn bởi vẻ đẹp phong cảnh tự nhiên của mình. Bất cứ nơi nào trong chuyến du lịch 
Vũng Tàu cũng có sức cuốn hút kỳ lạ, dưới đây là những điểm du lịch nổi bật bạn không nên bỏ lỡ ở Vũng Tàu.',
'Vung-Tau-Locations')
select * from Locations ;
go
drop table Locations;
go
--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------Tours--------------------------------------------------------------
insert into Tours values ('Tour đi Đà Lạt 3 ngày','1','2023-05-26','3 ngày','1.634.500VNĐ','daLatTour1.jpg','daLatTour2.jpg','daLatTour3.jpg','daLatTour4.jpg','Da-Lat-Tours',
'Đà Lạt đang là thành phố du lịch lớn nhất nước ta hiện nay. Với ước tính là 1.172.568 lượt khách du lịch trong tháng 11 năm 2017. Đà Lạt hiện đang là tâm điểm du lịch của rất nhiều khách du lịch quốc tế.
Đà Lạt được mệnh danh là thiên đường du lịch. Một xứ sở của các loài hoa thi nhau đua sắc thắm.  Ở Đà Lạt tập trung rất nhiều các loài hoa quý từ các nước khác nhập về. Tạo thêm cho Đà Lạt một vẽ đẹp huyền bí và mơ mộng tới tột cùng. 
Màng không có một thành phố nào tại nước Việt Nam ta sánh kịp với Đà Lạt.')
insert into Tours values ('Tour đi Vịnh Hạ Long 4 ngày','2','2023-06-12','4 ngày','2.520.500VNĐ','vinhHaLongTour1.jpg','vinhHaLongTour1.jpg','vinhHaLongTour1.jpg','vinhHaLongTour1.jpg','Vinh-Ha-Long-Tours',
'Vịnh Hạ Long là một phần của biển đảo Vịnh Bắc Bộ. Nhưng đều thuộc địa bàn hành chính của Tỉnh Quảng Ninh. Được chia ra cho các khu vực phần nắm giữ nhiều nhất là Thành phố Hạ Long, một phần của thành phố cẩm phả, một phần của vân đồn.ịnh Hạ Long có tổng diện tích gần 2.530 km vuông và sở hữu trong đó có tất cả 1969 hòn đảo lớn nhỏ. 
Phần nhiều những hòn đảo ở đây đều được cấu tạo từ những núi đá vôi. Vịnh Hạ Long là một trong 7 kỳ quan thiên nhiên thế giới đã 2 lần được Unetco công nhận là gi sản thiên nhiên thế giới lần đầu vào năm 1994 và lần 2 vào năm 2000.')
insert into Tours values ('Tour đi Sa-Pa 3 ngày','3','2023-09-12','3 ngày','1.200.000VNĐ','saPaTour1','saPaTour2','saPaTour3','saPaTour4','Sa-Pa-Tours',
'Sa Pa có núi Hàm Rồng ở sát ngay thị trấn, bất kỳ du khách nào cũng có thể lên đó để ngắm toàn cảnh thị trấn, thung lũng Mường Hoa, Sa Pả, Tả Phìn ẩn hiện trong sương khói. 
Hiện nay, với bàn tay tôn tạo của con người, Hàm Rồng thực sự là một thắng cảnh đầy hoa trái của Sa Pa. Và, nếu ai đã đến Thạch Lâm (Vân Nam, Trung Quốc) thì Hàm Rồng cũng có thể giúp các bạn tưởng tượng là Thạch Lâm được. Lên Hàm Rồng, du khách như lạc vào vườn tiên, mây ùa kín thân người, hoa rực rỡ mặt đất.')
insert into Tours values ('Tour đi Phú Quốc 5 ngày','4','2023-08-12','5 ngày','2.525.000VNĐ','phuQuocTour1.jpg','phuQuocTour2.jpg','phuQuocTour3.jpg','phuQuocTour4.jpg','Phu-Quoc-Tours',
'Phú Quốc được mệnh danh là hòn đảo ngọc bởi sự giàu có do thiên nhiên ban tặng và tiền năng du lịch phong phú, một vùng đất lạ.
Quanh đảo có nhiều bãi tắm đẹp như bãi Trường, bãi Khem, gành Dầu, Rạch Tràm, Rạch Vẹm… Đến đây du khách có thể tắm biển, tắm suối, leo núi, vào hang lên rừng…trải nghiệm mọi vẻ đẹp của nơi đây')
insert into Tours values ('Tour đi Nha Trang 4 ngày','5','2023-07-23','4 ngày','1.050.000VNĐ','nhaTrangTour1.jpg','nhaTrangTour2.jpg','nhaTrangTour3.jpg','nhaTrangTour4.jpg','Nha-Trang-Tours',
'thành phố biển miền Trung không chỉ đi vào thơ, hoạ mà còn “được lòng” du khách với những gì đẹp nhất của một vùng duyên hải. Nha Trang, hòn ngọc quý của tỉnh Khánh Hòa luôn là một điểm sáng trên bản đồ du lịch Việt, thu hút đông đảo du khách trong nước và quốc tế.')
insert into Tours values ('Tour đi Hội An 7 ngày','6','2023-06-04','7 ngày','3.250.000VNĐ','hoiAnTour1.jpg','hoiAnTour1.jpg','hoiAnTour1.jpg','hoiAnTour1.jpg','Hoi-An-Tours',
'Phố Cổ Hội An – Từng là một thương cảng rất sầm uất và sôi động, thế nhưng điều đó không làm vùi lấp không khí cổ xưa của nơi đây. Cuộc sống vẫn cứ bình lặng mặc cho đã trải qua hàng trăm năm, khi mà ngoài kia bao nhiêu nơi vẫn không ngừng vươn mình phát triển. 
Những mái cũ rêu phong, những con đường ngập tràn trong sắc màu của những chiếc đèn lồng và cả những công trình cổ kính,… tất cả khiến bạn như có cảm giác trở về quá khứ.')
insert into Tours values ('Tour đi Đà Nẵng 4 ngày','7','2023-05-16','4 ngày','1.235.000VNĐ','daNangTour1.jpg','daNangTour2.jpg','daNangTour3.jpg','daNangTour4.jpg','Da-Nang-Tours',
'Đà Nẵng đã thay đổi chóng mặt với tốc độ phát triển kinh hoàng đó là lời nhận xét của đa số mọi người khi quay lại nơi đây. Thành phố Đà Nẵng thuộc miền Trung của Việt Nam nằm giữa đất nước nên rất thuận tiện cho mọi người cả miền Bắc hoặc miền Nam di chuyển đến. 
Với vị trí tuyệt vời và kết hợp tham quan được cả Hội An và Huế bởi thế hàng năm thu hút hàng triệu du khách trong nước cũng như quốc tế đến tham quan du lịch.')
insert into Tours values ('Tour đi Huế 3 ngày','8','2023-06-21','3 ngày','1.800.000VNĐ','hueTour1.jpg','hueTour2.jpg','hueTour3.jpg','hueTour4.jpg','Hue-Tours',
'Huế – cái tên không còn xa lạ đối với người dân Việt Nam lẫn du khách nhưng để giới thiệu về thành phố Huế thì khó có thể miêu tả hết. Một vùng đất vùng đất văn hiến có bề dày lịch sử, văn hóa đặc sắc, 
nhiều di sản và lễ hội độc đáo. Cùng với đó là nét đẹp trầm lắng, dịu dàng và bình yên của cảnh quan và con người nơi đây đã khiến nó trở nên đặc biệt và thu hút.')
insert into Tours values ('Tour đi Vũng Tàu 3 ngày','9','2023-07-20','3 ngày','1.568.000VNĐ','vungTauTour1.jpg','vungTauTour2.jpg','vungTauTour3.jpg','vungTauTour4.jpg','Vung-Tau-Tours',
'Với cát vàng biển xanh, cùng vô vàn món ngon hấp dẫn từ hải sản đến bánh khọt, một khách sạn ở Vũng Tàu hẳn là địa chỉ "đi trốn" không thể hoàn hảo hơn. Cho một con thèm biển bất chợt, 
nếu bạn chẳng muốn đi xa mệt nhọc thì sao không dừng chân nơi phố biển và thoải mái tận hưởng kì nghỉ của mình!')
insert into Tours values ('Tour đi Đà Lạt 7 ngày','1','2023-10-19','7 ngày','1.456.000VNĐ','daLatTour2-1.jpg','daLatTour2-2.jpg','daLatTour2-3.jpg','daLatTour2-4.jpg','Da-Lat-Tours-2',
'Thành phố Đà Lạt là một địa danh được thiên nhiên ưu ái. Tọa lạc trên mảnh đất vàng có khí hậu ôn hòa và nhiều cảnh quang đẹp mắt. Có thể nói Đà Lạt chính là một Paris thu nhỏ nơi núi rừng cao nguyên. 
Và có người đã từng nói rằng: Đà Lạt– Đi trăm lần không chán, đi vạn lần vẫn mê. Phải chăng có gì thu hút ở nơi đây. Nếu hỏi Đà Lạt như thế nào thì: lạnh, lạnh lắm! buồn, buồn lắm!…Nhưng đẹp thì đẹp không nơi nào có thể so sánh được.')
insert into Tours values ('Tour đi Sa-Pa 7 ngày','3','2023-09-21','7 ngày','1.354.000VNĐ','saPaTour2-1.jpg','saPaTour2-2.jpg','saPaTour2-3.jpg','saPaTour2-4.jpg','Sa-Pa-Tours-2',
'Sapa là một danh lam thắng cảnh nằm ở phía tây bắc của Tổ quốc, là một huyện vùng cao của tỉnh Lào Cai. Sa Pa là một điểm du lịch nổi tiếng cảu cả nước. 
Nằm cách trung tâm thành phố Lào Cai khoảng hơn 30 km. Nằm ở độ cao trung bình 1500 – 1800 m so với mặt nước biển. Sapa luôn chìm trong làn sương mù dầy đặc khiến cho ta có cảm giác bồng bềnh, tạo nên một bức tranh huyền ảo đẹp đến kỳ lạ.')
insert into Tours values ('Tour đi Phú Quốc 3 ngày','4','2023-08-05','3 ngày','965.000VNĐ','phuQuocTour2-1.jpg','phuQuocTour2-2.jpg','phuQuocTour2-3.jpg','phuQuocTour2-4.jpg','Phu-Quoc-Tours-2',
'Phú Quốc có nhiều bãi biển đẹp trải dài từ phía bắc đến phía nam, có 99 ngọn núi đồi và dãy rừng nguyên sinh với hệ động thực vật phong phú. Phía Bắc của đảo có làng chài Rạch Vẹm, Bãi Thơm, Hòn Một,… 
nổi bật với vẻ đẹp hoang sơ hay ở Nam Đảo có 12 hòn đảo nhỏ to khác nhau thuộc quần đảo An Thới có thể kể đến như Hòn Thơm, Hòn Móng Tay, Hòn Gầm Ghì, Hòn Mây Rút,… là những nơi lý tưởng cho các hoạt 
động khám phá thiên nhiên cùng các hoạt động trên biển như du thuyền, câu cá, lặn ngắm san hô và khám phá đảo hoang kỳ thú…')
select * from Tours;
go
drop table Tours;
go
--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Booking---------------------------------------------------------------
insert into Booking values ('Nguyễn Văn A','helloworld@gmail.com','1','3','0902134597','Sa Pa','2023-06-06','8','Khách đi có 2 trẻ em nhỏ cần vài vật dụ cần thiết để hỗ trợ !')
insert into Booking values ('Nguyễn Văn B','doancoso@gmail.com','2','9','0904869523','Vũng Tàu','2023-08-15','2','Không có ghi chú !')
insert into Booking values ('Nguyễn Văn C','nodejs@gmail.com','3','5','0542365879','Nha Trang','2023-09-21','3','Khách có người tiền sử bệnh tim cần nhân viên hỗ trợ !')
select * from Booking;
go
drop table Booking;
go
--------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------Details----------------------------------------------------------------

select * from bookDetails;
go
drop table bookDetails;
go
--------------------------------------------------------------------------------------------------------------------------
create view chiTietBooking as
select bo_userName, bo_userEmail, tours_Name, bo_userPhone, bo_locaName, bo_checkInDate, bo_numberTourist, bo_note
from Booking inner join Tours on Booking.tours_ID = Tours.tours_ID;
go
select * from chiTietBooking;
go