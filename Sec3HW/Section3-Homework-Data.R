#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#1
profit <- round(revenue - expenses)
profit

#2
profit_after_tax <- profit * 0.7
profit_after_tax

#3
pmfem <- round(profit_after_tax / revenue, 2) * 100
pmfem

#4
mean <- round(mean(profit))
good_m <- profit_after_tax > mean
good_m

#4
bad_m <- profit_after_tax < mean
bad_m

#5
round(max(profit_after_tax))

#6
round(min(profit_after_tax))

