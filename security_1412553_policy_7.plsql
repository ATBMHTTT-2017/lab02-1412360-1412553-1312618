--POLICY 7---
--Chỉ trưởng dự án được phép xem và cập nhật thông tin chi tiêu của dự án của mình

--tẠO Hàm chính sách
CREATE OR REPLACE FUNCTION SELECT_UPDATE_CHITIEU (
p_schema  VARCHAR2,
p_object  VARCHAR2)
RETURN VARCHAR2 
AS
DUAN varchar2(5);
temp number;
BEGIN
  Select count (*) into temp from PhongBan_1312618_1412553 where user = truongPhong;
  if (temp > 0) then
  RETURN '';
  ELSE
    BEGIN
    select maDA INTO DUAN from DuAn_1312618_1412553 where truongDA = USER;
    RETURN 'DUAN='|| q'[']' || DUAN || q'[']';
    END;
  END IF;
EXCEPTION
      WHEN OTHERS THEN RETURN '1 = 0';
END;

-- Gắn hàm chính sách đó vào bảng

BEGIN
DBMS_RLS.add_policy
(object_schema => 'EXBT2',
object_name => 'ChiTieu_1312618_1412553',
policy_name => 'my_ChiTieu',
function_schema => 'EXBT2',
policy_function => 'SELECT_UPDATE_CHITIEU',
statement_types => 'SELECT, UPDATE');
END;
/

