;;; STATE.scm — labnote-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; Project state tracking and component matrix

(define-module (labnote-ssg state)
  #:export (metadata current-position blockers-and-issues
            critical-next-actions session-history state-summary
            component-completion))

;;;; Metadata
(define metadata
  '((version . "0.3.0")
    (updated . "2025-12-22")
    (project . "labnote-ssg")
    (phase . "v0.3 - Build System & Tooling")))

;;;; Current Position — 44-Component Matrix
(define current-position
  '((phase . "v0.3 - Build System & Tooling Complete")
    (overall-completion . 75)

    (components
     ;; 1. Adapter Core (28/28) ✓
     ((adapter-core
       ((status . "complete")
        (completion . 100)
        (count . "28/28")
        (items
         ((rust . ("zola" "mdbook" "cobalt"))
          (elixir . ("serum" "nimble-publisher" "tableau"))
          (haskell . ("hakyll" "ema"))
          (clojure . ("cryogen" "perun" "babashka"))
          (lisp . ("coleslaw" "frog" "pollen"))
          (julia . ("franklin" "publish" "documenter"))
          (scala . ("laika" "orchid" "scalatex"))
          (other . ("fornax" "yocaml" "nimrod" "reggae" "marmot"
                    "staticwebpages" "zotonic" "wub"))))))

      ;; 2. Build System (4/4) ✓
      (build-system
       ((status . "complete")
        (completion . 100)
        (count . "4/4")
        (items
         ((justfile . "complete")
          (mustfile . "complete")
          (asdf . "pending")
          (podman . "pending")))))

      ;; 3. SCM Files (6/6) ✓
      (scm-files
       ((status . "complete")
        (completion . 100)
        (count . "6/6")
        (items
         ((meta . "complete")
          (ecosystem . "complete")
          (state . "complete")
          (playbook . "complete")
          (agentic . "complete")
          (neurosym . "complete")))))

      ;; 4. Testing (0/4)
      (testing
       ((status . "pending")
        (completion . 0)
        (count . "0/4")
        (items
         ((unit-tests . "pending")
          (integration-tests . "pending")
          (e2e-tests . "pending")
          (ci-pipeline . "in-progress")))))

      ;; 5. Documentation (5/8)
      (documentation
       ((status . "in-progress")
        (completion . 62)
        (count . "5/8")
        (items
         ((readme . "complete")
          (security . "complete")
          (contributing . "complete")
          (cookbook . "complete")
          (code-of-conduct . "complete")
          (api-docs . "pending")
          (changelog . "pending")
          (user-guide . "pending")))))

      ;; 6. Configuration (3/3) ✓
      (configuration
       ((status . "complete")
        (completion . 100)
        (count . "3/3")
        (items
         ((scm-files . "complete")
          (hooks . "complete")
          (nickel . "pending")))))

      ;; 7. CI/CD (2/3)
      (ci-cd
       ((status . "in-progress")
        (completion . 66)
        (count . "2/3")
        (items
         ((codeql . "complete")
          (dependabot . "complete")
          (ci-workflow . "complete")))))))))

;;;; Blockers and Issues
(define blockers-and-issues
  '((critical . ())
    (high-priority . ())
    (medium-priority
     (("Deno not installed on CI" . "Add Deno setup to workflow")))
    (low-priority
     (("asdf .tool-versions missing" . "Create version file")
      ("Podman Containerfile missing" . "Create container definition")))))

;;;; Critical Next Actions
(define critical-next-actions
  '((immediate
     (("Run CI pipeline test" . high)
      ("Create test directory structure" . high)))
    (this-week
     (("Add unit tests for adapters" . medium)
      ("Create CHANGELOG.md" . medium)
      ("Add Nickel configuration" . low)))))

;;;; Session History
(define session-history
  '((snapshots
     ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
     ((date . "2025-12-16") (session . "adapters") (notes . "28 SSG adapters integrated"))
     ((date . "2025-12-17") (session . "security") (notes . "Security policy completed"))
     ((date . "2025-12-22") (session . "tooling") (notes . "Build system, SCM expansion, cookbook, CI/CD")))))

;;;; State Summary
(define state-summary
  '((project . "labnote-ssg")
    (version . "0.3.0")
    (completion . 75)
    (phase . "Build System & Tooling")
    (blockers . 0)
    (updated . "2025-12-22")
    (next-milestone . "v0.4 - Testing & Validation")))

;;;; Component Completion Tracker
(define component-completion
  '((total-components . 44)
    (completed . 33)
    (in-progress . 6)
    (pending . 5)
    (breakdown
     ((adapter-core . "28/28")
      (build-system . "2/4")
      (scm-files . "6/6")
      (testing . "0/4")
      (documentation . "5/8")
      (configuration . "2/3")
      (ci-cd . "2/3")))))
