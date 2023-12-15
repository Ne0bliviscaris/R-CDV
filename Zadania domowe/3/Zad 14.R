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

?Auto

#
# --------------------------------------------------------
# tu wpisz swój kod: 

head(ISLR::Auto) # pierwsze 6 obserwacji
str(ISLR::Auto) # struktura danych
table(is.na(ISLR::Auto)) # sprawdzenie czy są braki danych
summary(ISLR::Auto) # podstawowe statystyki
head(unique(ISLR::Auto$name)) # sprawdzenie zawartości kolumny name
colnames(ISLR::Auto) # nazwy kolumn
model1 <- lm(mpg ~ horsepower, data=ISLR::Auto) # tworzenie modelu mierzącego wpływ mocy silnika (horsepower) na spalanie (mpg)
summary(model1) # podsumowanie modelu

cat("Wraz ze wzrostem mocy silnika, współczynnik mpg maleje.") #a)
cat("Współczynnik regresji wynosi -0.1578, co oznacza, że wraz ze wzrostem mocy silnika o 1 jednostkę, mpg maleje o 0.1578 jednostki.") #b)
predict(model1, data.frame(horsepower=98), interval="confidence") # c) predykcja dla mocy silnika 98
plot(ISLR::Auto$horsepower, ISLR::Auto$mpg, xlab="Horsepower", ylab="Miles per galon", main="Wpływ mocy silnika na spalanie", col="darkblue") # d)
abline(model1, col="red") # dodanie linii regresji do wykresu
plot(model1) # e) wykresy diagnostyczne

print("Macierz korelacji dla zmiennych numerycznych")
cor(ISLR::Auto[, sapply(ISLR::Auto, is.numeric)]) # macierz korelacji dla zmiennych numerycznych
cat("Zmienne numeryczne silnie skorelowane ze zmienną objaśnianą (mpg):\n") #f) silna koleracja z mpg
names(abs(cor(Auto[, sapply(Auto, is.numeric)])[,"mpg"])[abs(cor(Auto[, sapply(Auto, is.numeric)])[,"mpg"])>0.7])

model2 <- lm(mpg ~ ., data=ISLR::Auto) # model2 oparty na wszystkich zmiennych
summary(model2) # podsumowanie modelu
p_values <- summary(model2)$coefficients[, "Pr(>|t|)"] # p-value dla wszystkich zmiennych objaśniających
significant_variables <- names(p_values)[p_values < 0.05] # zmienna jest istotna, jeśli p-value < 0.05
cat("Zmienne powiązane z mpg w statystycznie istotnyn stopniu:\n")
print(significant_variables) #g)
cat("Współczynnik year odpowiada za rok produkcji samochodu.") #h)
cat("R-squared dla modelu1:", summary(model1)$r.squared)
cat("R-squared dla modelu2:", summary(model2)$r.squared)
cat("R-squared dla modelu2 jest większe, co oznacza, że model2 lepiej wyjaśnia zmienność mpg.")
plot(model1)
plot(model2)
