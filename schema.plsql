/*
DROP TABLE NhanVien_1312618_1412553_1312618_1412553 CASCADE CONSTRAINTS;
DROP TABLE ChiNhanh_1312618_1412553 CASCADE CONSTRAINTS;
DROP TABLE PhongBan_1312618_1412553 CASCADE CONSTRAINTS;
DROP TABLE DuAn_1312618_1412553 CASCADE CONSTRAINTS;
DROP TABLE ChiTieu_1312618_1412553 CASCADE CONSTRAINTS;
DROP TABLE PhanCong_1312618_1412553 CASCADE CONSTRAINTS;
*/

create table NhanVien_1312618_1412553_1312618_1412553(
  maNV char(5) primary key,
  hoTen nvarchar2(50) not null,
  diaChi nvarchar2(100),
  dienThoai char(11),
  email varchar2(20),
  maPhong int,
  chiNhanh int,
  luong int
);

create table ChiNhanh_1312618_1412553(
  maCN int primary key,
  tenCN nvarchar2(50),
  truongChiNhanh char(5)
);

create table PhongBan_1312618_1412553(
  maPhong int primary key,
  tenphong nvarchar2(50),
  truongPhong char(5),
  ngayNhanChuc date,
  soNhanVien int,
  chiNhanh int
);

create table DuAn_1312618_1412553(
  maDA int primary key,
  tenDA nvarchar2(50),
  kinhPhi int,
  phongChuTri int,
  truongDA char(5)
);

create table ChiTieu_1312618_1412553(
  maChiTieu int primary key,
  tenChiTieu nvarchar2(100),
  soTien int,
  duAn int
);

create table PhanCong_1312618_1412553(
  maNV char(5),
  duAn int,
  vaiTro nvarchar2(50),
  phuCap int,
  primary key (maNV, duAn)
);

-- Create foreign key --

	alter table NhanVien_1312618_1412553_1312618_1412553
	add constraint fk_NhanVien_1312618_1412553_phongban
	foreign key (maPhong)
	references PhongBan_1312618_1412553(maPhong);
  
  alter table NhanVien_1312618_1412553_1312618_1412553
	add	constraint fk_NhanVien_1312618_1412553_chinhanh
	foreign key (chiNhanh)
	references ChiNhanh_1312618_1412553(maCN);

	alter table PhongBan_1312618_1412553
	add constraint fk_phongban_chinhanh
	foreign key (chiNhanh)
	references ChiNhanh_1312618_1412553(maCN);
  
  alter table PhongBan_1312618_1412553
	add	constraint fk_phongban_NhanVien_1312618_1412553
	foreign key (truongPhong)
	references NhanVien_1312618_1412553_1312618_1412553(maNV);

	alter table ChiNhanh_1312618_1412553
	add constraint fk_chinhanh_NhanVien_1312618_1412553
	foreign key (truongChiNhanh)
	references NhanVien_1312618_1412553_1312618_1412553(maNV);

	alter table DuAn_1312618_1412553
	add constraint fk_duan_phongban
	foreign key (phongChuTri)
	references PhongBan_1312618_1412553(maPhong);
  
  alter table DuAn_1312618_1412553
	add	constraint fk_duan_NhanVien_1312618_1412553
	foreign key (truongDA)
	references NhanVien_1312618_1412553_1312618_1412553(maNV);

	alter table ChiTieu_1312618_1412553
	add constraint fk_chitieu_duan
	foreign key (duAn)
	references DuAn_1312618_1412553(maDA);

	alter table PhanCong_1312618_1412553
	add constraint fk_phancong_NhanVien_1312618_1412553
	foreign key (maNV)
	references NhanVien_1312618_1412553_1312618_1412553(maNV);
  
  alter table PhanCong_1312618_1412553
	add	constraint fk_phancong_duan
	foreign key (duAn)
	references DuAn_1312618_1412553(maDA);

--insert data


insert all
  INTO ChiNhanh_1312618_1412553 values (1, N'Đăk Nông', null)
  INTO ChiNhanh_1312618_1412553 values (2, N'Bình Phước', null)
  INTO ChiNhanh_1312618_1412553 values (3, N'Đăk Lăk', null)
  INTO ChiNhanh_1312618_1412553 values (4, N'Gia Lai', null)
  INTO ChiNhanh_1312618_1412553 values (5, N'Bình Dương', null)
  INTO ChiNhanh_1312618_1412553 values (6, N'Khánh Hòa', null)
