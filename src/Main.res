// SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
// SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
// labnote-ssg - SciLab-based static site generator for lab notebooks

module Config = {
  type t = {
    inputDir: string,
    outputDir: string,
    scilabPath: option<string>,
    executeCode: bool,
  }

  let default: t = {
    inputDir: "notebooks",
    outputDir: "site",
    scilabPath: None,
    executeCode: true,
  }
}

module Notebook = {
  type cell = {
    cellType: string,
    source: string,
    outputs: array<string>,
  }

  type t = {
    title: string,
    cells: array<cell>,
    metadata: Js.Dict.t<string>,
  }

  let parse = (_content: string): t => {
    {
      title: "Untitled",
      cells: [],
      metadata: Js.Dict.empty(),
    }
  }
}

module SciLab = {
  type result = {
    output: string,
    figures: array<string>,
    errors: array<string>,
  }

  let execute = async (_code: string): result => {
    // Would invoke SciLab via Deno.Command
    {
      output: "",
      figures: [],
      errors: [],
    }
  }
}

module Builder = {
  type stats = {
    notebooks: int,
    figures: int,
    duration: float,
  }

  let build = async (config: Config.t): stats => {
    let start = Js.Date.now()
    Js.Console.log(`Building ${config.inputDir} -> ${config.outputDir}`)

    {
      notebooks: 0,
      figures: 0,
      duration: Js.Date.now() -. start,
    }
  }
}

let name = "labnote-ssg"
let version = "0.1.0"

let main = async () => {
  Js.Console.log(`${name} v${version}`)

  let config = Config.default
  let stats = await Builder.build(config)

  Js.Console.log(`Built ${stats.notebooks->Belt.Int.toString} notebooks, ${stats.figures->Belt.Int.toString} figures`)
}

let _ = main()
