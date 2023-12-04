#Zadanie.02. Zainstalujcie i uruchomcie paczkę "moments", skorzystajcie z pomocy dla podanych niżej poleceń

#install.packages("moments")
library(moments)                                      #wywołanie biblioteki
require(moments)
#help(package = "moments")
#?moments::kurtosis

#skewness
#moment

set.seed(1234)
moments::kurtosis(rnorm(1000))       #biblioteka::funkcja z biblioteki
                                     #wskazanie biblioteki umożliwia pominięcie wywołanie funkcji bez ówczesnego wywoływania biblioteki



c(TRUE, TRUE, FALSE, FALSE, TRUE)     #R nie operuje na wcięciach, można je stosować dowolnie
length(
  c(
    c(
      TRUE, TRUE, FALSE
      ),
    c(
      FALSE, TRUE
      )
    )
  )



c(1, +2, -3, 2.3, -.4, 5.)            #wartości dodatnie nie wymagają +



seq(1, 8, length.out = 6)



Zadanie.02. Użyj funkcji rep(), aby utworzyć wektor logiczny, zaczynając od trzech wartości prawda,
następnie czterech wartości fałsz, po których następują dwie wartości prawda i wreszcie pięć wartości
fałsz.


c(
  rep(TRUE,3),
  rep(FALSE,4),
  rep(TRUE,2),
  rep(FALSE,5)
)

rep(c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE))
rep(c(TRUE,FALSE,TRUE,FALSE),c(3,4,2,5))




Zadanie.03. Palindromem nazywamy wektor, którego elementy czytane od końca tworzą ten sam
wektor co elementy czytane od początku. Utwórz taki wektor 100 liczb przy czym pierwsze 20 liczb
to kolejne liczby naturalne, następnie występuje 10 zer, następnie 20 kolejnych liczb parzystych, a
pozostałe elementy określone są przez palindromiczność (warunek symetrii).

## [1] 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 0 0 0 0 0
## [26] 0 0 0 0 0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
## [51] 40 38 36 34 32 30 28 26 24 22 20 18 16 14 12 10 8 6 4 2 0 0 0 0 0                 
## [76] 0 0 0 0 0 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1

  seq(1,20),
  rep(0,10),
  seq(2, 20, 2)

  
  
  
  
  a = c(seq(1:20))
  b = c(rep(0,10))
  c = c(seq(2, 40, 2))
  
  c(a, b, c, rev(a), rev(b), rev(c))
  
  
txt="Zażółć gęślą jaźń"
 length(txt,"asdf")                            #length 
 nchar(txt)                                 #nchar liczy litery
 
 
 
 
 
 
 
 
 
 
 
 
 
 operatory przypisania
 
 • W R obiekty nazywamy za pomocą jednego z następujących operatorów przypisania (ang. assignment operator): =, <-, ->.
 • W RStudio skrót klawiszowy ALT+- wywołuje <
   
   # CTRL + SHIFT + F10
   
 x = 5
 5 = x
 
 # Alt i minus
 y <- 6
 6 -> y
 
 x
 y
      

 
 Zadanie.02(cd.). Nazwij dany wektor przez x, a następnie korzystając z tej nazwy dokonaj konwersji na wektor numeryczny. 
 Użyj funkcji as.numeric().
 
 asd = rep(FALSE,4)
 asd

 as.numeric(asd)
 
 
 poprzedniezadanie = c(
   rep(TRUE,3),
   rep(FALSE,4),
   rep(TRUE,2),
   rep(FALSE,5)
 )

 as.numeric(poprzedniezadanie)

 
 
 
 
 5 %% 2                   # %% - dzielenie modulo
 5 %/% 2                  # %/% - dzielenie bez reszty
 ?"%%"
 ?"%/%"
 
 

 
 1:3 + c(3, 4, 5)
 1:3 * 11:13 / 21:23
 
 
 
 x <- c(1, 3, 5, 8, 1, 3, 0, 6)
 x * c(1, 3)

 
 
 x <- c(TRUE,FALSE,0,6)
 y <- c(FALSE,TRUE,FALSE,TRUE)
 !x
 ?x&y
 x&&y
 x|y
 x||y                                     #podwójny operator - wykonywanie operacji element-wise
 
 

 
 1 > 0
 0 == 1
 
 (1:7) == (1:7)
 (1:7) == (7:1)
 a <- ((1:7) == (7:1))
 
 
 
 • Przy porównaniu wektorów napisów, operator == sprawdza, czy poszczególne napisy są takiej
 samej długości i czy składają się dokładnie z tych samych znaków (wielkości liter mają znaczenie).
 
 "Statystyka" == "statystyka"
 "statystyka" == "statystyka"
 tolower("Statystyka") == tolower("statystyka")
 
 
 
 
 
 
 Indeksowanie wektorów
 
 • Wartości elementów każdego wektora leżą na ściśle określonych pozycjach oznaczonych kolejnymi liczbami naturalnymi (1:length(x)). Do elementów wektora odwołujemy się poprzez nawiasy kwadratowe [].
 • Jeżeli w nawiasach kwadratowych podanych po nazwie wektora znajdzie się wektor wartości dodatnich, to otrzymamy wektor złożony z elementów leżących na podanych pozycjach.
 
 x <- 1:5
 x[2]	
 x <- 1:5
 x[2]
 
 x <- c(2, 6, 3, 5, 8)
 x[2]
 x[2:3]
 x[length(x)] # ostatni element wektora
 x[2:4]   
 x[c(2,4)]            #wyjęcie dwóch elementów z wektora
 
 
 
 
 x[2] <- 1
 x
 x[c(1, 4)] <- c(-2,-5)
 x[c(1, 4)] <- 7
 
 x[c(1,2)] <- c(8,8)
 x
 
 x <- 1:10

 
