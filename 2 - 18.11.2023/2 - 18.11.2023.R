Zadanie.08. W pakiecie schoolmath znajduje się zbiór danych primlist, który zawiera liczby pierwsze pomiędzy 1 a 9999999.
• Znajdź największą liczbę pierwszą mniejszą od 1000.
• Ile jest liczb pierwszych większych od 100 a mniejszych od 500?  
  
install.packages("schoolmath")
schoolmath::primlist
max(schoolmath::primlist[schoolmath::primlist < 1000])
length(schoolmath::primlist[schoolmath::primlist < 500 & 100 < schoolmath::primlist])

######## wersja prowadzącego

library(schoolmath)
head(primlist)
tail(primlist)

str(primlist)
is.vector(primlist)
is.integer(primlist)
is.double(primlist)               

primlist[primlist<1000]
max(primlist[primlist<1000]) 

length(primlist[primlist>100 & primlist<500]) 	



###############################2

Listy

• Kolejnym podstawowym typem danych jest lista. Najlepiej postrzegać ją jako ciąg złożony z elementów o dowolnych typach (a więc już niekoniecznie tych samych jak w przypadku wektorów atomowych).
• Listy mają kluczowe znaczenie w programie R. Przykładowo, funkcje w R mają możliwość zwracania wielu wartości różnych typów. Wynikiem działania funkcji może być tylko jeden obiekt, ale nic nie stoi na przeszkodzie, aby zebrać obliczone, różnorodne dane w pojedynczą listę. Co więcej, wiele dość skomplikowanych na pierwszy rzut oka obiektów będzie w swej stocie reprezentantami list, np. ramki danych.
• List tworzymy zazwyczaj za pomocą funkcji list().

x <- list(TRUE, 2L, 3.5, "statystyka")
x
typeof(x) 
length(x)
str(x)

• Funkcja str() podaje bardziej zwięzłą i jednocześnie bardziej szczegółową informację o liście
str(x)

• Przypomnijmy, że nawiasy kwadratowe [] zastosowane do wektorów atomowych zwracały obiekt tego samego typu co obiekt, do którego go stosujemy. Podobnie jest dla list.

x <- list(TRUE, 2L, 3.5, "statystyka")
x[1]
x[2]
x[3]
x[4] 
x[c(1:2)]
x[-c(2:4)]

• Konkretny element listy wydobywamy za pomocą [[]]. Jako argument przyjmuje on wartość liczbową dodatnią określającą indeks interesującego nas elementu.

x <- list(1:4, c("a", "b", "c"), list("statystyka", "informatyka"))
length(x)
str(x)

x[[1]]

x[[1]][1]
x[[1]][2:3]

x[[2]][1]

x[[2]]
x[[3]]
x[[3]][[1]]
x[[3]][[2]]	


• Nawiasy [] umożliwiają zastąpienie zawartości wybranej podlisty. Do wybranej podlisty możemy przypisać wektor (uogólniony lub atomowy).

x <- list(1, 2, 3)
str(x)

# znulowanie elementu z listy (bez zmiany długości listy)
x[1] <- list(NULL)
str(x)


• Niewiele funkcji jest dedykowanych listom. Wynika to faktu, że ten typ danych służy zazwyczaj do grupowania innych obiektów w jeden. Listy są jednak istotnymi elementami programu R, ponieważ są to obiekty, na których zbudowane są inne typy danych jak np. ramki danych.
• Funkcja lapply() służy do wywoływania danej funkcji na każdym elemencie listy. Liście 𝑘 elementowej przypisana jest lista 𝑘 elementowa.

sum(list(1:3, 4:6))

lapply(list(1:3, 4:6), sum)



######################################9
Zadanie 9. Skonstruuj listę o nazwie moja_lista, której pierwszym elementem będzie dwuelementowy 
wektor napisów zawierający Twoje imię i nazwisko, 
drugim elementem będzie liczba 𝜋, trzecim funkcja służąca do obliczania pierwiastka kwadratowego, 
a ostatni element listy to wektor złożony z liczb 0,02; 0,04; … ; 1. 

Następnie usuń elementy numer jeden i trzy z tej listy. 

Na zakończenie, wyznacz listę zawierającą wartości funkcji gamma Eulera dla elementów listy moja_lista.                 
dane <- ('imie','nazwisko')
moja_lista <- list(c('Mateusz','Ratajczak'),pi,seq(0.02, 1, 0.02), sum)
moja_lista

