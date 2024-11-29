#주석 shift + alt + c
#할당 = ctrl + c
#명령어 실행 = ctrl + enter

a <- 1
a

b <- 2
b


c <- 3
c

a+b+c


var1 <- c(1,2,5,7,8)
var1
var2 <- c(1:5)
var3 <- c(2,4,6)
var1+var3
var1 + var2

v3 <- seq(1,5)
v3
v4 <- seq(0,10, by=2)
v4
v5 <- seq(1,10, by=2)
v5

var1 + 1
var1 -1


str1 <- "k"
str1
str2 <- "text"
str2
str3 <- c("a","b","c")
str3
str4 <- c("Hello!","World","is","good!")
str4
paste("Hello!","World","is","good!")
paste0("Hello!","World","is","good!")

paste(str4, collapse = " ")
paste(str4, collapse = "_")


mean(var1)
table(str3)
# 대괄호: []
# 중괄호: {}
#소괄호: ()
# 알파벳 추출
# 인덱스: 데이터 위치
# 인덱싱: 인덱스를 이용해 데이터를 추출하는 작업

LETTERS[1:5]
LETTERS[c(1,20)]
letters[1:5]
letters[c(11,15)]
#
# 4+6
4+6
# 제곱 = ^2 = **2
2^2

correct <-  c(8,6,5,8,7,8,9,6,10,8)
ls()
ls(pattern="c")
correct

data1 <- c(45,56,34,56,23,53,34,12,67,89)
# data2 <- (7,5,3,2,1,2,4,5,6,7)
# data2 생성에러수정
data2 <- c(7,5,3,2,1,2,4,5,6,7)
data3 <- c(1,2,1,2,2,1,2,1,2,2)
ls()
rm(data2)
ls()

exam <- read.csv("./data/csv_exam.csv")
exam
# file.choose()
# read.csv(file.choose())
str(exam) # info와 비슷한 기능

path = "./data/"
list.files(path)
list.files(path, full.names =TRUE)
list.files(path, full.names = TRUE,
           pattern = "csv_exam")
filenames <- list.files(path,full.names=TRUE)
filenames[1]
read.csv(filenames[1])

filenames2 <- list.files(path, full.names=TRUE, pattern="csv_exam")
read.csv(filenames2[1])



summary(exam)
# 범주형 변수
# 빈도, 비율

table(exam$class)
#상관계수
data2 <- c(7,5,3,6,4,7,6,4,5,9)
data1;data2
# correlation
cor(data1,data2)
# 산점도
plot(data1,data2)
search()
# 패키지는 함수의 묶음
# 예) tidyr(데이터 전처리), ggplot(시각화)


#행 추출

exam[1,]
exam[15,]
exam[c(1:10),]
exam[c(11:20),]
exam[seq(1,10),]
exam[seq(11,20),]
exam[seq(1,20,by=2),]
exam[seq(0,20,by=2),]

str(exam)
exam[exam$class==1,]
exam[exam$class!=1,]
exam[exam$english>97,]
exam[exam$math<50,]
exam[exam$math<=50,]


exam[exam$class==3 & exam$science >= 50,]
exam[exam$math > 70 | exam$science <= 30, ]



#열번호로 열 추출
str(exam)

exam[,1]# id
exam[,2]# class
exam[,3]# math
exam[,4]# english
exam[,5]# science
exam[,6]

# 열 번호로 여러개 열 추출
exam[,c(1:3)]
exam[,c(3:5)]
exam[,c(1,3,5)]

# 열 이름으로 열 추출

exam[, "id"]
exam[,"class"]
exam[,"math"]
exam[,"english"]
exam[,"science"]

# 열 이름을 여러개 열 추출

exam[,c("id","class","math")]
exam[,c("math","english","science")]
exam[,c("id","math","science")]

# 문제) 수학점수 50이상, 영어점수 80이상인 학생들을 대상으로 각 반의 전과목 총평균을 구하라.

