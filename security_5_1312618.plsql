

-- update table NhanVien

create table NhanVien(
			  maNV char(9) not null primary key,
			  hoTen nvarchar2(50) not null,
			  diaChi nvarchar2(100),
			  dienThoai char(11),
			  email varchar2(20),
			  maPhong int,
			  chiNhanh int,
        		luong binary_float
			);
      

CREATE OR REPLACE PACKAGE BODY SYS.user1
AS     
     encryption_type    PLS_INTEGER :=DBMS_CRYPTO.AES_CBC_PKCS5; 
     encryption_key     RAW (32) := UTL_RAW.cast_to_raw('maNV');


     FUNCTION encrypt (p_plainText VARCHAR2) RETURN RAW DETERMINISTIC
     IS
        encrypted_raw      RAW (2000);
     BEGIN
        encrypted_raw := DBMS_CRYPTO.ENCRYPT
        (
           src => UTL_RAW.CAST_TO_RAW (p_plainText),
           typ => encryption_type,
           key => encryption_key,
           iv => hextoraw('12345678901234567890123456789012') 
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
            key => encryption_key,
            iv => hextoraw('12345678901234567890123456789012') 
        );
        RETURN (UTL_RAW.CAST_TO_VARCHAR2 (decrypted_raw));
     END decrypt;
END;

--select enc_dec.encrypt('luong') from NhanVien;
--select enc_dec.decrypt(enc_dec.encrypt('luong')) from NhanVien;

