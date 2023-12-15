# --------------------------------------------------------
# Zadanie.15
#
# Wygeneruj 1000-elementowy wektor z rozkładu Poisonna z parametrem lambda=6. Policz dla tego wektora:
# - średnią, 
# - rozstęp, 
# - wariancję, 
# - kwartyle, 
# - rozstęp międzykwartylowy, 
# - kurtozę, 
# - skośność ,
# - oraz dominantę.
# Zwizualizuj wektor za pomocą histogramu oraz wykresu pudełkowego (użyj kolorów, ustaw tytuły osi, wykresu).
# Jak mają się do siebie średnia, mediana i dominanta?
# Wygeneruj ponownie losowy wektor (korzystając z tej samej komendy) i uruchom ponownie napisane komendy. 
# Czy są wyraźne różnice?


#
# --------------------------------------------------------
# tu wpisz swój kod: 
vec <- rpois(1000, lambda=6)
# - średnią, 
cat("Średnia: ", mean(vec), "\n")
# - rozstęp, 
cat("Rozstęp: ", range(vec), "\n")
# - wariancję, 
cat("Wariancja: ", var(vec), "\n")
# - kwartyle, 
cat("Kwartyle: ", quantile(vec), "\n")
# - rozstęp międzykwartylowy, 
cat("Rozstęp międzykwartylowy: ", IQR(vec), "\n")
# - kurtozę, 
cat("Kurtoza: ", moments::kurtosis(vec), "\n")
# - skośność ,
cat("Skośność: ", moments::skewness(vec), "\n")
# - oraz dominantę.
cat("Dominanta: ", dominant(vec), "\n")

as.numeric(names(sort(-table(vec)))[1])
table(vec)
max(table(vec))
# Zwizualizuj wektor za pomocą histogramu oraz wykresu pudełkowego (użyj kolorów, ustaw tytuły osi, wykresu).
# Jak mają się do siebie średnia, mediana i dominanta?
# Wygeneruj ponownie losowy wektor (korzystając z tej samej komendy) i uruchom ponownie napisane komendy. 
# Czy są wyraźne różnice?

hist(vec, col="red", main="Histogram", xlab="Wartości", ylab="Częstość")
boxplot(vec, col="blue", main="Wykres pudełkowy", xlab="Wartości", ylab="Częstość")

vec <- rpois(1000, lambda=6)
hist(vec, col="blue", main="Histogram", xlab="Wartości", ylab="Częstość")
boxplot(vec, col="red", main="Wykres pudełkowy", xlab="Wartości", ylab="Częstość")
