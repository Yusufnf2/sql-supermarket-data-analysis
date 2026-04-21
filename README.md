# 🛒 Supermarket Sales Analysis (SQL Project)

## 📌 Deskripsi Proyek 

Proyek ini bertujuan untuk menganalisis data transaksi penjualan supermarket menggunakan SQL guna menghasilkan insight bisnis yang actionable.

---

## 🎯 Permasalahan Bisnis 

Perusahaan supermarket ingin menjawab beberapa pertanyaan berikut:
* Cabang mana yang memiliki performa terbaik dan terburuk?
* Produk apa yang paling menguntungkan?
* Kapan waktu penjualan paling tinggi?
* Siapa pelanggan paling bernilai?
* Bagaimana cara meningkatkan revenue dan kepuasan pelanggan?

---

## 📊 Dataset

Dataset berisi data transaksi penjualan dengan atribut berikut:
* Invoice ID
* Cabang & Kota | Branch & City
* Tipe Pelanggan | Customer Type
* Kategori Produk | Product Line
* Harga & Jumlah | Unit Price & Quantity
* Total Penjualan | Total Sales
* Metode Pembayaran | Payment Method
* Tanggal & Waktu | Date & Time
* Rating Pelanggan | Customer Rating

---

## ⚠️ Data Cleaning

Dataset awal memiliki kolom **tanggal dan waktu dalam bentuk string** sehingga tidak dapat langsung dianalisis.

### 🔧 Solusi | Solution
```
ALTER TABLE sales
ADD COLUMN date_clean DATE,
ADD COLUMN time_clean TIME;
```
```
UPDATE sales
SET 
    date_clean = "Date"::DATE,
    time_clean = "Time"::TIME;
```
Setelah proses ini, data dapat digunakan untuk analisis berbasis waktu.

---

## 🧠 Teknik SQL 

* Common Table Expression (CTE)
* Aggregation (SUM, AVG, COUNT)
* Window Functions (RANK)
* Data Cleaning & Type Conversion
* Time-based Analysis

---

## 📈 Analisis Utama 

### 1. Performa Cabang 

* Mengidentifikasi cabang dengan revenue dan profit tertinggi
* Menemukan cabang dengan rating rendah

---

### 2. Profitabilitas Produk 

* Membandingkan produk paling laku vs paling menguntungkan
* Produk terlaris tidak selalu paling profit

---

### 3. Analisis Waktu 

* Menentukan jam sibuk (peak hour)
* Menemukan jam sepi

---

### 4. Segmentasi Pelanggan 

* Membandingkan member vs non-member
* Member memiliki kontribusi revenue lebih tinggi

---

### 5. Metode Pembayaran 

* Mengidentifikasi metode pembayaran populer
* Tren cashless (e-wallet) meningkat

---

## 📌 Insight Utama | Key Insights

* Cabang terbaik menghasilkan revenue tertinggi
* Produk terlaris tidak selalu paling menguntungkan
* Penjualan tertinggi terjadi pada sore–malam
* Member adalah pelanggan paling bernilai
* E-wallet menjadi metode pembayaran dominan

---

## 🚀 Rekomendasi Bisnis 

* Fokus pada produk dengan margin tinggi
* Tingkatkan layanan di cabang dengan rating rendah
* Tambah staf saat jam sibuk
* Buat promosi saat jam sepi
* Kembangkan program loyalitas
* Kerjasama dengan e-wallet

---

## 🛠️ Tools yang Digunakan 

* SQL (MySQL / PostgreSQL)
* DBeaver

---

## 📁 Struktur Project 

```id="8y4b4o"
supermarket-sql-analysis/
│
├── dataset/
│   └── SuperMarket Analysis.csv
│
├── queries/
│   └── analysis.sql
│
├── README.md
```

---

## 💡 Pembelajaran 
* Pentingnya data cleaning sebelum analisis
* Penggunaan CTE untuk query yang modular
* Mengubah data menjadi insight bisnis
* Komunikasi hasil analisis
---

## 👤 Author

Yusuf Nur Fajar Aspiring Data Analyst / Data Enthusiast

---
