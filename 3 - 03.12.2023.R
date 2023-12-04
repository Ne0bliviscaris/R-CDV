### Zajęcia.03 #######################################################################


### Pętle

• Pętle umożliwiają wielokrotne wykonywanie tego samego wyrażenia (choć zapewne na różnych obiektach). W programie R mamy do dyspozycji pętle while, repeat i for.

• Składnia pętli while jest następująca:
  
  while (warunek) wyrazenie

• Zadaniem pętli while jest obliczanie wyrazenia dopóty, dopóki warunek jest spełniony.

i <- 1

while (i <= 3) {
  print(i)
  i <- i + 1
}



• Wykonywanie całej pętli (i tylko pętli) można przerwać w dowolnym momencie za pomocą wyrażenia break.

i <- 1
while (i <= 3) {
  print(i)
  if (i >= 2) break
  i <- i + 1
}

• Natomiast wywołanie wyrażenia next zleca natychmiastowe zakończenie aktualnej iteracji pętli. 	
Dokładniej ewaluacji samego wyrazenia, i przejście do kolejnej iteracji, która zawsze zaczyna 
się od sprawdzenia warunku testowego.

i <- 1
while (i <= 3) {
  i <- i + 1
  if (i %% 2) next
  print(i)
}

• Pętla repeat zachowuje się tak jak while z warunkiem testowym na stałe ustawionym na TRUE. 
Zatem należy zawsze pamiętać o wywołaniu break (lub return() wewnątrz funkcji), o ile chcemy doczekać wyniku.

i <- 0
repeat {
  i <- i + 1
  print(i)
  if (i == 3) break
}

• Pętla for jest chyba najczęściej stosowaną pętlą w programie R. Szczególnie nadaje się ona do "przechodzenia" 
po elementach wektora atomowego lub listy bądź też wykonywania ciągu wyrażeń zadaną liczbę razy. 
Jej składnia jest następująca:
  
  for (nazwa in wektor) wyrazenie

W pętli for każdą kolejną (od pierwszej do ostatniej) wartość wektora związujemy z podaną nazwą i obliczamy wyrażenie. 
Pętla ta wykonuje się zawsze dokładnie length(wektor) razy, o ile nie użyte zostało wyrażenie break lub funkcja return().

print(1)
print(2)
print(3)

for (i in 1:3) print(i)


v <- c("Ala", "Ola", "Marta", "Zosia")

for (i in v) print(i)





#	Zadanie 15. Oblicz iloczyn elementów dowolnego wektora x za pomocą pętli while, repeat i for (każdej z osobna).	
### btw istnieje funkcja wbudowana dla tego problemu prod(1:5) 


prod(1:5)
1*2*3*4*5

#while
i=1
wynik=1
while (i <= 5){
  wynik=wynik*i
  i <- i+1
  
}
print(wynik)

#repeat
i<-0
repeat {
  i <- i+1
  wynik <- i*i
  if (i == 5) break
}
print(wynik)





### Brak danych i czyszczenia danych

# systemowy brak danych reprezentowany jest symbolem NA (ang. not available)
# wartości niemożliwe do obliczenia (jak np. dzielenie przez zero) oznaczane są symbolem NaN (ang. not a number)
# oprócz tego istnieje również brak danych użytkownika tj. są to wszystkie wartości, które wybrał użytkownik do reprezentacji braków daNych

# lokalizacja brakujących wartości  (is.na)
# https://www.rdocumentation.org/packages/ursa/versions/3.9.4/topics/is.na

is.na(x) # zwraca wartość TRUE jeżeli x jest NA
y <- c(1,2,3,NA)
is.na(y) # zwraca wektor (F F F T)

# zastąpienie braku danych użytkownika (99) brakiem danych systemowych

v1 <- c(1,2,3,99)
v1[v1==99] <- NA

# wykluczenie brakujących danych z analizy 
# odbywa się przy pomocy polecenia, na.rm=TRUE
# tj. postaci ogólnej  function(vector,na.rm=TRUE)
# https://www.geeksforgeeks.org/how-to-use-na-rm-in-r/

x <- c(1,2,NA,3)
mean(x) # zwraca NA
mean(x, na.rm=TRUE) # zwraca 2                 





