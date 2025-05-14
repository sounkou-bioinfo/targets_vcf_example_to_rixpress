# rix_vcf_example

This is an example workflow using the [targets](https://github.com/ropensci/targets) and [rix](https://github.com/ropensci/rix) R packages.
It is based on the [Data Carpentry Variant Calling Workflow lesson](https://datacarpentry.org/wrangling-genomics/04-variant_calling/index.html) and the target_vcf_example from [joelnitta/targets_vcf_example](https://github.com/joelnitta/targets_vcf_example)

## Dependencies

[rix](https://github.com/ropensci/rix) is used to maintain the R environment and system dependencies like in the [rixpress demos](https://github.com/b-rodrigues/rixpress_demos).

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


The nix env includes R and packages required the workflow. The [rix](https://rstudio.github.io/renv/index.html) R package was used to convert the original renv.lock to default.nix  and adding system tools to remove the docker dependency.


```r
renv2nix("renv.lock", ".", system_pkgs = c("bwa", "samtools", "bcftools"))
```

## Running the analysis


Enter the environment:

```
nix-shell
```


Run  `Rscript -e 'targets::tar_make()'` in the nix shell. but before run the vizualization in a R session

```r
 targets::tar_visnetwork()

```

```r
sessionInfo()
#R version 4.3.2 (2023-10-31)
#Platform: x86_64-pc-linux-gnu (64-bit)
#Running under: Ubuntu 24.04.2 LTS

#Matrix products: default
#BLAS/LAPACK: /nix/store/jx5r3fyz26nvrj5zcx2f7fc2yszfalwb-blas-3/lib/libblas.so.3;  LAPACK version 3.11.0

#locale:
# [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
# [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
 #[5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
 #[7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
# [9] LC_ADDRESS=C               LC_TELEPHONE=C            
#[11] LC_MEASUREMENT=en_US.UTF-8 #LC_IDENTIFICATION=C       

#time zone: Asia/Dubai
#tzcode source: system (glibc)

#attached base packages:
#[1] stats     graphics  grDevices utils     #datasets  methods   base     

#loaded via a namespace (and not attached):
#[1] compiler_4.3.2 cli_3.6.2      #jsonlite_1.8.8 rlang_1.1.2 
```
## TODO

- [ ] Port the targets pipeline to [rixpress](https://github.com/b-rodrigues/rixpress)


## License

[MIT](LICENSE)