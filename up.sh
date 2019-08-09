tag=$1
if [ -z "$tag" ] ;  then
        echo "请指定tag"
        exit 1
fi
docker build -t zhaojiedi1992/dingding_webhook_for_prometheus:$tag   .
docker push zhaojiedi1992/dingding_webhook_for_prometheus:$tag
