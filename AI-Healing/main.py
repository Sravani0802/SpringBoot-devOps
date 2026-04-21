import config

from analyzer import (
    get_cloudwatch_logs,
    detect_log_issues,
    get_restart_count,
    get_cpu_usage
)

from decision_engine import (
    restart_deployment,
    scale_up,
    rollback
)


def main():

    print("Checking CloudWatch logs...")

    logs = get_cloudwatch_logs()

    issues = detect_log_issues(logs)

    print("Issues found:", issues)

    if "crashloop" in issues:
        print("CrashLoop detected -> restarting")
        restart_deployment()

    if "oom" in issues:
        print("OOM detected -> scaling")
        scale_up(5)

    if "error" in issues:
        print("App errors detected -> rollback")
        rollback()

    print("Checking Prometheus metrics...")

    restarts = get_restart_count()

    print("Restart count:", restarts)

    if restarts > config.RESTART_THRESHOLD:
        print("Too many restarts -> restart deployment")
        restart_deployment()

    cpu = get_cpu_usage()

    print("CPU:", cpu)

    if cpu > config.CPU_THRESHOLD:
        print("High CPU -> scaling up")
        scale_up(5)


if __name__ == "__main__":
    main()