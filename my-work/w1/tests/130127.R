x <- rnorm(1000)
hist(x)

name = "thomas"
class(name)

areYouInteger = 1L
class(areYouInteger)

kins = c('marcella', 'valentina', 'thomas', 'camilla', 'alberto', 'susanna', 'massimiliano')
age = c(40, 36, 36, 46, NA, 45, 41)
skill = c('high', 'low', 'low', NA, 'high', 'low', 'high')
table = data.frame(names = kins, age = age, level = skill)
table[age < 40, ]

skill_eval = as.factor(skill)

x = seq(0, 10, by=1)
binomDensity = dbinom(x, size=10, prob=0.6)
round(binomDensity, 3)

pop = sample(1:50, 10, FALSE)