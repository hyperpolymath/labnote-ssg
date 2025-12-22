;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; PLAYBOOK.scm — labnote-ssg
;;; Operational playbooks for common tasks and workflows

(define-module (labnote-ssg playbook)
  #:export (workflows recipes runbooks troubleshooting))

;;;; Workflows — Sequential task chains
(define workflows
  '((adapter-development
     (description . "Add a new SSG adapter")
     (steps
      ("Copy template from existing adapter (e.g., zola.js)"
       "Update name, language, description exports"
       "Define binary path and runCommand function"
       "Implement connect/disconnect/isConnected"
       "Define tools array with MCP-compatible schemas"
       "Add SPDX license header"
       "Run: just lint"
       "Run: just test"
       "Add to adapters/README.md"
       "Commit with conventional commit message")))

    (release-workflow
     (description . "Create a new release")
     (steps
      ("Update version in STATE.scm"
       "Update CHANGELOG.md"
       "Run: just test-all"
       "Run: just lint"
       "Commit: chore(release): vX.Y.Z"
       "Tag: git tag vX.Y.Z"
       "Push: git push --tags")))

    (security-review
     (description . "Perform security audit")
     (steps
      ("Run: just security"
       "Check CodeQL results"
       "Review Dependabot alerts"
       "Audit adapter command execution"
       "Verify no hardcoded credentials"
       "Update SECURITY.md if needed")))

    (hub-sync
     (description . "Sync with poly-ssg-mcp hub")
     (steps
      ("Pull latest from hub"
       "Compare adapter implementations"
       "Run transfer script"
       "Test all adapters"
       "Commit sync changes")))))

;;;; Recipes — Reusable command patterns
(define recipes
  '((build
     (just . "just build")
     (must . "must build")
     (description . "Build all adapters"))

    (test
     (just . "just test")
     (must . "must test")
     (deno . "deno test --allow-run --allow-read")
     (description . "Run test suite"))

    (test-e2e
     (just . "just test-e2e")
     (must . "must test-e2e")
     (description . "Run end-to-end tests"))

    (lint
     (just . "just lint")
     (deno . "deno lint adapters/")
     (description . "Lint all code"))

    (fmt
     (just . "just fmt")
     (deno . "deno fmt adapters/")
     (description . "Format all code"))

    (check
     (just . "just check")
     (description . "Run lint + test"))

    (security
     (just . "just security")
     (description . "Run security checks"))

    (clean
     (just . "just clean")
     (description . "Clean build artifacts"))

    (docs
     (just . "just docs")
     (description . "Generate documentation"))))

;;;; Runbooks — Emergency procedures
(define runbooks
  '((security-incident
     (severity . "critical")
     (description . "Security vulnerability discovered")
     (steps
      ("Assess severity using CVSS"
       "Create private security advisory"
       "Develop and test fix"
       "Prepare coordinated disclosure"
       "Release patch"
       "Publish advisory")))

    (broken-ci
     (severity . "high")
     (description . "CI pipeline failing")
     (steps
      ("Check GitHub Actions logs"
       "Identify failing step"
       "Check for flaky tests"
       "Verify SHA-pinned action versions"
       "Fix and push")))

    (adapter-broken
     (severity . "medium")
     (description . "SSG adapter not working")
     (steps
      ("Verify SSG binary installed"
       "Check binary path in adapter"
       "Test command manually"
       "Check Deno permissions"
       "Review error output")))))

;;;; Troubleshooting — Common issues and solutions
(define troubleshooting
  '((adapter-not-connecting
     (symptoms . ("connect() returns false" "isConnected() always false"))
     (causes . ("SSG binary not installed" "Wrong binary path" "Permission denied"))
     (solutions . ("Install SSG: see adapter docs"
                   "Check binaryPath variable"
                   "Run with --allow-run permission")))

    (command-execution-fails
     (symptoms . ("runCommand returns error" "stderr contains error"))
     (causes . ("Invalid arguments" "Missing working directory" "Binary crash"))
     (solutions . ("Check args array format"
                   "Verify cwd exists"
                   "Test command manually in terminal")))

    (deno-permission-denied
     (symptoms . ("PermissionDenied error" "Requires --allow-run"))
     (causes . ("Missing Deno permissions"))
     (solutions . ("Run: deno run --allow-run --allow-read adapter.js"
                   "Check deno.json permissions config")))

    (codeql-failing
     (symptoms . ("CodeQL workflow fails" "Analysis timeout"))
     (causes . ("Large codebase" "Complex code" "Action version issue"))
     (solutions . ("Check action SHA pins"
                   "Reduce analysis scope"
                   "Increase timeout")))))
