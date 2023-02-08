### Repo:

https://github.com/roxsross/devops-practice-tools/tree/master/final-bootcampdevops-ninja

### Comentarios:

1. Depslegar 3 servers en la misma VPC 
2. Utilizar userdata para subir el docker y el dockerhub en cada server
3. Separar por ramas (develop, Testing, Master) 
4. utiizar el pipeline multibranch para setear por cada ambiente una rama.
5. Cada tfvars lo nombramos con la rama y concatenamos una variable local que permita concatenar el nombre.
6. Fases
   1. hacer funcionar la app en docker localmente 
   
      ``` # Build apuntando al folder 
      docker build -t ms-frontend:1.0 frontend 
      ```
   2. hacerlo funcionar con kubernetes utilizando minikube
   3. depslegar la infra con pipeline
   4. desplegar la infra con los dockers con userdata
   5. En Kubernetes en killercoda desplegar los kubernetes. Puede que roxx nos disponibilice un EKS o podemos desplegarlo nosotros en la cuenta tlz 


### MEJORAS

1. Desplegar 1 vpc por cada ambiente.


