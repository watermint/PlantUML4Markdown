# Overview

@startuml
Gradle -> PlantUML4Markdown : Invoke
PlantUML4Markdown -> Document : Convert
Gradle -> PlantUML : Invoke
PlantUML -> Document : Generate
Gradle -> "Generated Documents" : Publish
@enduml


# Generate Diagrams

@startuml

PlantUML4Markdown -> "Markdown (orig)" : Read
PlantUML4Markdown -> "PlantUML (markup)" : Generate
PlantUML4Markdown -> "Markdown (converted)" : Generate
PlantUML -> "PlantUML (markup)" : Read
PlantUML -> "UML Diagram (image)" : Generate

@enduml