# zwrócenie liczby kompletnych wierszy (complete.cases)
# https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/complete.cases

x=data.frame(a=c(2,3,5,8),b=c(3,8,NA,5),c=c(10,4,6,11))
x
complete.cases(x)
as.numeric(complete.cases(x))	
sum(as.numeric(complete.cases(x)))
x[complete.cases(x),]             #wybiera tylko kompletne wiersze
x[!complete.cases(x),]            #sprawdza, które wiersze są niekompletne

# zwrócenie danych z wyłączeniem braków (na.omit) 
# https://www.geeksforgeeks.org/remove-unnecessary-values-from-an-object-in-r-programming-na-omit-function/

na.omit(x)



# Zadanie.16
#
# Użyj poleceń colMeans(), rowMeans(), colSums() i rowSums() na ramce danych x 
#	tak, aby zwróciły prawidłowe wyniki dla wszystkich wierszy lub kolumn.
# Oblicz sumę wszystkich elementów ramki. 

colMeans(x, na.rm = TRUE)
rowMeans(x, na.rm = TRUE)
colSums(x, na.rm = TRUE)
rowSums(x, na.rm = TRUE)
sum(x, na.rm = TRUE)





# Zadanie.17

#
# Użyj zbioru airquality. Odpowiedz na pytania: 	
#  c) ile jest przypadków w zbiorze
#  d) ile jest przypadków z brakami danych
#  a) ile, i jakich, jest zmiennych w zbiorze
#  b) ile, i jakich, jest zmiennych z brakami danych

#zadanie domowe
airquality
# a) ile jest przypadków w zbiorze
cat("Przypadków w zbiorze jest łącznie: ", nrow(airquality),".")
# b) ile jest przypadków z brakami danych
cat("Przypadków", sum(is.na.data.frame(airquality)))
# c) ile, i jakich, jest zmiennych w zbiorze
cat("Łącznie zmiennych jest: ", ncol(airquality), ". Ich nazwy to: ", colnames(airquality), ".")
# d) ile, i jakich, jest zmiennych z brakami danych
col=1
df <- data.frame(colnames(airquality))
while (col <= length(airquality)) {
  df[col,2] <- sum(is.na(airquality[col]))
  col <- col + 1
}

d <- capture.output(print(df[df$V2 !=0, ]))
cat("\nZmiennych z brakami danych jest: ", length(df[df$V2 !=0]),
    "\n\n Tabela zmiennych i ich braków:\n\n", d)



#z zajęć
# Użyj zbioru airquality. Odpowiedz na pytania: 	
#  c) ile jest przypadków w zbiorze
#  d) ile jest przypadków z brakami danych
#  a) ile, i jakich, jest zmiennych w zbiorze
#  b) ile, i jakich, jest zmiennych z brakami danych
airquality

dim(airquality)
str(airquality)
nrow(airquality)
nrow(airquality[complete.cases(airquality),]) #  c) ile jest przypadków w zbiorze
nrow(airquality[!complete.cases(airquality),]) #  d) ile jest przypadków z brakami danych
sum(is.na(airquality$Ozone)) # liczba przypadków z zmiennej Ozone
sum(is.na(airquality$Solar.R)) # liczba przypadków z zmiennej Solar.R

which(is.na(airquality$Ozone)) # przypadki w danej kolumnie
which(is.na(airquality$Solar.R)) # przypadki w danej kolumnie

apply(is.na(airquality), 2, which) # przypadki w każdej kolumnie po kolei

ncol(airquality)
colnames(airquality)
colnames(airquality)[colSums(is.na(airquality)) > 0]


























































### Wstępna eksploracja danych

# wczytajmy zbiór danych z tej strony
link <- "http://members.upcpoczta.pl/t.pytlak/access/pracownicy.txt"


df <- read.table(link, header = TRUE, sep = "\t", dec = ",")	
print(df)
View(df)
Sys.setlocale("LC_CTYPE", "polish")     

df <- read.csv(url(link))
df <- read.csv(url(link), sep="\t")
df <- read.csv(url(link), sep="\t", fileEncoding="ISO-8859-2") # ew. kodowanie
df <- read.csv(url(link), sep="\t", fileEncoding="UTF-8")  # ew. kodowanie


