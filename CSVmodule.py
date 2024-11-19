###Ce module regroupe des fonctions pour traiter des fichiers CSV###
def return_list_from_csv(file_name):
# Ouverture du fichier en lecture mode binaire
	data_pool_file = open(file_name, "r")
	data_list = data_pool_file.readlines()
	data_pool_file.close()
	return data_list

def write_list_in_csv(liste_supp):
# Ouverture du fichier en lecture mode append
	sup_list_file = open("ListeSup.txt", "a")
	for site in liste_supp:
		sup_list_file.write(site + "\n")
	sup_list_file.close()

def clear_file (file_name):
# Ouverture du fichier en lecture mode write
	open(file_name, "w").close

if __name__ == "__main__":
	import os
	clear_file("ListeSup.txt")
	os.system("pause")