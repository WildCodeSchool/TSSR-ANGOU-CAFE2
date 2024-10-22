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
vente=$(wc -l < compteur.txt)
technicien () {
	echo "Mode technicien"
	echo " -------------"
	echo "Quel action désirez-vous effectuer ?"
	echo "1 : Consulter les stocks"
	echo "2 : Approvisionner la machine"
	echo "3 : Consulter le nombre de vente"
	echo "4 : Sortir du mode technicien"
	read choix_tech

case $choix_tech in
	
	1)
		echo "Voici tout les stocks restants(en portions)"
		echo "-----"
		echo "Eau : $eau"
		echo " Café : $cafe"
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
						gobelet=$(($gobelet + $pgod))
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
			echo "Redirection vers le menu utilisateur"
			sleep 1s
			choix_paiement
			;;

esac
}
cafe () {
case $choix_cafe in
        1)
                echo "Vous avez choisi Café court"
                sleep .5s
		tasse 
		;;
	2)
		echo "Vous avez choisi Café long"
		sleep .5s
		tasse
		;;
	3)
		echo "Vous avez choisi Nespresso, What else ?"
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
		echo " Vous avez choisi Chocolat au lait"
		sleep .5s
		tasse 
		;;
	2)
		echo "Vous avez choisi Chocolat fort"
		sleep .5s
		tasse
		;;
	3)
		echo "Vous avez choici Chocolat concentré cacao"
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
		sleep .5s
		tasse
		;;
	2)
		echo "Vous avez choisi Thé noir"
		sleep .5s	
		tasse
		;;
	3)
		echo "Vous avez choisi Thé au citron/gimgembre"
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
	      read -p "Vous-vous du sucre ? (Oui)" choix_sucre
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
		echo "Vous avez choisi 4g de sucre(1 portion)."
		sucre=$(($sucre - $nb_sucre ))
		echo "$sucre" > sucre.txt
		sleep .5s
		recap;;
        2)
		echo "Vous avez choisi 8g de sucre(2 portions)."
        	sucre=$(($sucre - $nb_sucre ))
                echo "$sucre" > sucre.txt
		sleep .5s
		echo "Une touilette est livrée"
		touilette=$(($touilette - 1))
		echo "$touilette" > touilette.txt
		sleep .5s
		recap;;
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
		elif [ $choix_cafe = "2" ]
		then
			echo "Vous avez commandé un café long"
		elif [ $choix_cafe = "3" ]
		then
		echo "Vous avez commandé un Nespresso"
		fi
	elif [ $choix = "2" ]
	then
		if [ $choix_chocolat = "1"]
		then
			echo "Vous avez commandé un chocolat au lait"
		elif [ $choix_chocolat = "2" ]
		then
			echo "Vous avez commandé un chocolat fort"
		elif [ $choix_chocolat = "3" ]
		then
			echo "Vous avez commandé un chocolat concentré en cacao"
		fi
	elif [ $choix = "3" ]
	then
		if [ $choix_the = "1" ]
		then
			echo "Vous avez commandé un thé à la menthe"
		elif [ $choix_the = "2" ]
		then
			echo "Vous avez commandé un thé noir"
		elif [ $choix_the = "3" ]
		then
			echo "Vous avez commandé un thé au citron/gingembre"
		fi
	fi
else	
	if [ $choix = "1" ]
	then
	        if [ $choix_cafe = "1" ]
	        then
			echo "Vous avez commandé un café court avec $nb_sucre portion(s) de sucre"
	        elif [ $choix_cafe = "2" ]
	        then
			echo "Vous avez commandé un café long avec $nb_sucre portion(s) de sucre"
	        elif [ $choix_cafe = "3" ]
	        then
			echo "Vous avez commandé un Nespresso avec $nb_sucre portion(s) de sucre"
	        fi
	elif [ $choix = "2" ]
	then
	        if [ $choix_chocolat = "1"]
	        then
			echo "Vous avez commandé un chocolat au lait avec $nb_sucre portion(s) de sucre"
	        elif [ $choix_chocolat = "2" ]
	        then
			echo "Vous avez commandé un chocolat fort avec $nb_sucre portion(s) de sucre"
	        elif [ $choix_chocolat = "3" ]
	        then
			echo "Vous avez commandé un chocolat concentré en cacao avec $nb_sucre portion(s) de sucre"
	        fi
	elif [ $choix = "3" ]
	then
	        if [ $choix_the = "1" ]
	        then
			echo "Vous avez commandé un thé à la menthe avec $nb_sucre portion(s) de  sucre"
	        elif [ $choix_the = "2" ]
	        then
			echo "Vous avez commandé un thé noir avec $nb_sucre portion(s) de sucre"
	        elif [ $choix_the = "3" ]
	        then
			echo "Vous avez commandé un thé au citron/gingembre avec $nb_sucre portion(s) de sucre"

	        fi
	fi 
fi

}



espece=0
choix_paiement=0
choix_paiement () {

if [ $choix_paiement = "1" ]
then
	echo "Voici votre monnaie, $espece € rendu"
	sleep .5s
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
	while [ $espece -le 0 ]
	do
		echo "Veuillez insérer votre espèce"
		read espece
	done
		echo "$espece € insérer."
		sleep .5s
		menu
		;;
	2)
		echo "Vous avez choisi de payer par carte bancaire. Une empreinte de 5€ sera retenu"
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
		sleep .5s
		choix_paiement
		;;
	*) 	
		echo " Choix invalide, retour au menu"
		menu
		;;
esac

}
choix_paiement

			
