--POLICY 7---
--Chỉ trưởng dự án được phép xem và cập nhật thông tin chi tiêu của dự án của mình

--tẠO Hàm chính sách
CREATE OR REPLACE FUNCTION SELECT_UPDATE_CHITIEU(p_schema varchar2, p_obj varchar2)
RETURN varchar2
AS
  u_user varchar2(5);
  c_maDuAn number;
BEGIN
  u_user := SYS_CONTEXT('USERENV', 'SESSION_USER');
  SELECT maDA INTO c_maDuAn FROM DuAn_1312618_1412553 WHERE TO_CHAR(truongDA) = user;
  RETURN 'duAn = ' || TO_CHAR(c_maDuAn);
END;

-- Gắn hàm chính sách đó vào bảng

BEGIN
DBMS_RLS.add_policy
(object_schema => 'BT12',
object_name => 'ChiTieu_1312618_1412553',
policy_name => 'my_ChiTieu',
function_schema => 'BT12',
policy_function => 'SELECT_UPDATE_CHITIEU',
statement_types => 'SELECT, UPDATE');
END;
/

