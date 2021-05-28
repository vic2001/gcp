from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


# Peut se connecter en tant que client, commander en ligne, valider sa commande
class Client(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="client", verbose_name="client" )

    class meta:
        ordering = ['username']
        
    def __str__(self):
        return self.username

    
# commerçant peut créer/modifier/supprimer enseigne, créer/modifier/article dans enseigne
class Commercant(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="commercant", verbose_name="commerçant")
    siret = models.CharField(max_length=14)
    iban = models.CharField(max_length=15)
    
    class meta:
        ordering = ['username']
        
    def __str__(self):
        return self.user.username
    

    
#Pour l'instant je n'implémente pas la classe livreur, on verra après si c'est nécessaire

#classe enseigne: un commerçant peut créer plusieurs boutiques en ligne
class Enseigne(models.Model):
    commercant = models.ManyToManyField(Commercant)
    nom = models.CharField(max_length=100)
    type = models.CharField(max_length=100)
    description = models.TextField()
    photo = models.ImageField(upload_to='images/')
    
    def __str__(self):
        return self.nom

#classe article: une enseigne peut proposer plusieurs articles
class Article(models.Model):
    enseigne = models.ManyToManyField(Enseigne)
    designation = models.CharField(max_length=100)
    categorie = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    prix = models.FloatField()
    photo = models.ImageField(upload_to='images/')
    
    def __str__(self):
        return self.designation
    
    
# Une commande se compose de différents articles appartenat à la même enseigne
class Commande(models.Model):
    articles = models.ManyToManyField(Article)
    num_cde = models.CharField(max_length=20, verbose_name="N° de commande")
    date_cde = models.DateField(verbose_name="Date commande")
    heure_cde = models.TimeField()
    client = models.ForeignKey(Client, on_delete=models.CASCADE) #si le client est supprimé, la commande l'est également
    enseigne = models.ForeignKey(Enseigne, on_delete=models.CASCADE)

# classe Adrese: une adresse peut correspondre à plusieurs clients/un client peut aoir plusieurs adresse
# 
class Adresse(models.Model):
    client = models.ForeignKey(Client, blank=True, null=True, on_delete=models.CASCADE) # le champ peut être vide
    enseigne = models.ForeignKey(Enseigne, on_delete=models.CASCADE, blank=True, null=True)
    rue = models.CharField(max_length=250)
    cp = models.CharField(max_length=10, verbose_name="Code postale")
    ville = models.CharField(max_length=100)
    etage = models.IntegerField(blank=True, null=True)
    comp_adr = models.TextField(verbose_name="Complément adresse", blank=True, null=True)
    tel = models.CharField(max_length=10, verbose_name="Téléphone", null=True, blank=True)
    
    def __str__(self):
        return f"{self.rue} - {self.cp} {self.ville}"
    
