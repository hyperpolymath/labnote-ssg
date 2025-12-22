;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; NEUROSYM.scm — labnote-ssg
;;; Neurosymbolic patterns for hybrid AI-symbolic reasoning

(define-module (labnote-ssg neurosym)
  #:export (symbolic-patterns neural-integration reasoning-chains
            knowledge-representation inference-rules))

;;;; Symbolic Patterns — Structured knowledge representations
(define symbolic-patterns
  '((ssg-taxonomy
     (description . "Hierarchical classification of SSGs by language")
     (structure
      ((systems-languages
        ((rust . ("zola" "mdbook" "cobalt"))
         (ada . ("staticwebpages"))))
       (functional-languages
        ((haskell . ("hakyll" "ema"))
         (ocaml . ("yocaml"))
         (fsharp . ("fornax"))
         (elixir . ("serum" "nimble-publisher" "tableau"))
         (erlang . ("zotonic" "wub"))))
       (lisp-family
        ((clojure . ("cryogen" "perun" "babashka"))
         (common-lisp . ("coleslaw"))
         (racket . ("frog" "pollen"))))
       (scientific-languages
        ((julia . ("franklin" "publish" "documenter"))))
       (jvm-languages
        ((scala . ("laika" "orchid" "scalatex"))))
       (other-languages
        ((nim . ("nimrod"))
         (d . ("reggae" "marmot")))))))

    (capability-matrix
     (description . "SSG capabilities mapped to operations")
     (operations
      ((init . "all")
       (build . "all")
       (serve . "most")
       (watch . "some")
       (check . "some")
       (clean . "some")
       (test . "few"))))))

;;;; Neural Integration — Points where AI enhances symbolic reasoning
(define neural-integration
  '((adapter-selection
     (description . "AI-assisted SSG recommendation")
     (inputs . ("project requirements" "language preference" "features needed"))
     (symbolic-knowledge . "ssg-taxonomy capability-matrix")
     (neural-component . "natural language understanding of requirements")
     (output . "ranked SSG recommendations with rationale"))

    (error-diagnosis
     (description . "AI-assisted troubleshooting")
     (inputs . ("error message" "context" "adapter state"))
     (symbolic-knowledge . "troubleshooting runbooks")
     (neural-component . "pattern matching against known issues")
     (output . "diagnosis and suggested fixes"))

    (migration-planning
     (description . "AI-assisted cross-SSG migration")
     (inputs . ("source project" "target SSG"))
     (symbolic-knowledge . "capability-matrix content-schemas")
     (neural-component . "content structure analysis")
     (output . "migration plan with transformation rules"))))

;;;; Reasoning Chains — Multi-step inference patterns
(define reasoning-chains
  '((ssg-recommendation-chain
     (steps
      ((analyze-requirements
        (input . "user requirements text")
        (output . "structured requirements"))
       (filter-by-language
        (input . "language preference")
        (output . "candidate SSGs"))
       (score-by-features
        (input . "required features")
        (output . "ranked candidates"))
       (validate-compatibility
        (input . "environment constraints")
        (output . "final recommendations")))))

    (build-failure-diagnosis-chain
     (steps
      ((parse-error-output
        (input . "stderr from build")
        (output . "structured error"))
       (classify-error-type
        (input . "structured error")
        (output . "error category"))
       (lookup-solutions
        (input . "error category")
        (output . "potential solutions"))
       (rank-solutions
        (input . "solutions + context")
        (output . "recommended fix")))))))

;;;; Knowledge Representation — Formal schemas
(define knowledge-representation
  '((adapter-schema
     (required-fields . ("name" "language" "description"))
     (required-functions . ("connect" "disconnect" "isConnected"))
     (required-exports . ("tools"))
     (tool-schema
      ((name . "string")
       (description . "string")
       (inputSchema . "json-schema")
       (execute . "async-function"))))

    (command-result-schema
     (fields
      ((success . "boolean")
       (stdout . "string")
       (stderr . "string")
       (code . "number"))))

    (mcp-tool-schema
     (fields
      ((name . "string")
       (description . "string")
       (inputSchema . "object"))))))

;;;; Inference Rules — Logical deduction patterns
(define inference-rules
  '((adapter-availability
     (rule . "If SSG binary exists AND is executable THEN adapter can connect")
     (antecedent . ("binary-exists" "binary-executable"))
     (consequent . "adapter-connectable"))

    (build-success
     (rule . "If build exits with code 0 AND no stderr errors THEN build succeeded")
     (antecedent . ("exit-code-zero" "no-error-output"))
     (consequent . "build-successful"))

    (ssg-compatibility
     (rule . "If SSG supports feature X AND project requires X THEN SSG is candidate")
     (antecedent . ("ssg-has-feature" "project-needs-feature"))
     (consequent . "ssg-is-candidate"))

    (security-safe
     (rule . "If command uses array args AND no shell evaluation THEN execution is safe")
     (antecedent . ("array-arguments" "no-shell-eval"))
     (consequent . "safe-execution"))))
