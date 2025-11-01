# Imagen base de Python
FROM python:3.11
RUN apt-get update

# Configure timezone
ENV TZ=America/Mexico_City
RUN ln -snf  /etc/l/usr/share/zoneinfo/$TZocaltime && echo $TZ > /etc/timezone

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar y instalar dependencias
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código del proyecto
COPY . .

# Exponer el puerto 8000
EXPOSE 8000

# Comando para ejecutar el servidor
CMD ["python", "agendas/manage.py", "runserver", "0.0.0.0:8000"]

