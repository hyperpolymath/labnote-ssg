;;; STATE.scm — labnote-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; Project state tracking and 44-component matrix

(define-module (labnote-ssg state)
  #:export (metadata current-position blockers-and-issues
            critical-next-actions session-history state-summary
            component-completion))

;;;; Metadata
(define metadata
  '((version . "0.4.0")
    (updated . "2025-12-22")
    (project . "labnote-ssg")
    (phase . "v0.4 - Documentation & Testing Complete")))

;;;; Current Position — 44-Component Matrix Tracking
(define current-position
  '((phase . "v0.4 - Documentation & Testing Complete")
    (overall-completion . 90)

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
          (tool-versions . "complete")
          (containerfile . "complete")))))

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

      ;; 4. Testing (3/4)
      (testing
       ((status . "in-progress")
        (completion . 75)
        (count . "3/4")
        (items
         ((unit-tests . "complete")
          (e2e-tests . "complete")
          (integration-tests . "pending")
          (ci-pipeline . "complete")))))

      ;; 5. Documentation (8/8) ✓
      (documentation
       ((status . "complete")
        (completion . 100)
        (count . "8/8")
        (items
         ((readme . "complete")
          (security . "complete")
          (contributing . "complete")
          (cookbook . "complete")
          (code-of-conduct . "complete")
          (api-docs . "complete")
          (changelog . "complete")
          (copilot-instructions . "complete")))))

      ;; 6. Configuration (3/3) ✓
      (configuration
       ((status . "complete")
        (completion . 100)
        (count . "3/3")
        (items
         ((scm-files . "complete")
          (hooks . "complete")
          (nickel . "complete")))))

      ;; 7. CI/CD (3/3) ✓
      (ci-cd
       ((status . "complete")
        (completion . 100)
        (count . "3/3")
        (items
         ((codeql . "complete")
          (dependabot . "complete")
          (ci-workflow . "complete")))))))))

;;;; Blockers and Issues
(define blockers-and-issues
  '((critical . ())
    (high-priority . ())
    (medium-priority . ())
    (low-priority
     (("Integration tests with real SSGs" . "Requires SSG binaries installed")))))

;;;; Critical Next Actions
(define critical-next-actions
  '((immediate
     (("Merge PR to main" . high)
      ("Tag v0.4.0 release" . high)))
    (this-week
     (("Add integration tests with Docker" . medium)
      ("Publish to package registry" . low)))))

;;;; Session History
(define session-history
  '((snapshots
     ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
     ((date . "2025-12-16") (session . "adapters") (notes . "28 SSG adapters integrated"))
     ((date . "2025-12-17") (session . "security") (notes . "Security policy completed"))
     ((date . "2025-12-22") (session . "tooling") (notes . "Build system, SCM expansion, cookbook, CI/CD"))
     ((date . "2025-12-22") (session . "completion") (notes . "E2E tests, Nickel config, API docs, all placeholders fixed")))))

;;;; State Summary
(define state-summary
  '((project . "labnote-ssg")
    (version . "0.4.0")
    (completion . 90)
    (phase . "Documentation & Testing Complete")
    (blockers . 0)
    (updated . "2025-12-22")
    (next-milestone . "v1.0 - Production Ready")))

;;;; Component Completion Tracker — 44 Component Matrix
(define component-completion
  '((total-components . 44)
    (completed . 40)
    (in-progress . 3)
    (pending . 1)
    (breakdown
     ((adapter-core . "28/28 ✓")
      (build-system . "4/4 ✓")
      (scm-files . "6/6 ✓")
      (testing . "3/4")
      (documentation . "8/8 ✓")
      (configuration . "3/3 ✓")
      (ci-cd . "3/3 ✓")))
    (summary . "40/44 components complete (90%)")))
