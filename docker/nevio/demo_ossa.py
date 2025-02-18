import os
import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.models as models
import torchvision.transforms as transforms
import numpy as np
import matplotlib.pyplot as plt
import cv2
from PIL import Image

# Controllo del dispositivo disponibile (GPU o CPU)
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f"Utilizzando il dispositivo: {device}")

# Caricamento modello pre-addestrato VGG16
print("Caricamento modello VGG16 pre-addestrato...")
model_ft = models.vgg16(weights='IMAGENET1K_V1')

# Congelamento dei layer convoluzionali
for param in model_ft.parameters():
    param.requires_grad = False

# Modifica dell'ultimo layer per 5 classi (placeholder)
n_inputs = model_ft.classifier[6].in_features
model_ft.classifier[6] = nn.Linear(in_features=n_inputs, out_features=5)

# Sposta il modello su GPU se disponibile
model_ft = model_ft.to(device)
print("Modello VGG16 pronto per la classificazione su 5 classi.")

# Interruzione per mancanza del dataset
print("\n--- Fine Demo ---")
exit()