### wynik prowadzącego
MyList <- list(c("Mój Mały", "Wektor"), pi, sqrt, seq(0.02, 1, 0.02))

# usuń elementy numer jeden i trzy z tej listy.
MyList[c(1,3)] <- NULL
MyList
# wyznacz listę zawierającą wartości funkcji gamma Eulera 
lapply(MyList, gamma)

#################################################################################3
Macierze

• Macierz (typ złożony matrix) i, ogólniej, tablice (typ złożony array) są reprezentowane w R przez wektory atomowe. 
Mają one jednak ustawiony atrybut specjalny dim. Jako wartość może mieć on przypisany jedynie wektor liczb całkowitych 
dodatnich o długości nie mniejszej niż dwa.
• Macierze można utworzyć korzystając z funkcji matrix().

# konieczny dodatkowy atrybut wymiaru dim
x <- matrix(1:8, nrow = 2, ncol = 4)
x <- matrix(1:6, ncol = 3)
class(x)

dim(x)
nrow(x)
ncol(x)

x


• Skoro macierze są wektorami atomowymi, do ich indeksowania możemy użyć nawiasów kwadratowych []. Jednak możemy korzystać z nich na „większą’ ’ liczbę sposobów

x <- matrix(1:6, ncol = 3)
x[2, 3]
x[2,]
x[,3]
x[, 2:3] # podmacierz


# analogiczne działania jak na wektorach atomowych
mean(matrix(1:6, ncol = 3))
mean(x)
2 * matrix(1:6, ncol = 3)

# transpozycja macierzy
t(matrix(1:6, ncol = 3))

# mnożenie macierzy
(A <- matrix(1:6, ncol = 3))
(B <- matrix(7:12, ncol = 2))

A %*% B # Matrix multiplication
B %*% A # Matrix multiplication   
A*B # Element-wise multiplication,  iloczyn Hadamarda
A <- matrix(c(1,3,2,1), ncol = 2)
B <- matrix(c(0,2,3,1), ncol = 2)
A * B     

