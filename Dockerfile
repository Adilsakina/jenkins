FROM maven AS run
WORKDIR /app
COPY . /app
WORKDIR /app
RUN mvn clean package

