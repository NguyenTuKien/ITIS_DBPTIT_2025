UPDATE SinhVien
SET 
  TrangThai = CASE
    WHEN DiemTB >= 5.0 THEN 'Đạt'
    WHEN DiemTB < 5.0  THEN 'Không đạt'
    ELSE TrangThai 
  END;