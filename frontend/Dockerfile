#python image
FROM python:3.7
#Create working directory called /app
WORKDIR /app
COPY ./requirements.txt .
#execture a pip install for all reqs
RUN pip install -r requirements.txt
#copy image to working direcory
COPY . .
#listening port
EXPOSE 5000
#run app
ENTRYPOINT ["python", "app.py"]
