# Usa l'immagine ufficiale di PyTorch con supporto CUDA
FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

# Imposta la cartella di lavoro nel container
WORKDIR /app

# Copia il file dello script demo nel container
COPY demo_ossa.py /app/demo_ossa.py

# Aggiorna apt e installa le librerie mancanti per OpenCV
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Aggiorna pip e forza l'uso di NumPy 1.x
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir "numpy<2" pandas matplotlib scipy opencv-python \
    pillow regex torchvision scikit-learn

# Imposta il comando di default
CMD ["python", "/app/demo_ossa.py"]
