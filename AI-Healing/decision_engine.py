import subprocess
import config


def run(cmd):

    print(f"Running: {cmd}")
    result = subprocess.run(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True
    )

    print(result.stdout)
    print(result.stderr)


def restart_deployment():

    run(
      f"kubectl rollout restart deployment "
      f"{config.DEPLOYMENT_NAME} "
      f"-n {config.NAMESPACE}"
    )


def scale_up(replicas=4):

    run(
      f"kubectl scale deployment "
      f"{config.DEPLOYMENT_NAME} "
      f"--replicas={replicas} "
      f"-n {config.NAMESPACE}"
    )


def rollback():

    run(
      f"kubectl rollout undo deployment "
      f"{config.DEPLOYMENT_NAME} "
      f"-n {config.NAMESPACE}"
    )