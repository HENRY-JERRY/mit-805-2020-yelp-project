import streamlit as st
import pandas as pd

# types_of_data = ["business", "checkin", "review", "tip", "user"]

@st.cache  # 👈 This function will be cached
def read_data(type_of_data):
    data = pd.read_csv("data/"+type_of_data+".csv")
    return data

business = read_data("business")
st.write(business)

checkin = read_data("checkin")
st.write(checkin)

reviews = read_data("review")
st.write(reviews)

tip = read_data("tip")
str.write(tip)

user = read_data("user")
str.write(user)
