----edit---------

CREATE OR REPLACE PACKAGE enc_dec
AS
   FUNCTION encrypt (p_plainText VARCHAR2, p_key in number) RETURN RAW DETERMINISTIC;
   FUNCTION decrypt (p_encryptedText RAW, p_key in number) RETURN number DETERMINISTIC;
END;
/

CREATE OR REPLACE PACKAGE BODY enc_dec
AS
     encryption_type    PLS_INTEGER := DBMS_CRYPTO.ENCRYPT_DES
                                     + DBMS_CRYPTO.CHAIN_CBC
                                     + DBMS_CRYPTO.PAD_PKCS5;
     
     encryption_key     RAW (32) := UTL_RAW.cast_to_raw('1221212121212121212122121212121');
     -- The encryption key for DES algorithem, should be 8 bytes or more.

     FUNCTION encrypt (p_plainText VARCHAR2, p_key in number) RETURN RAW DETERMINISTIC
     IS
        encrypted_raw      RAW (2000);
     BEGIN
        encrypted_raw := DBMS_CRYPTO.ENCRYPT
        (
           src => p_plainText,
           typ => encryption_type,
           key => encryption_key
        );
       RETURN encrypted_raw;
     END encrypt;
     
     FUNCTION decrypt (p_encryptedText RAW, p_key in number) RETURN number DETERMINISTIC
     IS
        decrypted_raw      RAW (2000);
     BEGIN
        decrypted_raw := DBMS_CRYPTO.DECRYPT
        (
            src => p_encryptedText,
            typ => encryption_type,
            key => encryption_key
        );
        RETURN (UTL_RAW.CAST_TO_number (decrypted_raw));
     END decrypt;
END enc_dec;
/
grant execute on enc_dec to BT12;
create public synonym enc_dec for sys.enc_dec;
