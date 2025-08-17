  #!/bin/bash -xe

  # Runtime build script for ubuntu:22.04, only for CI job
  # docker run -it --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name github-api ubuntu:22.04
  # ./runtime.sh  --sdk-path /dotnet-sdk-9.0.100-rc.2.24422.24-linux-ppc64le.tar.gz --ref v9.0.0-rc.2.24473.5 --patch-file /runtime.patch

set -uxo pipefail
apt update && apt upgrade -y > /dev/null

REPO=https://github.com/dotnet/runtime.git
REF=main

PORTABLE_BUILD=false
BUILD=false
TEST=false
SDK_VERSION=""
export ARCH=$(arch)
export SCRIPT_DIR=$(pwd)
export CONFIGURATION=Debug

NUM=0
sdk_versions=0
REF=0
RUNTIME_TOTAL_TESTCASES=0
RUNTIME_PASSED_TESTCASES=0
RUNTIME_PASS_AVG=0
RUNTIME_FAILED_TESTCASES=0
RUNTIME_FAIL_AVG=0
RUNTIME_SKIPPED_TESTCASES=0
RUNTIME_SKIP_AVG=0
LIB_BUILD_EXIT_CODE=0
common_args=()
build_args=()
test_args=()

get_linux_platform_name()
{
    . /etc/os-release
    echo "$ID.$VERSION_ID"
    return 0
}

export linux_platform=$(get_linux_platform_name)

while [ $# -ne 0 ]
do
  name="$1"
  case "$name" in
    --ref)
      shift
      REF="$1"
      ;;
    --build)
      shift
      BUILD="true"
      ;;
    --test)
      shift
      TEST="true"
      ;;
    --configuration)
      shift
      CONFIGURATION="$1"
      ;;
    --portablebuild)
      shift
      PORTABLE_BUILD="$1"
      ;;
    --outerloop)
      test_args+=(/p:OuterLoop=true)
      ;;
    --sdk-path)
      shift
      SDK_PATH="$1"
      ;;
    --sdk_version)
      shift
      SDK_VERSION="$1"
      ;;
    --patch-file)
      shift
      PATCH_PATH="$1"
      ;;
    *)
      echo "Unknown argument \`$name\`"
      exit 1
      ;;
  esac
  shift
done

apt-get -y install git 

git clone "$REPO"

cd "$(basename "$REPO" .git)"
git checkout "$REF"
COMMIT=$(git rev-parse HEAD)
echo "$REPO is at $COMMIT"