class(df)
dim(df)
nrow(df)
ncol(df)
names(df)
head(df)
tail(df)

str(df)
summary(df)


df$Zarobki #wyświetlamy kolumnę
sort(df$Zarobki)
class(df$Zarobki) # sprawdzamy typ danych

df$Urodziny
class(df$Urodziny)
df$Urodziny <- as.Date(df$Urodziny)
class(df$Urodziny)
format(df$Urodziny,"%m") # format daty umożliwia operacje na dacie
months(df$Urodziny)



#install.packages("lubridate")
lubridate::year(Sys.Date()) - lubridate::year(df$Urodziny[1]) # wiek pracownika [1]
lubridate::year(Sys.Date()) - lubridate::year(df$Urodziny) # wiek pracownikow


df$Stanowisko
class(df$Stanowisko)
# funkcja table oblicza ile jest posczególnych wystąpień danych wariantów obserwacji
# uwaga: funkcja zwraca obiekt typu "table"
# uwaga: funkcja nie zwraca braków danych NA
table(df$Stanowisko)
as.data.frame(table(df$Stanowisko))
as.data.frame(table(df$Stanowisko)[order(table(df$Stanowisko))])
library(dplyr)
as.data.frame(table(df$Stanowisko)) %>% arrange(desc(Freq))
as.data.frame(table(df$Stanowisko))[1,]
as.data.frame(table(df$Stanowisko))[1,2]

#funkcja unique zwraca wszystkie uniklane wartości występujące w kolumnie
#wynik jest wektorem odpwiedniego typu (zależnie do typu kolumny)
length(unique(df$Stanowisko)) #liczba stanowisk

#jak sobie poradzić ze zmienną typu character? nie jest wygodna w pracy
#lepiej ją zmienić na factor
df$Stanowisko <- as.factor(df$Stanowisko)			
levels(df$Stanowisko)

# zmienna typu factor pozwala na szybką zmianę etykiet poszczególnych poziomów
levels(df$Stanowisko)[levels(df$Stanowisko)=="administracja"] <- "pracownik biurowy"
levels(df$Stanowisko)
df$Stanowisko                


#nadanie typu factor zmiennej płeć (mężczyzna, kobieta)	
df$Plec <- as.factor(df$Plec)
table(df$Plec)
barplot(table(df$Plec)) # prosty wykres słupkowy

# prosta analiza danych 
table(df$Urodziny)
table(lubridate::year(df$Urodziny))
hist(lubridate::year(df$Urodziny)) # prosty histogram
hist(lubridate::year(df$Urodziny), breaks = 6)

# zmiana zmiennej ciągłej na kategoryczną ifelse
table(df$Zarobki)
summary(df$Zarobki)

df$ZarobkiGrupy <- ifelse(df$Zarobki<=2225,
                          "2225 i mniej",
                          ifelse(df$Zarobki<2590,
                                 "2225 - 2590",
                                 "2590 i więcej"))

df$ZarobkiGrupy
table(df$ZarobkiGrupy)
barplot(table(df$ZarobkiGrupy))

# zmiana zmiennej ciągłej na kategoryczną case_when

df$ZarobkiGrupy <- dplyr::case_when(
  df$Zarobki<=1000 ~ "1000 i mniej",
  between(df$Zarobki, 1001, 2000) ~ "1001 - 2000",
  between(df$Zarobki, 2001, 3000) ~ "2001 - 3000",
  between(df$Zarobki, 3001, 4000) ~ "3001 - 4000",
  between(df$Zarobki, 4001, 5000) ~ "4001 - 5000",
  df$Zarobki > 5000 ~ "5000 i więcej")

df$ZarobkiGrupy
table(df$ZarobkiGrupy)
barplot(table(df$ZarobkiGrupy))



# zmiana zmiennej ciągłej na kategoryczną cut i seq

cut(df$Zarobki,seq(0, 6000, 1000))
cut(df$Zarobki,seq(0, 6000, 500))

cut(df$Zarobki,seq(0, 6000, 1000),dig.lab=10)
cut(df$Zarobki,seq(0, 6000, 500),dig.lab=10)

