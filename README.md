# WhoIsTheGuest
Who is The Guest is an example of how you can apply an clean architecture to iOS with VIPER, Realm and Carthage together

# Clean Architecture
Clean architecture has the objective, which is the separation of concerns. It achieve this separation by dividing the software into layers. Each has at least one layer for business rules, and another for interfaces.

This architecture produce a system that are:

1. Independent of Frameworks. The architecture does not depend on the existence of some library of feature laden software. This allows you to use such frameworks as tools, rather than having to cram your system into their limited constraints.
2. Testable. The business rules can be tested without the UI, Database, Web Server, or any other external element.
3. Independent of UI. The UI can change easily, without changing the rest of the system. A Web UI could be replaced with a console UI, for example, without changing the business rules.
4. Independent of Database. You can swap out Oracle or SQL Server, for Mongo, BigTable, CouchDB, or something else. Your business rules are not bound to the database.
5. Independent of any external agency. In fact your business rules simply don’t know anything at all about the outside world.

p.s. This idea about Clean Architecture is from **"Uncle Bob" - Robet C. Martin**

# VIPER
VIPER is an approach to iOS application architecture, which stands for:

- Routing (Wireframe)
- View (ViewController)
- Presenter (Presentation)
- Interactor (Domain or Use cases)
- Entity (Data)

# Realm
Realm is a mobile database. It is a replacement for SqlLite & CoreData.

# Carthage
Carthage is intended to be the simplest way to add frameworks to your Cocoa application.
