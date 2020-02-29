# SDML

[![Travis CI Build Status](https://travis-ci.org/jmbarnardgh/SDML.svg?branch=master)](https://travis-ci.org/jmbarnardgh/SDML)

## System Design Markdown Language

SDML is a markdown language which can be used to easily write, store, share and curate business requirements, technical specifications, constraints, and other software project documentation elements.

## Getting Up and Running

SDML is still deep in development. However, you are free to clone this repository and run the tests. Ensure you have the Ruby programming language installed and appropriate gems.

You can see the current features of SDML by running `rake test` in the root folder of this repository.

### Getting Started

  - install Ruby 2.7.0
  - `bundle install`
  - `rake test`

## Example of SDML

**Business Requirement Written in SDML**

```
#BR(User Check Status)[user][check my status][know whether I need to post an update]
```

can transpile to:

**Plain Text**

```
As a user, I want to be able to check my status, in order to know whether I need to post an update.
```

**HTML**

```html
<businessrequirement id="usercheckstatus"><summary>User Check Status</summary>As a user, I want to be able to check my status, in order to know whether I need to post an update.</businessrequirement>
```

**Markdown**

```markdown
# User Check Status

As a user, I want to be able to check my status, in order to know whether I need to post an update.
```

**JSON**

```json
{"summary":"User Check Status","actor":"user","action":"check my status","results":"know whether I need to post an update","token_index":0,"token_subtype":"businessrequirement"}
```

## Motivation & Goals

**Portability**

SDML can be viewed on any system which can render plain text. SDML is code! It does not need a fancy ticket, issue, bug, feature, etc. tracking tool. Sharing SDML is as easy as "copy, paste, send!"

**Exportability**

SDML can be exported for either human-readable or data transfer purposes.

  - e.g. export an SRS in SDML to HTML in order to view a human-readable version in a browser
  - e.g. export an SRS in SDML to JSON for data transfer to a ticket/issue tracking system

**Lightweight**

  - stored as plain text
  - syntax overhead is low

**Easy to Write, Easy to Read**

SDML is inspired by [Markdown](https://github.com/topics/markdown). Writing a few pieces of syntax helps you glue ideas togther in a raw source code format that is itself fairly human-readable.

**Coherence**

With SDML, high-level documentation as well as deep technical bits are encouraged to live in close proximity to each other. This helps to foster **transparency** of ideas and meaning, which in turn **exposes** **disharmony**, leading (hopefully) to correction and **better** **coherence**.

In certain transpiled formats of SRSM, document elements will cross-reference and even link to other elements, readily exposing documentation which does not harmonize. This can be very effective for software projects as they become larger and more complex.

## Feature List

  - [ ] appendix
  - [ ] element mapping (e.g. `x`, `y`, and `z` technical specifications fulfill `b` business requirement)
  - [ ] figure (i.e. display chart, graph, wireframe, etc.)
  - [ ] transpiler support for plain text (in progress)
  - [ ] transpiler support for HTML (in progress)
    - [ ] linking to and generation of anchor tags based on SDML element `id` (based on element `summary`)
  - [ ] transpiler support for regular Markdown
  - [ ] linter for checking that verbiage used is not beyond scope of SRS element type (e.g. check that the term `pixels` is not in a business requirement, unless the business logic of the system deals with screens and pixels)
    - [ ] internal SRS dictionary support for linter
  - [ ] analyzer for generating SDML element statistics
    - [ ] number of times a particualr `actor`, `action`, etc. was used
    - [ ] check for duplications of a given `summary`

more to come...

## Milestone List

  - [ ] Define basic set of functionality and designate as a 0.1 version
  - [ ] Use SDML to document the SDML language
  - [ ] Make SDML available as a [gem](https://rubygems.org)