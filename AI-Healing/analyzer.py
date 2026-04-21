import boto3
import requests
import config

logs_client = boto3.client(
    "logs",
    region_name=config.AWS_REGION
)

def get_cloudwatch_logs():

    response = logs_client.filter_log_events(
        logGroupName=config.LOG_GROUP,
        limit=50
    )

    return [
        e["message"]
        for e in response["events"]
    ]


def detect_log_issues(logs):

    issues = []

    for msg in logs:

        if "CrashLoopBackOff" in msg:
            issues.append("crashloop")

        if "OutOfMemory" in msg:
            issues.append("oom")

        if "ERROR" in msg:
            issues.append("error")

    return issues


def query_prometheus(promql):

    url = f"{config.PROMETHEUS_URL}/api/v1/query"

    r = requests.get(
        url,
        params={"query": promql},
        timeout=10
    )

    data = r.json()

    return data


def get_restart_count():

    query = (
      "kube_pod_container_status_restarts_total"
    )

    data = query_prometheus(query)

    results = data["data"]["result"]

    if not results:
        return 0

    values = [
      float(item["value"][1])
      for item in results
    ]

    return max(values)


def get_cpu_usage():

    query = (
     "sum(rate(container_cpu_usage_seconds_total[1m]))"
    )

    data = query_prometheus(query)

    results = data["data"]["result"]

    if not results:
        return 0

    return float(
      results[0]["value"][1]
    )