table(cut(df$Zarobki,seq(0, 6000, 1000),dig.lab=10))
table(cut(df$Zarobki,seq(0, 6000, 500),dig.lab=10))
table(cut(df$Zarobki,seq(500, 5500, 500),dig.lab=10))	
barplot(table(cut(df$Zarobki,seq(500, 5500, 500),dig.lab=10))	)

df$ZarobkiGrupy2 <- cut(df$Zarobki,seq(500, 5500, 500),dig.lab=10)

# dodawanie zmiennych do zbioru

## tworzenie nowej zmiennej 

df$Premia <- 0.2 * df$Zarobki
df
df$RandomData <- c(1, 2)

## rekodowanie istniejącej zmiennej

# Patrz ZarobkiGrupy

## zmiana nazwy istniejącej zmiennej

names(df)[names(df) == "RandomData"] <- "SomeOtherData"

# łatwiej: dplyr::rename(.data, new_name = old_name)
df <- dplyr::rename(df, "Wynagrodzenie" = "Zarobki")
df
## dołączenie nowej zmiennej poprzez rbind, cbind lub merge

df <- cbind(df, 1)        #dodanie kolumny z wartościami 1
df <- rbind(df, df[292,]) #dodanie wiersza nr 292
df <- df[,-grep("1", colnames(df))] #usunięcie kolumny 1 z df
df
sort(unique(df$Stanowisko))
bonus <- data.frame(Stanowisko=sort(unique(df$Stanowisko)),Bonus=c(200,300,500,300, 250, 200, 200,100))
bonus

df <- merge(df, bonus, by="Stanowisko")




































#-----------------------------------------------------------------------------

#### Analiza struktury

# trzy wektory do pracy

num_vec1 <- c(19,23,51,22,29,70,33,17,33,61,44,19,18,25,39,27,22,55,50,41,37,30, 18,29,40, NA)
num_vec2 <- rnorm(100,0,5)
kat_vec <- c("podstawowe", "wyższe", "wyższe", "średnie", "wyższe","średnie","podstawowe","podstawowe","podstawowe","wyższe","średnie","podstawowe","podstawowe", "wyższe", "wyższe","średnie","podstawowe")

# klasyczne miary tendencji centralnej

# zmienne numeryczne

# średnia
mean(num_vec2)
mean(num_vec1)  # NA!
mean(num_vec1, na.rm=TRUE)  # musimy dodać argument na.rm=TRUE, aby zignorować braki danych
mean(num_vec1, na.rm=TRUE, trim = 0.1) 

# średnia geometryczna i harmoniczna
#install.packages("psych")
library(psych)

geometric.mean(num_vec1) # ta funkcja automatycznie usuwa braki danych
geometric.mean(num_vec2) # uwaga, procedura ominie wartości ujemne!

harmonic.mean(num_vec1)
harmonic.mean(num_vec2)

weighted.mean(c(2,3,4),c(3,1,5))

num_vec3 <- c(19,23,51,22,29,70,33,17,33,61,44,19,18,25,39,27,22,55,50,41,37,30, 18,29,NA, NA)
wagi <- c(rep(1,5), rep(1.5,5), rep(2,5), rep(2.5,5), rep(3,5), NA)

weighted.mean(num_vec3,wagi)
weighted.mean(num_vec3,wagi, na.rm = TRUE)

# pozycyjne miary tendencji centralnej

# kwantyle (kwartyle, decyle, percentyle)	
quantile(1:12)  #otrzymujemy minimum, maksimum oraz trzy kwartyle (w tym mediana)

# argument "probs" z przedziału [0,1] definiuje wynikowe percentyle 
quantile(1:100, probs = c(0,0.2,0.4,0.6,0.8,1))

# skrócona wersja zapisu decyli 
quantile(1:100, probs = seq(0,1,0.1))

quantile(num_vec1, na.rm = TRUE)
quantile(num_vec2, na.rm = TRUE)
quantile(num_vec2[num_vec2>0], na.rm = TRUE)

# dominanta
table(kat_vec)
#install.packages("RVAideMemoire")
#library(RVAideMemoire)
RVAideMemoire::mod(kat_vec)
RVAideMemoire::mod(num_vec1); table(num_vec1)
RVAideMemoire::mod(num_vec2)
sort(num_vec2)

