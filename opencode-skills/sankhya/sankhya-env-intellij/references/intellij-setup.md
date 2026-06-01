# IntelliJ Setup

1. Open `C:\dharatecnologia\dhara-pecuaria` as a Gradle project.
2. Configure Project SDK as `C:\\dharatecnologia\\dhara-pecuaria\tools\jdk8\jdk8u492-b09`.
3. In Gradle settings, set Gradle JVM to the same JDK 8.
4. Set Gradle user home to `C:\\dharatecnologia\\dhara-pecuaria\tools\gradle-cache`.
5. Confirm `.env` has:

```properties
WILDFLY_HOME=C:\sk-java\AS\wildfly-23-pre-hom
SNK_LIB=C:\sk-java\LIBS
```

6. Use the shared run configurations in `.idea/runConfigurations`.

## Remote Debug

Enable JDWP in WildFly with port `8787`, then attach IntelliJ using a Remote JVM Debug configuration.

