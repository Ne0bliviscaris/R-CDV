# Zadanie.13
#
# Dostępny jest zbiór danych prezentujących liczbę małżeństw (v1). Prezentuje on dane za okres od stycznia
# 2009 do grudnia 2011. Dokonaj jego dekompozycji. Wybierz właściwy typ modelu wahań w czasie. Wykreśl
# wyniki. Odpowiedz na pytania:
#
# W których miesiącach jest najwyższy dodatni poziom wahań sezonowych, 
# a w których jest najniższy? Uzasadnij odpowiedź i zinterpretuj wyniki.
#  
# O ile procent w każdym miesiącu wskaźniki sezonowości odchylają się od średniej dla danego miesiąca?
#
# --------------------------------------------------------
# tu wpisz swój kod: 

v1 <-  c(10.8, 12.9, 4.7, 28.1, 6.1, 23.1, 20.2, 23.7, 30.4, 24.6, 7.7, 14.8,
         10.2, 10.9, 4.9, 27.3, 6.0, 27.6, 16.7, 28.3, 26.7, 24.8, 8.2, 12.9,
         9.8,  7.9, 8.1, 25.7, 6.3, 25.2, 18.8, 29.6, 26.2, 26.1, 8.3, 12.9)

# Dekompozycja szeregu czasowego
v1.ts <- ts(v1, start=c(2009,1), frequency=12) # podział wektora na time series po 12 elementów na rok
v1.decomp <- decompose(v1.ts, type="additive") # dekompozycja addytywna
plot(v1.decomp) # wykres dekompozycji addytywnej
v1.decomp <- decompose(v1.ts, type="multiplicative") # dekompozycja
plot(v1.decomp) # wykres dekompozycji multiplikatywnej








# WYBRAĆ METODĘ DEKOMPOZYCJI
# MULTIPLIKATYWNA BARDZIEJ ODPOWIEDNIA











str(v1.decomp) # struktura obiektu v1.decomp
# v1.decomp - wynik dekompozycji szeregu czasowego
v1.seasonal <- v1.decomp$seasonal
# Obliczenie średniej dla każdego miesiąca
v1.seasonal_mean <- tapply(v1.seasonal, cycle(v1.seasonal), mean) #tworzy tabelę z wartościami średnimi dla każdego miesiąca
print(v1.seasonal_mean) # wyświetla tabelę z wartościami średnimi dla każdego miesiąca
# Znalezienie miesiąca z najwyższym dodatnim poziomem wahań sezonowych
max_month <- which.max(v1.seasonal_mean)
# Znalezienie miesiąca z najniższym poziomem wahań sezonowych
min_month <- which.min(v1.seasonal_mean)
print(paste("Miesiąc z najwyższym dodatnim poziomem wahań sezonowych:", max_month))
print(paste("Miesiąc z najniższym poziomem wahań sezonowych:", min_month))


# Obliczenie odchylenia od średniej dla każdego miesiąca
print(v1.seasonal_mean) # wyświetla tabelę z wartościami średnimi dla każdego miesiąca
# Obliczenie procentowego odchylenia od średniej dla każdego miesiąca
v1.seasonal_mean_perc <- (v1.seasonal_mean - mean(v1.seasonal_mean)) / mean(v1.seasonal_mean) * 100
# wyświetla tabelę z wartościami procentowymi odchylenia od średniej dla każdego miesiąca z zaokrągleniem do 2 miejsc po przecinku
print(round(v1.seasonal_mean_perc),2) 
print(paste("Miesiąc z najwyższym dodatnim poziomem wahań sezonowych: ", max_month, "-", which.max(v1.seasonal_mean_perc), "%"))
print(paste("Miesiąc z najniższym poziomem wahań sezonowych: ", min_month, "-", which.min(v1.seasonal_mean_perc), "%"))



