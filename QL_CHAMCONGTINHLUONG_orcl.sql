CREATE TABLE PHONGBAN
(
    MAPB NCHAR(5) NOT NULL,
    TENPB NVARCHAR2(30),
    
    CONSTRAINT PK_PB PRIMARY KEY (MAPB)
);

/*CREATE TABLE LUONG
(
    HSLUONG INT NOT NULL,
    LUONGCB INT,
    
    CONSTRAINT PK_LUONG PRIMARY KEY (HSLUONG)
);*/


CREATE TABLE NHANVIEN
(
    MANV NCHAR(5) NOT NULL,
    MAPB NCHAR(5),
    MACV NCHAR(5),
    TENNV NVARCHAR2(30),
    SODT NVARCHAR2(20),
    DIACHI VARCHAR2(30),
    NGAYSINH DATE,
    GIOITINH NVARCHAR2(30),
    TRINDO NVARCHAR2(30),
    EMAIL NVARCHAR2(200),
    TTHONNHAN NVARCHAR2(30),
    HSLUONG INT,
    LUONGCOSO INT,
    LUONGCANBAN INT,
    
    CONSTRAINT PK_NV PRIMARY KEY (MANV),
   -- CONSTRAINT FK_NV_HSLUONG FOREIGN KEY(HSLUONG) REFERENCES LUONG(HSLUONG),
    CONSTRAINT FK_NV_PB FOREIGN KEY(MAPB) REFERENCES PHONGBAN(MAPB),
    CONSTRAINT FK_NV_CV FOREIGN KEY(MACV) REFERENCES CHUCVU(MACV)
);

CREATE TABLE CHUCVU
(
    MACV NCHAR(5) NOT NULL,
    TENCV NVARCHAR2(30),
    
    CONSTRAINT PK_CV PRIMARY KEY (MACV)
);