exam[1,5]
exam[1,"science"]
exam[exam$math>80, 5]
exam[exam$math>80, "science"]
exam[exam$math>80, c(4,5)]
exam[exam$math>80, c("english", "science")]
filtered_exam <- exam[exam$math >= 50 & exam$english >= 80, ]
class_means <- aggregate(cbind(math, english, science) ~ class, data = filtered_exam, mean)
print(class_means)
total_mean <- mean(rowMeans(class_means[, c("math", "english", "science")]))
cat("전 과목 총평균:", total_mean, "\n")
install.packages("tidyverse")
library(tidyverse)
exam %>%
  filter(math >= 50 & english >= 80) %>%
  mutate(total = (math+english+science)/3) %>%
  group_by(class) %>%
  summarise((mean_score = mean(total)))

var1 <- c(1,2,3,1,2)
var2 <- factor(c(1,2,3,1,2))
var1
var2
var1+2
var2+2
class(var1)
class(var2)
# 값을 문자로 입력
var3 <- c("a","b","b","c")
var4 <- factor(c("a","b","b","c"))
var3
var4
var3+2
var4+2
class(var3)
class(var4)

#함수적용
var1
mean(var1)
table(var1)
summary(var1)
var2
mean(var2)
table(var2)
summary(var2)
var3
mean(var3)
table(var3)
summary(var3)
var4
mean(var4)
table(var4)
summary(var4)
# 데이어타이변경
var1;var2
class(var1);class(var2)
var2 <- as.numeric(var2)
class(var1);class(var2)

mpg$drv
class(mpg$drv)
mpg$drv <- as.factor(mpg$drv)

table(mpg$drv)

# 자료구조
# 1. 벡터: 하나의 값, 여러 개의 값,
# 같은 데이터 타입

a <- 3
a
b <- c(1,2,3,4,5)
b
c <- "hi"
c
d <- c("a","b","c","a")
d
class(a)
class(b)
class(c)
class(d)

# 2. 데이터프레임: 행과 열로 구성된 2차원, 열들이 서로다른 데이터타입 가질 수 있음

df <- data.frame(var1=c(1,2,3),
                 var2=c("a","b","c"))
df
class(df)
class(df$var1)
class(df$var2)

# 3. 매트릭스: 행과 열로 구성된 2차원, 같은 데이터타입만 저장 간으
mx <- matrix(c(1:12), ncol=4)
mx
class(mx)

# 4. 어레이: 행과 열로 구성된 매트릭스가 여러 겹이 있는 구조

ar <- array(1:18, dim=c(3,6,3))
ar
class(ar)

# 5. 리스트: 모든 데이터 구조를 저장할 수 있음

ls <- list(list1 = a, 
           list2 = df,
           list3 = mx, 
           list4 = ar)
ls
class(ls)

#벡터를 꺼내서 사용하기
ls$list1
vec <- ls$list1
vec
# = a
# 데이터프레임을 꺼내서 사용하기
ls$list2
# 매트릭스를 꺼내서 사용하기
ls$list3
# 어레이를 꺼내서 사용하기
ls$list4

# 리스트 실제 활용 예
mpg <- as.data.frame(ggplot2::mpg)
# 상자수염그림
bp <- boxplot(mpg$hwy)
bp
bp$stats
#하한값값
bp$stats[1,1]
lower_limit <- bp$stats[1,1]
lower_limit
#상한값
bp$stats[5,1]
upper_limit <- bp$stats[5,1]
upper_limit

#패키지
library(ggplot2)
x <- c("a","a","b","c")
x
# quick plot: 탐색적 목적으로 빠르게 시각화 함수
# 막대그래프: 범주형변수의 빈도표현
qplot(x)
#
mpg <- as.data.frame(ggplot2::mpg)
#히스토그램: 연속형 변수(구간) 의 빈도표현
qplot(data=mpg, x=drv, y=hwy)
#
qplot(data = mpg, x=drv, y=hwy, geom="line")
#상자수염그림
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")
#
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", color=drv)

#
# 도움말 보고 싶을 때
?qplot

#q1. 시험점수 변수만들고 출력하기
#q2. 전체 평균 구하기
#q3. 전체 평균변수 만들고 출력하기
test_v <- c(80,60,70,50,90)
mean(test_v)
test_mean = mean(test_v)

# 평균
# 세 지역에 이는 서점의 연평균 고객수
x <- c(2150, 1534, 3564)
x
mean(x)

#계산식
(2150+ 1534+ 3564)/3
sum(x)/3
sum(x)/length(x)
















