#!/bin/bash
#Implantation des variables pour le stock
touilette=$(cat < touilette.txt)
sucre=$(cat < sucre.txt)
eau=$(cat < eau.txt)
gobelet=$(cat < gobelet.txt)
grand_gobelet=$(cat < grand_gobelet.txt)
cafe=$(cat < cafe.txt)
chocolat=$(cat < chocolat.txt)
the=$(cat < the.txt)
vente=$(cat < compteur.txt)
cafe () {
case $choix_cafe in
        1)
                echo "Vous avez choisi Café court"
                prix=1
                sleep .5s
		tasse 
		;;
	2)
		echo "Vous avez choisi Café long"
		prix=2
		sleep .5s
		tasse
		;;
	3)
		echo "Vous avez choisi Nespresso, What else ?"
		prix=3
		sleep .5s
		tasse
		;;
	*)
		echo "Erreur, retour au menu"
		sleep .5s
		menu
		;;
esac
}
chocolat () {
case $choix_chocolat in
	1)
		echo " Vous avez choisi Chocolat au lait"*
		prix=1
		sleep .5s
		tasse 
		;;
	2)
		echo "Vous avez choisi Chocolat fort"
		prix=2
		sleep .5s
		tasse
		;;
	3)
		echo "Vous avez choici Chocolat concentré cacao"
		prix=3
		sleep .5s
		tasse
		;;
	*)
		echo "Erreur, retour au menu"
		sleep .5s
		menu
		;;

esac
}

the () {
case $choix_the in
	1)
		echo "Vous avez choisi Thé à la menthe"
		prix=1
		sleep .5s
		tasse
		;;
	2)
		echo "Vous avez choisi Thé noir"
		prix=2
		sleep .5s	
		tasse
		;;
	3)
		echo "Vous avez choisi Thé au citron/gimgembre"
		prix=3
		sleep .5s
		tasse
		;;
	*)
		echo "Erreur, retour au menu"
		sleep .5s
		menu
		;;

esac
}

tasse () {        
if [ $argent -lt $prix ]
then
	echo "Vous n'avez pas assez d'argent, veuillez refaire votre choix."
	choix_paiement
else
	
read -p "Avez vous une tasse ? (Oui/Non/m pour retour au menu)" tasse
sleep .5s
case $tasse in
        Oui)
                echo "Vous avez votre tasse"
		read -p "Voulez-vous du sucre ?(Oui)" choix_sucre
	case $choix_sucre in
		Oui)
			sucre;;
		*)
			echo "Vous n'avez pas pris de sucre"
			sleep .5s
			recap
			;;
			
	esac
	;;
		
	
	Non)
              echo "Un goletet va être insérer"
	      read -p "Voulez-vous du sucre ? (Oui)" choix_sucre
	case $choix_sucre in
                Oui)
                        sleep .5s
			sucre;;
                *)
                        echo "Vous n'avez pas pris de sucre"
        		sleep .5s
			recap
			;;
	esac
	;;

        m)
                echo "Retour au menu"
		sleep .5s
                menu;;
       
	*)
                echo "Erreur, veuillez réessayer"
                sleep .5s
	       	tasse;;
