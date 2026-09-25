# Validação de Ideia

Ambiente para validar ideias de negócio com IA.

- `ideia/` — uma ideia por arquivo `.md`, no formato de `ideia/MODELO.md`. `MODELO.md` é só o modelo e nunca é validado.
- `interpreters/` — definições dos métodos; os arquivos aplicáveis são a fonte de verdade da análise. Um marcador `IGNORE.<NOME>.md` desativa a definição correspondente `<NOME>.md`.
- `prompts/` — prompts executáveis do fluxo. Execute os arquivos `.md` em ordem lexicográfica, substituindo os campos entre colchetes pelos dados da ideia.
- O PDF final fica ao lado do arquivo da ideia, com o mesmo nome-base (`ideia/<NOME>.pdf` para `ideia/<NOME>.md`).
- `.codex/agents/validador-prova.toml` — agente especializado do Codex.
- `.agents/skills/validar/SKILL.md` — fluxo de validação invocável no Codex.

Quando o usuário pedir para validar uma ideia, delegue a análise ao agente `validador-prova`.
O arquivo `ideia/MODELO.md` nunca deve ser validado. Sem arquivo informado, pergunte pelos campos do modelo e crie a ideia antes de validar. Grave o PDF no mesmo diretório da ideia.
