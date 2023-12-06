# --------------------------------------------------------
# Zadanie.11

# Wczytaj dane ze zbioru "countries of the world.csv" 
df <- read.csv("https://github.com/RPuakowski/Teaching/raw/main/countries%20of%20the%20world.csv", header = TRUE, sep = ",", dec = ",")	
# Zapoznaj się z danymi korzystając np. z funkcji names(), summary(), str(), dim(), itd., obejrzysz też dane za pomocą funkcji View()
names(df)
summary(df)
str(df)
dim(df)
#View(df) - ukryte dla szybkiego ponownego wykonywania całości
# Zamień puste pola na wartości NA: data[data==""] <- NA
df <- read.csv("https://github.com/RPuakowski/Teaching/raw/main/countries%20of%20the%20world.csv", na.strings = c("", "NA"))
# zmień nazwy kolumn, zgodnie z następującym wzorem:
# Area_sq_mi -> Area
colnames(df) <- gsub("Area..sq..mi..", "Area", colnames(df))
# Pop_Density_per_sq_mi -> Pop_dens
colnames(df) <- gsub("Pop..Density..per.sq..mi..", "Pop_dens", colnames(df))
# GDPper_capita -> GDP
colnames(df) <- gsub("GDP....per.capita.", "GDP", colnames(df))
# Literacy.... -> Literacy
colnames(df) <- gsub("Literacy....", "Literacy", colnames(df))
# Usuń ze zbioru wszystkie zmienne poza: Country, Region, Population, Area Pop_dens, GDP, Literacy, Birthrate, Deathrate.
df <- subset(df, select = c("Country", "Region","Population", "Area", "Pop_dens", "GDP", "Literacy", "Birthrate", "Deathrate"))
# Usuń spacje ze zmiennej Region (z przodu i z tyłu nazw - funkcja str_trim)
df$Region <- stringr::str_trim(df$Region)

# Dla ilu krajów występują braki danych w zmiennej Literacy? Użyj funkcji is.na i sum
cat("Braki w literacy występują dla", sum(is.na(df$Literacy)), "krajów")
# Wyświetl wszystkie kategorie zmiennej Region. Jaka jest dominanta? (RVAideMemoire::mod(?))
cat("Wszystkie kategorie zmiennej Region to:\n\n", unique((df$Region)), ".\n\nDominantą zmiennej region jest:", RVAideMemoire::mod(df$Region))
# Sprawdź udział procentowy poszczególnych kategorii.
cat("Udział procentowy poszczególnych kategorii:\n")
prop.table(table(df$Region))*100
# Jaka jest średnia i mediana zmiennych Population, Area i GDP? 
cat("Dla zmiennej Population średnia wynosi:", mean(df$Population),", a mediana wynosi:", median(df$Population))
cat("Dla zmiennej Area średnia wynosi:", mean(df$Area),", a mediana wynosi:", median(df$Area))
cat("Dla zmiennej GDP średnia wynosi:", mean((df$GDP), na.rm = TRUE),", a mediana wynosi:", median((df$GDP), na.rm = TRUE))
# Stwórz histogram oraz wykres pudełkowy dla zmiennych GDP  oraz Literacy.
hist(df$GDP, main = "Global GDP", xlab = "Millions usd", ylab = "Countries", col = "lightgreen", labels = TRUE )
boxplot(df$GDP, main = "Global GDP", ylab = "Millions usd", col = "lightgreen", range = 1.4)
# Odpowiednio podpisz osie histogramu (uwzględniając też jednostki)
df$Literacy <- gsub(",", ".", df$Literacy)
hist(na.omit(as.numeric(df$Literacy)), main = "Global Literacy", xlab = "Literacy %", ylab = "Countries", col = "brown", labels = TRUE )
boxplot(as.numeric(df$Literacy), main = "Global Literacy", ylab = "Literacy %", col = "brown", range = 1.2)
# Wyświetl kwartyle dla funkcji GDP.
quantile(df$GDP, na.rm = T)
# Teraz stwórz nową zmienną - będzie to zmienna 
# kategoryczną oparta na zmiennej GDP. Nowa zmienna:
# - powinna się nazywać "GDP_binned"
# - będzie przyjmować cztery wartości (kategorie):
# - pierwsza kategoria ma zawierać wartości od minimum do pierwszego kwartyla. Nazwij ją "Very_poor"
first_quartile <- quantile(df$GDP, 0.25, na.rm = TRUE)
# - druga kategoria ma zawierać wartości od pierwszego kwartyla do mediany. Nazwij ją "Poor"
median_gdp <- quantile(df$GDP, 0.5, na.rm = TRUE)
# - trzecia kategoria ma zawierać wartości od mediany do trzeciego. Nazwij ją "Medium"
third_quartile <- quantile(df$GDP, 0.75, na.rm = TRUE)
# - czwarta kategoria ma zawierać wartości od mediany do trzeciego. Nazwij ją "Rich"
# - (użyj funkcji ifelse albo case_when)  
df$GDP_binned <- case_when(
  df$GDP <= first_quartile ~ "Very_poor", # 0-25
  df$GDP > first_quartile & df$GDP <= median_gdp ~ "Poor", # 26-50
  df$GDP > median_gdp & df$GDP <= third_quartile ~ "Medium", # 51-75
  df$GDP > third_quartile ~ "Rich") # 76-100
# Stwórz nową zmienną logiczną, która przyjmuje wartość „True”, kiedy wartość 
# zmiennej „Birthrate” jest większa lub równa od wartości zmiennej „Deathrate”,
# a wartość „False” w przeciwnym przypadku. Wartość „True” w nowej zmiennej
# oznacza – najprościej ujmując – że w roku badania w danym kraju więcej osób się
# urodziło niż umarło. 
df$More_Births <- df$Birthrate >= df$Deathrate
#Stwórz wykres słupkowy dla nowo powstałej zmiennej, 
#  pokazując częstości występowania pierwszej i drugiej kategorii.
barplot(table(df$More_Births), 
        main = "Kraje z większą liczbą urodzeń niż zgonów",
        col = c("lightblue", "lightgreen"), 
        legend = c("Więcej zgonów", "Więcej urodzeń"),
        ylab = "Liczba krajów",
        xlab = "Więcej urodzeń niż zgonów")

