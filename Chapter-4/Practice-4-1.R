## ������ �Է��� ������ �����

# ���� ����� 
english <- c(90, 80, 60, 70)    # ���� ���� ���� ����
english

math <- c(50, 60, 100, 20)      # ���� ���� ���� ����
math

class <- c(1, 1, 2, 2)          # �л��� �ݿ� ���� ����
class


# ������ ������ ����� 
# english, math, class�� ������ ������ �����ؼ� df_midterm�� �Ҵ� 
df_midterm <- data.frame(english, math, class)

#�Ѳ����� �ϱ�
#df_midterm <- data.frame(english = c(90, 80, 60, 70), 
#                         math = c(50, 60, 100, 20),
#                         class = c(1, 1, 2, 2))

df_midterm

# �м��ϱ� 
mean(df_midterm$english)    # df_midterm�� english�� ��� ����
mean(df_midterm$math)     # df_midterm�� math�� ��� ����