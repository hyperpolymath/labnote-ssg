;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; ECOSYSTEM.scm — labnote-ssg
;;; Ecosystem positioning and project relationships

(define-module (labnote-ssg ecosystem)
  #:export (ecosystem-definition related-projects integration-points
            satellite-role differentiation))

;;;; Ecosystem Definition
(define ecosystem-definition
  '((version . "1.0.0")
    (name . "labnote-ssg")
    (type . "satellite")
    (purpose . "MCP adapter hub for 28 static site generators")

    (position-in-ecosystem
     "Satellite implementation in the hyperpolymath poly-ssg-mcp ecosystem.
      Provides MCP-compatible adapters for diverse SSG tooling.
      Follows RSR (Rhodium Standard Repository) guidelines.")

    (ecosystem-standards
     ((rsr . "Rhodium Standard Repository compliance")
      (mcp . "Model Context Protocol adapter interface")
      (spdx . "SPDX license identifiers on all files")
      (semver . "Semantic Versioning 2.0.0")))))

;;;; Related Projects
(define related-projects
  '((hub
     ((name . "poly-ssg-mcp")
      (url . "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship . "hub")
      (description . "Central MCP server unifying all SSG adapters")
      (integration . "Adapters synchronized via transfer script")))

    (standards
     ((name . "rhodium-standard-repositories")
      (url . "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship . "standard")
      (description . "RSR compliance guidelines and templates")
      (integration . "Repository structure and CI/CD patterns")))

    (ecosystem-projects
     ((name . "hyperpolymath")
      (url . "https://github.com/hyperpolymath")
      (relationship . "organization")
      (description . "Parent organization for all ecosystem projects"))

     ((name . "noteg-lang")
      (relationship . "sibling")
      (description . "Note G programming language"))

     ((name . "noteg-mcp")
      (relationship . "sibling")
      (description . "MCP server for Note G")))))

;;;; Integration Points
(define integration-points
  '((adapter-interface
     (protocol . "MCP 2024-11-05")
     (transport . "stdio")
     (pattern . "Request-response tool calls")
     (exports . ("connect" "disconnect" "isConnected" "tools")))

    (hub-synchronization
     (method . "Git-based file transfer")
     (script . "transfer-ssg-adapters.sh")
     (frequency . "On adapter changes"))

    (ci-cd-integration
     (platform . "GitHub Actions")
     (workflows . ("codeql.yml" "ci.yml"))
     (security . ("CodeQL SAST" "Dependabot")))

    (runtime-integration
     (runtime . "Deno")
     (version . ">=1.40")
     (permissions . ("--allow-run" "--allow-read")))))

;;;; Satellite Role Definition
(define satellite-role
  '((primary-function
     "Provide modular SSG adapter implementations that integrate with
      the poly-ssg-mcp hub via MCP protocol.")

    (responsibilities
     ("Implement MCP-compatible adapters for 28 SSGs"
      "Maintain secure command execution patterns"
      "Follow RSR compliance guidelines"
      "Synchronize with hub on changes"
      "Provide comprehensive documentation"))

    (boundaries
     ((in-scope
       ("Adapter implementation"
        "Security hardening"
        "Testing and validation"
        "Documentation"))
      (out-of-scope
       ("Hub server implementation"
        "MCP protocol changes"
        "SSG binary distribution"))))))

;;;; Differentiation
(define differentiation
  '((vs-poly-ssg-mcp
     ((this-project . "Satellite adapter implementations")
      (poly-ssg-mcp . "Central hub server")
      (relationship . "This project's adapters are used by poly-ssg-mcp")))

    (vs-individual-ssgs
     ((this-project . "Unified MCP interface to all SSGs")
      (individual-ssgs . "Standalone tools with different interfaces")
      (value-add . "Consistent tool interface for AI agents")))

    (vs-other-mcp-servers
     ((this-project . "Specialized for static site generation")
      (other-servers . "Different domains (filesystem, database, etc.)")
      (unique-value . "28 SSGs under one protocol")))))
