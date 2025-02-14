create database QLNS
use QLNS
set dateformat DMY


create table Sach
(
MaSach varchar(10) primary key,
TenSach varchar(100),
TenTacGia varchar(100),
TenTheLoai varchar(100),
SoLuong int,
Gia money,
)

create table KhachHang
(
MaKH varchar(10) primary key,
TenKH varchar(100),
DiaChi varchar(100),
DienThoai varchar(10),
Email varchar(100),
SoSPDaMua varchar(100),
)

create table PhanQuyen
(
MaPhanQuyen varchar(10) primary key,
TenPhanQuyen varchar(100),
)

create table TaiKhoan
(
MaTK varchar(10) primary key,
Email varchar(100),
MatKhau varchar(100),
HoTen varchar(100),
MaPhanQuyen varchar(10) --foreign key references PhanQuyen(MaPhanQuyen),
)

create table NhaCungCap
(
MaNCC varchar(10) primary key,
TenNCC varchar(100),
)


create table PhieuNhapKho
(
MaPhieuNhap varchar(10) primary key,
NgayNhapKho date,
NgayTaoPhieu date,
MaTK varchar(10), --foreign key references TaiKhoan(MaTK),
MaNCC varchar(10) ,--foreign key references NhaCungCap(MaNCC),
)

create table ChiTietPhieuNhap
(
MaPhieuNhap varchar(10),-- foreign key references PhieuNhapKho(MaPhieuNhap),
MaSach varchar(10), --foreign key references Sach(MaSach),
SoLuong int,
)

create table PhieuThuTien
(
MaPhieuThu varchar(10),
MaKH varchar(10),-- foreign key references KhachHang(MaKH),
NgayThu date,
SoTienThu money,
MaTaiKhoan varchar(10)-- foreign key references TaiKhoan(MaTK),
)

create table BaoCaoCongNo
(
MaBaoCaoNo varchar(10) primary key,
Thang int,
Nam int,
)

create table ChiTietBaoCaoCongNo
(
MaBaoCaoNo varchar(10),-- foreign key references BaoCaoCongNo(MaBaoCaoNo),
MaKH varchar(10) --foreign key references KhachHang(MaKH),
)

create table BaoCaoTon
(
MaBaoCao varchar(10) primary key,
Thang int,
Nam int,
)

create table ChiTietBaoCaoTonKho
(
MaBaoCao varchar(10),--foreign key references BaoCaoTon(MaBaoCao),
MaSach varchar(10),-- foreign key references Sach(MaSach),
SoLuongTonDau int,
SoLuongTonCuoi int,
)

create table HoaDon
(
MaHoaDon varchar(10) primary key,
MaKH varchar(10),-- foreign key references KhachHang(MaKH),
NgayLap date,
TongTien money,
TienTra money,
TinhTrang varchar(20),

)

create table ChiTietHoaDon

(
MaHD varchar(10),-- foreign key references HoaDon(MaHoaDon),
MaSach varchar(10),-- foreign key references Sach(MaSach),
SoLuongSachMua int,
)

create table QuyDinh
(
MaQuyDinh varchar(10) primary key,
NgayCapNhap date,
SoLuongSachTonToiThieuDeNhap int,
SoLuongSachNhapToiThieu int,
)

alter table TaiKhoan add constraint FK_TaiKhoan_PhanQuyen foreign key (MaPhanQuyen) references PhanQuyen(MaPhanQuyen)

alter table PhieuNhapKho add constraint FK_PhieuNhapKho_TaiKhoan foreign key (MaTK) references TaiKhoan(MaTK)
alter table PhieuNhapKho add constraint FK_PhieuNhapKho_NhaCungCap foreign key(MaNCC) references NhaCungCap(MaNCC)

alter table ChiTietPhieuNhap add constraint FK_ChiTietPhieuNhap1_PhieuNhapKho foreign key(MaPhieuNhap) references PhieuNhapKho(MaPhieuNhap)
alter table ChiTietPhieuNhap add constraint FK_ChiTietPhieuNhap2_PhieuNhapKho foreign key(MaSach) references Sach(MaSach)

alter table PhieuthuTien add constraint FK_PhieuthuTien_KhachHang foreign key(MaKH) references KhachHang(MaKH)
alter table PhieuThuTien add constraint FK_PhieuThuTien_TaiKhoan foreign key(MaTK) references TaiKhoan(MaTK)

alter table ChiTietBaoCaoCongNo add constraint FK_ChiTietBaoCaoCongNo_BaoCaoCongNo foreign key(MaBaoCaoNo) references BaoCaoCongNo(MaBaoCaoNo)
alter table ChiTietBaoCaoCongNo add constraint FK_ChiTietBaoCaoCongNo_KhachHang foreign key(MaKH) references KhachHang(MaKH)

alter table ChiTietBaoCaoTonKho add constraint FK_ChiTietBaoCaoTonKho_BaoCaoton foreign key(MaBaoCao) references BaoCaoTon(MaBaoCao)
alter table ChiTietBaoCaoTonKho add constraint FK_ChiTietBaoCaoTonKho_Sach foreign key(MaSach) references Sach(MaSach)


alter table HoaDon add constraint FK_HoaDon_KhachHang foreign key(MaKH) references KhachHang(MaKH)

alter table ChiTietHoaDon add constraint FK_ChiTietHoaDon_HoaDon foreign key(MaHD) references HoaDon(MaHD)
alter table ChiTietHoaDon add constraint FK_ChiTietHoaDon_Sach foreign key(MaSach) references Sach(MaSach)

--ALTER TABLE HoaDon (use to add when create CSDL previous)
--ADD TinhTrang varchar(20);

--INSERT DATA
	-- PhanQUyen
INSERT INTO PhanQuyen VALUES('Admin','Admin')
INSERT INTO PhanQuyen VALUES('Sale','SaleStaff')

	--TaiKhoan
INSERT INTO TaiKhoan VALUES('admin1', 'admin@gmail.com', 'admin', 'Tran Thanh Trung', 'Admin')

	--KhachHang
INSERT INTO KhachHang VALUES('1', 'Trung', 'KTX Khu B', '0345304407', 'trung@gmail.com', 0)
INSERT INTO KhachHang VALUES('2', 'Trung2', 'KTX Khu B', '0345304402', 'trung2@gmail.com', 1)

	
	--Sach
INSERT INTO Sach VALUES('Test1', 'JavaBook', 'Coder', 'Lap Trinh', 10, 50000)

--Update
ALTER TABLE PhieuNhapKho
ALTER COLUMN NgayNhapKho date
