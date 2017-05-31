
-- update table NhanVien 

create table NhanVien(
			  maNV char(9) not null primary key,
			  hoTen nvarchar(50) not null,
			  diaChi nvarchar(100),
			  dienThoai varchar(15),
			  email varchar(20),
			  maPhong int,
			  chiNhanh int,
			  luong varbinary(max),
			  matKhau varbinary(max),
			  pubkey char(9)
			);

-- stored procedure dùng để insert NHANVIEN
go
IF OBJECT_ID('SP_INS_PUBLIC_NHANVIEN') IS NOT NULL
    DROP PROCEDURE SP_INS_PUBLIC_NHANVIEN;
go
create proc SP_INS_PUBLIC_NHANVIEN (	
										@MANV char(9),
										@HOTEN NVARCHAR(50),
										@DIACHI NVARCHAR(100),
										@DIENTHOAI VARCHAR(15),
										@EMAIL  VARCHAR(20),
										@MAPHONG INT,
										@CHINHANH INT,
										@LUONG INT,
										@MK NVARCHAR(100)
									)
									
as
	begin
		DECLARE @PUBKEYWORD NVARCHAR(MAX) ='CREATE ASYMMETRIC KEY '+ @MANV+ ' WITH ALGORITHM = RSA_512 '+' ENCRYPTION BY PASSWORD = N''' + @MK +''';';
		EXEC (@PUBKEYWORD);
		declare @asymID int
		SET @asymID = ASYMKEY_ID(@MANV); 
		declare @PUBKEY VARCHAR(20)
		SET @PUBKEY=@MANV
		insert into NHANVIEN values (@MANV,@HOTEN,@DIACHI,@DIENTHOAI,@EMAIL,@MAPHONG,@CHINHANH,ENCRYPTBYASYMKEY(@asymID,CONVERT(VARCHAR(MAX),@LUONG)),HASHBYTES('SHA1',@MK),@PUBKEY)
	end
go

--exec SP_INS_PUBLIC_NHANVIEN 'NV100', N'Nguyen Van A', N'Ha Noi', '0123245687','abc@gmail.com', 1,1,1230000, N'1234'
--select * from NhanVien



--- stored dùng để truy vấn dữ liệu NHANVIEN
go
IF OBJECT_ID('SP_SEL_PUBLIC_NHANVIEN') IS NOT NULL
    DROP PROCEDURE SP_SEL_PUBLIC_NHANVIEN;
GO
create proc SP_SEL_PUBLIC_NHANVIEN @TENDN CHAR(9), @MATKHAU NVARCHAR(100)
AS
	BEGIN
		
		SELECT maNV, hoTen,diaChi,dienThoai, email,maPhong,chiNhanh,cast(cast(DECRYPTBYASYMKEY(ASYMKEY_ID(pubkey),luong, @MATKHAU) as varchar(max)) as int) as LUONG
		FROM NHANVIEN
		WHERE maNV=@TENDN AND MATKHAU = HASHBYTES('SHA1',@MATKHAU)
	END

GO


--exec SP_SEL_PUBLIC_NHANVIEN 'NV100','1234'
---------------------------------------
----edit---------


CREATE OR REPLACE PACKAGE enc_dec
AS
   FUNCTION encrypt (p_plainText VARCHAR2) RETURN RAW DETERMINISTIC;
   FUNCTION decrypt (p_encryptedText RAW) RETURN VARCHAR2 DETERMINISTIC;
END;
/

CREATE OR REPLACE PACKAGE BODY enc_dec
AS
     encryption_type    PLS_INTEGER := DBMS_CRYPTO.ENCRYPT_DES
                                     + DBMS_CRYPTO.CHAIN_CBC
                                     + DBMS_CRYPTO.PAD_PKCS5;
     /*
       ENCRYPT_DES is the encryption algorithem. Data Encryption Standard. Block cipher. 
       Uses key length of 56 bits.
       CHAIN_CBC Cipher Block Chaining. Plaintext is XORed with the previous ciphertext 
       block before it is encrypted.
       PAD_PKCS5 Provides padding which complies with the PKCS #5: Password-Based 
       Cryptography Standard
     */
     encryption_key     RAW (32) := UTL_RAW.cast_to_raw('MyEncryptionKey');
     -- The encryption key for DES algorithem, should be 8 bytes or more.

     FUNCTION encrypt (p_plainText VARCHAR2) RETURN RAW DETERMINISTIC
     IS
        encrypted_raw      RAW (2000);
     BEGIN
        encrypted_raw := DBMS_CRYPTO.ENCRYPT
        (
           src => UTL_RAW.CAST_TO_RAW (p_plainText),
           typ => encryption_type,
           key => encryption_key
        );
       RETURN encrypted_raw;
     END encrypt;
     FUNCTION decrypt (p_encryptedText RAW) RETURN VARCHAR2 DETERMINISTIC
     IS
        decrypted_raw      RAW (2000);
     BEGIN
        decrypted_raw := DBMS_CRYPTO.DECRYPT
        (
            src => p_encryptedText,
            typ => encryption_type,
            key => encryption_key
        );
        RETURN (UTL_RAW.CAST_TO_VARCHAR2 (decrypted_raw));
     END decrypt;
END;
/

grant execute on enc_dec to BT12;
create public synonym enc_dec for sys.enc_dec;
