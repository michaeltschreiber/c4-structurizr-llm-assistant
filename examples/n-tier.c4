workspace "Todo Application" "A traditional n-tier ASP.NET React application for managing todos" {

    !identifiers hierarchical
    
    model {
        user = person "User" "A person who needs to manage their tasks and todos" {
            tags "External Person"
        }
        
        group "Acme Corporation" {
            todoSystem = softwareSystem "Todo Application" "Allows users to create, manage and track their todos and tasks" {
                webApp = container "Web Application" "Provides todo management functionality to users via their web browser" "React.js, TypeScript, IIS" {
                    tags "Web App"
                    
                    loginComponent = component "Login Component" "Handles user authentication and registration" "React Component"
                    dashboardComponent = component "Dashboard Component" "Displays overview of todos and statistics" "React Component"
                    todoListComponent = component "Todo List Component" "Displays and manages lists of todos" "React Component"
                    todoDetailComponent = component "Todo Detail Component" "Allows users to view and edit individual todo details" "React Component"
                    settingsComponent = component "Settings Component" "Allows users to manage their preferences" "React Component"
                }
                
                api = container "API Server" "Provides todo functionality via a JSON/HTTPS API" "ASP.NET Web API, C#, IIS" {
                    authController = component "Authentication Controller" "Handles user authentication and authorization" "ASP.NET Controller"
                    todoController = component "Todo Controller" "Manages CRUD operations for todos" "ASP.NET Controller"
                    userProfileController = component "User Profile Controller" "Manages user profile and preferences" "ASP.NET Controller"
                    dataAccessLayer = component "Data Access Layer" "Handles database interactions" "Entity Framework Core"
                }
                
                database = container "Database" "Stores user information, todos, categories and settings" "SQL Server" {
                    tags "Database"
                    
                    /*
                    Data Dictionary:
                    
                    Users Table:
                    - UserID (int, PK)
                    - Username (nvarchar(50))
                    - Email (nvarchar(100))
                    - PasswordHash (nvarchar(256))
                    - RegistrationDate (datetime)
                    - LastLogin (datetime)
                    
                    Todos Table:
                    - TodoID (int, PK)
                    - UserID (int, FK)
                    - Title (nvarchar(100))
                    - Description (nvarchar(500))
                    - CreationDate (datetime)
                    - DueDate (datetime)
                    - CompletionDate (datetime, nullable)
                    - Priority (int)
                    - IsCompleted (bit)
                    
                    Categories Table:
                    - CategoryID (int, PK)
                    - UserID (int, FK)
                    - Name (nvarchar(50))
                    - Color (nvarchar(20))
                    
                    TodoCategories Table:
                    - TodoID (int, FK)
                    - CategoryID (int, FK)
                    - PK(TodoID, CategoryID)
                    
                    UserPreferences Table:
                    - UserID (int, PK, FK)
                    - DefaultView (nvarchar(20))
                    - Theme (nvarchar(20))
                    - NotificationsEnabled (bit)
                    */
                }
                
                // Relationships between containers
                webApp -> api "Makes API calls to" "JSON/HTTPS"
                api -> database "Reads from and writes to" "Entity Framework/SQL"
                
                // Relationships between components in WebApp
                
                // Relationships between components in API
                api.authController -> api.dataAccessLayer "Uses"
                api.todoController -> api.dataAccessLayer "Uses"
                api.userProfileController -> api.dataAccessLayer "Uses"
                api.dataAccessLayer -> database "Reads from and writes to" "Entity Framework/SQL"
            }
            
            // External person to system relationships
            user -> todoSystem "Manages todos using"
            user -> todoSystem.webApp "Accesses via web browser" "HTTPS"
        }
        
        # Deployment nodes for production environment
        deploymentEnvironment "Production" {
            deploymentNode "Windows Server" "Windows Server 2022" "Server OS" {
                deploymentNode "IIS 10" "Internet Information Services" "Web Server" {
                    webAppInstance = containerInstance todoSystem.webApp
                    apiInstance = containerInstance todoSystem.api
                }
                
                deploymentNode "SQL Server 2019" "Database Server" "RDBMS" {
                    databaseInstance = containerInstance todoSystem.database
                }
            }
        }
    }
    
    views {
        systemContext todoSystem "SystemContext" {
            include *
            autoLayout
            title "Todo Application - System Context"
            description "The system context diagram for the Todo application"
        }
        
        container todoSystem "Containers" {
            include *
            autoLayout
            title "Todo Application - Container Diagram"
            description "The container diagram for the Todo application"
        }
        
        component todoSystem.webApp "WebAppComponents" {
            include *
            autoLayout
            title "Web Application - Components"
            description "The component diagram for the Web Application"
        }
        
        component todoSystem.api "APIComponents" {
            include *
            autoLayout
            title "API Server - Components"
            description "The component diagram for the API Server"
        }
        
        deployment todoSystem "Production" "ProductionDeployment" {
            include *
            autoLayout
            title "Production Deployment"
            description "The production deployment architecture for the Todo Application"
        }
        
        dynamic todoSystem "CreateTodo" {
            title "Create New Todo"
            description "Illustrates the process of creating a new todo item"
            user -> todoSystem.webApp "Creates a new todo"
            todoSystem.webApp -> todoSystem.api "Sends create todo request"
            todoSystem.api -> todoSystem.database "Stores new todo"
            todoSystem.database -> todoSystem.api "Returns new todo data"
            todoSystem.api -> todoSystem.webApp "Return 201 Created"
            todoSystem.webApp -> user "Display confirmation"
            autoLayout
        }
        
        styles {
            element "Person" {
                shape Person
                background #08427B
                color #ffffff
            }
            
            element "External Person" {
                background #686868
                color #ffffff
            }
            
            element "Software System" {
                background #1168BD
                color #ffffff
            }
            
            element "Container" {
                background #438DD5
                color #ffffff
            }
            
            element "Web App" {
                shape WebBrowser
                background #438DD5
                color #ffffff
            }
            
            element "Database" {
                shape Cylinder
                background #438DD5
                color #ffffff
            }
            
            element "Component" {
                background #85BBF0
                color #000000
            }
            
            relationship "*" {
                thickness 2
                color #707070
                dashed false
            }
        }
        
        theme default
    }
}