# --------------------------------------------------------
# Zadanie.11

# Wczytaj dane ze zbioru "countries of the world.csv" 
# Zapoznaj się z danymi korzystając np. z funkcji names(), summary(), str(), 
# dim(), itd., obejrzysz też dane za pomocą funkcji View()
# Zamień puste pola na wartości NA: data[data==""] <- NA
# zmień nazwy kolumn, zgodnie z następującym wzorem:
# Area_sq_mi -> Area
# Pop_Density_per_sq_mi -> Pop_dens
# GDPper_capita -> GDP
# Usuń ze zbioru wszystkie zmienne poza: Country, Region, Population, Area, 
# Pop_dens, GDP, Literacy, Birthrate, Deathrate.
# Usuń spacje ze zmiennej Region (z przodu i z tyłu nazw - funkcja str_trim)
#  
# Dla ilu krajów występują braki danych w zmiennej Literacy? Użyj funkcji is.na i sum
# Wyświetl wszystkie kategorie zmiennej Region. Jaka jest dominanta? (RVAideMemoire::mod(?))
# Sprawdź udział procentowy poszczególnych kategorii.
# Jaka jest średnia i mediana zmiennych Population, Area i GDP? 
# Stwórz histogram oraz wykres pudełkowy dla zmiennych GDP oraz Literacy. 
# Odpowiednio podpisz osie histogramu (uwzględniając też jednostki)
# Wyświetl kwartyle dla funkcji GDP. Teraz stwórz nową zmienną - będzie to zmienna 
# kategoryczną oparta na zmiennej GDP. Nowa zmienna:
# - powinna się nazywać "GDP_binned"
# - będzie przyjmować cztery wartości (kategorie):
# - pierwsza kategoria ma zawierać wartości od minimum do pierwszego kwartyla. Nazwij ją "Very_poor"
# - druga kategoria ma zawierać wartości od pierwszego kwartyla do mediany. Nazwij ją "Poor"
# - trzecia kategoria ma zawierać wartości od mediany do trzeciego. Nazwij ją "Medium"
# - czwarta kategoria ma zawierać wartości od mediany do trzeciego. Nazwij ją "Rich"
# - (użyj funkcji ifelse albo case_when)  
# Stwórz nową zmienną logiczną, która przyjmuje wartość „True”, kiedy wartość 
# zmiennej „Birthrate” jest większa lub równa od wartości zmiennej „Deathrate”,
# a wartość „False” w przeciwnym przypadku. Wartość „True” w nowej zmiennej
# oznacza – najprościej ujmując – że w roku badania w danym kraju więcej osób się
# urodziło niż umarło. Stwórz wykres słupkowy dla nowo powstałej zmiennej, 
#  pokazując częstości występowania pierwszej i drugiej kategorii.


# Wczytaj dane ze zbioru "countries of the world.csv" 
link <- "https://github.com/RPuakowski/Teaching/raw/main/countries%20of%20the%20world.csv"
df <- read.csv(link, header = TRUE, sep = ",", dec = ",")	
print(df)
# Zapoznaj się z danymi korzystając np. z funkcji names(), summary(), str(), dim(), itd., obejrzysz też dane za pomocą funkcji View()
names(df)
summary(df)
str(df)
dim(df)
View(df)
# Zamień puste pola na wartości NA: data[data==""] <- NA
df <- read.csv(link, na.strings = c("", "NA"))
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
hist(df$GDP, main = "Global GDP", xlab = "Billions usd", ylab = "Countries", col = "green", labels = TRUE )
boxplot(df$GDP, main = "Global GDP", ylab = "Billions usd", col = "green", range = 1.4)
# Odpowiednio podpisz osie histogramu (uwzględniając też jednostki)
df$Literacy <- gsub(",", ".", df$Literacy)
hist(na.omit(as.numeric(df$Literacy)), main = "Global Literacy", xlab = "Literacy %", ylab = "Countries", col = "brown", labels = TRUE )
boxplot(as.numeric(df$Literacy), main = "Global Literacy", ylab = "Literacy %", col = "brown", range = 1.2)
# Wyświetl kwartyle dla funkcji GDP. Teraz stwórz nową zmienną - będzie to zmienna 
# kategoryczną oparta na zmiennej GDP. Nowa zmienna:
# - powinna się nazywać "GDP_binned"
# - będzie przyjmować cztery wartości (kategorie):
# - pierwsza kategoria ma zawierać wartości od minimum do pierwszego kwartyla. Nazwij ją "Very_poor"
# - druga kategoria ma zawierać wartości od pierwszego kwartyla do mediany. Nazwij ją "Poor"
# - trzecia kategoria ma zawierać wartości od mediany do trzeciego. Nazwij ją "Medium"
# - czwarta kategoria ma zawierać wartości od mediany do trzeciego. Nazwij ją "Rich"
# - (użyj funkcji ifelse albo case_when)  
# Stwórz nową zmienną logiczną, która przyjmuje wartość „True”, kiedy wartość 
# zmiennej „Birthrate” jest większa lub równa od wartości zmiennej „Deathrate”,
# a wartość „False” w przeciwnym przypadku. Wartość „True” w nowej zmiennej
# oznacza – najprościej ujmując – że w roku badania w danym kraju więcej osób się
# urodziło niż umarło. Stwórz wykres słupkowy dla nowo powstałej zmiennej, 
#  pokazując częstości występowania pierwszej i drugiej kategorii.