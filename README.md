# rix_vcf_example

This is an example workflow using the [targets](https://github.com/ropensci/targets) and [rix](https://github.com/ropensci/rix) R packages.
It is based on the [Data Carpentry Variant Calling Workflow lesson](https://datacarpentry.org/wrangling-genomics/04-variant_calling/index.html) and the target_vcf_example from [joelnitta/targets_vcf_example](https://github.com/joelnitta/targets_vcf_example)

## Dependencies

[Docker](https://www.docker.com/get-started) is used to run various programs. The docker daemon needs to be running so that containers can be launched. [rix](https://github.com/ropensci/rix) is used to maintain the environment for running for now Docker. We will afterward get rid of docker if i manage to set add the bwa and else dependencies by building a proper get-env.R like in the [rixpress demos](https://github.com/b-rodrigues/rixpress_demos).

Install [nix](https://nixos.org/download/)

```bash
# if you have sudo access
 sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
#  if not
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon

```

Build the enviroment

```bash
nix-build default.nix
```

This takes a bit of time the first time around.


The nix env includes R and packages required the workflow. The [rix](https://rstudio.github.io/renv/index.html) R package was used to convert the renv.lock to default.nix 


```r
rix::renv2nix('renv.lock',".")
```

## Running the analysis


Enter the environment:

```
nix-shell
```


Run  `Rscript -e 'targets::tar_make()'` in the nix shell.

## TODO

- [ ] remove docker dependency alltogheter by adding the bioinfo shell tools to the nix enviroment. This packages can be installed from git mostly. A template is found [here](https://git.sharcnet.ca/nix/nixpkgs/-/blob/9190dbcc0e4f42487886916a0309aa3236d76df6/pkgs/applications/science/biology/bwa/default.nix)


## License

[MIT](LICENSE)