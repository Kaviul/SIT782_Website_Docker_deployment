FROM python:3.9

WORKDIR /website

COPY website .
COPY requirements.txt .


# install python dependencies
# RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install django
# RUN pip install shell


# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# running migrations
RUN python manage.py migrate

EXPOSE 8000

# gunicorn
# CMD ["gunicorn", "--config", "gunicorn-cfg.py", "core.wsgi"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



