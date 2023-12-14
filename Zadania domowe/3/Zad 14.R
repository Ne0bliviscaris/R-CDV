# --------------------------------------------------------
# Zadanie.14
#
# W pakiecie ISLR dostępny jest zbiór "Auto "z informacją o różnych modelach samochodów.
# Zapoznaj się ze znaczeniem zmiennych zbioru. Dokonaj eksploracji zbioru za pomocą
# poznanych funkcji (np. head, summary, itd.).
#
# Utwórz model1 regresji liniowej ze zmienną mpg jako objaśnianą a horsepower jako objaśniającą.
# Zastanów się co zawierają zmienne i czy istnieje związek przyczynowo-skutkowy. 
# Zinterpretuj zmienne i uzasadnij związek.
# 
# Dokonaj analizy parametrów modelu za pomocą funkcji summary(). Na podstawie je wyników odpowiedz 
# na następujace pytania:
# a) Czy istnieje związek pomiędzy zmienną objaśniającą a objaśnianą?
# b) Jak można interpretować wartość współczynnika regresji?
# c) Jaką liczbę mil per galon paliwa model przewiduje dla 98 koni mechanicznych? 
# {wskazówka: użyj funkcji predict z argumentem interval="conficence"
# d) utwórz wykres rozrzutu dla tych dwóch zmiennych; dodaj linię regresji za pomocą funkcji "abline"
# e) użyj funkcji "plot", żeby obejrzeć wykresy diagnostyczne
#
# Spróbuj stworzyć model dla większej liczby zmiennych. 
# Najpierw stwórz macierz korelacji dla zmiennych numerycznych używająch funkcji cor(). 
# (pamiętaj, że w argumencie funkcji cor powinny być dane bez zmiennych kategorycznych)
# f) które zmienne numeryczne są silnie skorelowane ze zmienną objaśnianą?
#
# Stwórz teraz model2 oparty na wszystkich zmiennych.
# g) Które zmienne są powiązane ze zmienną objaśnianą (mpg) w statystycznie istotnym stopniu?
# h) Jak można interpretować współczynnik przy zmiennej "year"?
#
# Porównaj modele ze względu na wartość R kwadrat 
# i stwórz wykresy diagnostyczne dla obu modeli.

# Załaduj zestaw danych Auto z pakietu ISLR
ISLR::Auto
# Wyświetl pierwsze sześć wierszy zestawu danych Auto
head(ISLR::Auto)
# Wyświetl podsumowanie statystyczne dla każdej kolumny w zestawie danych Auto
summary(ISLR::Auto)
# Utwórz model liniowy przewidujący mpg (miles per gallon) na podstawie horsepower (moc koni mechanicznych) w zestawie danych Auto
model1 <- lm(mpg ~ horsepower, data=ISLR::Auto)
# Wyświetl podsumowanie modelu liniowego model1, w tym statystyki takie jak R-squared, p-value, etc.
summary(model1)
# Przewiduj mpg dla samochodu o mocy 98 KM, używając modelu model1
predict(model1, newdata=data.frame(horsepower=98), interval="confidence")
# Utwórz wykres punktowy mpg w funkcji horsepower
plot(ISLR::Auto$horsepower, ISLR::Auto$mpg)
plot(ISLR::Auto$horsepower, ISLR::Auto$mpg, xlab = "Horsepower", ylab = "MPG")
# Dodaj linię regresji do wykresu punktowego
abline(model1)
# Utwórz wykresy diagnostyczne dla modelu model1
plot(model1)
# Oblicz współczynnik korelacji Pearsona dla wybranych kolumn zestawu danych Auto
cor(ISLR::Auto[,c(1,3,4,5,6,7)])
# Utwórz model liniowy przewidujący mpg na podstawie wszystkich innych zmiennych w zestawie danych Auto
model2 <- lm(mpg ~ ., data=ISLR::Auto)
# Wyświetl podsumowanie modelu liniowego model2
summary(model2)
# Utwórz wykresy diagnostyczne dla modelu model2
plot(model2)