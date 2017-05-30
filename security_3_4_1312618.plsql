
--CREATE ROLE--
CREATE ROLE GIAMDOCROLE;
CREATE ROLE TRUONGPHONGROLE;
CREATE ROLE TRUONGCHINHANHROLE;
CREATE ROLE TRUONGDUANROLE;
CREATE ROLE NHANVIENROLE;


--CREATE USER--
-- create user NhanVien
CREATE USER nv_01 IDENTIFIED BY "a123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER nv_02 IDENTIFIED BY "b123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER nv_03 IDENTIFIED BY "c123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER nv_04 IDENTIFIED BY "d123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER nv_05 IDENTIFIED BY "e123456"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

-- Create user TruongDuAn

CREATE USER tda_01 IDENTIFIED BY "a12345"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tda_02 IDENTIFIED BY "b12345"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tda_03 IDENTIFIED BY "c12345"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tda_04 IDENTIFIED BY "d12345"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tda_05 IDENTIFIED BY "e12345"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

-- Create user TruongPhong

CREATE USER tp_01 IDENTIFIED BY "a1234567"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tp_02 IDENTIFIED BY "b1234567"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tp_03 IDENTIFIED BY "c1234567"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tp_04 IDENTIFIED BY "d1234567"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tp_05 IDENTIFIED BY "e1234567"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

--create user TruongChiNhanh

CREATE USER tcn_01 IDENTIFIED BY "a12345678"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tcn_02 IDENTIFIED BY "b12345678"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tcn_03 IDENTIFIED BY "c12345678"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tcn_04 IDENTIFIED BY "d12345678"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER tcn_05 IDENTIFIED BY "e12345678"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

--create user GiamDoc

CREATE USER gd_01 IDENTIFIED BY "a123456789"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER gd_02 IDENTIFIED BY "b123456789"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER gd_03 IDENTIFIED BY "c123456789"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER gd_04 IDENTIFIED BY "d123456789"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;

CREATE USER gd_05 IDENTIFIED BY "e123456789"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE DEFAULT;