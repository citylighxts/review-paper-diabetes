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
