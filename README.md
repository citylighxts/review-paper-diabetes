# Review Paper: Metode Pengolahan Dataset Diabetes dan Komplikasinya

Repositori untuk Tugas Review Paper dan Rencana Final Project. Isinya 20 paper open access (2023 sampai 2026) tentang pengolahan data klinis tabular diabetes dan komplikasinya, tabel review hasil membaca full text, dan analisis pemilihan paper utama.

## Dataset Final Project

Li J, Zheng H, Zhou Y, Jiang F. *Diabetes and its complications research dataset* (v10). Zenodo, 2026. DOI [10.5281/zenodo.18270337](https://doi.org/10.5281/zenodo.18270337), lisensi CC BY 4.0.

Data follow-up pasien diabetes di Department of Diabetes and Endocrinology, Sixth People's Hospital (Shanghai Jiao Tong University), Februari sampai April 2012. Mencakup status glikemik, profil lipid, insulin, parameter hati, ginjal, dan hematologi, riwayat penyakit, gaya hidup, profil komplikasi (termasuk retinopati), kesadaran pasien, kepatuhan terapi, dan faktor genetik.

## Isi Repositori

| Path | Isi |
|---|---|
| `papers/` | 20 PDF paper, diberi nomor sesuai tabel |
| `papers/SOURCES.md` | DOI, lisensi, dan tautan unduh tiap paper |
| `papers/download_papers.sh` | Skrip untuk mengunduh ulang semua PDF |
| `review/tabel_review.xlsx` | Tabel review lengkap (27 kolom) + sheet rekap frekuensi metode |
| `review/tabel_review.csv` | Isi tabel yang sama dalam format CSV |
| `review/ringkasan_per_paper.md` | Ringkasan tiap paper sesuai butir tugas: tujuan, gap, kontribusi, tahapan, hasil, kesimpulan |

## Metode Review

- **Kriteria inklusi:** terbit 2023 atau sesudahnya, jurnal internasional peer-reviewed, open access, memakai data klinis tabular diabetes atau komplikasinya, dan membahas tahapan pengolahan data (missing value, imbalance, seleksi fitur, pemodelan, validasi).
- **Ekstraksi:** semua paper dibaca full text. Kolom tabel mengikuti data extraction form dari pedoman SLR Kitchenham & Charters (2007), disesuaikan dengan domain checklist CHARMS untuk studi model prediksi klinis (sumber data, partisipan, outcome, prediktor, ukuran sampel, missing data, pengembangan model, performa, evaluasi).
- **Catatan reviewer:** kolom keterbatasan memuat keterbatasan yang ditulis penulis ditambah temuan kritis saat membaca (misalnya inkonsistensi angka atau risiko data leakage).

## Tabel Review

Versi lengkap ada di [`review/tabel_review.xlsx`](review/tabel_review.xlsx).

| No | Paper | Jurnal | Target | Data (n) | Preprocessing & seleksi fitur | Model terbaik & hasil | Validasi |
|---|---|---|---|---|---|---|---|
| 1 | [Wang dkk. 2024](papers/01_Wang2024.pdf) | Scientific Reports | Klasifikasi biner DR vs non-DR | 3.000 (1.500 DR / 1.500 non-DR); 85 kandidat fitur dari 8... | 52 dari 86 fitur memiliki missing; fitur dengan missing >50% sebagian besar dibuang; imputasi modus (kategorikal) dan mean (kontinu); normalisasi M... | GBDT terbaik: Acc 0,788; Prec 0,830; Rec 0,754; F1 0,790; AUC 0,867. LR 27 faktor: Acc 0,773; AUC 0,834 | Split 50% train / 25% validasi / 25% test; tanpa validasi... |
| 2 | [Li B dkk. 2024](papers/02_Li2024.pdf) | Frontiers in Endocrinology | Klasifikasi biner DR vs non-DR | 300 (150 DR / 150 non-DR); 19 kandidat variabel | Normalisasi Z-score; hanya pasien dengan data lengkap. Seleksi: Uji univariat (P<0,05) lalu regresi logistik multivariat, 8 prediktor | IBAS-XGB terbaik: ROC-AUC 0,860; PR-AUC 0,883; Acc 0,850; F1 0,848. XGBoost 0,824; SVM 0,727; LR 0,652 | Split 80/20 (240/60) + 5-fold CV di training; tanpa valid... |
| 3 | [Liu X dkk. 2025](papers/03_Liu2025.pdf) | Frontiers in Endocrinology | Klasifikasi biner DR vs non-DR | 3.750 (1.392 DR / 2.358 non-DR); ukuran sampel minimal di... | Buang pasien missing >20%; buang variabel missing >20% (C-peptida, insulin, CRP); imputasi mean dan modus; fitur turunan TyG = ln(TG x FPG / 2); VI... | LR dan SVM terbaik: AUC test 0,85; 5-fold CV LR 0,824 +/- 0,012, SVM 0,815 +/- 0,007 | Split 7:3 + 5-fold CV |
| 4 | [Kim MS dkk. 2025](papers/04_Kim2025.pdf) | Frontiers in Medicine | Klasifikasi biner DR vs non-DR | 3.026 (671 DR = 22,2%) | Complete-case: hanya peserta tanpa missing pada variabel analisis. Seleksi: RFECV 5-fold, 16 variabel | RF terbaik: AUC 0,748; Sens 0,669; Spec 0,729; Acc 0,715. LR 0,744; XGB 0,731; DT 0,651 | Split 8:2 (2.420 / 606) |
| 5 | [Pan dkk. 2023](papers/05_Pan2023.pdf) | Frontiers in Medicine | Risiko DR pada T2DM | 2.385 (DR sekitar 20,5%); 23 kandidat faktor | Complete-case (pasien dengan data hilang atau abnormal dikeluarkan); normalisasi untuk LASSO. Seleksi: LASSO, RF-RFE, XGBoost, BPNN; prediktor akhi... | AUC test Model I 0,679 = Model II 0,679; recall hanya 0,035; NRI 0,004 (CI melewati nol) | Split 7:3; 10-fold CV untuk LASSO |
| 6 | [Kim S dkk. 2025](papers/06_Kim2025.pdf) | JMIR Medical Informatics | DR dalam 3 tahun | Discovery 14.694 (DR 2,37%); validasi 1.856 (DR 7,38%); 5... | Pasien dengan data hilang dikeluarkan; nilai lab terakhir sebelum onset dirata-rata, juga variabilitas (SD). Seleksi: Ranking feature importance XG... | XGBoost: AUROC internal 0,824, eksternal 0,717; Acc 75,1% vs 65,1% | Stratified 10-fold CV (internal) + validasi eksternal 2 RS |
| 7 | [Liu XZ dkk. 2023](papers/07_Liu2023.pdf) | Frontiers in Endocrinology | Klasifikasi DKD vs T2DM tanpa DKD | 3.624 (1.856 DKD / 1.768 non-DKD); 53 kandidat variabel | Pasien missing >25% dikeluarkan; sisa missing diimputasi MICE. Seleksi: LASSO 53 menjadi 38 fitur; model ringkas 12 fitur teratas SHAP | CatBoost: AUC 0,861; Acc 0,777 (38 fitur); 12 fitur AUC 0,840 | Stratified split 80/20 + 10-fold CV |
| 8 | [Sabanayagam dkk. 2023](papers/08_Sabanayagam2023.pdf) | eLife | Insiden DKD dalam 6 tahun | 1.365 (162 DKD = 11,9%); 339 fitur dalam 6 set fitur | Peserta missing >10% dikeluarkan; imputasi mean/modus. Seleksi: RFE berbasis Elastic Net + importance RF/GBDT/XGB; akhir 15 fitur | Elastic Net 15 fitur: AUC 0,851 vs LR 7 fitur 0,795 (naik relatif 7%); LASSO 0,820; GBDT 0,819 | Stratified split 80/20 + 40 kali ulang 5-fold CV |
| 9 | [Cai dkk. 2024](papers/09_Cai2024.pdf) | World Journal of Diabetes | Nefropati diabetik (DN) | 210 (74 DN / 136 non-DN); train 147 / test 63 | Hanya data lengkap; tidak ada detail lain. Seleksi: Uji univariat lalu LR multivariat: durasi DM, gula puasa, kreatinin, HbA1c, retinopati | RF AUC 0,850 (Acc 0,730); nomogram AUC 0,811 (Acc 0,746); DT AUC 0,735 | Split acak 7:3; uji DeLong |
| 10 | [Li T dkk. 2025](papers/10_Li2025.pdf) | Frontiers in Endocrinology | Risiko DKD pada T2DM | 10.057 (5.162 DKD / 4.895 non-DKD); 47 kandidat fitur | Tidak dilaporkan. Seleksi: LASSO 10-fold CV, 15 fitur | XGBoost AUC 0,932 (train) / 0,930 (validasi); RF 0,817; LR 0,675 | 15% hold-out acak + split 7:3 + 10-fold CV |
| 11 | [Lin X dkk. 2025](papers/11_Lin2025.pdf) | BMC Medical Informatics and Decision Making | Kejadian DKD sejak diagnosis awal T2DM | 3.291 (563 DKD = 17,1%); 74 menjadi 46 prediktor | Variabel missing >70% dibuang; pasien missing >30% dikeluarkan; MICE; outlier dibuang berdasarkan pertimbangan klinis. Seleksi: Tidak ada seleksi e... | SuperLearner: AUC train 0,938, holdout 0,714; Sens 73,4%; Spec 59,1% | Split 70/30 (2.303 / 988) |
| 12 | [Luo dkk. 2026](papers/12_Luo2026.pdf) | Frontiers in Endocrinology | Klasifikasi DKD vs T2DM tanpa DKD | 602 (457 T2DM / 145 DKD) dari 820 rekam medis; 19 indikat... | Missing <5%: modus (kategorikal), mean (kontinu normal), KNN (numerik lain). Seleksi: LR univariat lalu multivariat: HbA1c, beta2-MG, protein urin... | LR: AUC test 0,979; Sens 89,7%; Spec 92,4% | Split 8:2 + 5-fold CV |
| 13 | [Sun M dkk. 2025](papers/13_Sun2025.pdf) | Frontiers in Endocrinology | Risiko DPN | 1.544 (529 DPN = 34,3%); 23 kandidat variabel | Multiple imputation (mice, 5 imputasi, PMM); semua variabel missing <30%. Seleksi: Irisan Boruta dan LASSO, 8 fitur | SGBT AUC test 0,811 (train 0,933); XGB 0,810; LR 0,757 | Split 70/30 + 10x10-fold CV di training |
| 14 | [Wang L dkk. 2024](papers/14_Wang2024.pdf) | BMC Endocrine Disorders | DPN | 1.806 (training 1.012, validasi internal 434, eksternal 360) | Pasien dengan data baseline hilang dikeluarkan; entri ganda oleh dua peneliti. Seleksi: Univariat lalu eliminasi mundur LR: kebas, nyeri tungkai, D... | LR AUC eksternal 0,88; RF 0,88 (train 0,95). LR lebih terkalibrasi | Split 7:3 + validasi eksternal RS kedua + 10-fold CV |
| 15 | [Liu L dkk. 2024](papers/15_Liu2024.pdf) | Frontiers in Endocrinology | PVD pada T2DM | 3.982 dianalisis (3.065 PVD / 917 non-PVD); 53 variabel m... | Indikator missing >25% dibuang; sampel missing >30% dikeluarkan; imputasi median dan MissForest; normalisasi. Seleksi: RFE berbasis RF, 12 prediktor | XGBoost AUC 0,945; Acc 0,890; AdaBoost 0,938; RF 0,935; LR 0,711 | Split 8:2 + 10-fold CV |
| 16 | [Wu Y dkk. 2024](papers/16_Wu2024.pdf) | BMC Medical Informatics and Decision Making | DPN dan LEAD (dua model) | 479 (DPN 44,9%; LEAD 14,4%); 38 kandidat fitur | Missing <30%: isi dengan pengukuran terakhir sebelumnya, sisanya median. Seleksi: MI, RF-RFE, Boruta; fitur terpilih >=2 metode (DPN 12, LEAD 9) | DPN: XGBoost AUC 0,903. LEAD: RF AUC 0,923 | Split 80/20; tanpa CV |
| 17 | [Voskergian dkk. 2025](papers/17_Voskergian2025.pdf) | Frontiers in Genetics | Retinopati, CKD, penyakit jantung iskemik... | 324.575 rekam setelah preprocessing | JSON ke tabel; buang rekam kosong dan kunjungan sebelum diagnosis; cegah leakage; min-max scaling. Seleksi: Seleksi berbasis XGBoost (25-200 fitur) | XGBoost: retinopati AUC 0,84; jantung iskemik 0,84; CKD 0,77; amputasi 0,75 | Monte Carlo CV 90/10 + validasi terpartisi |
| 18 | [Jabbar & Washington 2024](papers/18_Jabbar2024.pdf) | BioMedInformatics | Prediksi diabetes | 162.453 (56.655 positif); 47 fitur; missing hingga 65% (b... | Dibandingkan: tanpa imputasi, auto-impute, konstanta, mean, median, multiple imputation (Bayesian Ridge). Seleksi: Tidak ada | Performa turun seiring bertambahnya fitur hilang; imputasi meratakan penurunan tapi variansnya membesar (he... | Stratified split 80/20 |
| 19 | [Li Y dkk. 2025](papers/19_Li2025.pdf) | Frontiers in Endocrinology | PDPN (sangat tidak seimbang, 4,08%) | 1.984 (81 PDPN) | Missing ditangani dengan eksklusi (247 dibuang). Seleksi: LASSO 10-fold CV aturan 1-SE, 10 prediktor | RF AUC 0,913 (PR-AUC 0,488); LR AUC 0,894 dengan sensitivitas dan balanced accuracy tertinggi (dipilih) | Test set independen (594) + bootstrap 1.000 kali |
| 20 | [Li W dkk. 2024](papers/20_Li2024.pdf) | PLOS ONE | Prediksi diabetes | Angka jumlah data tidak konsisten di naskah; prevalensi d... | Missing dihapus; recoding sesuai codebook. Seleksi: Korelasi Pearson dan uji chi-square | XGBoost tanpa resampling AUC 0,828 (recall 17%); stacking setelah SMOTEENN AUC 0,989; Acc 94,9% | Split 80/20; 5-fold CV untuk stacking |

## Pola Temuan dari 20 Paper

1. **Model:** XGBoost dan Random Forest paling sering diuji (masing-masing di 14 paper). Model terbaik bervariasi: XGBoost atau boosting di sebagian besar studi, tapi di paper no. 3, 4, 12, 14, dan 19 regresi logistik setara atau dipilih karena lebih stabil dan terkalibrasi.
2. **Interpretabilitas:** SHAP dipakai di 13 paper dan sudah menjadi standar. HbA1c, durasi diabetes, dan penanda ginjal (kreatinin, eGFR, albuminuria) paling sering muncul sebagai prediktor teratas.
3. **Missing value:** penanganan paling umum masih sederhana, yaitu membuang pasien atau variabel dengan missing tinggi lalu imputasi mean atau modus. Hanya sebagian kecil yang memakai MICE, KNN, atau MissForest. Paper no. 18 menunjukkan imputasi menambah ketidakstabilan performa seiring naiknya missingness.
4. **Imbalance:** SMOTE dipakai di 4 paper. Paper no. 15 menerapkannya dengan benar (hanya di data training), sedangkan lonjakan AUC di paper no. 20 mengindikasikan resampling sebelum split. Paper no. 5 tidak menangani imbalance sehingga recall hanya 0,035.
5. **Validasi:** 14 paper memakai K-fold CV, tapi hanya 2 paper (no. 6 dan no. 14) yang melakukan validasi eksternal di rumah sakit lain. Keduanya menunjukkan penurunan atau kestabilan performa yang tidak terlihat dari validasi internal saja.
6. **Sumber data:** 14 dari 20 paper memakai data rumah sakit di Tiongkok, sehingga sebanding langsung dengan dataset Zenodo dari Shanghai.

## Analisis: Paper Mana yang Sebaiknya Jadi Paper Utama?

Bobot penilaian tugas: kualitas jurnal 20%, kualitas artikel 20%, kedalaman review 25%, kelengkapan review 20%, rencana FP 15%. Paper utama yang ideal harus (a) terbit di jurnal bereputasi, (b) melaporkan tahapan secara lengkap sehingga semua butir review bisa diisi, (c) punya kelemahan yang jelas untuk dibahas secara kritis, dan (d) metodenya bisa langsung diterapkan pada dataset Zenodo.

| Kandidat | Jurnal | Kelengkapan pelaporan | Bahan analisis kritis | Kedekatan dengan dataset Zenodo | Kegunaan untuk rencana FP |
|---|---|---|---|---|---|
| **No. 1 Wang dkk. 2024** | Scientific Reports | Tinggi: tujuan, gap, kontribusi eksplisit; pipeline missing, normalisasi, RFECV, tuning, SHAP | Banyak: split 50/25/25 tanpa validasi eksternal, imputasi mean, kelas seimbang karena seleksi sampel | Sangat tinggi: dataset komplikasi diabetes RS Tiongkok, 86 variabel lab, banyak missing | Tinggi |
| No. 3 Liu X dkk. 2025 | Frontiers in Endocrinology | Sangat tinggi: TRIPOD, hitung ukuran sampel, VIF, CV | Sedang: validasi internal, imputasi sederhana | Tinggi: TyG bisa dihitung dari data Zenodo | Tinggi |
| No. 12 Luo dkk. 2026 | Frontiers in Endocrinology | Tinggi: langkah imputasi sangat rinci | Banyak: AUC 0,979 kemungkinan karena prediktor bagian dari definisi DKD | Sangat tinggi: panel lab hampir identik | Sedang |
| No. 8 Sabanayagam dkk. 2023 | eLife | Tinggi: CV berulang 40 kali | Sedang | Rendah: bergantung pada metabolit | Rendah |
| No. 15 Liu L dkk. 2024 | Frontiers in Endocrinology | Tinggi: SMOTE yang benar, G-mean | Sedang: imputasi sebelum split | Tinggi | Tinggi |

### Rekomendasi: paper no. 1 (Wang dkk., 2024, *Scientific Reports*)

1. **Kualitas jurnal:** Scientific Reports adalah jurnal Nature Portfolio yang terindeks Scopus dan WoS. Cek kuartil terbarunya di [SJR](https://www.scimagojr.com) sebelum presentasi.
2. **Datanya paling mirip dengan dataset FP.** Paper ini memakai *Diabetes Complication Early Warning Dataset* dari PLA General Hospital yang dirilis National Population Health Science Data Center Tiongkok: data tabular komplikasi diabetes dari rumah sakit Tiongkok dengan 86 variabel dan 52 di antaranya mengandung missing. Karakteristik ini hampir sama dengan dataset Zenodo, sehingga tahapan paper bisa dijadikan baseline FP.
3. **Semua butir review terisi jelas.** Tujuan, gap, dan kontribusi ditulis eksplisit. Tahapannya runtut: penanganan missing, normalisasi Min-Max, RFECV, perbandingan empat model dengan grid search, lalu SHAP termasuk analisis interaksi fitur.
4. **Kelemahannya konkret untuk kedalaman review:** tidak ada validasi eksternal meski disebut di subjudul; split 50/25/25 tanpa CV pada evaluasi akhir; imputasi mean yang diakui menambah error; kelas 1:1 karena pemilihan sampel sehingga prevalensi tidak realistis; durasi diabetes tidak tersedia.
5. **Langsung menjadi pijakan rencana FP.** Kelemahan di atas bisa dijawab di FP: imputasi yang lebih baik (MICE atau MissForest, dirujuk dari paper no. 7, 11, 13, 18), penanganan imbalance yang benar (no. 15, 19), dan evaluasi yang lebih kuat (K-fold berulang seperti no. 8).

**Cadangan:** paper no. 3 (Liu X dkk., 2025) jika ingin paper dengan pelaporan paling rapi. Paper no. 12 lebih cocok dijadikan contoh di bagian analisis kritis daripada paper utama, karena AUC-nya yang sangat tinggi patut dicurigai.

## Gap untuk Rencana Final Project

- Validasi eksternal jarang dilakukan (2 dari 20 paper).
- Imputasi mayoritas masih mean atau modus; perbandingan sistematis metode imputasi pada data komplikasi diabetes masih sedikit.
- Risiko data leakage (resampling atau imputasi sebelum split, prediktor yang merupakan bagian dari definisi outcome) sering tidak dibahas.
- Komplikasi hampir selalu dimodelkan satu per satu; hanya paper no. 16 dan 17 yang menangani beberapa komplikasi sekaligus.
- Variabel gaya hidup, kesadaran pasien, kepatuhan terapi, dan faktor genetik, yang tersedia di dataset Zenodo, jarang dipakai di 20 paper ini.

## Lisensi

Semua PDF di `papers/` adalah artikel open access (CC BY, CC BY-NC, atau CC BY-NC-ND) dan disimpan tanpa perubahan untuk keperluan akademik. Hak cipta tetap milik penulis dan penerbit masing-masing. Rincian lisensi per paper ada di [`papers/SOURCES.md`](papers/SOURCES.md).

## Referensi Format Review

- Kitchenham B, Charters S. *Guidelines for performing Systematic Literature Reviews in Software Engineering*. EBSE Technical Report, 2007.
- Moons KGM dkk. Critical appraisal and data extraction for systematic reviews of prediction modelling studies: the CHARMS checklist. *PLOS Medicine*, 2014.
