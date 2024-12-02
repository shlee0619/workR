# 데이터
temperature <- c(20, 25, 30, 35, 40)
sales <- c(30, 40, 50, 60, 70)

# 평균 계산
mean_sales <- mean(sales)
# 예측값 계산
predicted_sales <- predict(lm(sales ~ temperature))

# SST 계산
SST <- sum((sales - mean_sales)^2)

# SSR 계산
SSR <- sum((predicted_sales - mean_sales)^2)

# SSE 계산
SSE <- sum((sales - predicted_sales)^2)

# 결과 출력
cat("SST:", SST, "\n")
cat("SSR:", SSR, "\n")
cat("SSE:", SSE, "\n")
# 결정 계수 계산
R_squared <- SSR / SST

# 결과 출력
cat("R-squared:", R_squared, "\n")
# 기울기(beta) 계산
beta <- sum((temperature - mean(temperature)) * (sales - mean_sales)) / sum((temperature - mean(temperature))^2)

# 절편(alpha) 계산
alpha <- mean_sales - beta * mean(temperature)

# 결과 출력
cat("alpha:", alpha, "\n")
cat("beta:", beta, "\n")
# 잔차 분산(MSE) 계산
n <- length(sales)
MSE <- SSE / (n - 2)

# beta의 표준 오차 계산
SE_beta <- sqrt(MSE / sum((temperature - mean(temperature))^2))

# alpha의 표준 오차 계산
SE_alpha <- sqrt(MSE * (1/n + mean(temperature)^2 / sum((temperature - mean(temperature))^2)))

# 결과 출력
cat("MSE:", MSE, "\n")
cat("SE(beta):", SE_beta, "\n")
cat("SE(alpha):", SE_alpha, "\n")
# t-value 계산
t_beta <- beta / SE_beta
t_alpha <- alpha / SE_alpha

# p-value 계산 (양측 검정)
p_value_beta <- 2 * pt(abs(t_beta), df = n - 2, lower.tail = FALSE)
p_value_alpha <- 2 * pt(abs(t_alpha), df = n - 2, lower.tail = FALSE)

# 결과 출력
cat("t-value(beta):", t_beta, "\n")
cat("t-value(alpha):", t_alpha, "\n")
cat("p-value(beta):", p_value_beta, "\n")
cat("p-value(alpha):", p_value_alpha, "\n")

# 데이터
temperature <- c(20, 25, 30, 35, 40)
sales <- c(30, 40, 50, 60, 70)

# 평균 계산
mean_sales <- mean(sales)

# 예측값 계산
predicted_sales <- predict(lm(sales ~ temperature))

# SST 계산
SST <- sum((sales - mean_sales)^2)

# SSR 계산
SSR <- sum((predicted_sales - mean_sales)^2)

# SSE 계산
SSE <- sum((sales - predicted_sales)^2)

# 결정 계수 계산
R_squared <- SSR / SST

# 기울기(beta) 계산
beta <- sum((temperature - mean(temperature)) * (sales - mean_sales)) / sum((temperature - mean(temperature))^2)

# 절편(alpha) 계산
alpha <- mean_sales - beta * mean(temperature)

# 잔차 분산(MSE) 계산
n <- length(sales)
MSE <- SSE / (n - 2)

# beta의 표준 오차 계산
SE_beta <- sqrt(MSE / sum((temperature - mean(temperature))^2))

# alpha의 표준 오차 계산
SE_alpha <- sqrt(MSE * (1/n + mean(temperature)^2 / sum((temperature - mean(temperature))^2)))

# t-value 계산
t_beta <- beta / SE_beta
t_alpha <- alpha / SE_alpha

# 유의수준 설정
alpha <- 0.05

# 자유도 계산
df <- length(sales) - 2

# 양측 검정의 임계값 계산
cv <- qt(1 - alpha/2, df)

# 결과 출력
cat("Critical Value (CV):", cv, "\n")
cat("t-value(beta):", t_beta, "\n")
cat("t-value(alpha):", t_alpha, "\n")

# beta의 유의성 검정
if (abs(t_beta) > cv) {
  cat("beta는 유의미합니다.\n")
} else {
  cat("beta는 유의미하지 않습니다.\n")
}

# alpha의 유의성 검정
if (abs(t_alpha) > cv) {
  cat("alpha는 유의미합니다.\n")
} else {
  cat("alpha는 유의미하지 않습니다.\n")
}