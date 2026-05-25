# Clevis - Command Line Vector Graphics Software

**Clevis** (Command Line Vector Graphics Software) is a Java-based vector graphics tool developed as a group project for the **COMP2021 Object-Oriented Programming** course at **PolyU**. It allows users to create, manipulate, and organize vector shapes through both a command-line interface and a graphical user interface, demonstrating core OOP principles: Encapsulation, Inheritance, Polymorphism, and Abstraction.

## 📚 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Launching the Application](#launching-the-application)
  - [Launching the GUI](#launching-the-gui)
- [Commands Overview](#commands-overview)
- [Key OOP Concepts](#key-oop-concepts)
- [UML Diagram](#uml-diagram)
- [Documentation](#documentation)
- [Possible Improvements](#possible-improvements)
- [Acknowledgments](#acknowledgments)

## ✨ Features

| Category | Commands | Description |
|----------|----------|-------------|
| **Shape Creation** | `rectangle`, `square`, `circle`, `line` | Create shapes with unique names and precise coordinates |
| **Grouping** | `group`, `ungroup` | Organize multiple shapes into a single logical unit |
| **Manipulation** | `move`, `delete` | Move or remove shapes/groups |
| **Queries** | `boundingbox`, `shapeat`, `intersect` | Analyze shapes and spatial relationships |
| **History** | `undo`, `redo` | Full undo/redo by storing entire shape state snapshots in a stack (not inverse operations), supporting unlimited operations without stack overflow |
| **System** | `list`, `listall`, `help`, `quit` | Display shapes, show all command syntaxes, and exit cleanly |
| **Logging** | Automatic (HTML + TXT) | All operations are recorded to log files |
| **GUI** | Graphical Interface | Visual canvas for drawing, moving, and interacting with shapes using mouse and keyboard |

> 💡 **About Undo/Redo**: Unlike command-based undo (which requires implementing inverse logic per command), Clevis stores complete snapshots of the shape system state in a stack. Each modification pushes a new state, and undo/redo simply moves between these snapshots. This approach supports arbitrarily many operations without overflow and simplifies adding new commands — no need to implement inverse operations.

## 🛠 Tech Stack

- **Language**: Java SE 21
- **GUI Framework**: Java Swing
- **Design Patterns**: MVC, Composite, Memento, Prototype
- **Architecture**: Model-View-Controller (MVC)
- **Logging**: HTML & TXT file output

## 📁 Project Structure

```
Group18/
├── ProjectCode/
│   ├── src/
│   │   └── hk/edu/polyu/comp/comp2021/clevis/
│   │       ├── Application.java         # CLI entry point
│   │       ├── GuiApplication.java      # GUI entry point
│   │       ├── controller/
│   │       │   └── CommandProcessor.java # Command processing logic
│   │       ├── Logger/
│   │       │   └── CommandLogger.java    # HTML/TXT logging
│   │       └── model/
│   │           ├── Clevis.java           # Main controller
│   │           ├── Commander.java        # Command parser & input validation
│   │           ├── ShapeManager.java     # Model: shape storage & operations
│   │           ├── Shape.java            # Abstract base class
│   │           ├── ShapeSnapshot.java    # Snapshot for undo/redo & GUI rendering
│   │           ├── Rectangle.java        # Rectangle shape
│   │           ├── Square.java           # Square shape
│   │           ├── Circle.java           # Circle shape
│   │           ├── Line.java             # Line shape
│   │           └── Group.java            # Composite pattern for grouping
│   ├── out/production/clevis/            # Compiled .class files
│   └── run-gui.bat                       # Quick launch script for GUI
├── UML_ClassDiagram.pdf                  # Class diagram
├── user_manual.pdf                       # User manual
├── project_report.pdf                    # Project report
└── README.md                             # This file
```

## 🚀 Getting Started

### Prerequisites

- Java SE 21 or higher
- Terminal / Command Prompt

### Launching the CLI Application

```bash
cd ProjectCode
java -cp out/production/clevis hk.edu.polyu.comp.comp2021.clevis.Application -html <html_log_path> -txt <txt_log_path>
```

**Example:**

```bash
java -cp out/production/clevis hk.edu.polyu.comp.comp2021.clevis.Application -html log.html -txt log.txt
```

**Successful launch output:**

```
HTML logger: log.html
TXT logger: log.txt
Clevis - Command Line Vector Graphics Software
clevis>
```

### Launching the GUI

**Option 1: Double-click (Windows)**

Simply double-click `run-gui.bat` in the `ProjectCode` directory.

**Option 2: Command line**

```bash
cd ProjectCode
java -cp out/production/clevis hk.edu.polyu.comp.comp2021.clevis.GuiApplication
```

**GUI Features:**
- **Canvas**: Visual display of all shapes
- **Command Input**: Text field at the bottom to enter Clevis commands
- **Real-time Rendering**: Shapes update immediately after each command
- **Bounding Box View**: Auto-fits all shapes in the visible area
- **Logging**: GUI sessions are automatically logged to `gui_log.html` and `gui_log.txt`

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
| Undo | `undo` | Revert last modification (state-stack based) |
| Redo | `redo` | Reapply undone action (state-stack based) |
| Help | `help` | Display all command syntaxes |
| Quit | `quit` | Save logs and exit |

> **Note**: All commands work identically in both CLI and GUI modes.

## 🧠 Key OOP Concepts

| Principle | Application |
|-----------|-------------|
| **Abstraction** | Complex geometry logic hidden behind simple method calls (`move`, `containsPoint`) |
| **Encapsulation** | Private fields with controlled access; input validation in Controller layer |
| **Inheritance** | `Shape` as abstract class (not interface) to share `name` and `zWeight` fields (DRY principle) |
| **Polymorphism** | `ShapeManager` manages all shapes via `Shape` reference; `list()`, `move()`, `getBoundingBox()` behave differently per shape |
| **Composite Pattern** | `Group` extends `Shape` and contains a list of `Shape` objects for recursive operations |
| **Memento + Prototype** | Undo/Redo using deep cloning via polymorphic `cloneShape()`; `ShapeSnapshot` for GUI rendering |
| **MVC Architecture** | Model (`ShapeManager`, shapes), View (`GuiApplication` canvas), Controller (`CommandProcessor`) clearly separated |

## 📊 UML Diagram

Refer to [`UML_ClassDiagram.pdf`](./UML_ClassDiagram.pdf) for the complete class diagram.

## 📄 Documentation

- [User Manual](./user_manual.pdf) — Detailed command guide with examples
- [Project Report](./project_report.pdf) — Architecture, design decisions, and reflections

## 🔮 Possible Improvements

| Area | Suggestion |
|------|-------------|
| **Enhanced GUI** | Add mouse-based drawing (click to place shapes, drag to resize), tool palette for shape selection, and zoom/pan controls |
| **File Persistence** | Add save/load functionality to export/import canvas state as JSON or XML files |
| **Advanced Shapes** | Support more shapes like Ellipse, Polygon, and Bezier curves |
| **Performance** | Optimize undo/redo by using incremental state diffs instead of full snapshots for very large drawings |
| **Cross-Platform Launcher** | Create native launchers for macOS (.app) and Linux (.desktop) in addition to the Windows .bat file |

## 🙏 Acknowledgments

- COMP2021 Course Instructor, PolyU
- All team members for their dedication and collaboration

---

**📌 Note**: This project was developed for educational purposes as part of the Object-Oriented Programming course.