select* from dual;


insert all
  into PhongBan_1312618_1412553 values (1, N'Tài chính', null, null, 0, 1) 
  into PhongBan_1312618_1412553 values (2, N'Đào tạo', null, null, 0, 2)
  into PhongBan_1312618_1412553 values (3, N'Dịch vụ', null, null, 0, 3)
  into PhongBan_1312618_1412553 values (4, N'Kế hoạch', null, null, 0, 4)
  into PhongBan_1312618_1412553 values (5, N'Quản lý', null, null, 0, 5)
  into PhongBan_1312618_1412553 values (6, N'Quy hoạch', null, null, 0, 6)
select* from dual;

insert all
  into NhanVien_1312618_1412553(maNV, hoTen, diaChi, dienThoai, email, luong) values ('nv_00', N'Nguyễn Văn Tina', N'Campuchia', '01234567890', 'nvtina@gmail.com', 1000000);
  into NhanVien_1312618_1412553 values ('nv_01', N'Nguyễn Văn A', N'Đăk Nông', '0984898562', 'nva@gmail.com', 1, 1, 400000)
  into NhanVien_1312618_1412553 values ('nv_02', N'Nguyễn Văn B', N'Đăk Nông', '0981231212', 'nvb@gmail.com', 2, 2, 600000)
  into NhanVien_1312618_1412553 values ('nv_03', N'Trần Thị C', N'Đăk Nông', '0164554545', 'ttc@gmail.com', 3, 3, 700000)
  into NhanVien_1312618_1412553 values ('nv_04', N'Cao Văn B', N'Đăk Nông', '0164123456', 'cvb@gmail.com', 4, 4, 800000)
  into NhanVien_1312618_1412553 values ('nv_05', N'Đặng Thị Dạ Ly', N'Đăk Nông', '0164147895', 'dtdl@gmail.com', 5, 5, 900000)
  into NhanVien_1312618_1412553 values ('nv_06', N'Đặng Văn Hiếu', N'Đăk Nông', '0164101234', 'dvh@gmail.com', 6, 6, 100000)
  into NhanVien_1312618_1412553 values ('nv_07', N'Phạm Văn Tiến', N'Đăk Nông', '0164178956', 'adsfd@gmail.com', 2, 2, 200000)
  into NhanVien_1312618_1412553 values ('nv_08', N'Trầ Hà', N'Đăk Nông', '0164132105', 'agewd@gmail.com', 4, 4, 50000)
  into NhanVien_1312618_1412553 values ('nv_09', N'Nguyễn Thúy An', N'Bình Phước', '0164178965', 'wqegsdsa@gmail.com', 3, 3, 500000)
  into NhanVien_1312618_1412553 values ('nv_10', N'Đoàn Dự', N'Bình Phước', '0164178956', 'hrefasedf@gmail.com', 5, 5, 50000)
  into NhanVien_1312618_1412553 values ('nv_11', N'Nguyễn Thanh Trà', N'Bình Phước', '0164112345', 'awefd@gmail.com', 6, 6, 20000)
  into NhanVien_1312618_1412553 values ('nv_12', N'Nguyễn Yến Nhi', N'Bình Phước', '0164101234', 'lfuc@gmail.com', 1, 1, 800000)
  into NhanVien_1312618_1412553 values ('nv_13', N'Trương Phong', N'Bình Phước', '0164178965', 'gweafd@gmail.com', 4, 4, 30000)
  into NhanVien_1312618_1412553 values ('nv_14', N'Nguyễn Đại', N'Bình Dương', '09564012345', 'gqawefds@gmail.com', 1, 1, 300000)
  into NhanVien_1312618_1412553 values ('nv_15', N'Trần Ngọc', N'Bình Dương', '0956445689', 'gawefsdc@gmail.com', 6, 6, 50000)
  into NhanVien_1312618_1412553 values ('nv_16', N'Trần Đại', N'Bình Dương', '0956401236', 'gqawed@gmail.com', 3, 3, 60000)
  into NhanVien_1312618_1412553 values ('nv_17', N'Trương Sang', N'Bình Dương', '0956447895', 'awvesd@gmai.com', 5, 5, 700000)
  into NhanVien_1312618_1412553 values ('nv_18', N'Hoài Linh', N'Bình Dương', '0956423568', 'awvesd@gmail.com', 1, 1, 100000)
  into NhanVien_1312618_1412553 values ('nv_19', N'Chí Tài', N'Bình Dương', '0956445678', 'gqawevsd@gmail.com', 3, 3, 400000)
  into NhanVien_1312618_1412553 values ('nv_20', N'Đàm Vĩnh Hưng', N'Bình Dương', '0956498756', 'qgawesd@gmail.com', 3, 3, 200000)
