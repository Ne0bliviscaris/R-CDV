# --------------------------------------------------------
# Zadanie.12 
#
# W R dostępne są zbiory WWWusage, presidents oraz mdeaths. Wczytaj je i dokonaj eksploracji danych.
# Sprawdź czy są to zbiory typu "time series". Opisz jakich okresów dotyczą dane oraz jakim okresom 
# czasu odpowiadają poszczególne obserwacje. Sporządź również wykresy liniowe obrazujące te szeregi czasowe.
#
# Pełne rozwiązanie tego zadania musi zawierać dla każdego zbioru: 
#	- Twój kod R, 
#	- Twój opis i interprację szeregów czasowych,
#   - czytelną wizualizację na wykresach. 
#
# --------------------------------------------------------

head(WWWusage) # pierwsze 6 obserwacji
str(WWWusage) # struktura danych
table(is.na(WWWusage)) # sprawdzenie czy są braki danych
# Zbiór WWWusage to czereg czasowy 100 pomiarów ilości użytkowników internetu w ciągu jednej minuty.
# Ze zbioru nie da się wywnioskować, jakiego okresu dotyczą dane. Zbiór nie zawiera braków danych.
plot(WWWusage, xlab="Pomiar", ylab="Użytkownicy internetu", main="Liczba użytkowników internetu w czasie", col="#5c1515")


head(presidents) # pierwsze 6 obserwacji
str(presidents) # struktura danych
table(is.na(presidents)) # sprawdzenie czy są braki danych
# Zbiór presidents to szereg czasowy 120 kwartalnych pomiarów popularności prezydentów USA w latach 1945-1974. W zbiorze brakuje wartości dla 6 pomiarów.
plot(presidents, xlab="Czas", ylab="% poparcia dla prezydenta", main="Popularność prezydentów USA w latach 1945-1974", col="#5c1515", type="h")


head(mdeaths) # pierwsze 6 obserwacji
str(mdeaths) # struktura danych
table(is.na(mdeaths)) # sprawdzenie czy są braki danych
# Zbiór mdeaths to szereg czasowy 72 miesięcznych pomiarów liczby zgonów na zapalenie oskrzeli, rozedmę płuc i astmę  pośród mężczyzn w Anglii i Walii w latach 1974-1979.
# W zbiorze nie ma braków danych.
plot(mdeaths, xlab="Czas", ylab="Liczba zgonów", main="Liczba zgonów w wyniku zapalenia oskrzeli, rozedmy płuc i astmy pośród mężczyzn w UK w latach 1974-1979.", col="#5c1515")
