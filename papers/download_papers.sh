#!/usr/bin/env bash
# Unduh 20 PDF paper open access ke folder papers/.
set -u
cd "$(dirname "$0")"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"
ok=0; fail=0
get() {
  local file="$1" url="$2"
  if [ -s "$file" ] && head -c 4 "$file" | grep -q "%PDF"; then echo "ada  $file"; ok=$((ok+1)); return; fi
  curl -sSL -A "$UA" --max-time 120 -o "$file.tmp" "$url"
  if head -c 4 "$file.tmp" 2>/dev/null | grep -q "%PDF"; then mv "$file.tmp" "$file"; echo "OK   $file"; ok=$((ok+1));
  else rm -f "$file.tmp"; echo "GAGAL $file  ->  unduh manual: $url"; fail=$((fail+1)); fi
}
get "01_Wang2024.pdf" "https://www.nature.com/articles/s41598-024-75898-w.pdf"
get "02_Li2024.pdf" "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2024.1429974/pdf"
get "03_Liu2025.pdf" "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2025.1631647/pdf"
get "04_Kim2025.pdf" "https://www.frontiersin.org/journals/medicine/articles/10.3389/fmed.2025.1542860/pdf"
get "05_Pan2023.pdf" "https://www.frontiersin.org/journals/medicine/articles/10.3389/fmed.2023.1136653/pdf"
get "06_Kim2025.pdf" "https://medinform.jmir.org/2025/1/e58107/PDF"
get "07_Liu2023.pdf" "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2023.1184190/pdf"
get "08_Sabanayagam2023.pdf" "https://cdn.elifesciences.org/articles/81878/elife-81878-v3.pdf"
get "09_Cai2024.pdf" "https://www.wjgnet.com/1948-9358/full/v15/i1/43.htm"
get "10_Li2025.pdf" "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2025.1587932/pdf"
get "11_Lin2025.pdf" "https://bmcmedinformdecismak.biomedcentral.com/counter/pdf/10.1186/s12911-025-02977-x.pdf"
get "12_Luo2026.pdf" "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2026.1888060/pdf"
get "13_Sun2025.pdf" "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2025.1614657/pdf"
get "14_Wang2024.pdf" "https://bmcendocrdisord.biomedcentral.com/counter/pdf/10.1186/s12902-024-01728-9.pdf"
get "15_Liu2024.pdf" "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2024.1320335/pdf"
get "16_Wu2024.pdf" "https://bmcmedinformdecismak.biomedcentral.com/counter/pdf/10.1186/s12911-024-02595-z.pdf"
get "17_Voskergian2025.pdf" "https://www.frontiersin.org/journals/genetics/articles/10.3389/fgene.2025.1451290/pdf"
get "18_Jabbar2024.pdf" "https://www.mdpi.com/2673-7426/4/1/43/pdf"
get "19_Li2025.pdf" "https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2025.1651493/pdf"
get "20_Li2024.pdf" "https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0311222&type=printable"
echo "Selesai: $ok berhasil, $fail perlu unduh manual."
