# The SDML Glossary

## What is it?

  - a listing of terms common to SRS documents spanning a wide range of:
    - system types
    - business needs
    - technical jargon
    - marketing lingo
    - etc.

## Purpose

  - flag the usage of verbiage in various sections of the SRS, so as to avoid
    - semantic collision
    - obfuscation of detail
    - restrictive typecasting
    - unwarranted redundancy

## Example Use

Suppose you wanted to write a business requirement about viewing dinner recipe
details while on the go.

You could write:

`#BR(Dinner Recipe Details)[user][see dinner recipe details on my LED phone][know how to make the food]`

The terms `LED` and `phone` are likely *overly restrictive* typecastings of the *deeper* intent of 
this business requirement. 

  - What if the user has an iPhone XR (which uses an LCD screen)? Then `LED` would be overly restrictive.
  - What if the user wants to us a tablet? Then `phone` would be overly restrictive.
  - What if a user owns an iPod touch? Then `phone` would be overly restrictive.

*More generic* terminology is probably better to use here. The SDML Glossary would therefore flag this business requirement at compile-time and suggest alternative *super type* term instead.

```
$ SDML --to-html MySRS.SDML -o MySRS
SDML to HTML transpiler started...
FLAGGED: line 1: business requirement: action content contains term 'LED' - this term is scoped as technical - business requirements are scoped as general - please use a more generic term - suggestions: 'screen', 'view', or attempt to reword without the need for this term
FLAGGED: line 1: business requirement: action content contains term 'phone' - this term is scoped as technical - business requirements are scoped as general - please use a more generic term - suggestions: 'system', or attempt to reword without the need for this term
Flags raised: 2
Flagged files: MySDML.SDML
Transpile time: 0.002 sec
SDML to HTML transpiler done!
Ouput is at MySRS
```

Rewriting the business requirement to avoid these terms will not trigger flagging at compile time.

`#BR(Dinner Recipe Details)[user][review a dinner recipe on the go][conveniently learn how to make the food]`

Intuitively, no technical jargon exists in this rewrite of the business requirement. We should expect the SDML compiler to not raise any flags this time.

```
$ SDML --to-html MySRS.SDML
SDML to HTML transpiler started...
Transpile time: 0.002 sec
SDML to HTML transpiler done!
Ouput is at MySRS
```

## SDML Grammar and Semantics

Every **SDML glossary definition file**:

  - is JSON
  - declares a scope (domain name format) 

## Overriding Default Glossary Functionality

***A Note About Overriding the Glossary:*** *Please override prudently. Only override the scopes you need to override. The default glossary has been currated with care to tie terms with their corresponding semantics as generally would be expected in the software engineering industry. Dislodging standard meanings from their corresponding standard terms leads to confusion, generally speaking. Before overriding the default glossary, try it out on your SDML document. If you see a recurring pattern of flagging which seems odd, that may be a good indicator that it is time to override; getting a second opinion is advised.*

### Turning Off Glossary Flags

Run the command `SDML glossary --turn-off` to turn off flagging based on glossary terms. Neither the default nor custom SDML glossary definition files will be referenced.

### Fully Override Glossary

The default SDML glossary is set to recurse through a default glossary directory for SDML. To fully override the default glossary, simply point SDML to another directory where it can find your custom glossary definitions.

Run the command `SDML glossary --setroot "path/to/custom/glossary/directory"`.

Only custom SDML glossary definition files in this new directory will be referenced.

### Partially Override the Default SDML Glossary

  - put an SDML glossary definition file which declares the same scope as a default SDML glossary definition file in the `"overrides"` directory within the SDML glossary directory

#### Example

One default SDML glossary defintion file is `"glossary.generic.business.SDML.json"`. This file declares a glossary scope of `glossary.generic.business.SDML.json`. Create this same file with the same scope, and put it in the overrides directory. SDML will now see your custom glossary file and not the default. All other default glossary files will be referenced.

### Add to the Default SDML Glossary

  - put an SDML glossary definition file which declares a different scope as a default SDML glossary definition file in the `"overrides"` directory within the SDML glossary directory



### Reverting to Default Glossary After a Full Override

`SDML glossary --setroot --default`

### Clear All Custom Override Glossary Definition Files

The following will completely elminate all files and subdirectories within the `"overrides"` directory within the SDML glossary directory.

`SDML glossary --delete-overrides`
