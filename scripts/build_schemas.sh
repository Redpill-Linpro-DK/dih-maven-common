#!/bin/bash
java -jar ../tools/openapi-generator-cli.jar generate -g java -i "$1" -o ../dih.domain/ -c build_schemas_config.yaml --artifact-version 1.0.1 --minimal-update &&
  rm ../dih.domain/src/main/AndroidManifest.xml &&
  rm -rf ../dih.domain/src/main/java/org &&
  rm -rf ../dih.domain/.github/ &&
  rm ../dih.domain/.travis.yml &&
  rm ../dih.domain/build.gradle &&
  rm ../dih.domain/build.sbt &&
  rm ../dih.domain/settings.gradle &&
  rm -rf ../dih.domain/gradle* &&
  rm -rf ../dih.domain/api &&
  rm -rf ../dih.domain/src/test &&
  rm -rf ../dih.domain/git_push.sh &&
  head -n -1 ../dih.domain/pom.xml >../dih.domain/tmp.xml && mv ../dih.domain/tmp.xml ../dih.domain/pom.xml &&
  echo "    <distributionManagement>
          <repository>
            <id>github</id>
            <name>GitHub Packages</name>
            <url>https://maven.pkg.github.com/Redpill-Linpro-DK/dih-maven-common</url>
          </repository>
    </distributionManagement>
</project>" >>../dih.domain/pom.xml &&
  mvn clean compile -f ../dih.domain/pom.xml
