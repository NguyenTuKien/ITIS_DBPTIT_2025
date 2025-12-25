select mh.tenhang as TenHang, mh.macongty as MaCongTy, ncc.tencongty as TenCongTy from mathang mh
join nhacungcap ncc on mh.macongty = ncc.macongty
order by mh.tenhang