select* from dual;

insert all
  into DuAn_1312618_1412553 values (1, N'Dự án A', 10000000, 1, 'nv_15')
  into DuAn_1312618_1412553 values (2, N'Dự án B', 20000000, 2, 'nv_13')
  into DuAn_1312618_1412553 values (3, N'Dự án C', 30000000, 3, 'nv_16')
  into DuAn_1312618_1412553 values (4, N'Dự án D', 40000000, 4, 'nv_08')
  into DuAn_1312618_1412553 values (5, N'Dự án E', 50000000, 5, 'nv_17')
select* from dual;

insert all
  into ChiTieu_1312618_1412553 values (1, N'Thể thao', 100000, 3)
  into ChiTieu_1312618_1412553 values (2, N'Văn nghệ', 500000, 2)
  into ChiTieu_1312618_1412553 values (3, N'Trang thiết bị', 5000000, 1)
  into ChiTieu_1312618_1412553 values (4, N'Nhân công', 300000, 4)
  into ChiTieu_1312618_1412553 values (5, N'Du lịch', 1000000, 5)
  select* from dual;
  
insert all
  into PhanCong_1312618_1412553 values ('nv_03', 1, N'Công nhân', 20000)
  into PhanCong_1312618_1412553 values ('nv_04', 1, N'Giám đốc', 10000)
  into PhanCong_1312618_1412553 values ('nv_05', 1, N'Trưởng phòng', 20000)
  into PhanCong_1312618_1412553 values ('nv_15', 1, N'Quản lý', 50000)
  into PhanCong_1312618_1412553 values ('nv_08', 1, N'Bảo vệ', 60000)
select* from dual;

--update  PhongBan_1312618_1412553 và ChiNhanh_1312618_1412553

update PhongBan_1312618_1412553
set truongPhong = 'nv_01', ngayNhanChuc = to_date('1/2/2017', 'DD/MM/YYYY') where maPhong = 1;

update PhongBan_1312618_1412553
set truongPhong = 'nv_02', ngayNhanChuc = to_date('3/2/2017', 'DD/MM/YYYY') where maPhong = 2;

update PhongBan_1312618_1412553
set truongPhong = 'nv_19', ngayNhanChuc = to_date('3/4/2017', 'DD/MM/YYYY') where maPhong = 3;

update PhongBan_1312618_1412553
set truongPhong = 'nv_10', ngayNhanChuc = to_date('1/4/2017', 'DD/MM/YYYY') where maPhong = 4;

update PhongBan_1312618_1412553
set truongPhong = 'nv_17', ngayNhanChuc = to_date('2/1/2017', 'DD/MM/YYYY') where maPhong = 5;

update PhongBan_1312618_1412553
set truongPhong = 'nv_20', ngayNhanChuc = to_date('1/1/2017', 'DD/MM/YYYY') where maPhong = 6;

-- update ChiNhanh_1312618_1412553

update ChiNhanh_1312618_1412553
set truongChiNhanh = 'nv_01' where maCN = 1;

update ChiNhanh_1312618_1412553
set truongChiNhanh = 'nv_02' where maCN = 2;

update ChiNhanh_1312618_1412553
set truongChiNhanh = 'nv_03' where maCN = 3;

update ChiNhanh_1312618_1412553
set truongChiNhanh = 'nv_04' where maCN = 4;

update ChiNhanh_1312618_1412553
set truongChiNhanh = 'nv_05' where maCN = 5;

update ChiNhanh_1312618_1412553
set truongChiNhanh = 'nv_06' where maCN = 6;






