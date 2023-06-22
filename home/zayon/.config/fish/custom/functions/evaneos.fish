# function gcloud
#     docker run --rm -it \
#     -v ~/.config/gcloud:/root/.config/gcloud \
#     -v ~/.kube:/root/.kube \
#     gcloud:local \
#     gcloud $argv;
# end

# function gke-gcloud-auth-plugin
#     docker run --rm -it \
#     -v ~/.config/gcloud:/root/.config/gcloud \
#     # -v ~/.kube:/root/.kube \
#     gcloud:local \
#     gke-gcloud-auth-plugin $argv;
# end

# function kubectl-docker
#     docker run --rm -it $DOCKER_RUN_ARGS \
#     -v ~/.config/gcloud:/root/.config/gcloud \
#     -v ~/.kube:/root/.kube \
#     gcloud:local \
#     kubectl $argv;
# end

function __evaneos_intraneos_credentials
    PROJECT_ID=intraneos \
    REGION=europe-west3 \
    NAME=dev-tools2 \
    __evaneos_install_credentials;
end

function __evaneos_create_cloud_sql_proxy
    docker run -d \
        --name {$CONTAINER_NAME} \
        -u $(id -u):$(id -g) \
        -v ~/.config/gcloud/application_default_credentials.json:/credentials.json \
        -e GOOGLE_APPLICATION_CREDENTIALS=/credentials.json \
        gcr.io/cloudsql-docker/gce-proxy:1.26.0 \
        /cloud_sql_proxy -instances={$INSTANCE_CONNECTION_NAME}=tcp:0.0.0.0:5432;
end

function __evaneos_cloud_sql_proxy
    docker start {$CONTAINER_NAME} || \
        __evaneos_create_cloud_sql_proxy
end

function proxy_cashmanager_sql_prod
    CONTAINER_NAME=cashmanager_sql_prod \
    INSTANCE_CONNECTION_NAME=evaneos-production:europe-west3:cash-manager \
        __evaneos_cloud_sql_proxy
end

function __evaneos_intraneos_sshuttle
    PROJECT_ID=intraneos \
    __evaneos_access_kubernetes_endpoint;
end

function ssh_tunnel_sql_prod_ro
    ssh -f -o RequestTTY=no -N -L 5432:localhost:5432 sql2.evaneos2;
end

function ssh_tunnel_sql_prod_rw
    ssh -f -o RequestTTY=no -N -L 5433:localhost:5432 sql1.evaneos2;
end

function __evaneos_install_credentials
    gcloud container clusters get-credentials \
    --project {$PROJECT_ID} \
    --region {$REGION} \
    {$NAME};
end

function vault_tunnel
    # Start tunnel
    kubectl tunnel start intraneos

    # Port-forward the vault service
    kubectl \
        --context=intraneos \
        -n vault \
        --address=127.0.0.1 \
        port-forward service/vault-active 8200:8200
end

function __evaneos_access_kubernetes_endpoint
    set ZONE_ID (gcloud compute instances list --filter="bastion" --project "$PROJECT_ID" --format json | jq -r '.[0].zone')

    sshuttle \
    -D \
    -e "gcloud compute ssh --tunnel-through-iap --project $PROJECT_ID --zone $ZONE_ID" \
    -r bastion \
    --no-latency-control \
    172.16.0.0/21
end
