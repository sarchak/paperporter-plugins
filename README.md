# PaperPorter plugins

Plugins that let ChatGPT, Codex, and Claude fill official PDF forms, such as city permit applications and business licenses, in their original layout using [PaperPorter](https://paperporter.com).

- `paperporter/`: the Claude plugin (MCP server and the `fill-pdf-form` skill). See its [README](paperporter/README.md).
- `codex/`: the OpenAI manifest. `./package-codex.sh` builds the ZIP for the ChatGPT and Codex plugin directory from it and the shared skill and assets.

## Install in Claude Code

```
/plugin marketplace add sarchak/paperporter-plugins
/plugin install paperporter@paperporter
```

Support: support@paperporter.com · [Privacy](https://paperporter.com/privacy) · [Terms](https://paperporter.com/terms)
