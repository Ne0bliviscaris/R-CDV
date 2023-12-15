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
cat("Średnia: ", mean(vec), "\n")
cat("Rozstęp: ", range(vec), "\n")
cat("Wariancja: ", var(vec), "\n")
cat("Kwartyle: ", quantile(vec), "\n")
cat("Rozstęp międzykwartylowy: ", IQR(vec), "\n")
cat("Kurtoza: ", moments::kurtosis(vec), "\n")
cat("Skośność: ", moments::skewness(vec), "\n")
cat("Dominanta: ", as.numeric(names(sort(-table(vec)))[1]), "\n")

hist(vec, col="red", main="Histogram 1", xlab="Wartości", ylab="Częstość") # histogram vec
boxplot(vec, col="blue", main="Wykres pudełkowy 1", ylab="Wartości", range=1) # wykres pudełkowy vec
?boxplot
vec2 <- rpois(1000, lambda=6)
hist(vec2, col="blue", main="Histogram 2", xlab="Wartości", ylab="Częstość") # histogram vec2
boxplot(vec2, col="red", main="Wykres pudełkowy 2", ylab="Wartości", range=1) # wykres pudełkowy vec2

par(mfrow = c(1, 2)) # wykresy obok siebie
hist(vec, col="red", main="Histogram 1", xlab="Wartości", ylab="Częstość") # histogram vec
hist(vec2, col="blue", main="Histogram 2", xlab="Wartości", ylab="Częstość") # histogram vec2
par(mfrow = c(1, 2)) # wykresy obok siebie
boxplot(vec, col="blue", main="Wykres pudełkowy 1", ylab="Wartości", range=1) # wykres pudełkowy vec
boxplot(vec2, col="red", main="Wykres pudełkowy 2", ylab="Wartości", range=1) # wykres pudełkowy vec2

