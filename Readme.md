# 開発環境

## 環境

- MacbookPro `13 (2018)
- 2.7 GHz Intel Core i7
- 16GB RAM
- macOS 10.14 (Mojave)

## Terminal

- iterm2
- zsh
- zinit
- color: iceberg
- font: ricty for powerline

https://www.te-nu.com/entry/2018/08/30/214757

## Editor

### vim

color: iceberg
font: ricty

### vscode

theme: Ocean Dark Extended
font: ricty

Workspace Setting

```json
{
  "editor.formatOnSave": true,
  "[ruby]": {
    "editor.formatOnSave": true
  },
  "ruby.lint": {
    "rubocop": true
  },
  "python.pythonPath": <which python path>,
  "python.linting.flake8Enabled": true,
  "python.formatting.provider": "black",
  "[python]": {
    "editor.codeActionsOnSave": {
      "source.organizeImports": true
    }
  },
  "python.linting.mypyEnabled": true
}
```

## Programing language

anyenv

### Python

- pyenv
- pipenv
  - mypy
  - black
  - isort
  - flake8

### ruby

- rbenv
- rubocop
