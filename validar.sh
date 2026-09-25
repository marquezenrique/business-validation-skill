#!/usr/bin/env bash
# Valida uma ideia usando Codex CLI.
# Uso: ./validar.sh            -> entrevista e cria ideia
#      ./validar.sh TICKETMAKER -> uma ideia específica
#      ./validar.sh --todas     -> todas
set -euo pipefail
cd "$(dirname "$0")"

alvo="${1:-}"
if [[ -z "$alvo" ]]; then
  if [[ ! -t 0 ]]; then
    printf 'Execute sem argumento em um terminal interativo ou use $validar no Codex.\n' >&2
    exit 2
  fi
  while [[ -z "${mercado:-}" ]]; do
    printf 'Qual é o mercado ou setor de atuação? '
    IFS= read -r mercado
  done
  while [[ -z "${empresa:-}" ]]; do
    printf 'Qual é o nome da empresa ou projeto? '
    IFS= read -r empresa
  done
  while [[ -z "${problema:-}" ]]; do
    printf 'Qual é o problema, quem sofre com ele e em quais situações? '
    IFS= read -r problema
  done
  while [[ -z "${ideia:-}" ]]; do
    printf 'Qual é a solução proposta e como a tecnologia será usada? '
    IFS= read -r ideia
  done
  printf 'Já existe um Pitch Madlibs? (opcional; Enter para pular) '
  IFS= read -r pitch
  nome="$(printf '%s' "$empresa" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')"
  [[ -n "$nome" ]] || nome="nova-ideia"
  alvo="ideia/$nome.md"
  numero=2
  while [[ -e "$alvo" || -e "${alvo%.md}.pdf" ]]; do
    alvo="ideia/$nome-$numero.md"
    numero=$((numero + 1))
  done
  printf 'O Mercado: %s\nA Empresa: %s\nO Problema: %s\nA Ideia: %s\n' "$mercado" "$empresa" "$problema" "$ideia" > "$alvo"
  if [[ -n "$pitch" ]]; then
    printf '\nPitch Madlibs: %s\n' "$pitch" >> "$alvo"
  fi
  printf 'Ideia registrada em %s\n' "$alvo"
fi

prompt="Use o skill validar e o agente validador-prova. Entrada: $alvo. Siga os métodos e prompts ativos. Grave cada PDF no mesmo diretório do arquivo da ideia."
codex exec --full-auto "$prompt"
