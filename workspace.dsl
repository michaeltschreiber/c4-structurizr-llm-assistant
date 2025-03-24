// This enables hierarchical identifiers for clearer element referencing
// Define the workspace with name and description
workspace "E-Commerce Platform" "Comprehensive example of a modern e-commerce system" {
    
    !identifiers hierarchical
    // MODEL SECTION - Defines all people, systems, containers, and components
    model {
        // ----- ENTERPRISE BOUNDARY -----
        // Define the enterprise boundary to distinguish internal vs external systems
        // Define people at the top level outside enterprise boundary for easier referencing
        customer = person "Customer" "A registered customer of the e-commerce platform" {
            tags "External Person"
        }
        
        admin = person "Administrator" "System administrator with full access rights" {
            tags "Internal Person"
        }
        
        contentManager = person "Content Manager" "Manages product listings and content" {
            tags "Internal Person"
        }

        group "Acme Retail" {
            // ----- CORE SYSTEMS -----
            // Main e-commerce system with its containers and components
            ecommerce = softwareSystem "E-Commerce System" "Allows customers to browse products and place orders" {
                // Container level - applications and datastores that make up the system
                webApp = container "Web Application" "Provides e-commerce functionality to customers" "React, TypeScript" {
                    tags "Customer-Facing"
                    // Component level - internal implementation units
                    productCatalog = component "Product Catalog" "Displays products and allows filtering/search" "React Component"
                    shoppingCart = component "Shopping Cart" "Manages items in the user's cart" "React Component"
                    checkout = component "Checkout" "Handles the checkout process" "React Component"
                    accountManagement = component "Account Management" "Allows users to manage their profile" "React Component"
                }
                mobileApp = container "Mobile Application" "Provides e-commerce functionality to mobile users" "React Native" {
                    tags "Mobile App" "Customer-Facing"
                }
                api = container "API Gateway" "Provides an API for web and mobile clients" "Node.js, Express" {
                    tags "Customer-Facing"
                    // Component level for API
                    // Component level for API
                    authController = component "Auth Controller" "Handles authentication and authorization" "Express Controller"
                    productController = component "Product Controller" "Provides product data" "Express Controller"
                    orderController = component "Order Controller" "Manages order creation and retrieval" "Express Controller"
                    paymentController = component "Payment Controller" "Handles payment processing" "Express Controller"
                    
                    // Relationships between components
                    authController -> productController "Uses" "Internal"
                    authController -> orderController "Uses" "Internal"
                    orderController -> paymentController "Initiates payments via" "Internal"
                }
                
                // Databases with tagging for proper styling
                productDB = container "Product Database" "Stores product catalog information" "PostgreSQL" {
                    tags "Database"
                    
                    /* 
                    Supplementary ER Diagram (described in text):
                    
                    Product
                    - product_id (PK)
                    - name
                    - description
                    - price
                    - category_id (FK)
                    - created_at
                    
                    Category
                    - category_id (PK)
                    - name
                    - parent_category_id (FK)
                    
                    ProductImage
                    - image_id (PK)
                    - product_id (FK)
                    - url
                    - is_primary
                    
                    Relationships:
                    - Category 1--* Product
                    - Category 1--* Category (self-referential)
                    - Product 1--* ProductImage
                    */
                }
                
                customerDB = container "Customer Database" "Stores customer information" "MongoDB" {
                    tags "Database"
                    
                    /*
                    Data Dictionary:
                    
                    Customer Collection:
                    - _id: ObjectId (Primary Key)
                    - email: String (Unique, Indexed)
                    - passwordHash: String
                    - firstName: String
                    - lastName: String
                    - addresses: Array of Address objects
                    - paymentMethods: Array of PaymentMethod objects
                    - createdAt: Date
                    - lastLogin: Date
                    
                    Address Object:
                    - type: String (billing, shipping)
                    - street: String
                    - city: String
                    - state: String
                    - postalCode: String
                    - country: String
                    - isDefault: Boolean
                    */
                }
                
                orderDB = container "Order Database" "Stores order information" "MongoDB" {
                    tags "Database"
                }
                
                searchService = container "Search Service" "Provides product search functionality" "Elasticsearch, Node.js" {
                    tags "Search"
                }
                
                // Container relationships inside the e-commerce system
                webApp -> api "Makes API calls to" "JSON/HTTPS"
                mobileApp -> api "Makes API calls to" "JSON/HTTPS"
                api -> productDB "Reads from and writes to" "PostgreSQL Driver"
                api -> customerDB "Reads from and writes to" "MongoDB Driver"
                api -> orderDB "Reads from and writes to" "MongoDB Driver"
                api -> searchService "Searches products using" "REST API"
            }
            
            // Inventory management system
            inventory = softwareSystem "Inventory Management System" "Manages product inventory and stock levels" {
                inventoryApp = container "Inventory Application" "Used by staff to manage inventory" "Angular"
                inventoryApi = container "Inventory API" "Provides inventory management functionality" "Java, Spring Boot"
                inventoryDB = container "Inventory Database" "Stores inventory information" "PostgreSQL" {
                    tags "Database"
                }
                
                inventoryApp -> inventoryApi "Makes API calls to" "JSON/HTTPS"
                inventoryApi -> inventoryDB "Reads from and writes to" "JDBC"
            }
            
            // CMS system
            cms = softwareSystem "Content Management System" "Manages product content and descriptions" {
                cmsApp = container "CMS Application" "Used by content managers" "WordPress"
                cmsDB = container "CMS Database" "Stores content" "MySQL" {
                    tags "Database"
                }
                
                cmsApp -> cmsDB "Reads from and writes to" "SQL"
            }
        }

        // ----- EXTERNAL SYSTEMS -----
        // Systems outside our enterprise boundary that we interact with
        paymentGateway = softwareSystem "Payment Gateway" "Processes credit card payments" {
            tags "External System"
        }
        
        emailService = softwareSystem "Email Service" "Sends emails to customers" {
            tags "External System"
        }
        
        shippingProvider = softwareSystem "Shipping Provider" "Handles order fulfillment and shipping" {
            tags "External System"
        }

        // ----- SYSTEM RELATIONSHIPS -----
        // People to systems
        customer -> ecommerce "Browses products and places orders using"
        customer -> ecommerce.webApp "Uses to browse products and place orders" "HTTPS"
        admin -> ecommerce "Administers"
        admin -> inventory "Manages inventory using"
        contentManager -> cms "Manages product content using"
        
        // System to system
        ecommerce -> paymentGateway "Processes payments via" "HTTPS/REST"
        ecommerce -> emailService "Sends emails using" "SMTP"
        ecommerce -> inventory "Checks inventory in" "HTTPS/REST"
        ecommerce -> shippingProvider "Creates shipments with" "HTTPS/REST"
        ecommerce -> cms "Retrieves content from" "HTTPS/REST"

        // ----- DEPLOYMENT NODES -----
        // Deployment environment definition
        deploymentEnvironment "Production" {
            // Cloud provider
            deploymentNode "AWS" "Amazon Web Services" "Cloud Provider" {
                // Web Tier
                webTier = deploymentNode "Web Tier" "Web and presentation layer" "AWS EC2" {
                    webAppInstance = containerInstance ecommerce.webApp
                }
                
                // API Tier
                apiTier = deploymentNode "API Tier" "Business logic layer" "AWS EC2" {
                    apiGatewayInstance = containerInstance ecommerce.api
                    searchServiceInstance = containerInstance ecommerce.searchService
                }
                
                // Database Tier
                dbTier = deploymentNode "Database Tier" "Data persistence layer" "AWS RDS and DocumentDB" {
                    productDBInstance = containerInstance ecommerce.productDB
                    customerDBInstance = containerInstance ecommerce.customerDB
                    orderDBInstance = containerInstance ecommerce.orderDB
                }
                
                // Relationships between deployment nodes
                webTier -> apiTier "Calls APIs on" "HTTPS"
                apiTier -> dbTier "Reads from and writes to" "SQL/MongoDB Protocol"
            }
            }
        }
    
        // ----- VIEWS SECTION -----
        views {
            // System Landscape view - shows all systems and people
            systemLandscape "SystemLandscape" {
                include *
                autoLayout tb
                title "System Landscape for E-Commerce Platform"
                description "Overview of the complete e-commerce ecosystem"
            }
            
            // System Context view - focused on the e-commerce system
            systemContext ecommerce "ECommerceContext" {
                include *
                autoLayout tb
                title "E-Commerce System Context"
                description "The system context diagram for the e-commerce system"
            }
            
            // Container view - shows containers within the e-commerce system
            container ecommerce "ECommerceContainers" {
                include *
                autoLayout tb
                title "E-Commerce System Containers"
                description "The container diagram for the e-commerce system"
            }
            
            // Component views - zooms into specific containers
            component ecommerce.webApp "WebAppComponents" {
                include *
                autoLayout tb
                title "Web Application Components"
                description "The component diagram for the web application"
            }
            
            component ecommerce.api "ApiComponents" {
                include *
                autoLayout tb
                title "API Components"
                description "The component diagram for the API gateway"
            }
            
            // Deployment view - shows runtime instances
            deployment ecommerce "Production" "ProductionDeployment" {
                include *
                autoLayout tb
                title "Production Deployment"
                description "The production deployment architecture for the E-Commerce System"
            }
            
            // Filtered views
            filtered "ECommerceContainers" include "Customer-Facing" "CustomerFacing" {
                title "Customer-Facing Containers"
                description "Only showing customer-facing parts of the system"
            }
            
            // Dynamic view example
            dynamic ecommerce "Checkout" {
                title "Checkout Process"
                description "Illustrates the checkout process flow"
                customer -> ecommerce.webApp "Initiates checkout"
                ecommerce.webApp -> ecommerce.api "Submits order"
                ecommerce.api -> ecommerce.orderDB "Saves order"
                ecommerce.api -> ecommerce.webApp "Returns confirmation"
                autoLayout
            }
            
            // ----- STYLES -----
            styles {
                // Element styles based on tags
                element "Person" {
                    shape Person
                    background #08427B
                    color #ffffff
                }
                
                element "Internal Person" {
                    background #3B6F42
                }
                
                element "External Person" {
                    background #08427B
                }
                
                element "Software System" {
                    background #1168BD
                    color #ffffff
                }
                
                element "External System" {
                    background #999999
                }
                
                element "Container" {
                    background #438DD5
                    color #ffffff
                }
                
                element "Database" {
                    shape Cylinder
                    background #438DD5
                    color #ffffff
                }
                
                element "Mobile App" {
                    shape MobileDevicePortrait
                    background #438DD5
                    color #ffffff
                }
                
                element "Component" {
                    background #85BBF0
                    color #000000
                }
                
                element "Search" {
                    shape Hexagon
                    background #F0C169
                    color #000000
                }
                
                // Relationship styles
                relationship "Relationship" {
                    thickness 2
                    color #707070
                    dashed false
                }
                
                relationship "Async" {
                    dashed true
                }
            }
            
            // Use default theme as base
            theme default
        }
}
