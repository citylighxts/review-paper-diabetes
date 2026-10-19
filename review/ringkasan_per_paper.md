# Ringkasan Review per Paper

Setiap paper diringkas mengikuti butir tugas: tujuan, gap, kontribusi, tahapan dan metode, analisis hasil, kesimpulan. Semua dibaca dari full text.

## 1. Wang dkk. 2024: An enhanced machine learning algorithm for type 2 diabetes prognosis with a detailed examination of key correlates

**Wang X, Shen P, Zhao G, Li J, Zhu Y, Li Y, Xu H, Liu J, Cui R** (2024). *Scientific Reports, 14*. DOI [10.1038/s41598-024-75898-w](https://doi.org/10.1038/s41598-024-75898-w). Lisensi CC BY 4.0. PDF: [`papers/01_Wang2024.pdf`](papers/01_Wang2024.pdf)

- **Tujuan:** Membangun model prediksi DR berperforma tinggi pada T2DM dan mengidentifikasi korelat kuncinya, sekaligus membandingkan ML dengan regresi logistik.
- **Gap:** Statistik konvensional mudah underfit dan kurang mampu menangani banyak fitur; seleksi fitur, tuning, serta analisis efek dan interaksi fitur masih bisa ditingkatkan.
- **Kontribusi:** RFECV untuk membuang fitur redundan; perbandingan 4 model ML yang di-tuning; klaim penggunaan pertama GBDT untuk DR; 6 korelat (AUC 0,867) vs 27 faktor LR (AUC 0,834).
- **Data:** Diabetes Complication Early Warning Dataset, PLA General Hospital (via National Population Health Science Data Center), Tiongkok, 2021; 3.000 (1.500 DR / 1.500 non-DR); 85 kandidat fitur dari 86 variabel
- **Tahapan dan metode:**
  1. Preprocessing: 52 dari 86 fitur memiliki missing; fitur dengan missing >50% sebagian besar dibuang; imputasi modus (kategorikal) dan mean (kontinu); normalisasi Min-Max [0,1]
  2. Imbalance: Tidak perlu (kelas seimbang sejak desain)
  3. Seleksi fitur: RFECV 3-fold, akhir 6 fitur: HbA1c, protein urin 24 jam, kreatinin serum, rasio albumin/kreatinin, urea, C-peptida
  4. Model: LR (baseline), SVM, DT, RF, GBDT; tuning grid search + CV
  5. Validasi: Split 50% train / 25% validasi / 25% test; tanpa validasi eksternal; metrik: Accuracy, Precision, Recall, F1, AUC, ROC
- **Analisis hasil:** GBDT terbaik: Acc 0,788; Prec 0,830; Rec 0,754; F1 0,790; AUC 0,867. LR 27 faktor: Acc 0,773; AUC 0,834. Interpretasi: SHAP (swarm, violin, dependence, interaction); C-peptida protektif; ACR dan protein urin 24 jam menaikkan risiko; 6 pasangan interaksi fitur
- **Keterbatasan:** Sampel hanya pasien Tiongkok; imputasi mean menambah error; durasi diabetes tidak tersedia; analisis interaksi masih eksploratif. Catatan reviewer: tidak ada validasi eksternal walau judul subbab menyebutnya.
- **Kesimpulan:** GBDT dengan 6 faktor yang mudah dijelaskan lebih akurat daripada LR dengan 27 faktor.
- **Relevansi untuk FP:** Sangat tinggi: data tabular RS Tiongkok dengan banyak variabel lab dan missing, target komplikasi; pipeline lengkap dari imputasi sampai SHAP.

## 2. Li B dkk. 2024: The application and clinical translation of the self-evolving machine learning methods in predicting diabetic retinopathy and visualizing clinical transformation

**Li B, Hu L, Zhang S, Li S, Tang W, Chen G** (2024). *Frontiers in Endocrinology, 15:1429974*. DOI [10.3389/fendo.2024.1429974](https://doi.org/10.3389/fendo.2024.1429974). Lisensi CC BY. PDF: [`papers/02_Li2024.pdf`](papers/02_Li2024.pdf)

- **Tujuan:** Menilai ML self-evolving untuk prediksi DR dan membangun alat visualisasi risiko individual.
- **Gap:** Model prediksi DR sebelumnya mayoritas model linear tergeneralisasi; ML self-evolving belum jelas diterapkan pada DR.
- **Kontribusi:** Improved Beetle Antennae Search (IBAS: inisialisasi chaos, mutasi distribusi-t adaptif, random walk); model IBAS-XGB; perangkat lunak visualisasi.
- **Data:** Ganzhou People's Hospital, Tiongkok, Jan 2022 - Okt 2023 (satu RS); 300 (150 DR / 150 non-DR); 19 kandidat variabel
- **Tahapan dan metode:**
  1. Preprocessing: Normalisasi Z-score; hanya pasien dengan data lengkap
  2. Imbalance: Tidak perlu (seimbang sejak desain)
  3. Seleksi fitur: Uji univariat (P<0,05) lalu regresi logistik multivariat, 8 prediktor
  4. Model: LR, SVM, XGBoost (grid search) vs IBAS-XGB
  5. Validasi: Split 80/20 (240/60) + 5-fold CV di training; tanpa validasi eksternal; metrik: Precision, Sensitivity, Specificity, Accuracy, F1, ROC-AUC, PR-AUC
- **Analisis hasil:** IBAS-XGB terbaik: ROC-AUC 0,860; PR-AUC 0,883; Acc 0,850; F1 0,848. XGBoost 0,824; SVM 0,727; LR 0,652. Interpretasi: Odds ratio LR: jenis kelamin laki-laki (3,10), HbA1c (2,70), tekanan sistolik (2,67)
- **Keterbatasan:** Retrospektif, satu RS, sampel kecil (test hanya 60), biaya komputasi IBAS tinggi; tidak ada uji statistik antar model.
- **Kesimpulan:** ML self-evolving membantu identifikasi fitur DR dan prediksi dini; perlu validasi multisenter.
- **Relevansi untuk FP:** Sedang: ide tuning hyperparameter metaheuristik, tapi sampel kecil.

## 3. Liu X dkk. 2025: Development of machine learning predictive model for type 2 diabetic retinopathy using the triglyceride-glucose index explained by SHAP method

**Liu X, Wu S, Yang Y, Li Y, Zhang X, Liu R, Qin L, Li F** (2025). *Frontiers in Endocrinology, 16:1631647*. DOI [10.3389/fendo.2025.1631647](https://doi.org/10.3389/fendo.2025.1631647). Lisensi CC BY. PDF: [`papers/03_Liu2025.pdf`](papers/03_Liu2025.pdf)

- **Tujuan:** Membangun model prediksi DR dengan indeks TyG sebagai prediktor baru dan menjelaskannya dengan SHAP.
- **Gap:** Sedikit model DR yang memasukkan resistensi insulin; HOMA-IR butuh insulin puasa yang jarang tersedia di layanan primer.
- **Kontribusi:** Model ML pertama untuk DR dengan TyG sebagai prediktor inti; validasi lintas RS kota dan kabupaten; interpretasi SHAP.
- **Data:** First Hospital of Jilin University + Meihekou Central Hospital, Tiongkok, 2010-2023; 3.750 (1.392 DR / 2.358 non-DR); ukuran sampel minimal dihitung dengan metode Riley
- **Tahapan dan metode:**
  1. Preprocessing: Buang pasien missing >20%; buang variabel missing >20% (C-peptida, insulin, CRP); imputasi mean dan modus; fitur turunan TyG = ln(TG x FPG / 2); VIF
  2. Imbalance: Tidak ada (rasio sekitar 37:63)
  3. Seleksi fitur: Variabel P<0,1 masuk RFECV, tersisa 9 fitur
  4. Model: LR, DT, SVM, RF, XGBoost
  5. Validasi: Split 7:3 + 5-fold CV; metrik: Accuracy, Sensitivity, Specificity, Precision, F1, AUC
- **Analisis hasil:** LR dan SVM terbaik: AUC test 0,85; 5-fold CV LR 0,824 +/- 0,012, SVM 0,815 +/- 0,007. Interpretasi: SHAP (TreeExplainer) + PDP: TyG, terapi insulin, HbA1c, durasi DM, HDL; efek non-linear di TyG > 4
- **Keterbatasan:** Validasi internal saja; imputasi mean/modus sederhana; stadium DR tidak dibedakan.
- **Kesimpulan:** TyG adalah prediktor murah dan berguna untuk skrining DR di layanan primer.
- **Relevansi untuk FP:** Sangat tinggi: dataset Zenodo memiliki lipid, glukosa, dan insulin sehingga TyG bisa dihitung.

## 4. Kim MS dkk. 2025: A machine learning-based prediction of diabetic retinopathy using the Korea national health and nutrition examination survey (2008-2012, 2017-2021)

**Kim MS, Choi YW, Prakash BS, Lee Y, Lim S, Woo SJ** (2025). *Frontiers in Medicine, 12:1542860*. DOI [10.3389/fmed.2025.1542860](https://doi.org/10.3389/fmed.2025.1542860). Lisensi CC BY. PDF: [`papers/04_Kim2025.pdf`](papers/04_Kim2025.pdf)

- **Tujuan:** Mengembangkan dan membandingkan algoritma ML untuk prediksi DR tanpa citra fundus.
- **Gap:** Fasilitas tanpa kamera fundus butuh alat skrining dari data klinis rutin.
- **Kontribusi:** Model DR dari survei nasional representatif; perbandingan LR vs XGB, DT, RF; SHAP.
- **Data:** KNHANES, Korea Selatan, 2008-2012 dan 2017-2021; 3.026 (671 DR = 22,2%)
- **Tahapan dan metode:**
  1. Preprocessing: Complete-case: hanya peserta tanpa missing pada variabel analisis
  2. Imbalance: Tidak ada; threshold Youden
  3. Seleksi fitur: RFECV 5-fold, 16 variabel
  4. Model: LR, XGBoost, DT, RF; RandomizedSearchCV / grid search
  5. Validasi: Split 8:2 (2.420 / 606); metrik: AUC (95% CI), Sensitivity, Specificity, Accuracy, PPV, NPV
- **Analisis hasil:** RF terbaik: AUC 0,748; Sens 0,669; Spec 0,729; Acc 0,715. LR 0,744; XGB 0,731; DT 0,651. Interpretasi: SHAP: HbA1c, gula puasa, durasi DM, BMI
- **Keterbatasan:** Stadium DR tidak tersedia; hanya populasi Korea; complete-case membuang data.
- **Kesimpulan:** Model ML dari data klinis cukup andal tanpa fundus dan bisa menjadi CDSS.
- **Relevansi untuk FP:** Tinggi: contoh jujur bahwa ML tidak selalu jauh lebih baik daripada LR.

## 5. Pan dkk. 2023: A risk prediction model for type 2 diabetes mellitus complicated with retinopathy based on machine learning and its application in health management

**Pan H, Sun J, Luo X, Ai H, Zeng J, Shi R, Zhang A** (2023). *Frontiers in Medicine, 10:1136653*. DOI [10.3389/fmed.2023.1136653](https://doi.org/10.3389/fmed.2023.1136653). Lisensi CC BY. PDF: [`papers/05_Pan2023.pdf`](papers/05_Pan2023.pdf)

- **Tujuan:** Membangun model risiko DR dengan indikator sesedikit mungkin untuk pasien T2DM di Tiongkok.
- **Gap:** Model DR yang ada memakai banyak indikator yang sebagian sulit diperoleh.
- **Kontribusi:** Seleksi fitur 4 metode dengan aturan voting (terpilih di >=3 metode); nomogram dan kalkulator web.
- **Data:** 6 komunitas di Yangpu dan Pudong, Shanghai, Tiongkok, Okt 2014 - Apr 2015; 2.385 (DR sekitar 20,5%); 23 kandidat faktor
- **Tahapan dan metode:**
  1. Preprocessing: Complete-case (pasien dengan data hilang atau abnormal dikeluarkan); normalisasi untuk LASSO
  2. Imbalance: Tidak ada
  3. Seleksi fitur: LASSO, RF-RFE, XGBoost, BPNN; prediktor akhir: HbA1c, durasi, gula 2 jam PP, usia, SBP, ACR
  4. Model: Regresi logistik Model I (6 prediktor) vs Model II (studi terdahulu)
  5. Validasi: Split 7:3; 10-fold CV untuk LASSO; metrik: AUC, Accuracy, Precision, Recall, F1, Balanced accuracy, kalibrasi, NRI
- **Analisis hasil:** AUC test Model I 0,679 = Model II 0,679; recall hanya 0,035; NRI 0,004 (CI melewati nol). Interpretasi: Nomogram dan persamaan regresi
- **Keterbatasan:** Cross-sectional, satu wilayah, tanpa faktor gaya hidup. Catatan reviewer: peningkatan praktis nihil dan recall sangat rendah akibat data tidak seimbang tidak ditangani.
- **Kesimpulan:** Model 6 variabel diklaim lebih baik dan berguna untuk skrining DR oleh dokter umum.
- **Relevansi untuk FP:** Sedang: teknik voting seleksi fitur bagus, tapi hasilnya contoh pentingnya menangani imbalance.

## 6. Kim S dkk. 2025: Development and Validation of a Machine Learning Algorithm for Predicting Diabetes Retinopathy in Patients With Type 2 Diabetes: Algorithm Development Study

**Kim S, Park J, Son Y, Lee H, Woo S, Lee M, Lee H, Sang H, Yon DK, Rhee SY** (2025). *JMIR Medical Informatics, 13:e58107*. DOI [10.2196/58107](https://doi.org/10.2196/58107). Lisensi CC BY 4.0. PDF: [`papers/06_Kim2025.pdf`](papers/06_Kim2025.pdf)

- **Tujuan:** Memprediksi DR dalam 3 tahun pada T2DM dari data EMR rutin.
- **Gap:** Kinerja model prediktif DR berbasis data klinis masih belum mapan; riset AI DR didominasi citra fundus.
- **Kontribusi:** Model tabular untuk layanan primer; dislipidemia dan kanker sebagai prediktor utama; validasi eksternal 2 RS.
- **Data:** EMR Korea 2008-2022: Kyung Hee University Medical Center (discovery), 2 RS lain (validasi); Discovery 14.694 (DR 2,37%); validasi 1.856 (DR 7,38%); 57 kandidat variabel
- **Tahapan dan metode:**
  1. Preprocessing: Pasien dengan data hilang dikeluarkan; nilai lab terakhir sebelum onset dirata-rata, juga variabilitas (SD)
  2. Imbalance: SMOTE
  3. Seleksi fitur: Ranking feature importance XGBoost (top 15)
  4. Model: AdaBoost, CatBoost, LightGBM, RF, XGBoost; GridSearchCV
  5. Validasi: Stratified 10-fold CV (internal) + validasi eksternal 2 RS; metrik: AUROC, Accuracy, Sensitivity, Specificity, Balanced accuracy, Precision, F1, AUPRC
- **Analisis hasil:** XGBoost: AUROC internal 0,824, eksternal 0,717; Acc 75,1% vs 65,1%. Interpretasi: Feature importance: dislipidemia, kanker, hipertensi, CKD, variabilitas HbA1c dan glukosa
- **Keterbatasan:** Satu etnis; DR dari kode ICD; stadium DR tidak dimodelkan; performa turun di data eksternal.
- **Kesimpulan:** XGBoost dapat memprediksi risiko DR 3 tahun dari data rutin, dengan penurunan performa di validasi eksternal.
- **Relevansi untuk FP:** Sedang: contoh validasi eksternal dan fitur variabilitas lab.

## 7. Liu XZ dkk. 2023: Predicting diabetic kidney disease for type 2 diabetes mellitus by machine learning in the real world: a multicenter retrospective study

**Liu XZ, Duan M, Huang HD, Zhang Y, Xiang TY, Niu WC, Zhou B, Wang HL, Zhang TT** (2023). *Frontiers in Endocrinology, 14:1184190*. DOI [10.3389/fendo.2023.1184190](https://doi.org/10.3389/fendo.2023.1184190). Lisensi CC BY. PDF: [`papers/07_Liu2023.pdf`](papers/07_Liu2023.pdf)

- **Tujuan:** Membangun model ML untuk diagnosis bantu DKD pada T2DM.
- **Gap:** Belum ada gold standard penilaian DKD selain biopsi; studi besar di populasi Tiongkok masih sedikit.
- **Kontribusi:** Klaim penggunaan pertama CatBoost untuk DKD; perbandingan 15 algoritma; model ringkas 12 fitur; SHAP.
- **Data:** Platform Yidu-Cloud, 7 institusi di Tiongkok (periode tertulis tidak konsisten antara abstrak dan metode); 3.624 (1.856 DKD / 1.768 non-DKD); 53 kandidat variabel
- **Tahapan dan metode:**
  1. Preprocessing: Pasien missing >25% dikeluarkan; sisa missing diimputasi MICE
  2. Imbalance: Tidak perlu (hampir seimbang)
  3. Seleksi fitur: LASSO 53 menjadi 38 fitur; model ringkas 12 fitur teratas SHAP
  4. Model: 15 algoritma via PyCaret; CatBoost dituning Bayesian optimization
  5. Validasi: Stratified split 80/20 + 10-fold CV; metrik: AUC, Accuracy, Sensitivity
- **Analisis hasil:** CatBoost: AUC 0,861; Acc 0,777 (38 fitur); 12 fitur AUC 0,840. Interpretasi: SHAP: tekanan sistolik, kreatinin, lama rawat, thrombin time, usia
- **Keterbatasan:** Indikator penting dengan missing tinggi dibuang (durasi DM, protein urin 24 jam); cross-sectional. Catatan reviewer: lama rawat inap berisiko bocor informasi (leakage).
- **Kesimpulan:** CatBoost efektif untuk diagnosis bantu DKD dini; perlu validasi prospektif.
- **Relevansi untuk FP:** Tinggi: contoh MICE + LASSO + SHAP pada data EHR multisenter.

## 8. Sabanayagam dkk. 2023: Prediction of diabetic kidney disease risk using machine learning models: a population-based cohort study of Asian adults

**Sabanayagam C, He F, Nusinovici S, Li J, Lim C, Tan G, Cheng CY** (2023). *eLife, 12:e81878*. DOI [10.7554/eLife.81878](https://doi.org/10.7554/eLife.81878). Lisensi CC BY 4.0. PDF: [`papers/08_Sabanayagam2023.pdf`](papers/08_Sabanayagam2023.pdf)

- **Tujuan:** Membandingkan model ML dan LR untuk prediksi insiden DKD 6 tahun dan mengidentifikasi prediktor kunci.
- **Gap:** Sedikit studi ML untuk insiden DKD; regresi konvensional mudah overfit pada banyak variabel; butuh biomarker baru.
- **Kontribusi:** ML + seleksi fitur mengungguli LR 7 faktor standar; metabolit sebagai calon faktor risiko baru.
- **Data:** Singapore Epidemiology of Eye Diseases (SEED), kohort populasi, Singapura, baseline 2004-2011; 1.365 (162 DKD = 11,9%); 339 fitur dalam 6 set fitur
- **Tahapan dan metode:**
  1. Preprocessing: Peserta missing >10% dikeluarkan; imputasi mean/modus
  2. Imbalance: Stratified sampling saja
  3. Seleksi fitur: RFE berbasis Elastic Net + importance RF/GBDT/XGB; akhir 15 fitur
  4. Model: LR, LASSO, EN, CART, RF, GBDT, XGBoost, SVM, NB
  5. Validasi: Stratified split 80/20 + 40 kali ulang 5-fold CV; metrik: AUC (95% CI), Sensitivity, Specificity
- **Analisis hasil:** Elastic Net 15 fitur: AUC 0,851 vs LR 7 fitur 0,795 (naik relatif 7%); LASSO 0,820; GBDT 0,819. Interpretasi: Usia, SBP, retinopati, eGFR rendah, HbA1c, metabolit lipid
- **Keterbatasan:** DKD dari satu kali pengukuran kreatinin; albuminuria dibuang karena missing; tanpa validasi eksternal.
- **Kesimpulan:** Elastic Net dengan metabolit terpilih mengungguli model klinis standar.
- **Relevansi untuk FP:** Sedang: metodologi validasi kuat (CV berulang), tapi fitur metabolit tidak tersedia di Zenodo.

## 9. Cai dkk. 2024: Clinical study of different prediction models in predicting diabetic nephropathy in patients with type 2 diabetes mellitus

**Cai SS, Zheng TY, Wang KY, Zhu HP** (2024). *World Journal of Diabetes, 15(1):43-52*. DOI [10.4239/wjd.v15.i1.43](https://doi.org/10.4239/wjd.v15.i1.43). Lisensi CC BY-NC 4.0. PDF: [`papers/09_Cai2024.pdf`](papers/09_Cai2024.pdf)

- **Tujuan:** Mengidentifikasi faktor DN pada T2DM dan membandingkan nomogram, decision tree, dan random forest.
- **Gap:** Sedikit studi yang membandingkan ketiga model untuk DN.
- **Kontribusi:** 5 prediktor independen; perbandingan 3 model.
- **Data:** First People's Hospital of Wenling, Tiongkok, Agu 2019 - Agu 2022; 210 (74 DN / 136 non-DN); train 147 / test 63
- **Tahapan dan metode:**
  1. Preprocessing: Hanya data lengkap; tidak ada detail lain
  2. Imbalance: Tidak ada
  3. Seleksi fitur: Uji univariat lalu LR multivariat: durasi DM, gula puasa, kreatinin, HbA1c, retinopati
  4. Model: Nomogram (LR), Decision Tree (rpart), Random Forest
  5. Validasi: Split acak 7:3; uji DeLong; metrik: Accuracy, Sensitivity, Specificity, Precision, AUC
- **Analisis hasil:** RF AUC 0,850 (Acc 0,730); nomogram AUC 0,811 (Acc 0,746); DT AUC 0,735. Interpretasi: Nomogram, aturan pohon, importance RF
- **Keterbatasan:** Retrospektif, satu RS, sampel kecil; keunggulan RF atas nomogram tidak signifikan.
- **Kesimpulan:** RF menunjukkan prediksi dan stabilitas yang baik untuk DN.
- **Relevansi untuk FP:** Sedang: baseline sederhana LR vs pohon.

## 10. Li T dkk. 2025: A machine learning model for predicting the risk of diabetic nephropathy in individuals with type 2 diabetes mellitus

**Li T, Chen J, Zhang X, Wang K, Zhao X, Cao Y, Xu Z, Wang S, Su P, He X, Yang Y, Cao X, Liang X, Ma D** (2025). *Frontiers in Endocrinology, 16:1587932*. DOI [10.3389/fendo.2025.1587932](https://doi.org/10.3389/fendo.2025.1587932). Lisensi CC BY. PDF: [`papers/10_Li2025.pdf`](papers/10_Li2025.pdf)

- **Tujuan:** Mengembangkan dan memvalidasi model ML risiko DKD, membandingkan 8 algoritma, dan membuat kalkulator online.
- **Gap:** Analisis komparatif banyak model ML untuk DKD pada T2DM belum dieksplorasi.
- **Kontribusi:** Perbandingan 8 model; XGBoost terbaik; kalkulator web; SHAP dan DCA.
- **Data:** Shijiazhuang Second Hospital, Tiongkok, Des 2017 - Des 2023; 10.057 (5.162 DKD / 4.895 non-DKD); 47 kandidat fitur
- **Tahapan dan metode:**
  1. Preprocessing: Tidak dilaporkan
  2. Imbalance: Tidak perlu (hampir seimbang)
  3. Seleksi fitur: LASSO 10-fold CV, 15 fitur
  4. Model: LR, RF, SVM, GNB, KNN, GBM, AdaBoost, XGBoost (tuning tidak dilaporkan)
  5. Validasi: 15% hold-out acak + split 7:3 + 10-fold CV; metrik: AUC, Accuracy, F1, Sensitivity, Specificity, Brier (XGBoost saja), DCA
- **Analisis hasil:** XGBoost AUC 0,932 (train) / 0,930 (validasi); RF 0,817; LR 0,675. Interpretasi: SHAP: mikroalbuminuria, retinopati, hipertensi, kreatinin, asam urat
- **Keterbatasan:** Tanpa data obat; data RS saja. Catatan reviewer: preprocessing tidak dilaporkan, 'validasi eksternal' berasal dari RS yang sama, dan CI AUC eksternal tidak cocok dengan nilainya.
- **Kesimpulan:** XGBoost paling akurat dan kalkulatornya praktis.
- **Relevansi untuk FP:** Sedang: sampel besar, tapi pelaporan lemah sehingga cocok sebagai bahan kritik.

## 11. Lin X dkk. 2025: A SuperLearner approach for predicting diabetic kidney disease upon the initial diagnosis of T2DM in hospital

**Lin X, Liu C, Wang H, Fan X, Li L, Xu J, Li C, Wang Y, Cai X, Peng X** (2025). *BMC Medical Informatics and Decision Making, 25:148*. DOI [10.1186/s12911-025-02977-x](https://doi.org/10.1186/s12911-025-02977-x). Lisensi CC BY 4.0. PDF: [`papers/11_Lin2025.pdf`](papers/11_Lin2025.pdf)

- **Tujuan:** Memprediksi DKD pada pasien yang baru didiagnosis T2DM dari data dunia nyata.
- **Gap:** Studi lama mengecualikan pasien tanpa eGFR awal (bias seleksi); belum ada model gabungan via SuperLearner; penanganan missing sering tidak dilaporkan.
- **Kontribusi:** Perbandingan model linear, non-linear, dan SuperLearner; SHAP tingkat pasien; calon penanda baru (leukosit, pH urin).
- **Data:** Ningbo Municipal Hospital of TCM, Tiongkok, 2011-2023; 3.291 (563 DKD = 17,1%); 74 menjadi 46 prediktor
- **Tahapan dan metode:**
  1. Preprocessing: Variabel missing >70% dibuang; pasien missing >30% dikeluarkan; MICE; outlier dibuang berdasarkan pertimbangan klinis
  2. Imbalance: Tidak ada
  3. Seleksi fitur: Tidak ada seleksi eksplisit (46 variabel)
  4. Model: MLR, LASSO, RF, XGBoost, SuperLearner; tuning via CV
  5. Validasi: Split 70/30 (2.303 / 988); metrik: AUC, Sensitivity, Specificity, PPV, NPV, likelihood ratio
- **Analisis hasil:** SuperLearner: AUC train 0,938, holdout 0,714; Sens 73,4%; Spec 59,1%. Interpretasi: SHAP: leukosit, neutrofil, hematokrit, hemoglobin, usia, HbA1c
- **Keterbatasan:** Satu RS, tidak ada data retinopati, follow-up pendek. Catatan reviewer: selisih AUC train dan holdout besar (overfitting).
- **Kesimpulan:** SuperLearner yang dijelaskan dengan SHAP bisa membantu deteksi dini DKD.
- **Relevansi untuk FP:** Tinggi: contoh pelaporan missing yang rapi (ambang 70%/30% + MICE) dan performa realistis.

## 12. Luo dkk. 2026: Development and internal validation of a machine-learning-based risk identification model for diabetic kidney disease in patients with type 2 diabetes

**Luo J, Chen G, Yang J** (2026). *Frontiers in Endocrinology, 17:1888060*. DOI [10.3389/fendo.2026.1888060](https://doi.org/10.3389/fendo.2026.1888060). Lisensi CC BY. PDF: [`papers/12_Luo2026.pdf`](papers/12_Luo2026.pdf)

- **Tujuan:** Membangun model non-invasif identifikasi risiko DKD dari indikator lab rutin.
- **Gap:** Kesadaran DKD rendah dan alat skrining dini kurang.
- **Kontribusi:** Model LR terinterpretasi dengan DCA, kalibrasi, dan SHAP dari lab rutin.
- **Data:** Sihui People's Hospital, Guangdong, Tiongkok, Jan 2023 - Jun 2024; 602 (457 T2DM / 145 DKD) dari 820 rekam medis; 19 indikator lab
- **Tahapan dan metode:**
  1. Preprocessing: Missing <5%: modus (kategorikal), mean (kontinu normal), KNN (numerik lain)
  2. Imbalance: Tidak ada (rasio sekitar 3:1)
  3. Seleksi fitur: LR univariat lalu multivariat: HbA1c, beta2-MG, protein urin, albumin, eGFR; VIF<5
  4. Model: LR, XGBoost, RF, AdaBoost, SVC, GNB
  5. Validasi: Split 8:2 + 5-fold CV; metrik: AUC, Accuracy, Sens, Spec, PPV, NPV, F1, Kappa, Brier, kalibrasi, DCA
- **Analisis hasil:** LR: AUC test 0,979; Sens 89,7%; Spec 92,4%. Interpretasi: SHAP: HbA1c, albumin, protein urin, eGFR, beta2-MG
- **Keterbatasan:** Satu RS, cross-sectional, tanpa durasi DM dan obat. Catatan reviewer: AUC sangat tinggi karena prediktor (protein urin, eGFR) bagian dari definisi DKD; RF AUC train 1,000.
- **Kesimpulan:** LR dengan indikator rutin andal untuk stratifikasi risiko DKD.
- **Relevansi untuk FP:** Sangat tinggi: panel lab hampir sama dengan Zenodo; langkah imputasi eksplisit.

## 13. Sun M dkk. 2025: Machine learning-based prediction of diabetic peripheral neuropathy: model development and clinical validation

**Sun M, Sun X, Wang F, Liu L** (2025). *Frontiers in Endocrinology, 16:1614657*. DOI [10.3389/fendo.2025.1614657](https://doi.org/10.3389/fendo.2025.1614657). Lisensi CC BY. PDF: [`papers/13_Sun2025.pdf`](papers/13_Sun2025.pdf)

- **Tujuan:** Membangun model ML prediksi risiko DPN dari data demografis, klinis, dan biokimia.
- **Gap:** Model DPN sebelumnya sering memakai satu algoritma, tanpa SHAP, dan jarang menjadi alat yang bisa dipakai.
- **Kontribusi:** Seleksi fitur Boruta + LASSO; 9 algoritma; SHAP; kalkulator web Shiny.
- **Data:** First Affiliated Hospital of Shandong First Medical University, Tiongkok, 2023-2024; 1.544 (529 DPN = 34,3%); 23 kandidat variabel
- **Tahapan dan metode:**
  1. Preprocessing: Multiple imputation (mice, 5 imputasi, PMM); semua variabel missing <30%
  2. Imbalance: Tidak ada (sengaja, untuk menjaga distribusi nyata)
  3. Seleksi fitur: Irisan Boruta dan LASSO, 8 fitur
  4. Model: LR, DT, RF, KNN, SVM, NB, XGB, SGBT, NNET; grid search
  5. Validasi: Split 70/30 + 10x10-fold CV di training; metrik: Accuracy, Sens, Spec, PPV, NPV, F1, Kappa, AUC, DCA
- **Analisis hasil:** SGBT AUC test 0,811 (train 0,933); XGB 0,810; LR 0,757. Interpretasi: SHAP: durasi DM, HbA1c, kreatinin, hipertensi, asam urat
- **Keterbatasan:** Retrospektif, satu RS perkotaan, tanpa gaya hidup/obat; ada gejala overfitting.
- **Kesimpulan:** Alat prediksi DPN yang andal; perlu validasi multisenter.
- **Relevansi untuk FP:** Tinggi: kombinasi MICE + Boruta/LASSO + banyak model + SHAP.

## 14. Wang L dkk. 2024: Establishment and external validation of an early warning model of diabetic peripheral neuropathy based on random forest and logistic regression

**Wang L, Li J, Lin Y, Yuan H, Fang Z, Fei A, Shen G, Jiang A** (2024). *BMC Endocrine Disorders, 24:196*. DOI [10.1186/s12902-024-01728-9](https://doi.org/10.1186/s12902-024-01728-9). Lisensi CC BY-NC-ND 4.0. PDF: [`papers/14_Wang2024.pdf`](papers/14_Wang2024.pdf)

- **Tujuan:** Mengidentifikasi faktor risiko DPN dan membangun model diagnosis dini.
- **Gap:** DPN sering tanpa gejala di awal; tes sensorik bergantung respons subjektif.
- **Kontribusi:** Nomogram LR 9 prediktor; perbandingan dengan RF; validasi eksternal di RS kedua.
- **Data:** 2 RS di Anhui, Tiongkok, Jan 2018 - Jun 2022; 1.806 (training 1.012, validasi internal 434, eksternal 360)
- **Tahapan dan metode:**
  1. Preprocessing: Pasien dengan data baseline hilang dikeluarkan; entri ganda oleh dua peneliti
  2. Imbalance: Tidak ada
  3. Seleksi fitur: Univariat lalu eliminasi mundur LR: kebas, nyeri tungkai, DR, DKD, protein urin, DBP, leukosit, HbA1c, HDL
  4. Model: LR (nomogram), RF (grid search + CV)
  5. Validasi: Split 7:3 + validasi eksternal RS kedua + 10-fold CV; metrik: AUC, kalibrasi, Hosmer-Lemeshow, Brier, DCA
- **Analisis hasil:** LR AUC eksternal 0,88; RF 0,88 (train 0,95). LR lebih terkalibrasi. Interpretasi: SHAP + nomogram: kebas tungkai, nyeri tungkai
- **Keterbatasan:** Retrospektif, tanpa analisis sensitivitas dan data obat. Catatan reviewer: label tabel tertukar; gejala klinis dominan sebagai prediktor.
- **Kesimpulan:** Nomogram bisa membantu diagnosis DPN; LR dipilih karena generalisasi lebih baik.
- **Relevansi untuk FP:** Sedang: salah satu dari sedikit studi dengan validasi eksternal.

## 15. Liu L dkk. 2024: Predictive model and risk analysis for peripheral vascular disease in type 2 diabetes mellitus patients using machine learning and shapley additive explanation

**Liu L, Bi B, Cao L, Gui M, Ju F** (2024). *Frontiers in Endocrinology, 15:1320335*. DOI [10.3389/fendo.2024.1320335](https://doi.org/10.3389/fendo.2024.1320335). Lisensi CC BY. PDF: [`papers/15_Liu2024.pdf`](papers/15_Liu2024.pdf)

- **Tujuan:** Membangun model ML risiko PVD pada T2DM dari EHR dan menganalisis faktornya dengan SHAP.
- **Gap:** Belum ada model ML khusus untuk PVD pada T2DM.
- **Kontribusi:** Pertama memakai beberapa algoritma ML untuk PVD pada T2DM; RFE + SMOTE; SHAP global dan individual.
- **Data:** EHR Second Affiliated Hospital of Hainan Medical University, Tiongkok, Jan 2021 - Mar 2023; 3.982 dianalisis (3.065 PVD / 917 non-PVD); 53 variabel masuk RFE
- **Tahapan dan metode:**
  1. Preprocessing: Indikator missing >25% dibuang; sampel missing >30% dikeluarkan; imputasi median dan MissForest; normalisasi
  2. Imbalance: SMOTE hanya pada data training
  3. Seleksi fitur: RFE berbasis RF, 12 prediktor
  4. Model: DT, LR, RF, SVM, XGBoost, AdaBoost; grid search 10-fold CV
  5. Validasi: Split 8:2 + 10-fold CV; metrik: Accuracy, Precision, Recall, F1, G-mean, AUC
- **Analisis hasil:** XGBoost AUC 0,945; Acc 0,890; AdaBoost 0,938; RF 0,935; LR 0,711. Interpretasi: SHAP: hemoglobin, usia, asam empedu total, lipoprotein(a)
- **Keterbatasan:** Satu RS, validasi internal; imputasi dan seleksi fitur dilakukan sebelum split (diakui penulis).
- **Kesimpulan:** Model ML PVD berperforma baik dan memberi gambaran faktor risiko.
- **Relevansi untuk FP:** Tinggi: contoh SMOTE yang benar (hanya training) dan metrik G-mean.

## 16. Wu Y dkk. 2024: Interpretable machine learning models for detecting peripheral neuropathy and lower extremity arterial disease in diabetics: an analysis of critical shared and unique risk factors

**Wu Y, Dong D, Zhu L, Luo Z, Liu Y, Xie X** (2024). *BMC Medical Informatics and Decision Making, 24:200*. DOI [10.1186/s12911-024-02595-z](https://doi.org/10.1186/s12911-024-02595-z). Lisensi CC BY 4.0. PDF: [`papers/16_Wu2024.pdf`](papers/16_Wu2024.pdf)

- **Tujuan:** Memprediksi DPN dan LEAD serta mengidentifikasi faktor risiko bersama dan khusus.
- **Gap:** Studi sebelumnya memodelkan satu komplikasi saja; diagnosis butuh alat khusus.
- **Kontribusi:** Model dari data rutin; 3 metode seleksi fitur dengan voting; tuning PSO; SHAP faktor bersama.
- **Data:** Tongji Hospital, Tiongkok, Jan 2022 - Mar 2023; 479 (DPN 44,9%; LEAD 14,4%); 38 kandidat fitur
- **Tahapan dan metode:**
  1. Preprocessing: Missing <30%: isi dengan pengukuran terakhir sebelumnya, sisanya median
  2. Imbalance: LEAD: random undersampling ke rasio 1:3
  3. Seleksi fitur: MI, RF-RFE, Boruta; fitur terpilih >=2 metode (DPN 12, LEAD 9)
  4. Model: LR, RF, XGBoost; tuning Particle Swarm Optimization
  5. Validasi: Split 80/20; tanpa CV; metrik: Recall, Specificity, Precision, Accuracy, F1, AUC
- **Analisis hasil:** DPN: XGBoost AUC 0,903. LEAD: RF AUC 0,923. Interpretasi: SHAP: ACR, HbA1c, kreatinin, usia, stenosis karotis sebagai faktor bersama
- **Keterbatasan:** Satu RS, sampel kecil, tanpa CV dan validasi eksternal (pengamatan reviewer).
- **Kesimpulan:** ML dapat memprediksi DPN dan LEAD dari data rutin; faktor bersama jadi target prioritas.
- **Relevansi untuk FP:** Tinggi: kerangka multi-komplikasi dan voting seleksi fitur, cocok untuk data komplikasi Zenodo.

## 17. Voskergian dkk. 2025: Engineering novel features for diabetes complication prediction using synthetic electronic health records

**Voskergian D, Bakir-Gungor B, Yousef M** (2025). *Frontiers in Genetics, 16:1451290*. DOI [10.3389/fgene.2025.1451290](https://doi.org/10.3389/fgene.2025.1451290). Lisensi CC BY. PDF: [`papers/17_Voskergian2025.pdf`](papers/17_Voskergian2025.pdf)

- **Tujuan:** Memprediksi 4 komplikasi diabetes dari EHR sintetis dengan feature engineering baru.
- **Gap:** Prediksi komplikasi kurang diteliti dibanding prediksi onset; studi lama memakai sedikit fitur dan populasi kecil.
- **Kontribusi:** Feature engineering pasangan [rentang usia, kode ICD] berbobot urutan kunjungan; perbandingan 5 model.
- **Data:** sEHR CAMDA 2023, sintetis dari data Sistem Kesehatan Andalusia, Spanyol; 324.575 rekam setelah preprocessing
- **Tahapan dan metode:**
  1. Preprocessing: JSON ke tabel; buang rekam kosong dan kunjungan sebelum diagnosis; cegah leakage; min-max scaling
  2. Imbalance: Random downsampling kelas negatif
  3. Seleksi fitur: Seleksi berbasis XGBoost (25-200 fitur)
  4. Model: DT, RF, XGBoost, AdaBoost, LogitBoost
  5. Validasi: Monte Carlo CV 90/10 + validasi terpartisi; metrik: Accuracy, Sensitivity, Specificity, Precision, F-measure, AUC
- **Analisis hasil:** XGBoost: retinopati AUC 0,84; jantung iskemik 0,84; CKD 0,77; amputasi 0,75. Interpretasi: Ranking importance RF/XGB: hipertensi, hiperlipidemia, artrosis
- **Keterbatasan:** Data sintetis, perlu validasi eksternal; data amputasi kecil; angka prevalensi tidak konsisten.
- **Kesimpulan:** XGBoost dan RF terbaik; feature engineering mengungguli bag-of-features.
- **Relevansi untuk FP:** Sedang: ide multi-target komplikasi dan pencegahan leakage.

## 18. Jabbar & Washington 2024: The Effect of Data Missingness on Machine Learning Predictions of Uncontrolled Diabetes Using All of Us Data

**Jabbar Z, Washington P** (2024). *BioMedInformatics, 4(1):780-795*. DOI [10.3390/biomedinformatics4010043](https://doi.org/10.3390/biomedinformatics4010043). Lisensi CC BY 3.0. PDF: [`papers/18_Jabbar2024.pdf`](papers/18_Jabbar2024.pdf)

- **Tujuan:** Menguji pengaruh metode imputasi terhadap prediksi diabetes pada data EHR dengan missing tinggi.
- **Gap:** Studi sebelumnya tidak menunjukkan perubahan performa terhadap jumlah fitur yang hilang.
- **Kontribusi:** Analisis performa dan fairness per tingkat missingness; perbandingan 6 strategi imputasi.
- **Data:** NIH All of Us Research Program, Amerika Serikat (diakses Jan 2024); 162.453 (56.655 positif); 47 fitur; missing hingga 65% (bikarbonat)
- **Tahapan dan metode:**
  1. Preprocessing: Dibandingkan: tanpa imputasi, auto-impute, konstanta, mean, median, multiple imputation (Bayesian Ridge)
  2. Imbalance: Random oversampling (dibandingkan)
  3. Seleksi fitur: Tidak ada
  4. Model: Auto-sklearn 2.0
  5. Validasi: Stratified split 80/20; metrik: AUROC, Balanced accuracy, F1, Precision, Recall, metrik fairness, uji heteroskedastisitas
- **Analisis hasil:** Performa turun seiring bertambahnya fitur hilang; imputasi meratakan penurunan tapi variansnya membesar (heteroskedastis). Interpretasi: Analisis per gender dan ras
- **Keterbatasan:** Performa belum siap klinis; anggaran pelatihan 3 jam; tanpa CV.
- **Kesimpulan:** Imputasi perlu, tapi menambah noise dan ketidakmerataan performa antar pasien.
- **Relevansi untuk FP:** Tinggi: dasar argumen pemilihan strategi imputasi untuk data klinis Zenodo.

## 19. Li Y dkk. 2025: Development and validation of a risk prediction model for painful diabetic peripheral neuropathy in type 2 diabetes mellitus: a multicenter retrospective study

**Li Y, Wang X, Hu H, Zhou X, Hu N, Liu W, Zhang Y, Mao P, Xu L, Zhu Q, Fan B, Li Y** (2025). *Frontiers in Endocrinology, 16:1651493*. DOI [10.3389/fendo.2025.1651493](https://doi.org/10.3389/fendo.2025.1651493). Lisensi CC BY. PDF: [`papers/19_Li2025.pdf`](papers/19_Li2025.pdf)

- **Tujuan:** Membangun model risiko DPN nyeri (PDPN) untuk layanan primer.
- **Gap:** Model PDPN yang ada kurang tergeneralisasi ke populasi Tiongkok dan tanpa validasi eksternal.
- **Kontribusi:** Data multisenter komunitas; regimen obat sebagai prediktor; nomogram web; SHAP.
- **Data:** 13 fasilitas kesehatan komunitas, Beijing, Tiongkok, Mei 2023 - Mar 2024; 1.984 (81 PDPN)
- **Tahapan dan metode:**
  1. Preprocessing: Missing ditangani dengan eksklusi (247 dibuang)
  2. Imbalance: SMOTE 200% pada kelas minoritas di data pengembangan
  3. Seleksi fitur: LASSO 10-fold CV aturan 1-SE, 10 prediktor
  4. Model: LR, RF, XGBoost, LightGBM, ANN, SVM; grid search repeated 5-fold CV
  5. Validasi: Test set independen (594) + bootstrap 1.000 kali; metrik: AUC-ROC, PR-AUC, Brier, G-mean, Sens, Spec, PPV, NPV, Balanced accuracy, MCC
- **Analisis hasil:** RF AUC 0,913 (PR-AUC 0,488); LR AUC 0,894 dengan sensitivitas dan balanced accuracy tertinggi (dipilih). Interpretasi: SHAP + nomogram: gangguan muskuloskeletal, HbA1c
- **Keterbatasan:** Cross-sectional, hanya Beijing, event sedikit (81), proporsi split tidak konsisten.
- **Kesimpulan:** LR sebagai nomogram web direkomendasikan untuk pra-skrining.
- **Relevansi untuk FP:** Tinggi: contoh metrik yang tepat untuk data tidak seimbang (PR-AUC, MCC, G-mean).

## 20. Li W dkk. 2024: Diabetes prediction model based on GA-XGBoost and stacking ensemble algorithm

**Li W, Peng Y, Peng K** (2024). *PLOS ONE, 19(9):e0311222*. DOI [10.1371/journal.pone.0311222](https://doi.org/10.1371/journal.pone.0311222). Lisensi CC BY 4.0. PDF: [`papers/20_Li2024.pdf`](papers/20_Li2024.pdf)

- **Tujuan:** Membangun model prediksi diabetes dengan stacking berbasis GA-XGBoost dan menjelaskannya dengan SHAP.
- **Gap:** Metode ML tradisional akurasinya rendah dan generalisasinya buruk.
- **Kontribusi:** Perbandingan 4 teknik resampling; GA untuk tuning XGBoost; stacking 2 lapis; SHAP.
- **Data:** BRFSS 2021 (Kaggle), Amerika Serikat; Angka jumlah data tidak konsisten di naskah; prevalensi diabetes 14,2%
- **Tahapan dan metode:**
  1. Preprocessing: Missing dihapus; recoding sesuai codebook
  2. Imbalance: ROS, ADASYN, SMOTE, SMOTEENN (terbaik)
  3. Seleksi fitur: Korelasi Pearson dan uji chi-square
  4. Model: XGBoost, AdaBoost, LightGBM, DT, LR, GA-XGBoost, Stacking
  5. Validasi: Split 80/20; 5-fold CV untuk stacking; metrik: Accuracy, Precision, Recall, F1, AUC
- **Analisis hasil:** XGBoost tanpa resampling AUC 0,828 (recall 17%); stacking setelah SMOTEENN AUC 0,989; Acc 94,9%. Interpretasi: SHAP: kesehatan umum, kolesterol tinggi, BMI
- **Keterbatasan:** Data survei Kaggle; parameter optimasi memakan waktu. Catatan reviewer: lonjakan AUC setelah SMOTEENN menunjukkan kemungkinan resampling sebelum split (leakage); angka dataset tidak konsisten.
- **Kesimpulan:** SMOTEENN paling efektif; stacking mengungguli model tunggal.
- **Relevansi untuk FP:** Sedang: perbandingan resampling berguna, tapi juga contoh kesalahan metodologis yang harus dihindari.

## 21. Wang Y dkk. 2023: Expanded feature space-based gradient boosting ensemble learning for risk prediction of type 2 diabetes complications

**Wang Y, Wang S, Sima X, Song Y, Cui S, Wang D** (2023). *Applied Soft Computing, 144:110451*. DOI [10.1016/j.asoc.2023.110451](https://doi.org/10.1016/j.asoc.2023.110451). Lisensi Langganan (non-OA). PDF: [`papers/21_Wang2023.pdf`](papers/21_Wang2023.pdf)

- **Tujuan:** Membangun model risiko komplikasi T2D (IFS-GBRTE: perluasan ruang fitur + ensemble gradient boosting regression tree).
- **Gap:** Fitur klinis terbatas; seleksi fitur hanya mengurangi dimensi tanpa menambah informasi; generalisasi lemah.
- **Kontribusi:** Ekspansi 46 fitur menjadi 8.326 fitur lewat 7 operator, seleksi Gini + greedy CV menjadi 200 fitur.
- **Data:** China National Clinical Medical Science Data Center, RS tersier Tiongkok; 5 tabel digabung per ID pasien (data Tiongkok); 7.541 kasus awal, 1.913 sampel akhir (452 komplikasi), 46 fitur
- **Tahapan dan metode:**
  1. Preprocessing: Fitur missing >80% dibuang; sisanya imputasi mean; one-hot nominal; fitur duplikat, teks, dan tak berkorelasi dengan target dibuang
  2. Imbalance: Tidak ada resampling; dievaluasi dengan sensitivity, specificity, G-mean
  3. Seleksi fitur: Ekspansi 7 operator (sum, diff, product, dst) lalu Gini importance CART + greedy 5-fold CV menjadi 200 fitur
  4. Model: IFS-GBRTE vs RF, GBRTE, AdaBoost, DT, SVM, KNN
  5. Validasi: 5-fold CV (tanpa validasi eksternal); metrik: Akurasi, sensitivity, specificity, G-mean
- **Analisis hasil:** Akurasi 82,49%, sensitivity 0,397, specificity 0,957, G-mean 0,614; GBRTE 79,25%, RF 79,61%, SVM sensitivity 0. Interpretasi: Tidak ada (fokus akurasi)
- **Keterbatasan:** Sensitivity hanya 0,40 sehingga banyak kasus komplikasi terlewat; imputasi mean; tanpa validasi eksternal; seleksi fitur harus dipastikan di dalam fold CV; dataset sama keluarga dengan paper no. 1
- **Kesimpulan:** Ekspansi ruang fitur menaikkan G-mean dibanding GBRTE biasa, tetapi sensitivitas masih rendah.
- **Relevansi untuk FP:** Sangat tinggi: dataset komplikasi T2D Tiongkok, lab tabular, banyak missing.

## 22. Ye S dkk. 2024: Interpretable prediction model for assessing diabetes complication risks in Chinese sufferers

**Ye S, Ye J, Ye X, Ni X** (2024). *Diabetes Research and Clinical Practice, 209:111560*. DOI [10.1016/j.diabres.2024.111560](https://doi.org/10.1016/j.diabres.2024.111560). Lisensi Langganan (non-OA). PDF: [`papers/22_Ye2024.pdf`](papers/22_Ye2024.pdf)

- **Tujuan:** Model ML interpretable untuk risiko 4 komplikasi (CHD, DN, DR, FLD) pasien diabetes Tiongkok.
- **Gap:** Studi lama memakai statistik tradisional; dataset yang sama hanya difokuskan ke DR/DN; model perlu akurat dan interpretable.
- **Kontribusi:** Pertama memprediksi CHD dan FLD pada dataset ini; SHAP global dan lokal.
- **Data:** National Population Health Data Center, PLA General Hospital (data Tiongkok); 3.000 pasien, 88 fitur; 2.923 setelah cleaning
- **Tahapan dan metode:**
  1. Preprocessing: Fitur >50% missing dibuang (74 fitur tersisa); sampel dengan >10% fitur missing dibuang; tanpa imputasi (complete-case)
  2. Imbalance: Tanpa resampling, class weight saja (positif 31,6% sampai 50,5%)
  3. Seleksi fitur: Tanpa seleksi eksplisit: semua 74 fitur dipakai
  4. Model: LR, DT, RF, CatBoost; tuning hyperparameter
  5. Validasi: 5-fold CV diulang 3 kali; metrik: AUC, akurasi, F1
- **Analisis hasil:** CatBoost terbaik, rata-rata AUC 90,47% (CHD 94,79; DN 90,63; DR 91,51; FLD 84,94). Interpretasi: SHAP: rasio albumin/kreatinin, kreatinin serum, HbA1c, CA199, BMI, TG
- **Keterbatasan:** Tipe diabetes tidak dibedakan; data statis; hanya populasi Tiongkok; tanpa validasi eksternal; komplikasi lain dipakai sebagai fitur (risiko sirkular untuk DR dan DN); tanpa CI
- **Kesimpulan:** CatBoost akurat dan dapat dijelaskan untuk empat komplikasi pada data tabular Tiongkok.
- **Relevansi untuk FP:** Sangat tinggi: tabular komplikasi RS Tiongkok termasuk retinopati.

## 23. Looareesuwan dkk. 2023: Retinopathy prediction in type 2 diabetes: Time-varying Cox proportional hazards and machine learning models

**Looareesuwan P, Boonmanunt S, Siriyotha S, Lukkunaprasit T, Thammasudjarit R, Pattanaprateep O, Nimitphong H, Reutrakul S, Attia J, McKay G, Thakkinstian A** (2023). *Informatics in Medicine Unlocked, 40:101285*. DOI [10.1016/j.imu.2023.101285](https://doi.org/10.1016/j.imu.2023.101285). Lisensi CC BY. PDF: [`papers/23_Looareesuwan2023.pdf`](papers/23_Looareesuwan2023.pdf)

- **Tujuan:** Membandingkan Cox time-varying dengan ML survival (LTRC-RRF, LTRC-CIF) untuk prediksi retinopati diabetik.
- **Gap:** Model DR ML sebelumnya klasifikasi biner tanpa time-to-event dan kovariat time-varying; CPH berasumsi linear.
- **Kontribusi:** Desain survival dengan kovariat time-varying dan MICE bertingkat per rumah sakit.
- **Data:** EHR Ramathibodi Hospital Bangkok 2010-2019 (Thailand); 48.622 T2D tanpa DR di baseline; 3.044 DR; split 70/15/15
- **Tahapan dan metode:**
  1. Preprocessing: Interval 6 bulan; missing 10-37% diimputasi multilevel MICE (cluster RS), 40 imputasi dirata-rata; standardisasi unit; kategorisasi fitur
  2. Imbalance: Tidak ditangani (outcome survival dengan censoring)
  3. Seleksi fitur: Univariat CPH (p<0,2) lalu stepwise (p<0,05) menjadi 13 variabel
  4. Model: CPH time-varying, LTRC-RRF, LTRC-CIF
  5. Validasi: Hold-out 15% (internal); metrik: Harrell C-index, integrated Brier score
- **Analisis hasil:** CPH C-index 0,697 (IBS 0,0275); LTRC-RRF 0,568; LTRC-CIF 0,509. Prediktor: insulin, CKD, kontrol glikemik buruk; SGLT2i protektif. Interpretasi: Hazard ratio (CPH); tanpa feature importance untuk ML
- **Keterbatasan:** Follow-up median 3 tahun; underdiagnosis DR; imputasi dirata-rata sehingga variansi imputasi hilang; tanpa validasi eksternal; preprocessing manual
- **Kesimpulan:** Model statistik sederhana mengalahkan ML survival pada data ini.
- **Relevansi untuk FP:** Sedang: populasi Thailand dan desain survival, tetapi contoh MICE bertingkat dan model sederhana vs ML.

## 24. Bernardini dkk. 2023: A novel missing data imputation approach based on clinical conditional Generative Adversarial Networks applied to EHR datasets

**Bernardini M, Doinychko A, Romeo L, Frontoni E, Amini MR** (2023). *Computers in Biology and Medicine, 163:107188*. DOI [10.1016/j.compbiomed.2023.107188](https://doi.org/10.1016/j.compbiomed.2023.107188). Lisensi Open access. PDF: [`papers/24_Bernardini2023.pdf`](papers/24_Bernardini2023.pdf)

- **Tujuan:** Imputasi missing data EHR dengan clinical conditional GAN (ccGAN) untuk prediksi retinopati diabetik.
- **Gap:** Imputer baseline (KNN, MissForest, MICE) univariat atau linear; GAN lama tidak memakai fitur lengkap sebagai kondisi.
- **Kontribusi:** ccGAN dikondisikan pada fitur lengkap; gain imputasi ~19,8% (masked MSE); diuji juga di MIMIC-III.
- **Data:** Multi-Center Diabetic dataset Italia; 37.574 pasien, 48 prediktor
- **Tahapan dan metode:**
  1. Preprocessing: 48 dari 60 prediktor dipilih diabetolog; pasien dengan fitur lengkap-wajib tak lengkap dibuang; impute fitur dengan missing 3-40%; fitur >80% missing diabaikan; asumsi MCAR
  2. Imbalance: Tanpa resampling; macro-F1 dan PR-AUC
  3. Seleksi fitur: Seleksi pakar (48 prediktor)
  4. Model: XGB, RF, DT, SVM, LR, KNN dengan imputer KNN, MissForest, MICE, GAIN, MisGAN, ccGAN
  5. Validasi: 10-fold CV, nested 5-fold grid search, Wilcoxon; metrik: PR-AUC, AUC, macro-F1, masked MSE
- **Analisis hasil:** RF + ccGAN PR-AUC 66,16 (AUC 82,67) vs MICE 65,53; XGB + ccGAN 65,20. Interpretasi: Impurity importance; mikroalbuminuria teratas
- **Keterbatasan:** Asumsi MCAR tidak realistis untuk lab klinis; gain prediktif kecil (0,6-1,6 poin PR-AUC); fitur missing tinggi tidak diimputasi; data Italia, tanpa validasi eksternal
- **Kesimpulan:** ccGAN sedikit lebih baik dari imputer lain, terutama untuk missing tinggi.
- **Relevansi untuk FP:** Tinggi: referensi skenario ujicoba imputasi untuk retinopati dengan missing tinggi.

## 25. Laoh dkk. 2026: A robust and trustable approach to incorporate medical domain knowledge in machine learning models for diabetic retinopathy screening using routine lab results

**Laoh E, Ahmad OB, Liu T** (2026). *Smart Health, 42:100724*. DOI [10.1016/j.smhl.2026.100724](https://doi.org/10.1016/j.smhl.2026.100724). Lisensi Langganan (non-OA). PDF: [`papers/25_Laoh2026.pdf`](papers/25_Laoh2026.pdf)

- **Tujuan:** Kerangka ML low-dimensional berbasis pengetahuan domain untuk skrining DR dari lab rutin EHR.
- **Gap:** Model AI kompleks sulit dipakai klinis; studi sebelumnya fokus performa atau interpretabilitas, belum divalidasi terhadap pengetahuan medis.
- **Kontribusi:** Metrik TF-RCR (text mining PubMed) dan adaptive RFE menghasilkan 8 fitur.
- **Data:** Oracle Health Real-World Data, RS di AS (pasien 18-65 th); 97.786 pasien, 24 kandidat lab/komorbid
- **Tahapan dan metode:**
  1. Preprocessing: Cleaning, merging; imputasi median dan scaling di-fit di training lalu diterapkan ke val/test
  2. Imbalance: SMOTE hanya di training (split level pasien 64/16/20); val dan test prevalensi asli
  3. Seleksi fitur: TF-RCR dari 13.002 artikel PubMed + RFE adaptif (batas 7 +/- 2) menjadi 8 fitur
  4. Model: XGBoost 8 fitur vs LR, XGB 24 fitur, MLP, FT-Transformer
  5. Validasi: Hold-out test 19.558 pasien + bootstrap 1000x (tanpa validasi eksternal); metrik: Akurasi, sensitivitas, spesifisitas, F1, AUROC, AUPRC
- **Analisis hasil:** Akurasi 95,35%, sensitivitas 91,17%, AUROC 97,24%, AUPRC 94,55%; XGB 24 fitur AUROC 0,9750. Interpretasi: SHAP global dan lokal (kreatinin, HbA1c, usia, hemoglobin)
- **Keterbatasan:** Perlu validasi eksternal; data cross-sectional; nefropati dan neuropati dipakai sebagai prediktor sehingga AUROC tinggi didorong komorbid; label kolom Tabel 3 tampak tertukar
- **Kesimpulan:** 8 fitur berbasis literatur setara dengan 24 fitur.
- **Relevansi untuk FP:** Sangat tinggi: skema leakage-safe dan seleksi fitur berbasis literatur untuk DR dari lab rutin.

## 26. Hong dkk. 2026: Development and validation of a risk prediction model for diabetic peripheral neuropathic pain in type 2 diabetes: A machine learning and statistical approach

**Hong H, Chen Y, Bao J, Ma J** (2026). *Diabetes Research and Clinical Practice, 235:113219*. DOI [10.1016/j.diabres.2026.113219](https://doi.org/10.1016/j.diabres.2026.113219). Lisensi Langganan (non-OA). PDF: [`papers/26_Hong2026.pdf`](papers/26_Hong2026.pdf)

- **Tujuan:** Faktor risiko independen, nomogram, dan SHAP untuk nyeri neuropatik perifer diabetik (DPNP).
- **Gap:** Diagnosis DPNP bergantung gejala/konduksi saraf; belum ada alat prediksi dini sederhana; peran AST kurang diteliti.
- **Kontribusi:** Nomogram 7 faktor + RCS non-linear + SHAP.
- **Data:** RS Afiliasi ke-4 Soochow University, Tiongkok, 2021-2024; 500 pasien T2D, 43 kandidat variabel
- **Tahapan dan metode:**
  1. Preprocessing: Complete-case (pasien tidak lengkap dikeluarkan, tanpa imputasi)
  2. Imbalance: Tanpa resampling; AUPRC dilaporkan
  3. Seleksi fitur: Univariat (p<0,05) lalu LASSO 10-fold lalu LR backward stepwise (7 variabel)
  4. Model: Regresi logistik (nomogram); SHAP
  5. Validasi: Random split 70/30 + bootstrap 1000x; metrik: AUC, AUPRC, kalibrasi, DCA
- **Analisis hasil:** AUC 0,863 (train) dan 0,813 (validasi); AUPRC 0,641/0,610; kalibrasi baik. Interpretasi: Nomogram + SHAP + RCS
- **Keterbatasan:** Single center, n validasi kecil (150, CI AUC 0,72-0,91); validasi internal; judul menyebut ML padahal inti pemodelan statistik; complete-case dapat bias seleksi
- **Kesimpulan:** Nomogram 7 faktor memberi diskriminasi memadai.
- **Relevansi untuk FP:** Sedang-tinggi: neuropati, lab tabular, pipeline statistik pembanding untuk ML.

## 27. Sun Y dkk. 2025: Stroke Management and Analysis Risk Tool (SMART): An interpretable clinical application for diabetes-related stroke prediction

**Sun Y, Li J, He H, Xing G, Liu Z, Meng Q, Xu M, Huang L, Pan Z, Liao J, Ji C** (2025). *Nutrition, Metabolism and Cardiovascular Diseases, 35(4):103841*. DOI [10.1016/j.numecd.2024.103841](https://doi.org/10.1016/j.numecd.2024.103841). Lisensi Langganan (non-OA). PDF: [`papers/27_Sun2025.pdf`](papers/27_Sun2025.pdf)

- **Tujuan:** Faktor risiko dan model prediksi stroke interpretable pada pasien diabetes + web tool SMART.
- **Gap:** Riset risiko stroke terkait diabetes kurang mendalam; model data-driven akurat tapi tidak interpretable.
- **Kontribusi:** 11 faktor risiko, perbandingan 5 ML + 2 DL, SHAP, platform web.
- **Data:** Nanjing Drum Tower Hospital 2021-2022 (data Tiongkok); 15.676 pasien (759 stroke), 37 variabel
- **Tahapan dan metode:**
  1. Preprocessing: Variabel missing >15% dibuang; MICE untuk sisanya (sensitivitas vs mean dan PMM); VIF
  2. Imbalance: SMOTE (downsampling mayoritas 0,9 dan upsampling minoritas 0,35)
  3. Seleksi fitur: Irisan LASSO, SVM-RFE, dan univariat+multivariat menjadi 11 fitur
  4. Model: SVM, RF, XGBoost, AdaBoost, KNN, DNN, ResNet-18
  5. Validasi: Split 8:2 + 10-fold CV; metrik: Akurasi, precision, recall, F1, AUC, MCC, DCA
- **Analisis hasil:** RF terbaik AUC 0,95 (recall stroke 0,71, MCC 0,81); XGBoost 0,94; DNN 0,91; ResNet-18 0,58. Interpretasi: SHAP: usia dan penyakit serebrovaskular teratas
- **Keterbatasan:** Single center; abstrak AUC 0,95 vs diskusi rata-rata 0,81; urutan SMOTE vs split tidak jelas dan precision stroke 0,94 mencurigakan; riwayat serebrovaskular berpotensi leakage; tanpa validasi eksternal
- **Kesimpulan:** RF dengan 11 fitur memprediksi stroke pada pasien diabetes.
- **Relevansi untuk FP:** Sedang: outcome stroke, tetapi contoh MICE + SMOTE + irisan seleksi fitur dan risiko leakage.

## 28. Aljenfawi dkk. 2026: Bayesian models to forecast complications and their severity in type 2 diabetes

**Aljenfawi H, Mohammed A, Alfailakawi M, Al-Mulla F, Hasan A** (2026). *Intelligence-Based Medicine, 15:100439*. DOI [10.1016/j.ibmed.2026.100439](https://doi.org/10.1016/j.ibmed.2026.100439). Lisensi CC BY. PDF: [`papers/28_Aljenfawi2026.pdf`](papers/28_Aljenfawi2026.pdf)

- **Tujuan:** Bayesian Network untuk onset dan progresi (severity 3 tingkat dari ICD-10) komplikasi ginjal dan oftalmik T2D.
- **Gap:** Model biner per komplikasi; black-box kurang transparan; SHAP tidak menjelaskan dependensi antar variabel.
- **Kontribusi:** Skala severity dari ICD-10; pendekatan Complications-as-Features; BN interpretable vs LR/RF/NB/SVM/XGBoost.
- **Data:** Dasman Diabetes Institute, Kuwait, 2011-2020; 2.969 pasien, 158.595 kunjungan, 78 fitur
- **Tahapan dan metode:**
  1. Preprocessing: Gabung per ID + timestamp, buang duplikat, standardisasi unit, filter implausibel; imputasi interpolasi linear, forward/backward fill, median pasien; diskretisasi equal-width
  2. Imbalance: SMOTE saat training; macro/weighted PR-AUC dan MCC
  3. Seleksi fitur: mRMR menjadi 8 fitur (GFR, HDL/LDL, HbA1c, BUN, dst)
  4. Model: Bayesian Network (PC, MLE) vs LR, RF, NB, SVM, XGBoost
  5. Validasi: Stratified 80/20, 100 trial, Mann-Whitney U; metrik: PR-AUC, MCC
- **Analisis hasil:** BN PR-AUC 72-74% (oftalmik), 73-83% (ginjal); RF ginjal PR-AUC 0,92 / MCC 0,81. Interpretasi: Struktur jaringan Bayes (dependensi antar variabel)
- **Keterbatasan:** Single center; struktur dipelajari dari seluruh data; split level kunjungan (bukan pasien) berisiko leakage; RF lebih baik dari BN; akurasi LR/SVM 0,94 hanya karena kelas mayoritas; fill maju/mundur memakai informasi masa depan
- **Kesimpulan:** BN interpretable, tetapi RF lebih akurat.
- **Relevansi untuk FP:** Tinggi: multi-komplikasi ginjal + oftalmik, imputasi longitudinal, contoh leakage.

## 29. Okere dkk. 2025: Evaluation of factors predicting transition from prediabetes to diabetes among patients residing in underserved communities in the United States - A machine learning approach

**Okere AN, Li T, Theran C, Nyasani E, Ali AA** (2025). *Computers in Biology and Medicine, 187:109824*. DOI [10.1016/j.compbiomed.2025.109824](https://doi.org/10.1016/j.compbiomed.2025.109824). Lisensi Langganan (non-OA). PDF: [`papers/29_Okere2025.pdf`](papers/29_Okere2025.pdf)

- **Tujuan:** Faktor transisi prediabetes ke diabetes di komunitas underserved AS (11 algoritma + SHAP).
- **Gap:** Studi ML sebelumnya tidak memakai data komunitas underserved.
- **Kontribusi:** 11 model, SHAP tunggal dan interaksi, faktor SDOH.
- **Data:** EHR Federally Qualified Health Center, AS Tenggara, 2012-2022; 1.910 pasien (426 progres)
- **Tahapan dan metode:**
  1. Preprocessing: One-hot, agregasi per tahun, Quantile Transformation, variabel missing >50% dibuang, MICE-RF (di-fit di training)
  2. Imbalance: SMOTE pada training (327 vs 1.201 menjadi 1.201 per kelas)
  3. Seleksi fitur: Pearson, VIF, step forward/backward, RFE, embedded menjadi 29 fitur
  4. Model: LR, SVC, KNN, NB, AdaBoost, DT, RF, GB, XGBoost, ExtraTrees
  5. Validasi: 80/20 + 10-fold CV; metrik: Akurasi, AUC
- **Analisis hasil:** RF akurasi 0,900, AUC 0,963 (ET 0,962; XGB 0,952; LR 0,927); akurasi 74% menjadi 90% setelah pemrosesan. Interpretasi: SHAP: time points, obat antidiabetik, dietary counseling, BMI, ras, asuransi
- **Keterbatasan:** Confusion matrix RF ~2.400 sampel (2 x 1.201) menandakan CV pada data yang sudah di-SMOTE (leakage, terlalu optimis); prediktor time points terkait definisi outcome; tanpa validasi eksternal
- **Kesimpulan:** RF terbaik, tetapi performa kemungkinan terinflasi.
- **Relevansi untuk FP:** Sedang: bukan komplikasi, tetapi contoh kuat leakage SMOTE-sebelum-CV.

## 30. Elgendy dkk. 2025: Dual-stage explainable ensemble learning model for diabetes diagnosis

**Elgendy IA, Hosny M, Albashrawi MA, Alsenan S** (2025). *Expert Systems with Applications, 274:126899*. DOI [10.1016/j.eswa.2025.126899](https://doi.org/10.1016/j.eswa.2025.126899). Lisensi Langganan (non-OA). PDF: [`papers/30_Elgendy2025.pdf`](papers/30_Elgendy2025.pdf)

- **Tujuan:** Stacking ensemble explainable untuk diagnosis diabetes dengan LOF + sparse autoencoder dan 4 strategi penanganan data.
- **Gap:** Voting sederhana; seleksi fitur membuang fitur klinis; penjelasan hanya di level fitur.
- **Kontribusi:** Rekonstruksi autoencoder, 4 strategi imputasi/penghapusan, stacking, XAI dua lapis.
- **Data:** MIMIC-IV dan Pima Indians Diabetes; 37.246 pasien (7.472 diabetes), 10 fitur; Pima 768
- **Tahapan dan metode:**
  1. Preprocessing: LOF (k=30) + sparse autoencoder; outlier dihapus/diimputasi KNN/mean/nol; SMOTE setelah pembersihan outlier
  2. Imbalance: SMOTE (dilakukan sebelum split)
  3. Seleksi fitur: Tanpa seleksi (semua fitur + SHAP)
  4. Model: 7 base (AdaBoost, GBoost, HistGB, ExtraTrees, CatBoost, XGBoost, KNN) + 4 meta (Bagging, RF, MLP, LR)
  5. Validasi: Hold-out 80/20, tanpa CV; metrik: Akurasi, F1, AUC
- **Analisis hasil:** Stacking MLP akurasi 92,54% (AUC 92,52) setelah outlier dihapus; KNN imputation 89,40%. Interpretasi: Feature importance + SHAP base ke meta
- **Keterbatasan:** Outlier removal dan SMOTE sebelum split (leakage); menghapus sampel sulit menaikkan akurasi sehingga tidak sebanding; hanya 10 fitur tanpa lab; gagal ginjal dipakai sebagai prediktor; populasi ICU; tanpa uji signifikansi
- **Kesimpulan:** Stacking MLP terbaik, namun urutan preprocessing meragukan.
- **Relevansi untuk FP:** Rendah-sedang: diagnosis dengan fitur minim, tetapi contoh kritis urutan preprocessing.

## 31. Chowdhury dkk. 2024: An investigation of machine learning algorithms and data augmentation techniques for diabetes diagnosis using class imbalanced BRFSS dataset

**Chowdhury MM, Ayon RS, Hossain MS** (2024). *Healthcare Analytics, 5:100297*. DOI [10.1016/j.health.2023.100297](https://doi.org/10.1016/j.health.2023.100297). Lisensi Open access. PDF: [`papers/31_Chowdhury2024.pdf`](papers/31_Chowdhury2024.pdf)

- **Tujuan:** Prediksi risiko diabetes dari BRFSS 2021 dengan membandingkan teknik sampling tanpa data leakage.
- **Gap:** Kelas diabetes minoritas membuat recall rendah; banyak studi menerapkan sampling pada seluruh data sehingga metrik terinflasi.
- **Kontribusi:** SMOTE-N, ENN, SMOTE-Tomek, SMOTE-ENN hanya pada data training.
- **Data:** BRFSS 2021 (survei CDC, AS); 262.958 x 21 setelah filter
- **Tahapan dan metode:**
  1. Preprocessing: Drop missing, stratified split 80/20 sebelum sampling, one-hot (92 kolom); tanpa imputasi
  2. Imbalance: SMOTE-N, ENN, SMOTE-Tomek, SMOTE-ENN pada training saja
  3. Seleksi fitur: 20 variabel dari literatur (tanpa seleksi formal)
  4. Model: LR, RF, Gradient Boosting, AdaBoost, soft voting; GridSearchCV
  5. Validasi: Hold-out 80/20 stratified; metrik: Precision, recall, akurasi, AUC
- **Analisis hasil:** ENN + GB terbaik: recall 0,717, AUC 0,791, akurasi 0,703; tanpa sampling recall 0,57-0,58. Interpretasi: Tidak ada
- **Keterbatasan:** Jumlah data Tabel 2 (313.913) dan Tabel 4 (262.958) berbeda; survei self-report; fitur nominal tanpa lab; tanpa CV dan uji signifikansi; AUC hampir tidak naik; threshold 0,5 tidak dioptimalkan sebagai alternatif
- **Kesimpulan:** ENN menaikkan recall 13-14 poin dengan akurasi turun.
- **Relevansi untuk FP:** Sedang: praktik benar sampling hanya di train + perbandingan 4 teknik.

## 32. Guo dkk. 2025: Towards an explainable machine learning model to reduce readmission risks for diabetes patients

**Guo C, Zhou H, Pires IM, Coelho PJ, Tong R, Farid F** (2025). *Informatics in Medicine Unlocked, 58:101686*. DOI [10.1016/j.imu.2025.101686](https://doi.org/10.1016/j.imu.2025.101686). Lisensi Open access. PDF: [`papers/32_Guo2025.pdf`](papers/32_Guo2025.pdf)

- **Tujuan:** Model ML explainable untuk prediksi readmisi pasien diabetes dan faktor risikonya.
- **Gap:** Dataset readmisi jarang menangani imbalance dan kurang interpretable.
- **Kontribusi:** Benchmark none/ROS/SMOTE/OSS/SMOTETomek/Bagging-RF; SHAP, PDP, permutation importance.
- **Data:** Diabetes 130-US hospitals 1999-2008; 99.492 x 41 setelah cleaning
- **Tahapan dan metode:**
  1. Preprocessing: Drop kolom >50% missing; baris missing dibuang; binning kategori diagnosis; MinMaxScaler; one-hot
  2. Imbalance: SMOTE, ROS, OSS, SMOTETomek, Bagging(RF); SMOTE di training
  3. Seleksi fitur: Variance, chi-square, ANOVA, MI, RFE (32 fitur untuk RF)
  4. Model: DT, LR, RF, XGBoost, AdaBoost, KNN, QDA
  5. Validasi: Split 80/20 stratified; 5/10-fold CV; metrik: Akurasi, precision
- **Analisis hasil:** Bagging RF akurasi 0,89, presisi 0,67; SMOTE menurunkan presisi RF 0,61 menjadi 0,44. Interpretasi: SHAP, PDP, 2D PDP, permutation importance
- **Keterbatasan:** Akurasi 0,89 hampir sama proporsi mayoritas (88,77%); recall tidak dilaporkan; klaim SMOTE meningkatkan recall tidak didukung tabel; tuning di test set; data 1999-2008; bukan komplikasi
- **Kesimpulan:** Bagging RF terbaik; SMOTE tidak selalu membantu.
- **Relevansi untuk FP:** Sedang: contoh akurasi menyesatkan pada data imbalance.

## 33. Shaheen dkk. 2024: Hi-Le and HiTCLe: Ensemble Learning Approaches for Early Diabetes Detection Using Deep Learning and Explainable Artificial Intelligence

**Shaheen I, Javaid N, Alrajeh N, Asim Y, Aslam S** (2024). *IEEE Access, 12:66516-66538*. DOI [10.1109/ACCESS.2024.3398198](https://doi.org/10.1109/ACCESS.2024.3398198). Lisensi Open access. PDF: [`papers/33_Shaheen2024.pdf`](papers/33_Shaheen2024.pdf)

- **Tujuan:** Ensemble deep learning (Highway + LeNet; blending dengan TCN) untuk deteksi dini diabetes pada data sangat imbalance.
- **Gap:** DL belum dioptimalkan pada data tabular diabetes imbalance dan sulit diinterpretasi.
- **Kontribusi:** Hi-Le dan HiTCLe, ProWSyn, SHAP, ablation.
- **Data:** Diabetes Prediction Dataset (Kaggle, agregasi EHR); 100.000 x 9 fitur
- **Tahapan dan metode:**
  1. Preprocessing: Factorize encoding; tanpa penanganan missing/outlier eksplisit
  2. Imbalance: ProWSyn oversampling (sebelum split)
  3. Seleksi fitur: Tidak ada (SHAP)
  4. Model: Highway, LeNet-5, TCN, Hi-Le, HiTCLe
  5. Validasi: Train/test + 10-fold CV; metrik: Akurasi, F1, precision, recall
- **Analisis hasil:** Hi-Le akurasi 94%, F1 96%; HiTCLe akurasi 94%; model tunggal 89-91%. Interpretasi: SHAP
- **Keterbatasan:** Dilatih dan diuji pada data hasil oversampling (sampel sintetis bocor ke test); HbA1c dan glukosa menentukan diagnosis (target leakage klinis); TCN untuk tabular tanpa dasar temporal; F1 96% > precision 94% dan recall 95% tidak konsisten; tanpa pembanding gradient boosting
- **Kesimpulan:** Hi-Le mencapai akurasi 94%, namun metrik terinflasi.
- **Relevansi untuk FP:** Rendah-sedang: contoh kritis leakage oversampling dan fitur penentu diagnosis.

## 34. Obaido dkk. 2024: An Improved Ensemble Method for Predicting Hyperchloremia in Adults With Diabetic Ketoacidosis

**Obaido G, Ogbuokiri B, Chukwu CW, Osaye FJ, Egbelowo OF, Uzochukwu MI, Mienye ID, Aruleba K, et al.** (2024). *IEEE Access, 12:9536-9549*. DOI [10.1109/ACCESS.2024.3351188](https://doi.org/10.1109/ACCESS.2024.3351188). Lisensi Open access. PDF: [`papers/34_Obaido2024.pdf`](papers/34_Obaido2024.pdf)

- **Tujuan:** Prediksi hyperchloremia pada pasien dewasa DKA dengan bagging + random subspace dan LIME.
- **Gap:** ML untuk hyperchloremia pada DKA terbatas dengan performa rendah.
- **Kontribusi:** Ensemble bagging random subspace, faktor risiko, LIME.
- **Data:** MIMIC-III (ICU, AS); 1.177 pasien DKA
- **Tahapan dan metode:**
  1. Preprocessing: Imputasi (metode tidak disebut), ekstraksi fitur berbasis korelasi dengan outcome, standardisasi
  2. Imbalance: SMOTE (dibandingkan dengan dan tanpa)
  3. Seleksi fitur: Korelasi dengan outcome + random subspace
  4. Model: SVM, KNN, LR, RF, XGBoost, Bagging + random subspace
  5. Validasi: 10-fold CV (tanpa hold-out); metrik: Akurasi, sensitivitas, spesifisitas, AUC
- **Analisis hasil:** Tanpa SMOTE akurasi 94%; dengan SMOTE Bagging akurasi 100%, AUC 100%. Interpretasi: LIME: klorida dan bikarbonat
- **Keterbatasan:** Akurasi/AUC 100% mencurigakan (SMOTE sebelum CV, seleksi fitur pada seluruh data); klorida admisi hampir tautologi dengan outcome; metode imputasi tidak disebut; satu dataset ICU
- **Kesimpulan:** Bagging random subspace dengan SMOTE mencapai 100%, tetapi hampir pasti terinflasi.
- **Relevansi untuk FP:** Rendah-sedang: komplikasi akut DKA di ICU; bahan kritik leakage SMOTE + CV.

## 35. Fazakis dkk. 2026: MAGA: A Controlled Minority-Class Generative-Augmentation Framework With Fairness-Aware Selection for Imbalanced Diabetes Tabular Classification

**Fazakis N, Kotsiantis S, Dimakopoulos Y** (2026). *IEEE Access, 14:68076-68094*. DOI [10.1109/ACCESS.2026.3689690](https://doi.org/10.1109/ACCESS.2026.3689690). Lisensi CC BY. PDF: [`papers/35_Fazakis2026.pdf`](papers/35_Fazakis2026.pdf)

- **Tujuan:** Membandingkan 6 oversampler klasik dengan 4 generator tabular pada diabetes imbalance, dengan kerangka MAGA.
- **Gap:** Evaluasi biasanya satu keluarga balancing tanpa penalti fairness; data sintetis perlu kontrol validitas.
- **Kontribusi:** Benchmark 720 kombinasi; MAGA (generasi minoritas, fidelity filter, threshold via J_VAL); Friedman dan Wilcoxon-Holm.
- **Data:** OpenML Pima dan subset NHANES; Pima 768; NHANES 2.000 x 16
- **Tahapan dan metode:**
  1. Preprocessing: Augmentasi hanya di training; threshold dituning di validation; NaN dengan KNN minoritas; clipping IQR; dedup
  2. Imbalance: SMOTE, ADASYN, Borderline, SVM-SMOTE, KMeans-SMOTE, Copula, TVAE, CTGAN, GREAT
  3. Seleksi fitur: Tidak ada
  4. Model: RF, LR, HistGB, DT, GNB, SVC
  5. Validasi: Train/val/test, 2 seed, tanpa CV; metrik: PR-AUC, F1, recall, J_VAL, EOD, DPD
- **Analisis hasil:** GREAT+MAGA PR-AUC 0,6374, recall 0,9063; SMOTE J_VAL tertinggi 0,6958; klasik vs generatif hampir sama (0,6226 vs 0,6225). Interpretasi: Tidak ada
- **Keterbatasan:** Hanya 2 seed dan satu split; dataset kecil dan bukan komplikasi; grup sensitif lemah; bobot J_VAL manual; GREAT mahal untuk selisih kecil dari SMOTE; tanpa validasi eksternal
- **Kesimpulan:** Generatif tidak jelas mengungguli SMOTE.
- **Relevansi untuk FP:** Sedang: praktik benar augmentasi hanya di train dan pembanding SMOTE vs generatif.

## 36. Gressler dkk. 2026: Multiparameter Machine-Learning-Based Diabetes Screening From Routine Laboratory Data in a Brazilian Hospital Cohort

**Gressler, Nascimento, Schultze, Souza** (2026). *IEEE Access, 14:41699-41711*. DOI [10.1109/ACCESS.2026.3673706](https://doi.org/10.1109/ACCESS.2026.3673706). Lisensi CC BY. PDF: [`papers/36_Gressler2026.pdf`](papers/36_Gressler2026.pdf)

- **Tujuan:** Membandingkan 6 classifier dan 3 strategi resampling untuk deteksi diabetes dari lab rutin dengan skenario GLU atau A1C.
- **Gap:** Model prediksi memakai sedikit parameter; bukti dari kohort RS nyata di sistem kesehatan underrepresented masih sedikit.
- **Kontribusi:** Kohort RS riil, dua skenario, SMOTE/ENN/SMOTE-ENN dengan CI 95% dan uji Holm, SHAP.
- **Data:** HU-Furg, Rio Grande, Brasil, 2020-2024; 3.535 dewasa (663 DM)
- **Tahapan dan metode:**
  1. Preprocessing: Complete case; outlier z-score di luar [-3,3] dibuang (426); LabelEncoder; MinMax
  2. Imbalance: SMOTE, ENN, SMOTE-ENN hanya di training
  3. Seleksi fitur: Berbasis korelasi EDA (set GLU atau A1C)
  4. Model: SVC, RF, DT, KNN, LR, GNB
  5. Validasi: Hold-out 80/20 (707 test), CI Wilson/bootstrap/Hanley-McNeil; metrik: Akurasi, precision, recall, specificity, F1, AUROC
- **Analisis hasil:** GLU: RF+ENN recall 93,98% [88,58-96,92], AUROC 0,954; A1C: RF+SMOTE recall 90,23%, AUROC 0,959. Interpretasi: SHAP: GLU/A1C, hipertensi, VLDL, TRI
- **Keterbatasan:** Outlier dibuang sebelum split dan membuang kasus ekstrem khas diabetes; GLU/A1C adalah kriteria diagnosis (leakage klinis); tuning dan operating point di test set; prevalensi 18,75% vs 23,08% tidak konsisten; satu pusat
- **Kesimpulan:** RF dengan resampling mencapai recall >90%, tetapi sebagian karena fitur diagnostik.
- **Relevansi untuk FP:** Sedang: fitur lab mirip Zenodo, pengaruh outlier removal, resampling train-only dengan CI.

## 37. Ramadhan dkk. 2024: Chronic Diseases Prediction Using Machine Learning With Data Preprocessing Handling: A Critical Review

**Ghaniaviyanto Ramadhan, Adiwijaya, Maharani, Akbar Gozali** (2024). *IEEE Access, 12:80698-80730*. DOI [10.1109/ACCESS.2024.3406748](https://doi.org/10.1109/ACCESS.2024.3406748). Lisensi Open access. PDF: [`papers/37_Ramadhan2024.pdf`](papers/37_Ramadhan2024.pdf)

- **Tujuan:** Memetakan studi prediksi penyakit kronis dengan ML beserta penanganan lima masalah data.
- **Gap:** Belum ada survei yang membahas prediksi penyakit kronis sekaligus kualitas datanya.
- **Kontribusi:** Peta metode ML dan penanganan masalah data 2020-2022; celah riset.
- **Data:** SLR: Scopus 2010-2022; 182 paper, 4 RQ
- **Tahapan dan metode:**
  1. Preprocessing: Review: missing (mean/median/KNN/hapus baris), outlier (IQR), normalisasi
  2. Imbalance: Review: SMOTE, ADASYN, ROS, SMOTE-Tomek, GAN, RUS, NearMiss
  3. Seleksi fitur: Review: filter, wrapper, embedded
  4. Model: Review (tidak ada model baru)
  5. Validasi: Data extraction form + quality assessment; metrik: Frekuensi studi
- **Analisis hasil:** Masalah data paling sering: imbalance > fitur > missing > outlier > normalisasi; sebagian studi balancing sebelum split. Interpretasi: Tidak ada
- **Keterbatasan:** Cakupan hanya sampai 2022; satu database; campur banyak penyakit; ada erratum; tanpa meta-analisis
- **Kesimpulan:** Penanganan data sering tidak dilaporkan lengkap.
- **Relevansi untuk FP:** Sedang-tinggi: kerangka SLR dan peta metode preprocessing.

## 38. Nayak dkk. 2024: Development of a machine learning-based model for the prediction and progression of diabetic kidney disease: A single centred retrospective study

**Nayak S, Amin A, Reghunath SR, Thunga G, Acharya LD, Shivashankara KN, Attur RP, Acharya S** (2024). *International Journal of Medical Informatics, 190:105546*. DOI [10.1016/j.ijmedinf.2024.105546](https://doi.org/10.1016/j.ijmedinf.2024.105546). Lisensi Open access. PDF: [`papers/38_Nayak2024.pdf`](papers/38_Nayak2024.pdf)

- **Tujuan:** Model ML untuk stadium dan progresi DKD (stadium 1-5) dan regresi eGFR.
- **Gap:** Model DKD sebelumnya fokus onset, bukan stadium dan progresi; kurang explainability.
- **Kontribusi:** Klasifikasi 5 stadium + regresi eGFR, optimasi Bayesian, SHAP dan LIME.
- **Data:** RS tersier India Selatan 2017-2022; 227 pasien, 93 variabel awal
- **Tahapan dan metode:**
  1. Preprocessing: Fitur missing >50% dibuang; eGFR/kreatinin dikeluarkan dari klasifikasi; imputasi median per-stadium (memakai label); scaling; one-hot
  2. Imbalance: SMOTETomek hanya pada training
  3. Seleksi fitur: RFE top 15/10 + VIF<5
  4. Model: SVM, RF, XGBoost (Bayesian tuning); regresi Linear, RF, GBR
  5. Validasi: Hold-out acak 80/20, tanpa CV; metrik: Akurasi, F1, kappa, AUC-PR, AUROC; R2, MAE, RMSE
- **Analisis hasil:** XGBoost akurasi 88,75%, AUC 0,97; RF 83,75%; SVM 66,25%; GBR eGFR R2 0,97. Interpretasi: SHAP dan LIME: urea, asam urat, fosfor, RBC
- **Keterbatasan:** Imputasi median per-stadium memakai label (target leakage) dan RFE sebelum split; n kecil dan test ~45 pasien sehingga spesifisitas 100% tidak bermakna; regresi eGFR memakai kreatinin (tautologi); progresi tidak dimodelkan longitudinal
- **Kesimpulan:** XGBoost terbaik untuk stadium DKD, dengan catatan leakage.
- **Relevansi untuk FP:** Sedang-tinggi: nefropati tabular dengan missing banyak; contoh pelanggaran urutan preprocessing.

## 39. Luong dkk. 2025: Comparison of Machine Learning Models to a Novel Score in the Identification of Patients at Low Risk for Diabetic Retinopathy

**Luong ML, Cheung T, McMurtry J, Nelson N, Najac M, Ortiz A, Aronoff D, Henderer J, Zhang X** (2025). *Ophthalmology Science, 5(1):100592*. DOI [10.1016/j.xops.2024.100592](https://doi.org/10.1016/j.xops.2024.100592). Lisensi Open access. PDF: [`papers/39_Luong2025.pdf`](papers/39_Luong2025.pdf)

- **Tujuan:** Prediktor sederhana pasien risiko rendah DR; bandingkan 5 model ML dengan skor RRS = HbA1c x lama diabetes.
- **Gap:** Model ML DR butuh banyak variabel dan aplikasi; skrining tahunan semua pasien mahal.
- **Kontribusi:** RRS yang mudah dihitung; perbandingan dengan 5 MLM (uji DeLong).
- **Data:** EMR Temple University Health System, telemedis retina 2016-2020; 1.590 subjek evaluable, 30 fitur awal
- **Tahapan dan metode:**
  1. Preprocessing: Missing >50% dibuang; near-zero variance; korelasi r>0,85; MICE (PMM) pada seluruh data sebelum split
  2. Imbalance: Tidak ditangani; split stratified 2/3 : 1/3
  3. Seleksi fitur: Univariat (P<0,1) menjadi 16 variabel
  4. Model: LR, SVM-RBF, RPART, RF, GBM
  5. Validasi: 10-fold CV di train + test 540 (internal); metrik: AUC (DeLong), sensitivitas, spesifisitas, error rate low-risk
- **Analisis hasil:** Test AUC GBM 0,786, RF 0,774, LR 0,750, RRS 0,733 (RRS tidak beda signifikan dari 4 dari 5 MLM). Interpretasi: Skor sederhana RRS
- **Keterbatasan:** MICE dan seleksi fitur memakai seluruh data termasuk test; threshold RRS dioptimalkan di train tetapi threshold MLM di test; pasien duplikat antar kunjungan; durasi DM 33% imputasi dari kuesioner; AUC hanya 0,73-0,79 dengan spesifisitas rendah
- **Kesimpulan:** Skor sederhana setara ML untuk identifikasi risiko rendah.
- **Relevansi untuk FP:** Tinggi: data tabular retinopati; model sederhana vs ML; contoh imputasi sebelum split.

## 40. Wen dkk. 2025: Interpretable Machine Learning Model for Predicting and Assessing the Risk of Diabetic Nephropathy: Prediction Model Study

**Wen Y, Wan C, Ren Y, Wang X, Wang W** (2025). *JMIR Medical Informatics, 13:e64979*. DOI [10.2196/64979](https://doi.org/10.2196/64979). Lisensi Open access. PDF: [`papers/40_Wen2025.pdf`](papers/40_Wen2025.pdf)

- **Tujuan:** Model ML interpretable untuk prediksi diabetic nephropathy (DN) pada T2DM dengan LIME dan SHAP.
- **Gap:** Diagnosis DN kurang sensitif untuk deteksi dini; model ML sulit diinterpretasi.
- **Kontribusi:** Perbandingan 6 model tree/boosting, LASSO, ROC + PR + DCA + kalibrasi, LIME dan SHAP.
- **Data:** Diabetes Complications Dataset, National Population Health Data Center (Tiongkok), sejenis paper no. 1; 1.000 pasien T2DM, 87 fitur
- **Tahapan dan metode:**
  1. Preprocessing: Fitur missing >75% dibuang; multiple imputation iteratif; tanpa normalisasi
  2. Imbalance: SMOTE walau rasio 4:5
  3. Seleksi fitur: Uji univariat (P<0,001) + LASSO menjadi 24 fitur
  4. Model: DT, RF, Extra Trees, AdaBoost, XGBoost, LightGBM; grid search
  5. Validasi: 10-fold CV (tanpa hold-out dan validasi eksternal); metrik: Akurasi, precision, recall, F1, specificity, AUC, PR-AUC, DCA, kalibrasi
- **Analisis hasil:** XGBoost akurasi 86,87%, recall 84,40%, AUC 0,93; LightGBM 86,78%. Interpretasi: SHAP dan LIME: rasio albumin-kreatinin, kreatinin, albumin
- **Keterbatasan:** Renal_Failure dan rasio albumin-kreatinin adalah penanda yang mendefinisikan DN (leakage klinis); retinopati dipakai sebagai prediktor; SMOTE tidak diperlukan dan urutannya terhadap CV tidak jelas; imputasi sebelum CV; satu dataset tanpa validasi eksternal
- **Kesimpulan:** XGBoost dan LightGBM terbaik untuk DN.
- **Relevansi untuk FP:** Sangat tinggi: dataset China jenis sama dengan paper no. 1 dan mirip Zenodo (panel lab, banyak missing).
