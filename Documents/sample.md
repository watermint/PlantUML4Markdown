# Overview (概要)

@startuml
PlantUML4Markdown -> "Markdown (orig)" : Read
PlantUML4Markdown -> "PlantUML (markup)" : Generate
PlantUML4Markdown -> "Markdown (converted)" : Generate
PlantUML -> "PlantUML (markup)" : Read
PlantUML -> "UML Diagram (image)" : Generate
@enduml

## Diagram Source

    @startuml
    PlantUML4Markdown -> "Markdown (orig)" : Read
    PlantUML4Markdown -> "PlantUML (markup)" : Generate
    PlantUML4Markdown -> "Markdown (converted)" : Generate
    PlantUML -> "PlantUML (markup)" : Read
    PlantUML -> "UML Diagram (image)" : Generate
    @enduml

# Usecase

@startuml
User -> (Reader)
(Writer) -> (Reader)
@enduml

# Class

@startuml
class User {
  -String id
  -String name
  +String name()
}
User <|-- SpecificUser
@enduml

# Activity

@startuml

(*) --> Write
Write --> Convert
Convert --> (*)

@enduml

# Component

@startuml

[PlantUML4Markdown] ..> [PlantUML] : use
[PlantUML] ..> [Graphviz] : use

@enduml


