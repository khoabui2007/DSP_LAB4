// =============================================================================
// KỊCH BẢN HIỂN THỊ CỬA SỔ LẦN LƯỢT (CHỜ ĐÓNG/NHẤP CHUỘT MỚI MỞ CỬA SỔ TIẾP)
// =============================================================================

// 1. Nạp thư viện IPCV
atomsLoad("IPCV");

// 2. Đọc ảnh từ đĩa cứng
img = imread("Screenshot (109).png");

// 3. Chuyển RGB 3D sang Grayscale 2D
dims = size(img);
if length(dims) == 3 then
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

// -----------------------------------------------------------------------------
// BƯỚC 1: CỬA SỔ 1 - HISTOGRAM & EQUALIZATION
// -----------------------------------------------------------------------------
img_eq = imhistequal(img_gray);
h_orig = imhist(img_gray);
h_eq   = imhist(img_eq);

fig1 = figure(1);
clf(1);
subplot(2, 2, 1); imshow(img); title("Anh goc (RGB 3D)");

subplot(2, 2, 2); 
plot(0:255, h_orig, "b-"); 
title("Histogram anh goc");
xlabel("Muc xam (0-255)"); ylabel("So luong pixel");

subplot(2, 2, 3); imshow(img_eq); title("Anh sau Can bang Histogram");

subplot(2, 2, 4); 
plot(0:255, h_eq, "r-"); 
title("Histogram sau Can bang");
xlabel("Muc xam (0-255)"); ylabel("So luong pixel");

disp("--> Dang hien thi Cua so 1. Nhap chuột vao hinh 1 de chuyen sang Cua so 2...");
xclick(); // Tạm dừng kịch bản, chờ nhấp chuột vào Figure 1
delete(fig1);// Đóng/xóa Cửa sổ 1 sau khi nhấp chuột

// -----------------------------------------------------------------------------
// BƯỚC 2: CỬA SỔ 2 - LÀM MỜ ẢNH (BLUR FILTER)
// -----------------------------------------------------------------------------
h = fspecial("average", 25);
img_blur = imfilter(img, h);

fig2 = figure(2);
clf(2);
subplot(1, 2, 1); imshow(img);      title("Anh goc RGB");
subplot(1, 2, 2); imshow(img_blur); title("Anh RGB da lam mo (Blur 5x5)");

disp("--> Dang hien thi Cua so 2. Nhap chuột vao hinh 2 de chuyen sang Cua so 3...");
xclick(); // Tạm dừng kịch bản, chờ nhấp chuột vào Figure 2
delete(fig2); // Đóng/xóa Cửa sổ 2 sau khi nhấp chuột

// -----------------------------------------------------------------------------
// BƯỚC 3: CỬA SỔ 3 - ĐÓNG DẤU BẢN QUYỀN (WATERMARKING)
// -----------------------------------------------------------------------------
img_wm = imaddtext(img, "LAB4 SCILAB 2026",800, 300, 0, 10);

fig3 = figure(3);
clf(3);
imshow(img_wm);
title("Anh RGB da duoc dong dau Watermark");

disp("--> Đa hoan thanh tat ca các thao tac!");
