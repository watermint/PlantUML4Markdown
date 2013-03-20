# PlantUML4Markdown

Generate diagrams of [PlantUML](http://plantuml.sourceforge.net/) markups inside markdown documents, which contains [PlantUML](http://plantuml.sourceforge.net/) markup.

# Prerequisite

PlantUML supports generate sequence diagram OOTB. If you'd like to more diagrams like class diagrams, usecase diagrams, activities, etc. Install Graphviz, then configure PATH for it.

    brew install graphviz

# Usage

1. Place your documents under directory Documents with extension .md
2. Launch gradlew on the project directory
3. PlantUML4Markdown generates document under the directory build/Documents 

Internet connnection required during first build. Gradle automatically downloads required libraries.

    % ./gradlew
    :cloneDocuments
    :cloneStrapdown UP-TO-DATE
    :compileMarkdown
    :compilePlantuml
    
    BUILD SUCCESSFUL
    
    Total time: 17.13 secs

# License

## PlantUML4Markdown

* The MIT License (MIT)
* Copyright (c) 2013 Takayuki Okazaki
* https://github.com/watermint/PlantUML4Markdown

## Stripdown.js

* The MIT License (MIT)
* Copyright (c) 2012 Artur B. Adib
* http://strapdownjs.com/

## Bootswatch themes

* Apache License Version 2.0
* http://bootswatch.com/
