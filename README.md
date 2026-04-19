# 🛒 Supermarket Sales Analysis (SQL Project)

## 📌 Deskripsi Proyek | Project Overview

Proyek ini bertujuan untuk menganalisis data transaksi penjualan supermarket menggunakan SQL guna menghasilkan insight bisnis yang actionable.
This project aims to analyze supermarket sales transaction data using SQL to generate actionable business insights.

---

## 🎯 Permasalahan Bisnis | Business Problem

Perusahaan supermarket ingin menjawab beberapa pertanyaan berikut:
The supermarket business aims to answer the following questions:

* Cabang mana yang memiliki performa terbaik dan terburuk?
  Which branch performs the best and worst?
* Produk apa yang paling menguntungkan?
  Which products generate the highest profit?
* Kapan waktu penjualan paling tinggi?
  When are the peak sales hours?
* Siapa pelanggan paling bernilai?
  Who are the most valuable customers?
* Bagaimana cara meningkatkan revenue dan kepuasan pelanggan?
  How can revenue and customer satisfaction be improved?

---

## 📊 Dataset

Dataset berisi data transaksi penjualan dengan atribut berikut:
The dataset contains transactional sales data, including:

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
The initial dataset stored **date and time as strings**, preventing time-based analysis.

### 🔧 Solusi | Solution

ALTER TABLE sales
ADD COLUMN date_clean DATE,
ADD COLUMN time_clean TIME;

UPDATE sales
SET 
    date_clean = "Date"::DATE,
    time_clean = "Time"::TIME;

```

Setelah proses ini, data dapat digunakan untuk analisis berbasis waktu.
After this step, the data becomes suitable for time-based analysis.

---

## 🧠 Teknik SQL | SQL Techniques Used

* Common Table Expression (CTE)
* Aggregation (SUM, AVG, COUNT)
* Window Functions (RANK)
* Data Cleaning & Type Conversion
* Time-based Analysis

---

## 📈 Analisis Utama | Key Analysis

### 1. Performa Cabang | Branch Performance

* Mengidentifikasi cabang dengan revenue dan profit tertinggi
* Identifying top-performing branches by revenue and profit
* Menemukan cabang dengan rating rendah
* Detecting branches with low customer ratings

---

### 2. Profitabilitas Produk | Product Profitability

* Membandingkan produk paling laku vs paling menguntungkan
* Comparing most sold vs most profitable products
* Produk terlaris tidak selalu paling profit
* High sales volume does not always mean high profit

---

### 3. Analisis Waktu | Time Analysis

* Menentukan jam sibuk (peak hour)
* Identifying peak sales hours
* Menemukan jam sepi
* Detecting underutilized hours

---

### 4. Segmentasi Pelanggan | Customer Segmentation

* Membandingkan member vs non-member
* Comparing member vs non-member customers
* Member memiliki kontribusi revenue lebih tinggi
* Members contribute higher revenue

---

### 5. Metode Pembayaran | Payment Analysis

* Mengidentifikasi metode pembayaran populer
* Identifying popular payment methods
* Tren cashless (e-wallet) meningkat
* Increasing adoption of cashless payments

---

## 📌 Insight Utama | Key Insights

* Cabang terbaik menghasilkan revenue tertinggi
  Top branches generate significantly higher revenue
* Produk terlaris tidak selalu paling menguntungkan
  Best-selling products are not always the most profitable
* Penjualan tertinggi terjadi pada sore–malam
  Peak sales occur in the evening
* Member adalah pelanggan paling bernilai
  Members are the most valuable customers
* E-wallet menjadi metode pembayaran dominan
  E-wallet is the dominant payment method

---

## 🚀 Rekomendasi Bisnis | Business Recommendations

* Fokus pada produk dengan margin tinggi
  Focus on high-margin products
* Tingkatkan layanan di cabang dengan rating rendah
  Improve service quality in low-rated branches
* Tambah staf saat jam sibuk
  Increase staffing during peak hours
* Buat promosi saat jam sepi
  Launch promotions during off-peak hours
* Kembangkan program loyalitas
  Develop customer loyalty programs
* Kerjasama dengan e-wallet
  Partner with e-wallet providers

---

## 🛠️ Tools yang Digunakan | Tools Used

* SQL (MySQL / PostgreSQL)
* DBeaver
* Power BI / Tableau (opsional)

---

## 📁 Struktur Project | Project Structure

```id="8y4b4o"
supermarket-sql-analysis/
│
├── dataset/
│   └── sales.csv
│
├── queries/
│   └── analysis.sql
│
├── README.md
```

---

## 💡 Pembelajaran | What I Learned

* Pentingnya data cleaning sebelum analisis
  Importance of data cleaning before analysis
* Penggunaan CTE untuk query yang modular
  Using CTE for modular SQL queries
* Mengubah data menjadi insight bisnis
  Translating data into business insights
* Komunikasi hasil analisis
  Communicating analytical results effectively

---

## 👤 Author

Yusuf Nur Fajar Aspiring Data Analyst / Data Enthusiast

---
