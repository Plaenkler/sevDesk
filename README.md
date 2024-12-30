# 📖 sevDesk

[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Linters](https://github.com/plaenkler/sevdesk/actions/workflows/linters.yml/badge.svg)](https://github.com/plaenkler/sevdesk/actions/workflows/linters.yml)
[![Go Reference](https://pkg.go.dev/badge/github.com/Plaenkler/sevDesk.svg)](https://pkg.go.dev/github.com/Plaenkler/sevDesk)
[![Support me](https://img.shields.io/badge/Support%20me%20%E2%98%95-orange.svg)](https://www.buymeacoffee.com/Plaenkler)

## 🎯 Purpose

- Maintain updated and reliable Go bindings for the [sevDesk API](https://api.sevdesk.de/).
- Simplify integration with sevDesk for Go developers by providing:
  - **Generated Go types** for the API data models.
  - **A client implementation** for interacting with the API.
  - **Server boilerplate code** for custom API handling.

## 🚀 Installation

Install the package in your Go project:

```bash
go get github.com/Plaenkler/sevDesk
```

## 📚 Contribution

If you notice that this Golang package is out of date with the latest sevDesk OpenAPI definition please feel free to submit a pull request.
Here’s how you can help:

### 🛠 **Updating API Bindings**

To update the Go bindings based on the latest sevDesk OpenAPI definition, follow these steps:

1. **Fork the repository**  
   Create a personal copy of this repository by forking it.
   This will allow you to make changes without affecting the original project.

2. **Create a new branch**  
   Before making any changes, create a new branch with a descriptive name (e.g. `update-api-bindings-v2.X.X`).

3. **Run the Update Script**  
   We’ve provided an update script that automatically generates Go bindings from the sevDesk OpenAPI specification.
   Run the script by executing:
   ```bash
   ./update_bindings.sh
   ```
   This will generate updated Go types and client code based on the latest API schema.

4. **Commit and push the updated files**  
   After running the update script, review the changes and commit them with a clear message (e.g. `[UPD] Bindings for sevDesk v2.X.X`).
   Then, push the changes to your fork.

5. **Open a Pull Request**  
   Submit a pull request with your changes.