esac
fi
}
sucre () {
echo "Quelle quantité de sucre souhaitez-vous ?"

echo "1 : 4g"
echo "2 : 8g"
echo "3 : 12g"
echo "4 : 16g"
echo "m : Retour au menu"
read nb_sucre

case $nb_sucre in
	1) 
		if [ $sucre > 0 ]
		then
			echo "Vous avez choisi 4g de sucre(1 portion)."
			sucre=$(($sucre - $nb_sucre ))
			echo "$sucre" > sucre.txt
			sleep .5s
			recap
		else
			echo "Il n'y a plus de sucre, retour au menu"
			sleep .5s
			menu
		fi
		;;
        2)
		if [ $sucre > "1" ] && [ $touilette > "0" ]
		then
			echo "Vous avez choisi 8g de sucre(2 portions)."
        		sucre=$(($sucre - $nb_sucre ))
                	echo "$sucre" > sucre.txt
			sleep .5s
			echo "Une touilette est livrée"
			touilette=$(($touilette - 1))
			echo "$touilette" > touilette.txt
			sleep .5s
			recap
		elif [ $sucre > "1" ] && [ $touilette = "0" ]
		then
			echo "Vous avez choisi 8g de sucre(2 portions)."
                        sucre=$(($sucre - $nb_sucre ))
                        echo "$sucre" > sucre.txt
                        sleep .5s
			echo "Il n'y a plus de touilette, navré."
			sleep .5s
			recap
		elif [ $sucre = "0" ]
		then
			echo "Il n'y a plus de sucre, retour au menu"
			sleep .5s
			menu
		fi
		;;
			
	3)
		echo "Vous avez choisi 12g de sucre(3 portions)."
		sucre=$(($sucre - $nb_sucre ))
                echo "$sucre" > sucre.txt
		sleep .5s
		echo "Une touilette est livrée"
		touilette=$(($touilette - 1))
		echo "$touilette" > touilette.txt
		sleep .5s
		recap;;
        4)
		echo "Vous avez choisi 16g de sucre(4 portions)."
		sucre=$(($sucre - $nb_sucre ))
                echo "$sucre" > sucre.txt
		sleep .5s
		echo "Une touilette est livrée"
                touilette=$(($touilette - 1))
		echo "$touilette" > touilette.txt
		sleep .5s
		recap;;
		
	m)
		sleep 1s
		menu ;;	
	*)
                echo "Choix invalide, réessayer"
		sucre
		;;
esac


}


recap () {

if [ $choix_sucre != "Oui" ]
then
	if [ $choix = "1" ]
	then
		if [ $choix_cafe = "1" ]
		then
			echo "Vous avez commandé un café court"
			gobelet
		elif [ $choix_cafe = "2" ]
		then
			echo "Vous avez commandé un café long"
			gobelet
		elif [ $choix_cafe = "3" ]
		then
			echo "Vous avez commandé un Nespresso"
			gobelet
		fi
	elif [ $choix = "2" ]
	then
		if [ $choix_chocolat = "1" ]
		then
			echo "Vous avez commandé un chocolat au lait"
			gobelet
		elif [ $choix_chocolat = "2" ]
		then
			echo "Vous avez commandé un chocolat fort"
			gobelet
		elif [ $choix_chocolat = "3" ]
		then
			echo "Vous avez commandé un chocolat concentré en cacao"
			gobelet
		fi
	elif [ $choix = "3" ]
	then
		if [ $choix_the = "1" ]
		then
			echo "Vous avez commandé un thé à la menthe"
			gobelet
		elif [ $choix_the = "2" ]
		then
			echo "Vous avez commandé un thé noir"
			gobelet
		elif [ $choix_the = "3" ]
		then
			echo "Vous avez commandé un thé au citron/gingembre"
			gobelet
		fi
	fi
else	
	if [ $choix = "1" ]
	then
	        if [ $choix_cafe = "1" ]
	        then
			echo "Vous avez commandé un café court avec $nb_sucre portion(s) de sucre"
	       		gobelet
	       	elif [ $choix_cafe = "2" ]
	        then
			echo "Vous avez commandé un café long avec $nb_sucre portion(s) de sucre"
	        	gobelet
		elif [ $choix_cafe = "3" ]
	        then
			echo "Vous avez commandé un Nespresso avec $nb_sucre portion(s) de sucre"
	        	gobelet
		fi
	elif [ $choix = "2" ]
	then
	        if [ $choix_chocolat = "1" ]
	        then
			echo "Vous avez commandé un chocolat au lait avec $nb_sucre portion(s) de sucre"
	        	
			gobelet
		elif [ $choix_chocolat = "2" ]
	        then
			echo "Vous avez commandé un chocolat fort avec $nb_sucre portion(s) de sucre"
	        	gobelet
		elif [ $choix_chocolat = "3" ]
	        then
			echo "Vous avez commandé un chocolat concentré en cacao avec $nb_sucre portion(s) de sucre"
	        	gobelet
		fi
	elif [ $choix = "3" ]
	then
	        if [ $choix_the = "1" ]
	        then
			echo "Vous avez commandé un thé à la menthe avec $nb_sucre portion(s) de  sucre"
	        	gobelet
		elif [ $choix_the = "2" ]
	        then
			echo "Vous avez commandé un thé noir avec $nb_sucre portion(s) de sucre"
	        	gobelet
		elif [ $choix_the = "3" ]
	        then
			echo "Vous avez commandé un thé au citron/gingembre avec $nb_sucre portion(s) de sucre"
			gobelet
	        fi
	fi 
fi

}
gobelet () {

case $tasse in
	Oui)
		echo "Vous avez votre propre tasse"
		fin	
	;;
	Non)
		read -p "Quel taille de gobelet souhaitez vous ?
			- Petite taille : 1
			- Grande taille : 2" taille_gobelet
			case $taille_gobelet in
				1)
					gobelet=$(($gobelet-1))
					echo "$gobelet" > gobelet.txt
					echo "Vous avez choisi un gobelet de petite taille."
					;;
				2)
					grand_gobelet=$(($grand_gobelet-1))
					echo "$grand_gobelet" > grand_gobelet.txt
					echo "Vous avez choisi un gobelet de grande taille."
					;;
				*)
					gobelet
					;;
		
			esac 
		conso	
	;;
