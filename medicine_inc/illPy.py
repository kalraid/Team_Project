
# coding: utf-8

# In[79]:

#자료 처리용 임포트
import pandas as pd
import numpy as np

#시각화용 임포트
import matplotlib.pyplot as plt

#자료 위치 찾기용
import os
import sys
import json

# In[80]:

data = pd.read_excel('ill.xlsx')
data.index.name="Disease"
data.columns.name="City"
canser = data.iloc[1:,1:]
canser_name = canser.index
city = canser.columns
canser_value = canser.values
print(type(data))
canser.head()
canser.shape


# In[81]:

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


# In[82]:

def makeHisto(args1):
    plt.gcf().clear()
    plt.figure()
    canser.index
    plt.axhline(0, color='k')
    plt.title(args1)
    sns_plot = canser[args1].plot.bar()
    fig = sns_plot.get_figure()
    plt.show()
    fig.savefig('output.png') 


# In[83]:

def main():
	#makeHisto(args1)
		while True: 
			 command = sys.stdin.readline() 
			 command = command.split('\n')[0] 
			 if command == "hello": 
			 	sys.stdout.write("You said hello!\n") 
			 elif command == "goodbye": 
			 	sys.stdout.write("You said goodbye!\n") 
			 else: 
			 	sys.stdout.write("Sorry, I didn't understand that.\n") 
			 sys.stdout.flush() 

# In[86]:

def read_in():
    lines = sys.stdin.readlines()
    # Since our input would only be having one line, parse our JSON data from that
    return json.loads(lines)


# In[87]:

if __name__ == "__main__":
    # execute only if run as a script
    lines = read_in()
    main()
    print(os.getcwd())