letters[c(5,10,15,20,25)]



Zadanie.05. Utwórz wektor liczb naturalnych od 1 do 1000, a następnie zamień liczby parzyste na ich
odwrotności.




options(scipen = 999)
x
options(scipen = 0)
x
format(x, scientific = FALSE)
head(format(floor(x), scientific = FALSE))
tail(format(floor(x), scientific = FALSE))






• Funkcja sort() zwraca uporządkowaną kopię danego wektora. Funkcja is.unsorted() 
służy	do sprawdzania, czy dany wektor nie jest posortowany niemalejąco.	

is.numeric()
is.unsorted()                 
is.double()
as.numeric()
as.string()             
typeof()

sort(c(1, 2, 3, 4, 3, 2, 1))                                #funkcja sort sortuje rosnąco

sort(c(1, 2, 3, 4, 3, 2, 1), decreasing = TRUE)

is.unsorted(c(1, 2, 3, 4, 3, 2, 1))                 #czy wektor jest nieposortowany
!is.unsorted(c(1, 2, 3, 4, 3, 2, 1))                #czy wektor nie jest nieposortowany
is.unsorted(sort(c(1, 2, 3, 4, 3, 2, 1)))











• Funkcja rev() zwraca wektor o elementach podanych w odwrotnej kolejności.

rev(c(6, 2, 2, 3, 2, 3))

• Funkcja unique() służy do usuwania powtórzeń wartości elementów wektora.

x <- c(2, 3, 2, 2)
unique(x)

length(unique(c(6, 2, 2, 3, 2, 3))) # liczba unikalnych elemnetów wektora


x <- c(-1.876, -1.123, -0.123, 0, 0.123, 1.123, 1.876)

sign(x)
as.logical(sign(x))

round(x, 2)

floor(x)

trunc(x)	





Zadanie.07. Wyznacz pierwiastek kwadratowy z każdej liczby naturalnej od 1 do 100 milionów.

#porównaj sobie funkcje wbudowane i użytkownika
#algorytmy dla wbudowanych robili profesjonalni programiści i są wydajnieszje


x <- c(1:100000000)
sqrt(x)









### pomiar czasu

start_time <- Sys.time()
sqrt(1:1000000)
end_time <- Sys.time()	

end_time - start_time # sprawdź czas

start_time <- Sys.time()	
(1:1000000)^0.5	
end_time <- Sys.time()	

end_time - start_time # sprawdź czas











Zadanie.08. W pakiecie schoolmath znajduje się zbiór danych primlist, który zawiera liczby pierwsze pomiędzy 1 a 9999999.
• Znajdź największą liczbę pierwszą mniejszą od 1000.
• Ile jest liczb pierwszych większych od 100 a mniejszych od 500?  

#install.packages("schoolmath")

library(scoolmath)
??schoolmath::primlist


x <- (1:1000)
x(primlist)
