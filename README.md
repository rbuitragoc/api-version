# api-version
Minimal script to assess API version 

It leverages `Spring Boot Actuator` (https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-endpoints.html) to fetch git information deployed at an endpoint, providing accurate and verifiable versioning from runtime.

**Requirements**

Spring Boot with actuator enabled by default, or at least git information enabled
- `Curl`
- `Jq`
- `bash` or any sh-based shell

**Usage**

Simply execute `./api-version.sh <ACTUATOR_URL>` and the last commit message and id will be printed to stdout. Note that `ACTUATOR_URL` is by default `BASE_API_URL/actuator/info`. 

The script will print any errors found, like commands not available or actuator endpoint down. Feel free to report any issues found, I'll be happy to address them.