esac

}
conso () {

case $choix in
	1)
		case $choix_cafe in
			1)
				echo "Le prix est de 1€"
				cafe=$(($cafe-1))
				echo "$cafe" > cafe.txt
				eau=$(($eau-1))
				echo "$eau" > eau.txt
				fin
				;;
			2) 
				
				echo "Le prix est de 2€"
				cafe=$(($cafe-1))
				echo "$cafe" > cafe.txt
				eau=$(($eau-2))
				echo "$eau" > eau.txt
				fin

				;;
			3)
				echo "Le prix est de 3€"
				cafe=$(($cafe-2))
				echo "$cafe" > cafe.txt
				eau=$(($eau-1))
				echo "$eau" > eau.txt
				fin
				;;
		esac
		
	;;
	2)
		case $choix_chocolat in
			1)
				echo "Le prix est de 1€"
				chocolat=$(($chocolat-1))
				echo "$chocolat" > chocolat.txt
				eau=$(($eau-1))
				echo "$eau" > eau.txt
				fin
				;;
			2)
				echo "Le prix est de 2€"
				chocolat=$(($chocolat-2))
				echo "$chocolat" > chocolat.txt
				eau=$(($eau-1))
				echo "$eau" > eau.txt
				fin
				;;
			3)
				echo "Le prix est de 3€"
				chocolat=$(($chocolat-3))
				echo "$chocolat" > chocolat.txt
				eau=$(($eau-1))
				echo "$eau" > eau.txt
				fin
				;;
		esac
					
	;;
	3)
		case $choix_the in
			1)
				echo "Le prix est de 1€"
				the=$(($the-1))
				echo "$the" > the.txt
				eau=$(($eau-1))
				echo "$eau" > eau.txt
				fin
				;;
			2)
				echo "Le prix est de 2€"
				the=$(($the-1))
				echo "$the" > the.txt
				eau=$(($eau-1))
				echo "$eau" > eau.txt
				fin
				;;
			3)
				echo "Le prix est de 3€"
				the=$(($the-2))
				echo "$the" > the.txt
				eau=$(($eau-1))
				echo "$eau" > eau.txt
				fin
				;;
		esac
	;;
esac

}


espece () {
read -p "Veuillez insérer votre espèce, 20€ maximum." espece
case $espece in
	[1-9]|1[0-9]|2[0])
		echo "Vous avez insérer $espece €"
		argent=$espece
		menu
		;;
	*) 
		echo "Erreur, veuillez réessayer"
		espece
		;;
esac
}


