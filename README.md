# MiniLibC

> The objective of this project is to create a dynamic ELF library to replace (to a certain extent) the standard
C library you use every day on your system.

We had to reproduce the following functions:
* strlen
* strchr
* memset
* memcpy
* strcmp
* memmove
* strncmp
* strcasecmp
* rindex
* strstr
* strpbrk
* strcspn

<h2>Tests</h2>
<details>
    <summary>Unit tests</summary>
    In order to correctly tests my functions I decided to compare them with the already existing functions from the standard C library.    
<p align="center">
        <img src="/.github/readme_resources/tests.png">
    </p>
</details>


## Build and run

Linux:

```sh
make
```

## Contributors

- Antoine Desruet [![github-link][github-logo]](https://github.com/antwxne)

<!-- Markdown link & img definition's -->

[Github-logo]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
