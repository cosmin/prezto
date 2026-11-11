jenv
====

Loads [jenv][1], which switches between installed JDKs per directory.

This is loaded automatically if `jenv` is on the path or installed in
`$JENV_ROOT` (default `~/.jenv`). Install it with `brew install jenv`, then
register JDKs with `jenv add /path/to/jdk/Contents/Home`.

Plugins
-------

The `export` plugin, which keeps `JAVA_HOME` in sync with the active version,
is enabled by default. To enable others, set the list in _`~/.zpreztorc`_:

    zstyle ':prezto:module:jenv' plugins 'export' 'maven' 'gradle'

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Cosmin Stejerean](https://github.com/cosmin)

[1]: https://github.com/jenv/jenv
[2]: https://github.com/cosmin/prezto/issues
