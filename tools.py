from prometheus_client import Info
import os
import yaml
import json
from prometheus_http_client import Prometheus


def get_alias():

    result={}
    filename = os.path.join(os.path.dirname(__file__), 'alias.yaml').replace("\\", "/")
    with open(filename, 'r', encoding='utf-8') as f:
        conf = yaml.load(f)

    promethus = Prometheus()
    for k, v in conf["conf"].items():
        query = json.loads(promethus.query(metric=k))
        result[k] = {}
        for item in query["data"]["result"]:
            metric = item["metric"]
            #print (metric[v["id"]])
            result[k][metric[v["id"]]] =metric.get(v["alias"])

    return result
