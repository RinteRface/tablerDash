
# tablerDash <img src="https://rinterface.com/inst/images/tablerDash.svg" width=200 align="right" />

<!-- badges: start -->

[![R build
status](https://github.com/RinteRface/tablerDash/workflows/R-CMD-check/badge.svg)](https://github.com/RinteRface/tablerDash/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/tablerDash)](https://cran.r-project.org/package=tablerDash)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-ff69b4.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![cranlogs](https://cranlogs.r-pkg.org/badges/tablerDash)](https://cran.r-project.org/package=tablerDash)
[![total](https://cranlogs.r-pkg.org/badges/grand-total/tablerDash)](https://www.rpackages.io/package/tablerDash)
<!-- badges: end -->

> Tabler dashboard template for shiny with Bootstrap 4

See <https://tabler.io> for the original template.

## Installation

This package is on CRAN:

``` r
# latest devel version
devtools::install_github("RinteRface/tablerDash")
# CRAN version
install.packages("tablerDash")
```

## Demo

`{tablerDash}` works on all the RStudio products.

<div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="bslib-card-6424" style="margin: 0 auto; float: none;">
<div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
<iframe class="html-fill-item" src="https://shinylive.io/r/app/#code=NobwRAdghgtgpmAXGKAHVA6ASmANGAYwHsIAXOMpMAdzgCMAnRRASwgGdSoAbbgCgA6EAATCBYLnW5wGAESjsAFuNxDRDOKiLthAXmEFBYRaVKp2iAPSWGbcgwBmUAnAwBzFqUUBXOhhZENnYyTi4AtNQKMGEEDFAQlipixqbmVjaaRBgMEVEYRAxu4gCUQqUQQtwsjFAMAJ58Smx15VU19XyS0nIKiq3VcR1wBIq1pOwALAz97Q1NEHUA6iwAJm5w4zODDTBQbram00LHEADEwitQXDoO3ETUAOLcQgBuw6QFOgA8YcJwAB6oeIrdy2FZ8f56YRhADMiBhuGEdShsPh5Rg3mEP2EAEZXu9PgASdiQ7FvAgfBjsQl1fEUonsZHYjHCABUwj4OOhwnJlOp-wAegAmYpsnkEqk07m8on-Ol8wnEO4MLG-O5uHEABj4DG8EBYDj4EAY9z4MqpxUROKtmuK5SE5wIPAolxVqDupCEl3I31+7DgAEcMPJyHwFMGrnAjELNTiABxhWOJvFgS3CcMhqPiGPxsI4oWwlNpujI-TiS601OvHjeOC+4QMCAFGB8aQQNxePjeutpmOIgBs9oWcFqqouVygGAccXgXcjUO77ERLxrdahK+4tfYQ8dtRW7CEt3uAGE92OujJTwxwWphKRPNIoeIAGJ3R7cYTH0YMT14W8EO52CgKQ4ChZ8AEEABkAGUAFFVBEYQAC8iCIXYQLAqC4IQ0QiFQe8SB0fQuDcSCWE4QRENEC8GHAlcuAYRouFIbwiOSKp4CSbwGA-MsUjMCxrFQDQXhYOBqAwGj-ECTgrhYAhLCgejanYSxNXUmAMAAK1QIpUxw0Q72A7oABU9iNWBQL4uhvBYbgViSKAVhWEgnzAIF2HYNg9MRJyXIgY8iGVNz2G8AgXE8kpb0tW9qFWLwoXzAzhm-cYpgAeW8MwsqMI93yiiAh2EogHDsuArxWc9jJkAAFE1SukCrKNEOKVgS-Qktve9SEfPiao2GRhCweTv33FRb1Cuhut65IACEWDcYQ6DgXhkV1FZQLoIg6kRGA7KqEhb0Mi4gu4UcfE4boMGEABVCA4Bgd1trgEFxsQuhnAAa32Ig9UqviTAE9JhLgUTxMk6qGGkywNpgQJUEUIgPlUuyIG4sJPp4FgMV4NgwiFeMAE5Cf7MIAFZ1O03S3tEdgGAINzAbSISRLEiSpICGGHsCUI60sXZpEsHF+ypnyush6CiAIFgeDIiBPvYZrDJoyXpdlthPqV47oHgNzea2ohPpp47hEUDQHEZ1JBMsahbanZx6FQz6MGIGBjeO+TXL4-WnfEI7hBiqijJAhhVZl7g5c1-3RB1qzklIOLTBkd3DLNuALYBq30lt9nE-sF20JT0RPZEPiE88ew-aD8pRHKIchCdNtXQqqqQ9m9UmtvRHbBQsgeChEysBu+DYvixREqFZKRjGSYGEy7LSCMRuXVqAr67OdN0CEeY6mYHfwPQJXbKhGj5CUGq9izIPoBeD6VWIyGz8UAA5JStcM1Y3JgOp4DRovhDpgzTOQMWagzZhDEO0NYaBBqBAFYlgpLsBeGLIOMclIAFkKCYgfiHV+LxMFo3fsdGieCCHeAAJLkBbNHE2khX66z4gACTQnAf+HtiCl2SIjTif5UEm3EMwnhNDa4GRNsHbopCsGUIekQ2hwF6Fx3ECZOsv5RFiOECXNyW05S8PUYZJRKiq56JribQOYjT4mlQC5agEBZHUUfpY6xEBpHUL4cQh8iiwAuNxHeDxbDU7m0tmYdIbhUJuGkAXN2ui9HCG4rxLhWdrDY0vlOM694OGRMsCXVSSC3BCxhLGfJsY4yagmBgXJ-jabMVYm5S47Zk7RL0d2NyTZqCVOSCZRQ5ENE6C8KBUqVJSAXEcfcEQngHpGPUWY9RFi8JOJcXYwycSgnMyybsdYqS5IZNdlkjhOTkFFJxIckphNynIPabJFibFxCREbN5dpSiuk6G6X0gBwwSCVRWCMmxGiqHtOaXxOoKiZAVkmWI6Z5iHFzNGQs4RysPFuW8TCXxPVWGNPUY87pLzFCgS8Cwa8wzoU-PGVEuFJjjrkoDmohwqF7An0fr0Z8tKZCyJouQjhFkGHJF2Cok0SQ2huSBD-Cgv4IXK0huykgnLPG7E4DIJ015+XVEFVAYVZAShqNEMQVAdRbBuBMNcsAAABeQolKoPDiBALSJBEQ5kJmCql-tpqeNPr0FOW0VilnETIJ+s0iCesojQkYqF-TQSqBtUOn02BGHQf6mQFR9I0JomZOgLjFZwuTcBWFbjxV0AUW5QRaLNUm1uLZFYWBTRwuOkqbwMBbFVpNq1dqwgEQNuOsVBq5U9zFr0SrZincc16I3LWKEExW2DpmQiviTLeD3BkAedFMTlYaDgSiLUPaYlNvHh1IUbbDKUuMRu6tQVa31oncdLdUJ+xHpLW+Cqe6xV6JrXWxZYjL36HHUu4hkMB1fsbWPCeN7IUhxMtjFabAr5-uA6ZMDVR7rZqg5O1FiKqG4naUuy5NS+L7DgBQdDMSAXJFaQ6xDj6oPJtgxBhDiHaFTuSN43di6aOYbYs-G6kFIJAYI-OQFwLryqvw3o8QkECgPQ0eYWtJ1gpeSGZZUgXHj0cHeBsbi6YVgsFQOReS3k-hVFIBgEjUGD1fuM4evd9iQ7kIgDS39NHh2eJxDCIUADnQLoU4ZFjtT4jrAYIJj+HDamnVqGELybgE3udEBtdgsQNMEU4eIfMwhIieB00K3+4w-MtQAzu8zjrz2GTRvAWwBArOoByrl4uEAyukHIf9eOSMeDQUpJfTLwgzrLXieIWCZBBqcAKJfAwaBnCeErBFnkq5ErqVtO52y89qtGDYDSgqf7TP7rJRuzNqaqGvuDvmviyjODtNLasCt1AdtapPS+3L77hDXtyzRWziHnVuRqh6NzFXkKoXQjNCCMER75erYBaqmE-tjbwnFtiJEyIUQ+7TROIxSvlYB+otg1XatuQoNVAA+upzgr2kateOu1laL2PQAH5CeGXswPIe-2aMmxIE1q4WHkihXCnWd7yOxElQcEzq5Xn6m+bALDgOH2yNLqeqQOb5WwC49IPj0VY3PN8UW0QVrLHoKrE8dIBwqiPs3c6lz4QNKkaDQfqRcii8RfPrPfTi92XcSTxF6ILGYW3IuB60Lsbx12DhpkIjq3RuxHiCIHQTndv+FgGfrW5aKoSrCFD-6Bg9EAgcEQJT46e1OGam9ybXYkIOpTdz8dan+gKaamd6LoPVf6erfBQ+rjNvzuGRu3d5HD29zN-cch-b1Vw80ZGMMT62iLW-VQAHrvkeVy2GqpT8QAA1WoMsQK9KIAAxG1B09Mb-YYcQx46hwYjQu93B+M8dMtewPanlU-iDcrAM-4gHgjipLf7Dz-DMrdz2wODcdB7DzF2NheNLlbrLhOBqvrg7obvTkQG8I4G+DTv-sjuLuosduWpWkbk3iLq3rnilDPBlFlPNuIG4FAN4OsEkDigtCYG5AUpqKgDonXlMmNpgdXtgSLr7lrgwBPpXkQSQesIvs8NvlBo-rwaBPwbWFvsXsIFnlCDnpXvnpNrIdXqIKXsIBTCLgwfXkgQ+g2sgaIKgadnwMvHArUBVKtsZpSiYtMknrAVCA4HqBSKnnwKjllIiL9AvKKCAP7G4dVoSHLgrmOCuhGgrnwJ4XwgaByM4aQISJjiBDjpbgrqKE8ovI2M2E4VVllISInnaP7AAL6UreEZHehQABEugyAprSAhE0IwCkAKrsDACIi75gCPQ+QaLpFRHT7L7SBphfJ4Qg5wQAC6uRiIJoNilkbEf+sEQ4x0BRUReUTwJRcCMgsE08P4s8lRfC5oOgAApAAHxbFwpwBY4rHjAQiii7H7E5qHF5RY7hJ8A7QAL-CIiMgNFBQFBnF7EHFY6iShQ8BY67CoA7bSH6A55SFQAF64iIjnDqi4gV4Trqa-xeRezCATCQnCDgkglerWgPFQgIgAJeoTANpKD3B9HwTCDnBdIbQNpsBYDeZxxVAw75ZKgFBQiGAADkpwMIjm-YhMZMrJiI7JEwZMAA7GTHQBMHycIOyUKRMH5DiBKeycBCsITHAITPKacHAJqA4DCA4HGHyZXqIOyQ4EaQ4HQA4GqQ4LhpqITJqOaZcHAP2HKfyacA4BMP2CsGOmqSsEKQUkKEKWqVAOXkKP2KyQwWYcIOcZ8f8FjmCeRDtuwO6J4HLHSZbo0BviSWGRGZcVjnUNGf8LGYSQmaQEmVCPSYvESdQOmWSrkevNMQQRkargsRGjdOQusdBv7tZkQI9v+m1Nuo7huioR5OQNqJEYSB8FwNwE1v1usIiI-rNOATmsrqzmFBFP3mIponxEUR9P6P4lFjFvhKnm5CZA1h+JOXEOsJ+ENtLKQJWDQpSnkScF4XWVEUYa6I2UsccWsaEWIkCqOJmXoocR+XOOQO8Rcf+Ucc6MYYxJaueXxDmHGCUOGR8VmTilcP8WaKuEuAYKhNeFjoyHKjAO7hBa6AhX+eoocd8d4L8WhfIR+raNWQ+UHDMYSMQaQaBNiIEe+alJ+TQgBVxXwCBZ8SxesGGOwBgIVjIPJGkT4UJXAPwWmOIPsVWEHPeRUIhDkWUEIGADkf0UAA&amp;h=0" height="700" width="100%" style="border: 1px solid rgba(0,0,0,0.175); border-radius: .375rem;" allowfullscreen="" allow="autoplay" data-external="1"></iframe>
</div>
<bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
<template>Expand</template>
<button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
</bslib-tooltip>
<script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
</div>
<p class="text-center mt-2">
<a 
class="btn btn-primary" 
data-bs-toggle="collapse" 
href="#demo-code" 
role="button" 
aria-expanded="false" 
aria-controls="demo-code"> Toggle code </a>
</p>

<div id="demo-code" class="collapse">

``` r
```

</div>

<div class="row">

<div class="card">

<a href="https://community.rstudio.com/t/shiny-contest-submission-gotta-catch-em-almost-all/25284" target="_blank"><img src="https://community.rstudio.com/uploads/default/optimized/2X/6/626cbb941e2c3dfe543abde05f7e4097186811c6_2_690x431.png"></a>

</div>

</div>

<br>

<div class="row">

<div class="card">

<a href="https://community.rstudio.com/t/shiny-contest-submission-gotta-catch-em-almost-all/25284" target="_blank"><img src="https://community.rstudio.com/uploads/default/optimized/2X/3/33061a47390f6fa1515302d7f05e05c1b6f3e458_2_690x431.jpeg"></a>

</div>

</div>

<br>

## Issues

Issues are listed
[here](https://github.com/RinteRface/tablerDash/issues).

## Code of Conduct

Please note that the tablerDash project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