choix_paiement=0
choix_paiement () {

if [ -z "$choix_paiement" ]
then
	echo "Quel est votre moyen de paiement ?"
	echo "1 : Espèces"
	echo "2 : Carte bancaire"
	echo "x : Quitter"
	read choix_paiement
elif [ "$choix_paiement" = "1" ]
then
       	echo "Voici votre monnaie, $rendu € rendu"
        sleep .5s
        argent=0
       	echo "Quel est votre moyen de paiement ?"
        echo "1 : Espèces"
        echo "2 : Carte bancaire"
        echo "x : Quitter"
        read choix_paiement
else
	echo "Quel est votre moyen de paiement ?"
        echo "1 : Espèces"
        echo "2 : Carte bancaire"
        echo "x : Quitter"
        read choix_paiement

fi
case $choix_paiement in
	1)	
		espece
		;;
	2)
		echo "Vous avez choisi de payer par carte bancaire. Une empreinte de 5€ sera retenu"
		argent=5
		sleep .5s
		menu
		;;
	
	x)
		echo "Merci de votre visite, à bientôt."
		exit
		;;
	
	tech)
		echo "Technicien reconnu, redirection vers l'interface de gestion."
		echo "Merci de patienter"
		sleep 2s
		technicien
		;;
	*)
		echo "Erreur, veuillez réessayer"
		sleep .5s
		choix_paiement
		;;

esac
}		
menu () {

#while [ $choix != "1" ] && [ $choix != "2" ] && [ $choix != "3" ] && [ $choix != "x" ]
#do
	echo "Menu"
	echo "Faites votre choix"
	echo "Café : 1"
	echo "Chocolat : 2"
	echo "Thé : 3"
	echo "Changer de moyen de paiement : p"
	echo "Quitter : x"
read choix
#done

case $choix in
	1)

		echo "Vous avez choisi Café, Quel type de café souhaitez-vous ?"
		echo "1 : Café court : 1€"
		echo "2 : Café long  : 2€"
		echo "3 : Nespresso  : 3€"
		read choix_cafe
		cafe
		;;

	2)
		echo "Vous avez choisi Chocolat. Quel type de chocolat souhaitez-vous ?"
		echo "1: Chocolat au lait : 1€"
		echo "2: Chocolat fort   : 2€"
		echo "3: Chocolat concentré cacao : 3€"
		read choix_chocolat
		chocolat;;
	3)
		echo "Vous avez choisi Thé. Quel type de thé souhaitez-vous ?"
		echo "1: Thé à la menthe : 1€"
		echo "2: Thé noir : 2€"
		echo "3: Thé au citron-gimgembre :3€"
		read choix_the		
		the;;
	x) 
	
		echo "Vous allez sortir du menu"
		exit;;
	p)
		rendu=$argent
		sleep .5s
		choix_paiement
		;;
	*) 	
		echo " Choix invalide, retour au menu"
		menu
		;;
esac


}

fin () {

vente=$(($vente+1))
echo "$vente" > compteur.txt

rendu=$(($argent-$prix))	

echo "Votre boisson se prépare avec les livrables demandés."
sleep 2s
echo "Voici votre boisson."

case $taille_gobelet in
	1)
		case $choix in
			1)
				case $choix_cafe in
					2)
						echo "Ton café déborde pauvre fou"
					;;
					*)
						echo ""
					;;
				esac
			
				;;
			2)
				echo "Ton chocolat déborde pauvre fou"
		
				;;
			3)
			echo "Ton thé déborde pauvre fou"
		
				;;

		esac
		;;
	*)
		echo ""
		;;
esac
read -p "Souhaitez-vous commander un autre produit(O/N) ?" produit
case $produit in
	O)

		case $choix_paiement in
		1)
			choix_paiement
			;;
		2)
			echo "CB, il vous reste : $rendu €"
			choix_paiement
			;;
		esac	
	;;

	*)
		case $choix_paiement in
		1)
			echo "Voici votre monnaie $rendu €"
			exit
			;;
		2)
			echo "Il vous reste $rendu €"
			exit
			;;
		esac
	;;
esac
}

