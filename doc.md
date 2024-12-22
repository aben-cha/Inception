* Software :  * App1, App2, App3, ...
              * Operating System(Linux, windows, MacOS).
              * BIOS: Basic Input Output System.
* Hardware: HDD, RAM, CPU, ....
* BIOS: Basic Input Output System, it is a small program, it 
        manages the basic interactions between the hardware and the operating system.
    
==> Comment demarrer plusieurs OS en meme temps dans une meme machine.
    Application de Virtualisation (VMware).

* Virtualisation: faire fonctionner sur une meme machine physique
                  plusieurs Environements comme s'ils fonctionnet dans 
                  plusieurs machines physiques distinctes
* Hyperviseur :(comme VMware, VirtualBox) 
                * Assure le controle des processeurs et des ressources de la
                  machine physique Hote
                * Alloue a chaque machine virtuelle les ressources dont elle a besoin
                * Type : 1- Bare Metal
                         2- Host Metal
* conteneur: enveloppe permettant de packager une application.

===================(Docker)=================
* Docker permet de creer des environemments(appelees containers) de maniere a isoler des applications.
* Docker est un logiciel libre qui permet le depoiement d'aaplications sous
  la forme de conteneurs logiciels. 

===================(Architecture globale de Docker)=================
* Dockerfile: decrire les dependances dont l'application a besoin
* la commande docker-build: permettre de creer une image de l'application 
    * image : * template des conteneurs
            * c'est une ensemble de fichiers, lorsque l'image il est generée par docker
      vous pouver la publier dans ce qu'on appelle un registre docker ca peut etre prive ou public
    * Docker Hub :c'est une platforme publique dans laquelle on peur publier des conteneurs
      a chaque fois 
      ==> a chaque fois que vous creez une application et vous vouler la publier d'une maniere
          publique pour que les autres utilisent directement tout simplement vous utiliser docker-push
    * docker-run permet d'executer une application dans une machine 

====> Docker se compose de:
    * Docker Engine c'est le moteur de docker qui permet de creer le 
      Host Docker sur une machine Linux (Docker daemon).
      ==> c'est le seul qui est capable d'executer un conteneur
      ==> docker engine ne peut sinstaller que sur un system linux
    * Un client Docker qui peut se trouve dans n'importe quelle autre machine et qui est connecte
      a Docker engine via differentes connecterus exposes par docker (socket, REST, API, ..)
          

