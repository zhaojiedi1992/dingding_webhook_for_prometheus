import argparse
from wsgiref.simple_server import make_server

import yaml
import logging
import signal
import sys
import time
from web import create_app


def main():
    logging.getLogger().setLevel(logging.INFO)
    parser = argparse.ArgumentParser(description="prometheus通知消息发送给钉钉")
    parser.add_argument('--log.level', default='info',
                        help='指定日志级别')
    parser.add_argument("--web.listen-address", default=":8060",
                        help='web监听地址')
    parser.add_argument("--template", default="default", help="制定模板名字")
    parser.add_argument("--ding.profile", type=str, help="dinggding", action="append")

    # args = parser.parse_args()
    args = parser.parse_args(
        ["--log.level", "info", "--web.listen-address", ":8060", "--template", "default", "--ding.profile",
         "dingding_webhook_opt_myself=https://oapi.dingtalk.com/robot/send?access_token=c7a512f349bd5fe5b1a2ce2b1f516ff6a4b20078a0c4fcc1ddf9721adba1260a",
         "--ding.profile",
         "dingding_webhook_opt_myself=https://oapi.dingtalk.com/robot/send?access_token=c7a512f349bd5fe5b1a2ce2b1f516ff6a4b20078a0c4fcc1ddf9721adba1260a"]
    )
    print(args)
    config = args.__dict__
    # logging.info("Start exporter, listen on {}".format(int(args.__getattr__("--web.listen-address"))))

    app = create_app(config=config)
    host = config.get("web.listen_address").split(":")[0]
    port = config.get("web.listen_address").split(":")[1]
    app.run(host, port, debug=True)


if __name__ == "__main__":
    main()
