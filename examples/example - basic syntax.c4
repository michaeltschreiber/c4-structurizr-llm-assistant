workspace "Name" "Description" {
    
    !identifiers hierarchical

    model {
        u = person "User"
        ss = softwareSystem "Software System" {
            wa = container "Web Application"
            db = container "Database Schema" {
                tags "Database"
            }

            wa -> db "Reads from and writes to"
        }

        u -> ss "Uses"

    }
    views {
            systemContext ss "Diagram1" {
                include *
                autolayout lr
            }
            container ss "Diagram2" {
                include *
                autolayout lr
            }
    }
}