# zmienna kategoryczna
y <- rpois(100,2)
RVAideMemoire::mod(y)
table(y)   # rozkład wydarzeń rzadkich

# zmienna tekstowa
z <- sample(LETTERS[1:3],20,replace=TRUE)
table(z)
RVAideMemoire::mod(z)












# Klasyczne miary rozproszenia (zmienności)

# odchylenie standardowe
sd(num_vec1)
sd(num_vec1, na.rm=TRUE)
sd(num_vec2) # blisko wartości 5 - zgodnie z tym, jak zdefiniowaliśmy wektor num_vec2

# wariancja
var(num_vec1, na.rm=TRUE)
var(num_vec2, na.rm=TRUE) 

#równa kwadratowi odchylenia standardowego
sd(num_vec2)^2 
sqrt(var(num_vec2)) 
round(sd(num_vec2)^2,10) == round(var(num_vec2), 10)
round(sd(num_vec2),10) == round(sqrt(var(num_vec2)),10)

sd(num_vec2) == sqrt(var(num_vec2))


#odchylenie przeciętne - funkcja użytkownika

odch_przecietne <- function(wektor){
  if(any(is.na(wektor))) wektor <- na.omit(wektor) #funkcja automatycznie usuwa braki danych
  
  sum(abs(wektor - mean(wektor)))*(1/length(wektor))
}

odch_przecietne(1:5)
sd(1:5)

odch_przecietne(num_vec1)
sd(num_vec1, na.rm=TRUE)

# Pozycyjne miary rozproszenia (zmienności)

# minimum
min(num_vec1, na.rm = TRUE)

# maksimum
max(num_vec1, na.rm = TRUE)

# rozstęp
range(num_vec1, na.rm = TRUE)
max(num_vec1, na.rm = TRUE) - min(num_vec1, na.rm = TRUE)
diff(range(num_vec1, na.rm = TRUE))


# wyliczenie opcjonalne
#(num_vec1, na.rm = TRUE)[1] - (num_vec1, na.rm = TRUE)[2]
a <- range(num_vec1, na.rm = TRUE)
a[2]-a[1]

# rozstęp międzykwartylowy
quantile(1:100, 0.75, na.rm=TRUE) - quantile(1:100, 0.25, na.rm=TRUE)

# odchylenie ćwiartkowe
(quantile(1:100, 0.75, na.rm=TRUE) - quantile(1:100, 0.25, na.rm=TRUE))/2

# odchylenie ćwiartkowe (InterQuartile Range)
IQR(1:100)/2

# liczba kategorii
length(unique(kat_vec))

# prawo trzech sigm

x_norm <- num_vec2

three.sigmas <- data.frame(rbind(
  'µ - 3sd' = mean(x_norm) - 3 * sd(x_norm),
  'µ - 2sd' = mean(x_norm) - 2 * sd(x_norm),
  'µ - 1sd' = mean(x_norm) - 1 * sd(x_norm),
  'µ'       = mean(x_norm),
  'µ + 1sd' = mean(x_norm) + 1 * sd(x_norm),  
  'µ + 2sd' = mean(x_norm) + 2 * sd(x_norm),
  'µ + 3sd' = mean(x_norm) + 3 * sd(x_norm)
))
colnames(three.sigmas)[1] <- "value"
print(three.sigmas)













# Miary asymetrii, spłaszczenia i koncentracji

#install.packages("moments")
#library(moments)

# skośność
moments::skewness(num_vec1, na.rm = TRUE)
moments::skewness(num_vec2, na.rm = TRUE)

# spłaszczenie
moments::kurtosis(num_vec1, na.rm = TRUE)
moments::kurtosis(num_vec2, na.rm = TRUE)

# koncentracja,
#install.packages("ineq")
#library(ineq)
plot(ineq::Lc(num_vec1))
table(num_vec1)
plot(ineq::Lc(num_vec2)) # błąd - liczby ujemne!
plot(ineq::Lc(num_vec2[num_vec2>0]))

# współczynnik Ginniego
# https://pl.wikipedia.org/wiki/Wsp%C3%B3%C5%82czynnik_Giniego
ineq::ineq(num_vec1, type="Gini")

