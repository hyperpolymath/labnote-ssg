;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; AGENTIC.scm — labnote-ssg
;;; AI agent configuration and interaction patterns

(define-module (labnote-ssg agentic)
  #:export (agent-capabilities mcp-interface tool-schemas
            interaction-patterns safety-constraints))

;;;; Agent Capabilities
(define agent-capabilities
  '((primary-function . "SSG adapter orchestration via MCP")
    (supported-operations
     ("Initialize SSG projects"
      "Build static sites"
      "Start development servers"
      "Check site for errors"
      "Watch for file changes"
      "Clean build artifacts"
      "Query version information"))

    (adapter-coverage
     ((rust . ("zola" "mdbook" "cobalt"))
      (elixir . ("serum" "nimble-publisher" "tableau"))
      (haskell . ("hakyll" "ema"))
      (clojure . ("cryogen" "perun" "babashka"))
      (lisp . ("coleslaw" "frog" "pollen"))
      (julia . ("franklin" "publish" "documenter"))
      (scala . ("laika" "orchid" "scalatex"))
      (fsharp . ("fornax"))
      (ocaml . ("yocaml"))
      (nim . ("nimrod"))
      (d . ("reggae" "marmot"))
      (ada . ("staticwebpages"))
      (erlang . ("zotonic" "wub"))))

    (total-adapters . 28)))

;;;; MCP Interface Definition
(define mcp-interface
  '((protocol-version . "2024-11-05")
    (transport . "stdio")

    (server-info
     ((name . "labnote-ssg")
      (version . "0.2.0")
      (description . "MCP adapter hub for 28 static site generators")))

    (capabilities
     ((tools . #t)
      (resources . #f)
      (prompts . #f)))

    (tool-naming-convention
     "Each adapter exposes tools prefixed with SSG name:
      - {ssg}_init: Initialize new project
      - {ssg}_build: Build the site
      - {ssg}_serve: Start dev server
      - {ssg}_check: Validate site
      - {ssg}_version: Get version info")))

;;;; Tool Schemas (common patterns)
(define tool-schemas
  '((init-tool
     (name . "{ssg}_init")
     (description . "Initialize a new {SSG} project")
     (inputSchema
      ((type . "object")
       (properties
        ((path ((type . "string") (description . "Path for new project")))
         (force ((type . "boolean") (description . "Overwrite existing")))))
       (required . ("path")))))

    (build-tool
     (name . "{ssg}_build")
     (description . "Build the {SSG} site")
     (inputSchema
      ((type . "object")
       (properties
        ((path ((type . "string") (description . "Path to project root")))
         (outputDir ((type . "string") (description . "Output directory")))
         (drafts ((type . "boolean") (description . "Include drafts"))))))))

    (serve-tool
     (name . "{ssg}_serve")
     (description . "Start {SSG} development server")
     (inputSchema
      ((type . "object")
       (properties
        ((path ((type . "string") (description . "Path to project root")))
         (port ((type . "number") (description . "Port number")))
         (open ((type . "boolean") (description . "Open browser"))))))))

    (version-tool
     (name . "{ssg}_version")
     (description . "Get {SSG} version")
     (inputSchema
      ((type . "object")
       (properties . ()))))))

;;;; Interaction Patterns
(define interaction-patterns
  '((single-adapter-workflow
     (description . "Work with one SSG at a time")
     (pattern
      ("Connect to adapter"
       "Execute tool operations"
       "Handle results"
       "Disconnect when done")))

    (multi-adapter-comparison
     (description . "Compare capabilities across SSGs")
     (pattern
      ("Connect to multiple adapters"
       "Query version info for each"
       "Compare feature sets"
       "Report differences")))

    (migration-assistant
     (description . "Help migrate between SSGs")
     (pattern
      ("Analyze source SSG project"
       "Map content structure"
       "Initialize target SSG"
       "Transform content"
       "Validate migration")))))

;;;; Safety Constraints
(define safety-constraints
  '((command-execution
     ((rule . "Never execute shell strings")
      (implementation . "Use Deno.Command with array args")
      (rationale . "Prevents shell injection attacks")))

    (file-access
     ((rule . "Limit file operations to project directories")
      (implementation . "cwd parameter in runCommand")
      (rationale . "Prevents unauthorized file access")))

    (network-access
     ((rule . "No network access by default")
      (implementation . "Deno secure-by-default model")
      (rationale . "Explicit permissions required")))

    (environment-variables
     ((rule . "Never expose credentials in code")
      (implementation . "Use Deno.env.get()")
      (rationale . "Credentials in env only")))

    (error-handling
     ((rule . "Never expose internal errors to users")
      (implementation . "Catch and sanitize all errors")
      (rationale . "Prevent information leakage")))))
