# Sequence (概要)

@startuml
Gradle -> PlantUML4Markdown : 呼び出し
PlantUML4Markdown -> Document : Convert
Gradle -> PlantUML : Invoke
PlantUML -> Document : Generate
Gradle -> "Generated Documents" : Publish
@enduml

