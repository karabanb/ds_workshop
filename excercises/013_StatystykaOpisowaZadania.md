
<br/>

## Rogrzewka

### Zadanie 0

- Z niniejszego repozytorium utwórz nowy projekt w RStudio.
- W lokalnym repozytorium w folderze `/excercises` utwórz folder ze swoim imieniem, następnie utwórz 
w nim plik `013_StatystykaOpisowaOdpTwojeImie.R`
- Zakommituj wprowadzone zmiany i spushuj je do nieniejszego zdalnego repozytorium.

Do utworzonych przez Was folderów od tego momentu będziecie pushować wasze rozwiązania zadań (chyba, 
że specyfika zadania będzie wymagać innego rozwiązania).

<br/>

## Miary zmienności (rozproszenia)

Rozwiązania zadań umieść w pliku '013_StatystykaOpisowaOdpTwojeImie.R'. Finalną wersję pliku spushuj
do zdalnego repozytorium do folderu `/excercises/TwojeImie`

<br/>

### Zadanie 1

- Zapoznaj się z częścią dokementacji funkcji `rnorm` (Description, Usage, Arguments), służącej do 
generowania obserwacji, których rozkład jest normalny.
- wygeneruj 3 wektory wartości o rozkładzie normalnym o następujących parametrach: 

| liczba obserwacji | odch. stand.  | średnia |
| ------------------|:-------------:| -------:|
| 1000              | 1             | 0       |
| 1000              | 2             | 0       |
| 1000              | 3             | 0       |

wektory zapisz do zmiennych: `norm_sd1`, `norm_sd2`, `norm_sd3`.

- Dla każdego z wektorów, oblicz wszytskie poznane przez Ciebie miary zmienności. 
- Podaj wnioski nasuwające się z interpretacji obliczonych współczynników zmienności.
- Wykonaj jeden wykres, na którym znajdują się trzy rozkłady dla zmiennych `norm_sd1`, `norm_sd2`, `norm_sd3`.
- Wykonaj jeden wykres, na którym znajduję się trzy box-ploty dla zmiennych `norm_sd1`, `norm_sd2`, `norm_sd3`.

<br/>

### Zadanie 2

- Zapoznaj się z regułą ['Trzech sigm'](http://www.naukowiec.org/wiedza/statystyka/regula-trzech-sigm_709.html).
- Zasymuluj dane pomiaru ilozrazu intelgencji w skali Wechslera. Wektory o rozkładzie normalnym powinny
mieć następujące parametry:

| liczba obserwacji | odch. stand.  | średnia |
| ------------------|:-------------:| -------:|
| 100               | 15            | 100     |
| 10000             | 15            | 100     |
| 1000000           | 15            | 100     |

wektory zapisz do zmiennych: `iq_n100`, `iq_n10000`, `iq_n1000000`

- Sprawdź czy i jak sprawdza się reguła trzech sigm na zasymulowanych danych dla każdego z wektorów.
- Sprawdź jak kształtuje się wartość: 10 percentyla, 1 kwartyla, 3 kwartyla i 90 percentyla dla każdego z wektorów.
Porównaj uzyskane wyniki z wartościami z [tabeli](http://www.iqsociety.org/general/IQchart.pdf) dla skali Wechslera. Czy można zauważyć jakąś prawidłowość?
- Sprawdź na wektorze `iq_n1000000` jaki procent obserwacji ma: iq < 80, iq < 100, iq < 115 i iq > 140
- Umieść wykresy gęstości (rozkłady) wszytskich trzech wektorów na jednym wykresie (sugerowane użycie funkcji `ggplot2::geom_density()`). Co możesz zauważyć?

<br/>

### Zadanie 3

- Zapoznaj się ze zbiorem `iris` z pakietu bazowego R.
- Sprawdź która cecha charakteryzuje się największą zmiennością.
- Sprawdź dla każdej cechy, który gatunek charakteryzuje się największą zmiennością.

<br/>

## Statystyka Opisowa - Podsumowanie

### Projekt

Załóż konto na [www.rpubs.com](http://www.rpubs.com)

Dysponując danymi transakcyjnymi z portalu aukcyjnego [allegro](https://allegro.pl) wykonaj analizę 
danych pod kątem poznanych statystyk opisowych:

- miar położenia,
- miar zmienności,
- miar asymetrii,
- miar koncentracji,
- korelacji.

Na podstawie uzyskanych wyników stwórz raport w [Rmakrdown](https://rmarkdown.rstudio.com/) i z 
poziomu Rstudio opublikuj go na [www.rpubs.com](http://www.rpubs.com).

<br/>






