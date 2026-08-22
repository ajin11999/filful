# Filful (Goods Fulfillment for Purchase Orders) - Project Guidelines

## Overview
**Filful** is an offline-first Flutter application tailored for goods suppliers who receive client company Purchase Orders (POs) and fulfill the requested goods. The app handles PO document ingestion (PDF, Excel, with optional Gemini AI fallback), offline tracking of items and fulfillment batches, and delivery note generation.

- **Target Platforms**: Android (Primary), iOS / Desktop.
- **Application ID / Org**: `com.filful.filful` (`com.filful`)
- **Offline Philosophy**: All core features must work without an internet connection. Network access is strictly optional (e.g., AI document OCR fallback).

---

## Architectural Principles & Stack

### 1. State Management
- **Framework**: `flutter_riverpod` with `riverpod_annotation` and code generation (`@riverpod`).
- **Patterns**:
  - Keep business logic in `@riverpod` Notifiers / AsyncNotifiers.
  - UI consumes state using `ConsumerWidget` or `ConsumerStatefulWidget`.
  - Avoid large monolithic states; favor feature-scoped and scoped providers.

### 2. Local Database & Persistence
- **Database Engine**: `drift` (Type-safe SQLite) with `sqlite3_flutter_libs` and `path_provider`.
- **Guidelines**:
  - All database tables and DAOs live under `lib/src/core/database/`.
  - Keep relational models normalized (e.g., `PurchaseOrders`, `PurchaseOrderItems`, `FulfillmentBatches`, `FulfillmentItems`).
  - Expose Drift queries as reactive streams (`Stream<List<T>>`) to Riverpod providers.

### 3. Navigation & Routing
- **Routing**: `go_router` with declarative routing defined in `lib/src/core/router/app_router.dart`.
- **Structure**: ShellRoute / Bottom Navigation for primary tabs (e.g., PO List, Ingestion, Deliveries, Settings).

### 4. Document Ingestion
- **Local PDF Parsing**: `syncfusion_flutter_pdf` for structured text and table extraction.
- **Local Excel Parsing**: `excel` package for sheet and row parsing.
- **Optional AI Ingestion**: `google_generative_ai` for unstructured / scanned POs when user provides a Gemini API key in Settings.

---

## Directory Structure (Feature-First)

```text
lib/
├── main.dart
└── src/
    ├── app.dart
    ├── core/
    │   ├── database/       # Drift database tables, DAOs, connection
    │   ├── router/         # GoRouter configuration & routes
    │   ├── theme/          # Material 3 themes & color schemes
    │   ├── constants/      # App-wide constants, strings, styles
    │   └── utils/          # Formatters, file helpers, extensions
    ├── features/
    │   ├── purchase_orders/# PO listing, details, status tracking
    │   │   ├── data/       # Repositories & data sources
    │   │   ├── domain/     # Models & business entities
    │   │   └── presentation/# Screens, widgets, controllers
    │   ├── fulfillment/    # Picking, packing, delivery batches
    │   │   ├── data/
    │   │   ├── domain/
    │   │   └── presentation/
    │   ├── document_parser/# PDF / Excel / AI ingestion engines
    │   │   ├── data/
    │   │   ├── domain/
    │   │   └── presentation/
    │   └── settings/       # App preferences, Gemini API key, theme
    │       ├── data/
    │       ├── domain/
    │       └── presentation/
    └── shared/             # Shared UI widgets, dialogs, error handlers
```

---

## Development Commands

- **Run code generator**:
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  ```
- **Watch code generator**:
  ```bash
  dart run build_runner watch --delete-conflicting-outputs
  ```
- **Analyze code**:
  ```bash
  flutter analyze
  ```
- **Run tests**:
  ```bash
  flutter test
  ```