• Funkcje colMeans(), rowMeans(), colSums() i rowSums() wyznaczają średnią arytmetyczną albo sumę, odpowiednio, elementów z każdej kolumny lub wiersza.
• rankMatrix() z pakietu Matrix - rząd macierzy
• det() - wyznacznik macierzy
• kronecker(A, B) - iloczyn Kroneckera macierzy
• solve(A, b) - rozwiązuje układy równań liniowych, jako pierwszy parametr podajemy macierz 	współczynników, a jako drugi wektor wyrazów wolnych. Jeśli nie podamy drugiego parametru funkcja obliczy macierz odwrotną.
• ginv() z pakietu MASS - pseudoodwrotność Moore’a-Penrose’a
• eigen() - wartości oraz wektory własne (rozkład spektralny macierzy symetrycznej	
  
                                          
                                          
                                                                                  
                                          
                                          Zadanie 10. Wyznacz rząd, wyznacznik, odwrotność, wartości własne, wektory własne oraz sumy i
                                          średnie arytmetyczne dla kolejnych wierszy i kolumn dla następującej macierzy.
                                          Ponadto, pomnóż tę macierz przez jej odwrotność.	
                                          
                                          ┌1	5	3┐
                                          │2	0	5│
                                          └1	2	1┘
                                          
                                          ### potrzebne paczki: matlib, Matrix, matricks
                                          
                                          install.packages(c("matlib", "Matrix","matricks"))
                                          
                                          
                                          MyTrix <- matrix(c(1, 2, 1, 5, 0, 2, 3, 5, 1), nrow = 3, ncol = 3)
                                          MyTrix   
                                          
                                          # rząd macierzy
                                          Matrix::rankMatrix(MyTrix)
                                          Matrix::rankMatrix(MyTrix)[1]
                                          
                                          # wyznacznik macierzy
                                          Matrix::det(MyTrix)
                                          
                                          # wyznacznik macierzy
                                          Matrix::det(MyTrix)
                                          
                                          # odwrotność macierzy
                                          MASS::ginv(MyTrix)
                                          Matrix::solve(MyTrix)
                                          
                                          # wartości własne
                                          eigen(MyTrix)
                                          
                                          # sumy i średnie arytmetyczne dla kolejnych wierszy i kolumn
                                          colMeans(MyTrix)
                                          rowMeans(MyTrix)
                                          colSums(MyTrix)
                                          rowSums(MyTrix)
                                          
                                          
                                          # Ponadto, pomnóż tę macierz przez jej odwrotność.
                                          det(MyTrix) # czy można odwrócić? det(A) <> 0
                                          MyTrix %*% matlib::inv(MyTrix)
                                          
                                          round(MyTrix %*% matlib::inv(MyTrix),2)
                                          
                                          # diagonalna
                                          diag(MyTrix)
                                          
                                          # antydiagonalna
                                          matricks::antidiag(MyTrix)
                                          
                                          # czyli uzyskaliśmy macierz jednostkową
                                          
                                          
                                          
                                          
                                          ### dygresja: elegancki kod, który zainstaluje brakującą paczkę ############
                                          
                                          # require zwraca (niewidzialne) TRUE jeżeli paczka jest zainstalowana 
                                          
                                          if(!require(somepackage)){
                                            install.packages("somepackage")
                                            library(somepackage)
                                          }
                                          
                                          ############################################################################
                                          

                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
Ramki danych
                                          
• Ramki danych (ang. data frames) to obiekty przechowujące informacje w postaci macierzowej, najczęściej takie, które są np. wynikiem eksperymentów (także numerycznych).
• Wiersze ramki danych odpowiadają reprezentowanym obiektom, tzw. obserwacjom (ang. observations), bądź przypadkom (ang. cases), np. badanym osobom.
• Kolumny z kolei podają informacje na temat wartości różnych zmiennych (ang. variables) opisujących ich wybrane własności (mierzalne lub nie).
• Do tworzenia ramek danych służy funkcja data.frame(), którą wywołujemy podobnie jak funkcję list().
                                          
data_frame <- data.frame(
  plec = c("K", "K", "M", "M", "K"),
  edukacja = c("s", "w", "w", "p", "s"),
  waga = c(60, 55, 80, 75, 62)
)

View(data_frame)
class(data_frame)
                                          
nrow(data_frame)
ncol(data_frame)
rownames(data_frame)
colnames(data_frame)
dim(data_frame)



• Funkcje rownames() i colnames() pozwalają na zmianę nazw wierszy i kolumn, odpowiednio
rownames(data_frame) <- c("Anna", "Sara", "Tomek", "Marek", "Kasia")
data_frame

data_frame[1]
data_frame[2]
data_frame[3]
data_frame[[1]]
data_frame$plec
data_frame[3,]
data_frame[,3]



#################################################################DODAWANIE DO DATAFRAME
data_frame$waga <- c(58, 54, 78, 72, 60)            #nadpisanie kolumny

data_frame[data_frame$plec == "M",]                 #listowanie danych wartosci kolumny wg nazwy
data_frame[data_frame[1] == "K", ]                  #listowanie danych wartosci kolumny wg indeksu kolumny

• Na ramkach danych działają także dwie funkcje cbind() i rbind(), które poznaliśmy przy okazji omawiania macierzy.

rbind(data_frame[1:2, ], data_frame[1:2,])          #dopisywanie wiersza   ???
?rbind
cbind(data_frame[1:2, ], wzrost = c(170, 164))      #dopisywanie kolumn   ???




##############################################################################

df <- data.frame (
  Month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
  Temp.F = c(32, 33, 41, 52, 62, 72, 77, 75, 68, 58, 47, 35)
)

cbind(df, Temp.C = (df$Temp.F-32) * 5/9)

df <- cbind(df[1:12, ], Temp.C = round(df$Temp.F[1:12]-32*5/9))

df$Temp.C <-(df$Temp.F-32) * 5/9
df

### prowadzący
df$Temp.C = round(((df$Temp.F - 32) * 5 / 9), 2)





##############################################################################################
Odczytywanie i zapisywanie danych

• read.table(), load(), read.csv(), read.csv2(), read_excel() (pakiet readxl) - wczytanie zbioru danych, odpowiednio z pliku tekstowego, pliku w formacie programu R (z rozszerzeniem RData), pliku csv, pliku xls lub xlsx, odpowiednio,
• write.table(), save(), write.csv(), write.csv2(), write.xlsx() (pakiet xlsx) - zapis zbioru danych, odpowiednio do pliku tekstowego, pliku w formacie programu R (z rozszerzeniem RData), plików csv, plików xlsx, odpowiednio, 
• Przy odczytywaniu i zapisywaniu danych, wygodnie jest najpierw ustalić katalog bieżący na
ten, w którym znajdują się lub mają znaleźć się pliki z danymi. Aktualny katalog bieżący
sprawdzamy za pomocą funkcji getwd(), natomiast zmieniamy go używając funkcji setwd().

getwd()
setwd("c:/Users/Dragon/Documents/") # błąd!
	setwd("c:/Users/rpuak/Documents/")
	setwd("c:\\Users\\rpuak\\Documents\\")

#############wczytywanie pliku z sieci
odczyt_1 <- read.table("https://raw.github.com/RPuakowski/Teaching/main/odczyt_1.txt", header = TRUE)    #header = TRUE sprawia, że wiersz 1 nazywa kolumny
odczyt_1	
	
odczyt_2 <- read.table("https://raw.github.com/RPuakowski/Teaching/main/odczyt_2.txt", sep=';', dec=',')   #separator sep = ';' 
odczyt_2	
	



• Pliki z danymi do powyższych przykładów: odczyt_1.txt, odczyt_2.txt
• Można też zaimportować dane klikając na Import Dataset w RStudio i w otworzonym okienku ustawić potrzebne parametry.
• Podgląd danych w edytorze kodu źródłowego otrzymujemy za pomocą funkcji View().
• Zapisywanie danych:
  
getwd()                                          #sprawdza aktualnie używany folder R, setwd() ją zmienia
dane_1 <- data.frame(1:10, 5:14)
write.table(dane_1, "dane_1.txt")                #zapisuje tabelę do txt
save(dane_1, file = "dane_1.RData")              #zapisuje tabelę do pliku RData, jego otwarcie doda zmienną do środowiska

xx <- load("dane_1.RData")
get(xx)
xx <- get(load("dane_1.RData"))                  #wczytanie tabeli z pliku dane_1.RData do zmiennej xx






Zadanie 12. Odczytaj zbiór danych dane1.csv, a następnie korzystając z operatorów logicznych 
wyświetl tylko wiersze odpowiadające pacjentkom starszym niż 50 lat z przerzutami do węzłów chłonnych (Wezly.chlonne = 1).


file<-read.table("https://raw.githubusercontent.com/RPuakowski/Teaching/main/dane1.csv", header = TRUE, sep=';')

#### prowadzący

URL <- "https://raw.github.com/RPuakowski/Teaching/main/"

file <- read.csv2(paste0(URL,"dane1.csv"))

head(file)
dim(file)
str(file)
View(file)

file[file$Wiek > 50 & file$Wezly.chlonne == 1,]








#############################################################################
#############################################################################
Funkcje

• Korzystając z programu R, bardzo szybko odczuwa się potrzebę użycia pewnych fragmentów
kodu wielokrotnie, choć być może dla różnych danych.
• Tak jak listy grupują obiekty (być może różnych typów), tak funkcje zbierają określone wyrażenia
służące np. do obliczenia pewnych wartości dla zadanych danych.
• Dodatkową zaletą stosowania funkcji jest możliwość dzielenia długiego kodu na łatwiejsze do
opanowania części.
• Tworzenie obiektów typu funkcja odbywa się według następującej składni.

function(lista parametrów) ciało funkcji

gdzie ciało funkcji jest wyrażeniem do wykonania na obiektach określonych przez listę
parametrów.
• Wartość obliczonego wyrażenia jest wynikiem działania funkcji. Takim wynikiem może być
jeden i tylko jeden obiekt, np. lista.
• Parametrów może być jednak wiele. lista parametrów to ciąg oddzielonych przecinkami elementów postaci:
  – nazwa parametru (pod taką nazwą będzie dostępny w funkcji obiekt przekazany przy wywołaniu),
– nazwa = wyrażenie (parametr z wartością domyślną),
– ... - parametr specjalny, który pozwala przekazać dowolną liczbę argumentów w grupie.

#szescian x
szescian <- function(x) x^3                      #definicja funkcji, jesli funkcja obejmuje wiecej linii, nalezy uzyc { }
szescian(1:3)                                    #wywolanie funkcji z parametrem

#suma x + y
suma_1 <- function(x = 1, y = 2) {      #wartosci domyslne
x + y
}
suma_1(5,16)                            #nadpisanie wartosci domyślnych



suma_1()
suma_1(3,)
suma_1(,2)
suma_1(2, 3)      

mapply(suma_1, c(1,2,3), c(4,5,6))




suma_2 <- function(x, y = 2) {
  x + y
}

suma_2(2)
suma_2(2, y = 3)





Zadanie 14. Napisz funkcję zamieniającą miarę kąta podaną w stopniach na radiany. 
Sprawdź działanie tej funkcji dla kątów o mierze: 0o, 30o, 45o, 60o, 90o. 
Następnie przygotuj ramkę danych, w której zebrane będą informacje o wartościach funkcji 
sinus, cosinus, tangens i cotangens dla kątów o takich miarach.

df <- data.frame (
  Stopnie = as.numeric(c('0', '30', '45', '60', '90')),
  Radiany = c('0', '30', '45', '60', '90')
)
df$Radiany = (df$Stopnie * pi / 180)
df


stopnienaradiany <- function(x) x*pi/180
stopnie <- c(0,30,45,60,90)

df <- data.frame(
  stopnie,
  stopnienaradiany(stopnie),
  sin(stopnie),
  cos(stopnie),
  tan(stopnie),
  1/tan(stopnie)
)
df




### prowadzący
MyFunction <- function(x) {
  x * pi/ 180
}
MyFunction(0)
MyFunction(180)

input = c(0, 30, 45, 60, 90)
func = MyFunction(input)

df = data.frame(input, 
                func,
                sin(func),
                cos(func),
                tan(func),
                1/tan(func)   #, colnames("Stopien",'rad','sin','cos','tg','ctg')
)
df















############################################################################### IF
###############################################################################
Instrukcje Warunkowe

• Najprostsza wersja wyrażenia warunkowego if ma następującą składnię:
  
  if (warunek) wyrazenie_TRUE

gdzie warunek jest wektorem logicznym zawierający jeden element o wartości TRUE albo FALSE (NA nie
                                                                                            można tu używać - pojawi się błąd). Wyrażenie wyrazenie_TRUE zostanie wykonane wtedy i tylko
wtedy, gdy warunek będzie równy TRUE.

if (is.character("wyrazenie")) print("wyrazenie_TRUE")

if (is.numeric("wyrazenie")) print("wyrazenie_TRUE")

• Bardzie rozbudowana wersja wyrażenia warunkowego if ma następującą składnię:
  
  if (warunek) wyrazenie_TRUE else wyrazenie_FALSE

• Wyrażenie wyrazenie FALSE zostanie wykonane, gdy warunek będzie równy FALSE.

if (is.numeric("wyrazenie")) {
  print("wyrazenie_TRUE")
} else {
  print("wyrazenie_FALSE")
}





• Przykłady

x <- 1
if(x > 0){
  print("Positive number")
}      

x <- 1
if(x >= 0){
  print("Non-negative number")
} else {
  print("Negative number")
}

x <- -1
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")




Zadanie 15. Wylosuj liczbę z zakresu od 1 do 100 (skorzystaj z funkcji sample). 
Użyj wyrażenia warunkowego if else żeby sprawdzić czy 'Wylosowana liczba jest parzysta / nieparzysta'. 

samp <- sample(1:100, 1)
if (samp %% 2){
  print('parzysta')
}else print('nieparzysta')








Zadanie 16. Firma sprzedaje trzy kategorie produktów A, B oraz C. Każdy z nich
jest obłożony inną stawką podatku VAT (odpowiednio: 8%, 10% i 20%). Pobierz 
kategorię i cenę. Użyj wyrażenia warunkowego, aby wyliczyć cenę z podatkiem. 
Zakomunikuj wynik do użytkownika.

##> Obowiązuje stawka VAT 8%. Cena wraz z podatkiem wynosi 54.
##> Obowiązuje stawka VAT 10%. Cena wraz z podatkiem wynosi 55.
##> Obowiązuje stawka VAT 20%. Cena wraz z podatkiem wynosi 60.

VAT=c(8,10,20)
VAT
cena = as.numeric(readline((prompt='Podaj cenę produktu: ')))
kat = readline(prompt = "Podaj kategorę produktu: A, B lub C: ")
if (kat == "A"){
  print('Obowiązuje stawka VAT 8%. Cena wraz z podatkiem wynosi'cena*(1+VAT[1]/100)
} else if (kat == "B"){
  print('Obowiązuje stawka VAT 10%. Cena wraz z podatkiem wynosi'cena*(1+VAT[2]/100)
} else if (kat == "C"){
  print('Obowiązuje stawka VAT 20%. Cena wraz z podatkiem wynosi'cena*(1+VAT[3]/100))
} else print('Błędna stawka')




### wersja z funkcją
getProductPriceWithVat <- function (type, price) {
  if(type == 'A') {
    vat <- 0.08
  }
  if(type == 'B'){
    vat <- 0.1
  }
  if(type == 'C') {
    vat <- 0.2
  }
  cat('Obowiązuje stawka VAT,', vat*100, '% Cena wraz z podatkiem wynosi ', price + price * vat)
  
}
getProductPriceWithVat('C', 100)
