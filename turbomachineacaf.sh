#!/bin/bash
touilette=$(cat < touilette.txt)

cafe () {
case $choix_cafe in
        1)
                echo "Vous avez choisi Nespresso"
                tasse 
		;;
esac
}
chocolat () {
echo " Vous êtes dans chocolat"
}
the () {
echo " Vous êtes dans the"


}	
tasse () {        
	
read -p "Avez vous une tasse ? (Oui/Non/m pour retour au menu)" tasse

case $tasse in
        Oui)
                echo "Vous avez votre tasse"
		read -p "Voulez-vous du sucre ?(Oui)" choix_sucre
	case $choix_sucre in
		Oui)
			sucre;;
		*)
			echo "Vous n'avez pas pris de sucre";;
	esac
	;;
		
	
	Non)
              echo "Un goletet va être insérer"
	      read -p "Vous-vous du sucre ? (Oui)" choix_sucre
	case $choix_sucre in
                Oui)
                        sucre;;
                *)
                        echo "Vous n'avez pas pris de sucre";;
        esac
	;;

        m)
                echo "Retour au menu"
                menu;;
       
	*)
                echo "Erreur, veuillez réessayer"
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
read sucre

case $sucre in
	1) 
		echo "Vous avez choisi 4g de sucre.";;
        2)
                echo "Vous avez choisi 8g de sucre."
        	echo "Une touilette est livrée"
		touilette=$(($touilette - 1))
		echo "$touilette" > touilette.txt
		;;
	3)
                echo "Vous avez choisi 12g de sucre.";;
        4)
                echo "Vous avez choisi 16g de sucre.";;
	m)
		menu ;;	
	*)
                echo "Choix invalide, réessayer";;


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
	echo "Quitter : x"
read choix
#done

case $choix in
	1)

		echo "Vous avez choisi Café, Quel type de café souhaitez-vous ?"
		echo "1 :  Nespresso : 1€"
		echo "2 : Café long : 2€ "
		echo "3 : Café court : 3€"
		read choix_cafe
		cafe
		;;

	2)
		echo "Vous avez choisi Chocolat. Quel type de chocolat souhaitez-vous ?"
		
		chocolat;;
	3)
		echo "Vous avez choisi Thé."
		
		
		the;;
	x) 
	
		echo "Vous allez sortir du menu"
		exit;;
		
	*) 	
		echo " Choix invalide, retour au menu"
		menu
		;;
esac

}
menu

			
