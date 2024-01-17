# django-todo-app
A Smple Todo App developed by Django Framework



python manage.py dumpdata > datadump.json #backup database

python manage.py loaddata datadump.json #tranfer database

python manage.py migrate #migrate ลง database

python manage.py runserver #Lunch

docker run -d --name django_todol -p 8000:8111 mydjangoapp:v1  #docker run image v1
