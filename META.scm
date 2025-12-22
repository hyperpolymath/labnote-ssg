;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — labnote-ssg

(define-module (labnote-ssg meta)
  #:export (architecture-decisions development-practices design-rationale))

;;;; Architecture Decision Records (ADRs)
(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Satellite project in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target"
                      "SHA-pinned actions"
                      "SPDX headers"
                      "Multi-platform CI"
                      "Dependabot enabled")))

    (adr-002
     (title . "MCP Adapter Architecture")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "Need unified interface for 28 SSG tools")
     (decision . "Use Model Context Protocol adapters with Deno runtime")
     (consequences . ("Consistent tool interface"
                      "Safe command execution"
                      "Hub-satellite pattern"
                      "Deno.Command for process spawning")))

    (adr-003
     (title . "Security-First Command Execution")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Adapters execute external binaries")
     (decision . "Use array-based arguments, never shell strings")
     (consequences . ("No shell injection vulnerabilities"
                      "No eval or exec usage"
                      "Predictable argument passing")))

    (adr-004
     (title . "Dual Licensing Strategy")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Balance open source flexibility with copyleft protection")
     (decision . "MIT OR AGPL-3.0-or-later dual license")
     (consequences . ("Commercial use under MIT"
                      "Copyleft protection under AGPL"
                      "User choice of license")))))

;;;; Development Practices
(define development-practices
  '((code-style
     (languages . ("javascript" "typescript" "scheme"))
     (formatter . "deno fmt")
     (linter . "deno lint"))
    (security
     (sast . "CodeQL")
     (dependency-scanning . "Dependabot")
     (credentials . "env vars only")
     (command-execution . "Deno.Command array args"))
    (testing
     (framework . "Deno.test")
     (coverage-minimum . 70)
     (e2e . "integration tests"))
    (versioning
     (scheme . "SemVer 2.0.0")
     (changelog . "Keep a Changelog"))
    (documentation
     (format . "AsciiDoc")
     (api-docs . "JSDoc comments"))))

;;;; Design Rationale
(define design-rationale
  '((why-rsr
     "RSR ensures consistency, security, and maintainability across the hyperpolymath ecosystem.")
    (why-mcp
     "MCP provides a standard protocol for AI-assisted tool interaction.")
    (why-deno
     "Deno offers secure-by-default execution with built-in TypeScript support.")
    (why-satellite
     "Satellite pattern allows modular development while maintaining hub integration.")))

;;;; Component Matrix (adapted from 44/44 template)
(define component-matrix
  '((adapter-core
     (status . "complete")
     (count . "28/28")
     (components
      ((rust-adapters ((zola . "complete") (mdbook . "complete") (cobalt . "complete")))
       (elixir-adapters ((serum . "complete") (nimble-publisher . "complete") (tableau . "complete")))
       (haskell-adapters ((hakyll . "complete") (ema . "complete")))
       (clojure-adapters ((cryogen . "complete") (perun . "complete") (babashka . "complete")))
       (lisp-adapters ((coleslaw . "complete") (frog . "complete") (pollen . "complete")))
       (julia-adapters ((franklin . "complete") (publish . "complete") (documenter . "complete")))
       (scala-adapters ((laika . "complete") (orchid . "complete") (scalatex . "complete")))
       (other-adapters ((fornax . "complete") (yocaml . "complete") (nimrod . "complete")
                        (reggae . "complete") (marmot . "complete") (staticwebpages . "complete")
                        (zotonic . "complete") (wub . "complete"))))))

    (build-system
     (status . "in-progress")
     (count . "2/4")
     (components
      ((justfile . "pending")
       (mustfile . "pending")
       (asdf . "pending")
       (podman . "pending"))))

    (testing
     (status . "pending")
     (count . "0/4")
     (components
      ((unit-tests . "pending")
       (integration-tests . "pending")
       (e2e-tests . "pending")
       (ci-pipeline . "pending"))))

    (documentation
     (status . "in-progress")
     (count . "3/8")
     (components
      ((readme . "complete")
       (security . "complete")
       (contributing . "complete")
       (cookbook . "pending")
       (api-docs . "pending")
       (user-guide . "pending")
       (changelog . "pending")
       (module-docs . "pending"))))

    (configuration
     (status . "in-progress")
     (count . "1/3")
     (components
      ((scm-files . "complete")
       (hooks . "pending")
       (nickel . "pending"))))))

;;;; Technology Stack
(define technology-stack
  '((runtime . "Deno")
    (languages . ("JavaScript" "TypeScript" "Scheme"))
    (build-tools . ("just" "must" "nickel"))
    (ci-cd . ("GitHub Actions" "CodeQL" "Dependabot"))
    (containerization . "Podman")
    (documentation . "AsciiDoc")
    (version-manager . "asdf")))
