;;; STATE.scm — labnote-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "0.2.0") (updated . "2025-12-17") (project . "labnote-ssg")))

(define current-position
  '((phase . "v0.2 - Security Hardening Complete")
    (overall-completion . 50)
    (components
     ((rsr-compliance ((status . "complete") (completion . 100)))
      (security-policy ((status . "complete") (completion . 100)))
      (adapter-implementation ((status . "complete") (completion . 100)))
      (documentation ((status . "in-progress") (completion . 30)))
      (testing ((status . "pending") (completion . 0)))
      (ci-cd-verification ((status . "pending") (completion . 0)))))))

(define blockers-and-issues '((critical ()) (high-priority ())))

(define critical-next-actions
  '((immediate
     (("Verify CI/CD pipelines work" . high)
      ("Add comprehensive tests" . high)))
    (this-week
     (("Create CHANGELOG.md" . medium)
      ("Expand README documentation" . medium)))))

(define session-history
  '((snapshots
     ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
     ((date . "2025-12-16") (session . "adapters") (notes . "28 SSG adapters integrated"))
     ((date . "2025-12-17") (session . "security") (notes . "Security policy completed, SCM files updated")))))

(define state-summary
  '((project . "labnote-ssg")
    (completion . 50)
    (blockers . 0)
    (updated . "2025-12-17")))