CREATE TABLE CHAMCONG
(
    MACHAMCONG NCHAR(5) NOT NULL,
    MANV NCHAR(5),
    NGAYCHAM DATE,
    TINHTRANG NVARCHAR2(30),
    CONSTRAINT PK_CHAMCONG PRIMARY KEY (MACHAMCONG),
    CONSTRAINT FK_CC_NV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE THUONGPHAT
(
    MATHUONGPHAT NCHAR(5) NOT NULL,
    MANV NCHAR(5),
    LOAI NVARCHAR2(30),
    TIEN INT,
    LYDO NVARCHAR2(30),
    NGAYTHUONGPHAT DATE,
    CONSTRAINT PK_THUONGPHAT PRIMARY KEY (MATHUONGPHAT),
    CONSTRAINT FK_TP_NV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE NGUOIDUNG
(
    TENDN NCHAR(30) NOT NULL,
    MATKHAU NVARCHAR2(200),
    CONSTRAINT PK_NGUOIDUNG PRIMARY KEY (TENDN)
);


CREATE TABLE BAOHIEM
(
    MABH NCHAR(5) NOT NULL,
    MANV NCHAR(5),
    LOAIBAOHIEM NVARCHAR2(30),
    NGAYCAP DATE,
    NGAYHETHAN DATE,
    NOICAP NVARCHAR2(30),
    CONSTRAINT PK_BH PRIMARY KEY (MABH),
    CONSTRAINT FK_BH_NV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
);



CREATE TABLE PHUCAP
(
    MAPHUCAP NCHAR(5) NOT NULL,
    MANV NCHAR(5),
    LOAIPC NVARCHAR2(30),
    TUNGAY DATE,
    DENNGAY DATE,
    TIENPC INT,

    CONSTRAINT PK_PC PRIMARY KEY (MAPHUCAP),
    CONSTRAINT FK_PC_NV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE LUONG
(
    MALUONG NCHAR(5) NOT NULL,
    MANV NCHAR(5),
    --TENNV NVARCHAR2(30),
    MACV NCHAR(5),
    LUONGCB INT,
    TONGPHUCAP INT,
    NGAYCONG INT,
    TONGTIENBH INT,
    TAMUNG INT,
    THUCLINH INT,
    NGAYPHATLUONG DATE,
    GHICHU NVARCHAR2(30),
  
    CONSTRAINT PK_LUONG PRIMARY KEY (MALUONG),
    CONSTRAINT FK_LUONG_NV FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV),
    CONSTRAINT FK_LUONG_CV FOREIGN KEY(MACV) REFERENCES CHUCVU(MACV)
);

DROP TABLE LUONG;

DROP TABLE PHONGBAN;
DROP TABLE NHANVIEN;
DROP TABLE CHAMCONG;
DROP TABLE BAOHIEM;
DROP TABLE NGUOIDUNG;
DROP TABLE PHUCAP;
DROP TABLE THUONGPHAT;
DROP TABLE LUONG;

INSERT INTO PHONGBAN VALUES ('PB01','Ph�ng Gi�m ??c');
INSERT INTO PHONGBAN VALUES ('PB02','Ph�ng Ph� Gi�m ??c');
INSERT INTO PHONGBAN VALUES ('PB03','Ph�ng Kinh Doanh');
INSERT INTO PHONGBAN VALUES ('PB04','Ph�ng K? To�n');
INSERT INTO PHONGBAN VALUES ('PB05','Ph�ng K? Thu?t');

INSERT INTO CHUCVU VALUES ('GD','Gi�m ??c');
INSERT INTO CHUCVU VALUES ('PGD','Ph� Gi�m ??c');
INSERT INTO CHUCVU VALUES ('TPKD','Tr??ng Ph�ng Kinh Doanh');
INSERT INTO CHUCVU VALUES ('TPKT','Tr??ng Ph�ng K? To�n');
INSERT INTO CHUCVU VALUES ('TPKTH','Tr??ng Ph�ng K? Thu?t');
INSERT INTO CHUCVU VALUES ('NVKD','Nh�n Vi�n Kinh Doanh');
INSERT INTO CHUCVU VALUES ('NVKT','Nh�n Vi�n K? To�n');
INSERT INTO CHUCVU VALUES ('NVKTH','Nh�n Vi�n K? Thu?t');

INSERT INTO NHANVIEN VALUES ('NV01','PB01','GD','Nguy?n Ch� T�i','0933108601','Long An',TO_DATE('2002-03-28','YYYY-MM-DD'),'Nam','??i h?c','chitaisad123@gmail.com','Ch?a k?t h�n',6,5000000,30000000);
INSERT INTO NHANVIEN VALUES ('NV02','PB02','PGD','Nguy?n Ho�i Phong','0922188101','Ti?ng Giang',TO_DATE('2002-09-28','YYYY-MM-DD'),'Nam','??i h?c','hoaiphongsad123@gmail.com','Ch?a k?t h�n',5,4000000,20000000);
INSERT INTO NHANVIEN VALUES ('NV03','PB03','TPKD','Ph?m Minh Ph�c','0381228101','TP HCM',TO_DATE('2002-09-19','YYYY-MM-DD'),'Nam','??i h?c','minhphucsad123@gmail.com','?� k?t h�n',3,3000000,9000000);
INSERT INTO NHANVIEN VALUES ('NV04','PB04','NVKT','Nguy?n Th? Ng?c Ph??ng','0381228101','Qu?ng Ng�i',TO_DATE('2002-02-12','YYYY-MM-DD'),'Nam','??i h?c','ngocphuongsad123@gmail.com','?� k?t h�n',2,3000000,6000000);

INSERT INTO CHAMCONG VALUES ('CC01','NV01',TO_DATE('2023-11-01','YYYY-MM-DD'),'?i l�m');
INSERT INTO CHAMCONG VALUES ('CC02','NV02',TO_DATE('2023-11-01','YYYY-MM-DD'),'?i l�m');
INSERT INTO CHAMCONG VALUES ('CC03','NV03',TO_DATE('2023-11-01','YYYY-MM-DD'),'Ngh? c� ph�p');
INSERT INTO CHAMCONG VALUES ('CC04','NV04',TO_DATE('2023-11-01','YYYY-MM-DD'),'Ngh? kh�ng ph�p');

INSERT INTO THUONGPHAT VALUES ('TP01','NV04','Ph?t',300000,'Ngh? kh�ng ph�p',TO_DATE('2023-11-01','YYYY-MM-DD'));
INSERT INTO THUONGPHAT VALUES ('TP02','NV02','Th??ng',100000,'T?ng doanh s? b�n h�ng',TO_DATE('2023-11-02','YYYY-MM-DD'));

INSERT INTO NGUOIDUNG VALUES ('admin',null);
INSERT INTO NGUOIDUNG VALUES ('nhanvien01',null);

INSERT INTO BAOHIEM VALUES ('BH01','NV01','B?o hi?m nh�n th?',TO_DATE('2023-11-01','YYYY-MM-DD'),TO_DATE('2024-11-01','YYYY-MM-DD'),'G� V?p');
INSERT INTO BAOHIEM VALUES ('BH02','NV02','B?o hi?m y t?',TO_DATE('2023-12-01','YYYY-MM-DD'),TO_DATE('2024-12-01','YYYY-MM-DD'),'T�n Ph�');

INSERT INTO PHUCAP VALUES ('PC01','NV01','L�nh ??o',TO_DATE('2023-12-21','YYYY-MM-DD'),TO_DATE('2024-12-22','YYYY-MM-DD'),1000000);
INSERT INTO PHUCAP VALUES ('PC02','NV03','?i l?i',TO_DATE('2023-12-20','YYYY-MM-DD'),TO_DATE('2024-12-21','YYYY-MM-DD'),100000);

ROLLBACK;
INSERT INTO LUONG VALUES ('L01','NV01','GD',30000000,9330000,26,1996050,100000,37233950,TO_DATE('2023-11-01','YYYY-MM-DD'),null);



SELECT * FROM PHONGBAN;
SELECT * FROM CHUCVU;
SELECT * FROM NHANVIEN;
SELECT * FROM CHAMCONG;
SELECT * FROM THUONGPHAT;
SELECT * FROM NGUOIDUNG;
SELECT * FROM BAOHIEM;
SELECT * FROM PHUCAP;
SELECT * FROM LUONG;


SELECT NHANVIEN.MANV,TENNV,TENCV, NGAYSINH,GIOITINH,TTHONNHAN FROM ADMIN.NHANVIEN, ADMIN.CHUCVU WHERE NHANVIEN.MACV = CHUCVU.MACV AND GIOITINH='Nam';

SELECT MALUONG, LUONG.MANV,TENNV,TENCV, LUONGCB,TONGPHUCAP ,NGAYCONG, TONGTIENBH,TAMUNG,THUCLINH,NGAYPHATLUONG,GHICHU FROM ADMIN.LUONG,ADMIN.NHANVIEN, ADMIN.CHUCVU WHERE LUONG.MANV = NHANVIEN.MANV AND LUONG.MACV = CHUCVU.MACV;
SELECT TENNV FROM NHANVIEN,PHONGBAN
WHERE NHANVIEN.MAPB = PHONGBAN.MAPB AND TENPB ='Ph�ng Gi�m ??c';

SELECT MAPB, TENPB, COUNT(nhanvien.manv) AS SOLUONGNV FROM NHANVIEN,PHONGBAN 
WHERE NHANVIEN.MAPB = PHONGBAN.MAPB;

SELECT * FROM PHUCAP
WHERE  DENNGAY = TO_DATE('2024-12-21','YYYY-MM-DD');

SELECT * FROM PHUCAP
WHERE  TO_CHAR(denngay,'MM') = 12 AND TO_CHAR(denngay,'YYYY') = 2024;

SELECT MATHUONGPHAT, THUONGPHAT.MANV,TENNV, LOAI,TIEN ,LYDO, NGAYTHUONGPHAT 
FROM ADMIN.THUONGPHAT,ADMIN.NHANVIEN 
WHERE THUONGPHAT.MANV = NHANVIEN.MANV AND TO_CHAR(NGAYTHUONGPHAT,'MM') = 11 AND TO_CHAR(NGAYTHUONGPHAT,'YYYY') = 2023 ;

CREATE USER pgd IDENTIFIED BY pgd;
GRANT CONNECT TO pgd;

SELECT MALUONG, LUONG.MANV,TENNV,TENCV, LUONGCB,TONGPHUCAP ,NGAYCONG, TONGTIENBH,TAMUNG,THUCLINH,NGAYPHATLUONG,GHICHU FROM ADMIN.LUONG,ADMIN.NHANVIEN, ADMIN.CHUCVU WHERE LUONG.MANV = NHANVIEN.MANV AND LUONG.MACV = CHUCVU.MACV
AND TO_CHAR(NGAYPHATLUONG,'MM') = 12 AND TO_CHAR(NGAYPHATLUONG,'YYYY') = 2023;


------------




-- tao giam sat cho bang nhan vien
BEGIN
  DBMS_FGA.add_policy(
    object_schema => 'ADMIN',
    object_name => 'NHANVIEN',
    policy_name =>'FGA_NV',
    statement_types => 'SELECT, INSERT, UPDATE, DELETE'
  );
END;