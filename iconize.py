from PIL import Image

# Carica le tue tre immagini PNG
img_256 = Image.open("iconaNotepadClone_256.png")
img_128 = Image.open("iconaNotepadClone_128.png")
img_64 = Image.open("iconaNotepadClone_64.png")

# Salva l'immagine più grande includendo le altre come formati alternativi
img_256.save(
    "icona_lazarus.ico", 
    format="ICO", 
    sizes=[(256, 256), (128, 128), (64, 64)],
    append_images=[img_256,img_128, img_64]
)
