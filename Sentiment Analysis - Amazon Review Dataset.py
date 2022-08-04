#!/usr/bin/env python
# coding: utf-8

# In[1]:


#Importing nltk for doing Sentiment Analysis
import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer


# In[3]:


import pandas as pd
import matplotlib.pyplot as plt


# In[4]:


#Importing DataSet
df=pd.read_csv("c:\\amazonReviews.csv")


# In[5]:


#Describing Entire Data
df.describe()


# In[6]:


#Getting Info including Column wise non null counts and Data types
df.info()


# In[7]:


df.head()


# In[8]:


#Visualising the Overall Rating via Pie Chart
fig=plt.figure()
ax=fig.add_axes([1,1,2,2])
ax.set_title("Rating Pie Chart")
x=df["overall"].value_counts()
y=x.index
z=x.values
ax.pie(z,labels=y)
plt.show()


# In[9]:


#Dropping NA values
df=df.dropna()


# In[10]:


#Sentiment Analysis
sid=SentimentIntensityAnalyzer()


# In[11]:


df["Positive"]=[sid.polarity_scores(i)["pos"] for i in df["reviewText"]]


# In[12]:


df["Negative"]=[sid.polarity_scores(i)["neg"] for i in df["reviewText"]]
df["Neutral"]=[sid.polarity_scores(i)["neu"] for i in df["reviewText"]]


# In[13]:


df.head()


# In[14]:


#Getting Total of Responses
a=sum(df["Positive"])
b=sum(df["Negative"])
c=sum(df["Neutral"])


# In[15]:


#Finding out the overall response
if a>b and a>c:
    print("The Overall Review is Positive with Value:",a)
elif b>a and b>c:
    print("The Overall Review is Negative with Value:",b)
else:
    print("The Overall Review is Neutral with Value:",c)


# In[16]:


#Printing Response wise total Score
print("Positive Score-",a)
print("Negative Score-",b)
print("Neutral Score-",c)


# In[ ]:




