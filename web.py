from flask import Flask
from flask import abort
from flask import request

from dingding import DingDing
from jinja2 import Template
import datetime
import json
from collections import Counter
import jmespath
import re


def create_app(config=None):
    app = Flask(__name__, instance_relative_config=True)
    if config:
        app.custome_config = config
        app.ding_name_dict = {}
        for ding in app.custome_config.get("ding.profile"):
            name = ding.split("=")[0]
            token = ding.split("=")[-1]
            # url="=".join(ding.split("=")[1:])
            app.ding_name_dict[name] = token

    @app.route('/')
    def hello_world():
        return '/dingtalk/<your_dingding_name>/send'

    def pre_process_data(data):
        for alert in data["alerts"]:
            alert["startsAt"] = " ".join(
                re.search(r'([0-9]{4}-[0-9]{2}-[0-9]{2})T([0-9]{2}:[0-9]{2}:[0-9]{2}).*', alert["startsAt"]).group(1,
                                                                                                                   2))

            alert["endsAt"] = " ".join(
                re.search(r'([0-9]{4}-[0-9]{2}-[0-9]{2})T([0-9]{2}:[0-9]{2}:[0-9]{2}).*', alert["endsAt"]).group(1, 2))
            alert["during"] = ""
            if alert["endsAt"] != "0001-01-01 00:00:00":
                alert["during"] = (datetime.datetime.strptime(alert["endsAt"],
                                                              "%Y-%m-%d %H:%M:%S") - datetime.datetime.strptime(
                    alert["startsAt"], "%Y-%m-%d %H:%M:%S")).total_seconds() / 60

    @app.route("/dingtalk/<string:name>/send", methods=['POST'])
    def send(name):
        if name not in app.ding_name_dict:
            return "not"
        data = request.json
        app.logger.info("{0}".format(request))
        app.logger.info("data={0}".format(data))
        pre_process_data(data)
        template_name = app.custome_config.get("template", "default")
        with open("templates/{0}_text.j2".format(template_name), 'r', encoding="utf-8") as f:
            lines = f.read()
            template_text = Template(lines,trim_blocks=True)
        with open("templates/{0}_title.j2".format(template_name), 'r', encoding="utf-8") as f:
            lines = f.read()
            template_title = Template(lines,trim_blocks=True)

        status_list = jmespath.search("alerts[].status", data)
        extra_data = Counter(status_list)
        extra_data["alert"] = extra_data["firing"] + extra_data["resolved"]
        text = template_text.render(data=data, extra_data=extra_data)
        title = template_title.render(data=data, extra_data=extra_data)
        app.logger.info("text={0}".format(text))
        app.logger.info("title={0}".format(title))
        ding = DingDing(app.ding_name_dict[name])

        ding.send_markdown(title=title, text=text)
        return name

    # app.jinja_env.filters['date_format'] = date_format
    # app.jinja_env.filters['datetimeformat'] = datetimeformat
    return app


if __name__ == '__main__':
    config = {'log.level': 'info',
              'web.listen_address': ':8060',
              'template': 'default',
              'ding.profile': [
                  'dingding_webhook_opt_myself=https://oapi.dingtalk.com/robot/send?access_token=c7a512f349bd5fe5b1a2ce2b1f516ff6a4b20078a0c4fcc1ddf9721adba1260a',
                  'dingding_webhook_opt_myself=https://oapi.dingtalk.com/robot/send?access_token=c7a512f349bd5fe5b1a2ce2b1f516ff6a4b20078a0c4fcc1ddf9721adba1260a']}

    app = create_app(config=config)
    host = config.get("web.listen_address").split(":")[0]
    port = config.get("web.listen_address").split(":")[1]
    app.run(host, port, debug=True)
