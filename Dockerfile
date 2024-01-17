# ใช้ภาพ base image ที่มี Python
FROM python:3.8

# ตั้งค่าตัวแปรสภาพแวดล้อม
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# ติดตั้ง dependencies ที่จำเป็น
RUN apt-get update && apt-get install -y \
    postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# สร้างและตั้งค่าไดเรกทอรีทำงาน
RUN mkdir /app
WORKDIR /app

# คัดลอกไฟล์ requirements.txt เพื่อติดตั้ง dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# คัดลอกโปรเจกต์ Django ไปยังไดเรกทอรีทำงาน
COPY . /app/

# เปิด Port ที่ Django ใช้ # คือ port ของ nginx 80
EXPOSE 80

# สั่งให้ Django รันโปรเจกต์
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
