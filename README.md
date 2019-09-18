# Bumper

Bumper is the smallest, simplest binary tool to bump your project version. It aims to be project-agnostic (I use on embedded software projects).

## Overview

Bumper was created because I was jealous of my beloved backend coworkers that had a lot of tools to run semantic versioning. As mostly a firmware dev, I couldn't find any tools compiled as single binary that could allow me to scan my commit history and bump my project version accordingly. Bumper aimed to fill that gap, I can just drop the binary in the docker that runs my CD.

## Usage

Bumper navigates through your tags and inspect the biggest according to semver. Once he gets it, it takes the revs between that commit and heads and procees to analyse them to see the kind of bump that he's supposed to do. The commits need to respect [Conventional Commits Guideline](https://www.conventionalcommits.org/). Bumper supports **semver** but also notation of type v**semver**
Bumper doesn't actually *do anything for your CD* just prints on stdout what the next version should be. This next version then aims to be used by other script/tools.

```
bumper
```

## Contributing

I'm trash at Rust and project was barely tested. Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
