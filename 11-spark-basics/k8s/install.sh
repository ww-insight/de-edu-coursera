#The only pre-requisites to this lab are:
#    - A working docker installation
#    - A working kubernetes installation (minikube for example)
#    - The git command line tool

git clone https://github.com/ibm-developer-skills-network/fgskh-new_horizons.git
cd fgskh-new_horizons
alias k='kubectl'
my_namespace=$(kubectl config view --minify -o jsonpath='{..namespace}')

k apply -f spark/pod_spark.yaml
k get po

