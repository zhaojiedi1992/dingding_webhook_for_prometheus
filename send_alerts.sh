#!/bin/bash
alert4='
{
    "receiver": "dingding_webhook_opt_base",
    "status": "firing",
    "alerts": [
        {
            "status": "firing",
            "labels": {
                "alertname": "node-exporter-disk-write-count-high",
                "desc": "...........................",
                "device": "vdb",
                "environment": "PRO",
                "instance": "172.16.16.5:20001",
                "instancename": "Pro.cy.sa.elk.shenjianyu",
                "job": "node-exporter",
                "osname": "CentOS  6.9 64...",
                "prometheus": "monitoring/ack-prometheus-operator-prometheus",
                "severity": "warning",
                "unit": "Count/Second"
            },
            "annotations": {
                "description": "",
                "instance": "172.16.16.5:20001",
                "summary": "instance: 172.16.16.5:20001 iops write ............... 1972.7666666666667",
                "value": "1972.7666666666667"
            },
            "startsAt": "2019-08-02T10:08:35.592950238Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "http://prometheus.limikeji.com:9090/graph?g0.expr=node_exporter%3Adisk%3Awrite%3Acount%3Arate+%3E+1800&g0.tab=1"
        },
        {
            "status": "firing",
            "labels": {
                "alertname": "node-exporter-disk-write-count-high",
                "desc": "...........................",
                "device": "vda",
                "environment": "TEST",
                "instance": "172.16.16.95:20001",
                "instancename": "Dev_test.ketang.test.lishuaichen",
                "job": "node-exporter",
                "osname": "CentOS  7.4 64...",
                "prometheus": "monitoring/ack-prometheus-operator-prometheus",
                "severity": "warning",
                "unit": "Count/Second"
            },
            "annotations": {
                "description": "",
                "instance": "172.16.16.95:20001",
                "summary": "instance: 172.16.16.95:20001 iops write ............... 2500.3333333333335",
                "value": "2500.3333333333335"
            },
            "startsAt": "2019-08-02T08:08:35.592950238Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "http://prometheus.limikeji.com:9090/graph?g0.expr=node_exporter%3Adisk%3Awrite%3Acount%3Arate+%3E+1800&g0.tab=1"
        }
    ],
    "groupLabels": {
        "alertname": "node-exporter-disk-write-count-high"
    },
    "commonLabels": {
        "alertname": "node-exporter-disk-write-count-high",
        "desc": "...........................",
        "job": "node-exporter",
        "prometheus": "monitoring/ack-prometheus-operator-prometheus",
        "severity": "warning",
        "unit": "Count/Second"
    },
    "commonAnnotations": {
        "description": ""
    },
    "externalURL": "http://alertmanager.limikeji.com:9093",
    "version": "4",
    "groupKey": "{}:{alertname=\"node-exporter-disk-write-count-high\"}"
}
'
alert3='
{
    "receiver": "dingding_webhook_opt_base",
    "status": "resolved",
    "alerts": [
        {
            "status": "resolved",
            "labels": {
                "alertname": "node-exporter-down",
                "desc": ".................., ......1,.........0",
                "environment": "PRO",
                "instance": "172.16.16.2:20001",
                "instancename": "Pro.cy.sa.zabbix.wanglanbiao",
                "job": "node-exporter",
                "osname": "CentOS  7.2 64...",
                "prometheus": "monitoring/ack-prometheus-operator-prometheus",
                "severity": "warning",
                "unit": "None"
            },
            "annotations": {
                "description": "instance: 172.16.16.2:20001 \n- job: node-exporter ............ ............1............",
                "instance": "172.16.16.2:20001",
                "summary": "instance: 172.16.16.2:20001 .........",
                "value": "0"
            },
            "startsAt": "2019-08-02T08:10:35.592950238Z",
            "endsAt": "2019-08-02T08:14:35.592950238Z",
            "generatorURL": "http://prometheus.limikeji.com:9090/graph?g0.expr=node_exporter%3Aup+%3D%3D+0&g0.tab=1"
        }
    ],
    "groupLabels": {
        "alertname": "node-exporter-down"
    },
    "commonLabels": {
        "alertname": "node-exporter-down",
        "desc": ".................., ......1,.........0",
        "environment": "PRO",
        "instance": "172.16.16.2:20001",
        "instancename": "Pro.cy.sa.zabbix.wanglanbiao",
        "job": "node-exporter",
        "osname": "CentOS  7.2 64...",
        "prometheus": "monitoring/ack-prometheus-operator-prometheus",
        "severity": "warning",
        "unit": "None"
    },
    "commonAnnotations": {
        "description": "instance: 172.16.16.2:20001 \n- job: node-exporter ............ ............1............",
        "instance": "172.16.16.2:20001",
        "summary": "instance: 172.16.16.2:20001 .........",
        "value": "0"
    },
    "externalURL": "http://alertmanager.limikeji.com:9093",
    "version": "4",
    "groupKey": "{}:{alertname=\"node-exporter-down\"}"
}
'
alert2='{
    "receiver": "dingding_webhook_opt_myself",
    "status": "firing",
    "alerts": [
        {
            "status": "firing",
            "labels": {
                "alertname": "node-exporter cpu high info",
                "desc": ".........cpu..................",
                "instance": "172.16.16.142:20001",
                "job": "node-exporter",
                "prometheus": "monitoring/ack-prometheus-operator-prometheus",
                "severity": "info",
                "unit": "Percent"
            },
            "annotations": {
                "description": "",
                "summary": "instance: 172.16.16.142:20001 cpu ............... 56.61250000004656",
                "value": "56.61250000004656",
                "instance": "123.0.0.1"
            },
            "startsAt": "2019-07-18T07:48:25.737192646Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "http://ack-prometheus-operator-prometheus.monitoring:9090/graph?g0.expr=node_exporter%3Acpu%3Atotal%3Apercent+%3E+40&g0.tab=1"
        },
        {
            "status": "firing",
            "labels": {
                "alertname": "node-exporter cpu high info",
                "desc": ".........cpu..................",
                "instance": "172.16.17.1:20001",
                "prometheus": "monitoring/ack-prometheus-operator-prometheus",
                "severity": "info",
                "unit": "Percent"
            },
            "annotations": {
                "description": "",
                "summary": "instance: 172.16.17.1:20001 cpu ............... 62.56666667138538",
                "value": "62.56666667138538"
            },
            "startsAt": "2019-07-19T01:47:55.737192646Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "http://ack-prometheus-operator-prometheus.monitoring:9090/graph?g0.expr=node_exporter%3Acpu%3Atotal%3Apercent+%3E+40&g0.tab=1"
        },
        {
            "status": "firing",
            "labels": {
                "alertname": "node-exporter cpu high info",
                "desc": ".........cpu..................",
                "instance": "172.16.17.45:20001",
                "prometheus": "monitoring/ack-prometheus-operator-prometheus",
                "severity": "info",
                "unit": "Percent"
            },
            "annotations": {
                "description": "",
                "summary": "instance: 172.16.17.45:20001 cpu ............... 45.583333333100505",
                "value": "45.583333333100505"
            },
            "startsAt": "2019-07-19T01:48:25.737192646Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "http://ack-prometheus-operator-prometheus.monitoring:9090/graph?g0.expr=node_exporter%3Acpu%3Atotal%3Apercent+%3E+40&g0.tab=1"
        },
        {
            "status": "firing",
            "labels": {
                "alertname": "node-exporter cpu high info",
                "desc": ".........cpu..................",
                "instance": "172.16.19.239:20001",
                "prometheus": "monitoring/ack-prometheus-operator-prometheus",
                "severity": "info",
                "unit": "Percent"
            },
            "annotations": {
                "description": "",
                "summary": "instance: 172.16.19.239:20001 cpu ............... 43.07361111122494",
                "value": "43.07361111122494"
            },
            "startsAt": "2019-07-19T01:48:25.737192646Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "http://ack-prometheus-operator-prometheus.monitoring:9090/graph?g0.expr=node_exporter%3Acpu%3Atotal%3Apercent+%3E+40&g0.tab=1"
        },
        {
            "status": "resolved",
            "labels": {
                "alertname": "node-exporter cpu high info",
                "desc": ".........cpu..................",
                "instance": "172.16.19.240:20001",
                "prometheus": "monitoring/ack-prometheus-operator-prometheus",
                "severity": "info",
                "unit": "Percent"
            },
            "annotations": {
                "description": "",
                "summary": "instance: 172.16.19.240:20001 cpu ............... 41.270833333385085",
                "value": "41.270833333385085"
            },
            "startsAt": "2019-07-19T01:48:25.737192646Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "http://ack-prometheus-operator-prometheus.monitoring:9090/graph?g0.expr=node_exporter%3Acpu%3Atotal%3Apercent+%3E+40&g0.tab=1"
        }
    ],
    "groupLabels": {
        "alertname": "node-exporter cpu high info"
    },
    "commonLabels": {
        "alertname": "node-exporter cpu high info",
        "desc": ".........cpu..................",
        "prometheus": "monitoring/ack-prometheus-operator-prometheus",
        "severity": "info",
        "unit": "Percent"
    },
    "commonAnnotations": {
        "description": ""
    },
    "externalURL": "http://ack-prometheus-operator-alertmanager.monitoring:9093",
    "version": "4",
    "groupKey": "{}/{severity=~\"^(?:critical|warn|info)$\"}:{alertname=\"node-exporter cpu high info\"}"
}'
alerts1='{
    "receiver": "admins",
    "status": "firing",
    "alerts": [
        {
            "status": "firing",
            "labels": {
                "alertname": "something_happend",
                "env": "prod",
                "instance": "server01.int:9100",
                "job": "node",
                "service": "prometheus_bot",
                "severity": "warning",
                "supervisor": "runit"
            },
            "annotations": {
                "summary": "Oops, something happend!"
            },
            "startsAt": "2016-04-27T20:46:37.903Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "https://example.com/graph#..."
        },
        {
            "status": "resolved",
            "labels": {
                "alertname": "something_happend",
                "env": "prod",
                "instance": "server01.int:9100",
                "job": "node",
                "service": "prometheus_bot",
                "severity": "warning",
                "supervisor": "runit"
            },
            "annotations": {
                "summary": "Oops, something happend!"
            },
            "startsAt": "2016-04-27T20:46:37.903Z",
            "endsAt": "0001-01-01T00:00:00Z",
            "generatorURL": "https://example.com/graph#..."
        }
    ],
    "groupLabels": {
        "alertname": "something_happend",
        "instance": "server01.int:9100"
    },
    "commonLabels": {
        "alertname": "something_happend",
        "env": "prod",
        "instance": "server01.int:9100",
        "job": "node",
        "service": "prometheus_bot",
        "severity": "warning",
        "supervisor": "runit"
    },
    "commonAnnotations": {
        "summary": "runit service prometheus_bot restarted, server01.int:9100"
    },
    "externalURL": "https://alert-manager.example.com",
    "version": "3"
}'

curl -H "Content-type: application/json" -XPOST -d"$alert2" http://127.0.0.1:8060/dingtalk/dingding_webhook_opt_myself/send
