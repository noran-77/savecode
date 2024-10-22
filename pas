import streamlit as st
import re

def check_password_strength(password):
    if len(password) < 8:
        return "كلمة المرور ضعيفة: يجب أن تكون 8 أحرف على الأقل."
    if not re.search(r'[A-Z]', password):
        return "كلمة المرور ضعيفة: يجب أن تحتوي على حرف كبير واحد على الأقل."
    if not re.search(r'[a-z]', password):
        return "كلمة المرور ضعيفة: يجب أن تحتوي على حرف صغير واحد على الأقل."
    if not re.search(r'[0-9]', password):
        return "كلمة المرور ضعيفة: يجب أن تحتوي على رقم واحد على الأقل."
    if not re.search(r'[!@#$%^&*(),.?\":{}|<>]', password):
        return "كلمة المرور ضعيفة: يجب أن تحتوي على رمز خاص واحد على الأقل."
    return "كلمة المرور قوية!"

st.title("تقييم قوة كلمة المرور")

# إدخال كلمة المرور من المستخدم
password = st.text_input("أدخل كلمة المرور", type="password")

if st.button("تحقق"):
    if password:
        result = check_password_strength(password)
        st.write(f"النتيجة: {result}")
    else:
        st.write("يرجى إدخال كلمة المرور.")
