#-*-coding:utf-8

# In[1]:



import sys

print(sys.argv)



#자료 처리용 임포트
import pandas as pd
import numpy as np

#시각화용 임포트
import seaborn as sns
import matplotlib.pyplot as plt

#자료 위치 찾기용
import os


# In[2]:


os.getcwd()


# In[33]:


data = pd.read_excel('ill.xlsx')
canser = data.iloc[1:,1:]
canser_name = canser.index
city = canser.columns
canser_value = canser.values
print(type(data))
canser.head()


# In[10]:


import matplotlib
from matplotlib import font_manager, rc
import platform

if platform.system() == 'Windows':
# 윈도우인 경우
    font_name = font_manager.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
    rc('font', family=font_name)
else:    
# Mac 인 경우
    rc('font', family='AppleGothic')
    
matplotlib.rcParams['axes.unicode_minus'] = False   
#그래프에서 마이너스 기호가 표시되도록 하는 설정입니다. 


# In[28]:


def makeHisto(name):
    print(name)
    


# In[29]:


def main():
    name = '서울'
    makeHisto(name)


# In[30]:


if __name__ == "__main__":
    # execute only if run as a script
    main()
    print(os.getcwd())

