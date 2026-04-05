# Clevis - Command Line Vector Graphics Software

**Clevis** (Command Line Vector Graphics Software) is a Java-based vector graphics tool developed as a group project for the **COMP2021 Object-Oriented Programming** course at **PolyU**. It allows users to create, manipulate, and organize vector shapes through a command-line interface, demonstrating core OOP principles: Encapsulation, Inheritance, Polymorphism, and Abstraction.

## 📚 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Launching the Application](#launching-the-application)
- [Commands Overview](#commands-overview)
- [Key OOP Concepts](#key-oop-concepts)
- [UML Diagram](#uml-diagram)
- [Documentation](#documentation)
- [Team Members](#team-members)
- [Acknowledgments](#acknowledgments)

## ✨ Features

| Category | Commands | Description |
|----------|----------|-------------|
| **Shape Creation** | `rectangle`, `square`, `circle`, `line` | Create shapes with unique names and precise coordinates |
| **Grouping** | `group`, `ungroup` | Organize multiple shapes into a single logical unit |
| **Manipulation** | `move`, `delete` | Move or remove shapes/groups |
| **Queries** | `boundingbox`, `shapeat`, `intersect` | Analyze shapes and spatial relationships |
| **History** | `undo`, `redo` | Full undo/redo with Memento + Prototype patterns |
| **System** | `list`, `listall`, `help`, `quit` | Display shapes, show help, and exit cleanly |
| **Logging** | Automatic (HTML + TXT) | All operations are recorded to log files |

## 🛠 Tech Stack

- **Language**: Java SE 21
- **Design Patterns**: MVC, Composite, Memento, Prototype
- **Architecture**: Model-View-Controller (MVC)
- **Logging**: HTML & TXT file output

## 📁 Project Structure

```
Group18/
├── ProjectCode/
│   └── src/
│       └── hk/edu/polyu/comp/comp2021/clevis/
│           ├── Clevis.java              # Main controller
│           ├── Commander.java           # Command parser & input validation
│           ├── CommandLogger.java       # HTML/TXT logging
│           ├── ShapeManager.java        # Model: shape storage & operations
│           ├── Shape.java               # Abstract base class
│           ├── Rectangle.java           # Rectangle shape
│           ├── Square.java              # Square shape
│           ├── Circle.java              # Circle shape
│           ├── Line.java                # Line shape
│           ├── Group.java               # Composite pattern for grouping
│           └── Application.java         # Entry point
├── UML_ClassDiagram.pdf                 # Class diagram
├── user_manual.pdf                      # User manual
├── project_report.pdf                   # Project report
└── README.md                            # This file
```

## 🚀 Getting Started

### Prerequisites

- Java SE 21 or higher
- Terminal / Command Prompt

### Launching the Application

```bash
java hk.edu.polyu.comp.comp2021.clevis.Application -html <html_log_path> -txt <txt_log_path>
```

**Example:**

```bash
java hk.edu.polyu.comp.comp2021.clevis.Application -html log.html -txt log.txt
```

**Successful launch output:**

```
HTML logger: log.html
TXT logger: log.txt
Clevis - Command Line Vector Graphics Software
clevis>
```

## 📖 Commands Overview

### Shape Creation

| Command | Syntax | Example |
|---------|--------|---------|
| Rectangle | `rectangle <n> <x> <y> <w> <h>` | `rectangle r1 0 0 10 5` |
| Square | `square <n> <x> <y> <l>` | `square s1 0 0 4` |
| Circle | `circle <n> <x> <y> <r>` | `circle c1 0 0 1` |
| Line | `line <n> <x1> <y1> <x2> <y2>` | `line l1 0 0 1 1` |

> **Note**: Shape names must be unique and contain only letters, numbers, or underscores.

### Grouping & Manipulation

| Command | Syntax | Description |
|---------|--------|-------------|
| Group | `group <name> <n1> <n2> ...` | Group existing shapes |
| Ungroup | `ungroup <name>` | Dissolve a group |
| Move | `move <n> <dx> <dy>` | Move shape/group |
| Delete | `delete <n>` | Remove shape/group |

### Queries

| Command | Syntax | Description |
|---------|--------|-------------|
| Bounding Box | `boundingbox <n>` | Show smallest enclosing rectangle |
| Shape At | `shapeat <x> <y>` | Find topmost shape at point |
| Intersect | `intersect <n1> <n2>` | Check if two shapes overlap |
| List | `list <n>` | Show shape details |
| List All | `listall` | Show all shapes in Z-order |

### History & System

| Command | Syntax | Description |
|---------|--------|-------------|
| Undo | `undo` | Revert last modification |
| Redo | `redo` | Reapply undone action |
| Help | `help` | Show all commands |
| Quit | `quit` | Save logs and exit |

## 🧠 Key OOP Concepts

| Principle | Application |
|-----------|-------------|
| **Abstraction** | Complex geometry logic hidden behind simple method calls (`move`, `containsPoint`) |
| **Encapsulation** | Private fields with controlled access; input validation in Controller layer |
| **Inheritance** | `Shape` as abstract class (not interface) to share `name` and `zWeight` fields (DRY principle) |
| **Polymorphism** | `ShapeManager` manages all shapes via `Shape` reference; `list()`, `move()`, `getBoundingBox()` behave differently per shape |
| **Composite Pattern** | `Group` extends `Shape` and contains a list of `Shape` objects for recursive operations |
| **Memento + Prototype** | Undo/Redo using deep cloning via polymorphic `cloneShape()` |

## 📊 UML Diagram

Refer to [`UML_ClassDiagram.pdf`](./UML_ClassDiagram.pdf) for the complete class diagram.

## 📄 Documentation

- [User Manual](./user_manual.pdf) — Detailed command guide with examples
- [Project Report](./project_report.pdf) — Architecture, design decisions, and reflections


## 🙏 Acknowledgments

- COMP2021 Course Instructor, PolyU
- All team members for their dedication and collaboration

---

**📌 Note**: This project was developed for educational purposes as part of the Object-Oriented Programming course.
