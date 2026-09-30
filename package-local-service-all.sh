#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

VERSION=0.0.1
GROUP_ID=com.arcadiaeditions.modulith.application.arcadia-editions-modulith
GROUP_PATH=com/arcadiaeditions/modulith/application/arcadia-editions-modulith
ARTIFACT_ID=service-all
STAGING=target/staging
JAR="target/${ARTIFACT_ID}-${VERSION}.jar"

rm -rf "$STAGING" "$JAR"
mkdir -p "$STAGING/$GROUP_PATH"

git ls-files -z | while IFS= read -r -d '' f; do
  mkdir -p "$STAGING/$GROUP_PATH/$(dirname "$f")"
  cp "$f" "$STAGING/$GROUP_PATH/$f"
done

jar --create --file "$JAR" -C "$STAGING" .

mvn -B -ntp org.apache.maven.plugins:maven-install-plugin:3.1.4:install-file \
  -Dfile="$JAR" \
  -DgroupId="$GROUP_ID" \
  -DartifactId="$ARTIFACT_ID" \
  -Dversion="$VERSION" \
  -Dpackaging=jar \
  -DgeneratePom=true