technicien () {
	echo "Mode technicien"
	echo " -------------"
	echo "Quel action désirez-vous effectuer ?"
	echo "1 : Consulter les stocks"
	echo "2 : Approvisionner la machine"
	echo "3 : Consulter le nombre de vente"
	echo "4 : Réinitialiser le compteur des ventes"
	echo "5 : Sortir du mode technicien"
	read choix_tech

case $choix_tech in
	
	1)
		echo "Voici tout les stocks restants(en portions)"
		echo "-----"
		echo "Eau : $eau"
		echo "Café : $cafe"
		echo "Chocolat : $chocolat"
		echo "Thé : $the"
		echo "Sucre : $sucre"
		echo "Gobelets : $gobelet gobelet(s) et $grand_gobelet grand(s) gobelet(s)"
		echo "Touilettes : $touilette"
		echo " -----"
		echo "Redirection vers le menu technicien dans 3 secondes"
		sleep 3s
		technicien
		;;	
	
	2)
		echo "Quel stocks voulez vous réapprovisionner ?"
		echo "-------"
		echo "1 : Eau"
		echo "2 : Café"
		echo "3 : Chocolat"
		echo "4 : Thé"
		echo "5 : Sucre"
		echo "6 : Gobelets"
		echo "7 : Touilettes"
		echo "x : Revenir au menu technicien"
		read appro
		case $appro in
			1)
				echo "Il reste $eau portions d'eau"
				read -p "Indiquez le montant réapprovisionner" peau
				eau=$(($eau + $peau))
				echo "$eau" > eau.txt
				echo "$peau portions ajoutées."
				technicien
				;;
			2)
				echo "Il reste $cafe portions de café"
				read -p "Indiquez le montant réapprovisionner" pcafe
				cafe=$(($cafe + $pcafe))
				echo "$cafe" > cafe.txt
				echo "$pcafe portions ajoutées."
				technicien
				;;
			3)
				echo "Il reste $chocolat portions de chocolat"
				read -p "Indiquez le montant réapprovisionner" pchoco
				chocolat=$(($chocolat + $pchoco))
				echo "$chocolat" > chocolat.txt
				echo "$pchoco portions ajoutées."
				technicien
				;;
			4)
				echo "Il reste $the portions de thé"
				read -p "Indiquez le montant réapprovisionner" pthe
				the=$(($the + $pthe))
				echo "$the" > the.txt
				echo "$pthe portions ajoutées."
				technicien
				;;
			5)
				echo "Il reste $sucre portions de sucre"
				read -p "Indiquez le montant réapprovisionner" psucre
				sucre=$(($sucre + $psucre))
				echo "$sucre" > sucre.txt
				echo "$psucre portions ajoutées."
				technicien
				;;
			6)
				echo "Il reste $gobelet gobelet(s) et $grand_gobelet grand(s) gobelet(s)"
				echo "Souhaitez vous réapprovisionner en gobelets ou grand gobelets ?"
				echo "1 : Gobelet"
				echo "2 : Grand gobelets"
				read confgob
				case $confgob in
					1)
						read -p "Indiquez le montant de gobelets à réapprovisionner" pgob
						gobelet=$(($gobelet + $pgob))
						echo "$gobelet" > gobelet.txt
						echo "$pgob gobelet ont été ajoutés."
						;;
					2)
						read -p "Indiquez le montant de grands gobelets à réapprovisionner" pggob
						grand_gobelet=$(($grand_gobelet + $pggob))
						echo "$grand_gobelet" > grand_gobelet.txt
						echo "$pggob grands gobelets ont été ajoutés."
						;;
					*)
						echo "Erreur, retour au menu technicien"
						technicien
						;;
				esac
				technicien
				;;
			7)
				echo "Il reste $touilette touilette(s)"
				read -p "Indiquez le montant réapprovisionner" ptouil
				touilette=$(($touilette + $ptouil))
				echo "$touilette" > touilette.txt
				echo "$ptouil touilettes ont été ajoutées."
				technicien
				;;
			x)
				echo "Retour au menu techicien"
				technicien
				;;

		
		esac
			;;
		3)
			echo "Il y a eu $vente ventes réalisées tout produits confondues."	
			sleep 2s
			technicien
		
			;;
		
		4)	
			echo "0" > compteur.txt
			echo "Les ventes sont réinitialiées à 0."
			sleep 0.5s
			technicien	
			;;
		5)
			echo "Redirection vers le menu utilisateur"
			sleep 1s
			choix_paiement
			;;

esac
}
choix_paiement
