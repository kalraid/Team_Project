
# coding: utf-8

# In[4]:

#자료 처리용 임포트
import pandas as pd
import numpy as np

#시각화용 임포트
import matplotlib.pyplot as plt

#자료 위치 찾기용
import os
import sys, json


# In[5]:

data = pd.read_excel('ill.xlsx')
data.index.name="Disease"
data.columns.name="City"
canser = data.iloc[1:,1:]
canser_name = canser.index
city = canser.columns
canser_value = canser.values
canser.head()
canser.shape


# In[6]:

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


# In[7]:

#Read data from stdin
def read_in():
    lines = sys.stdin.readlines()
    # Since our input would only be having one line, parse our JSON data from that
    return json.loads(lines[0])

def main():
    lines = read_in()

    total = []
    for item in lines:
        total.append(item)
    
    plt.gcf().clear()
    plt.figure()
    plt.axhline(0, color='k')
    first = int(total[0])
    second = int(total[1])
    
    if(first==0):
    	plt.title(canser.index[int(second)])
    	sns_plot = canser.iloc[int(second)].plot.bar()
    elif(first==1):
	    plt.title(canser.columns[int(second)])
	    sns_plot = canser.iloc[:,int(second)].plot.bar()
    	
    fig = sns_plot.get_figure()
    plt.show();
    last = str(second)
    if(first==0):
	    fig.savefig('./src/main/webapp/resources/images/static/output_ill'+last+'.png')
    elif(first==1):
	    fig.savefig('./src/main/webapp/resources/images/static/output_city'+last+'.png')
    return (total)

# Start process
if __name__ == '__main__':
    main()





