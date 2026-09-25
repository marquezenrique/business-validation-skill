# Validar — skill de validação de ideias de negócio

Skill para analisar ideias de negócio em português do Brasil com apoio de IA. Ela parte de uma descrição da ideia ou de uma entrevista, pesquisa evidências, explicita hipóteses e entrega um relatório em PDF com veredito, nota justificada e próximos passos.

Este README contém **as instruções completas da skill**. É o único arquivo necessário para consultar, copiar e instalar o fluxo descrito aqui.

## O que a skill faz

- Aceita uma ideia escrita na conversa ou em um arquivo Markdown. Se faltarem informações essenciais, pergunta antes de analisar.
- Organiza a proposta com **Pitch Madlibs** e avalia a oportunidade pelo método **P.R.O.V.A**: Problema, Research, Organização do cliente, Valor e Argumento baseado em evidências.
- Executa quatro etapas: **quem** é o cliente e o pagador; **quanto** representa o mercado; **por que** o problema importa; e **qual** conclusão as evidências sustentam.
- Separa fatos, estimativas e hipóteses; mostra fontes, datas, contas e lacunas.
- Gera um PDF pesquisável no mesmo diretório do arquivo da ideia, com o mesmo nome-base.

Uma boa ideia ainda pode receber nota baixa quando as evidências forem insuficientes. A nota considera a oportunidade **e** o grau de confirmação das hipóteses.

## Como usar

### Em uma conversa com IA

Copie as instruções completas da seção abaixo para uma conversa ou configuração de agente e envie sua ideia. O mínimo necessário é:

```text
O Mercado: [setor e mercado de atuação]
A Empresa: [nome da empresa ou projeto]
O Problema: [quem enfrenta o problema, quando e com qual impacto]
A Ideia: [solução proposta e uso da tecnologia]

Pitch Madlibs: [opcional]
```

Você também pode informar o caminho de um arquivo `.md` ou pedir que a skill comece pela entrevista. Para processar todos os arquivos de uma pasta `ideia/`, use o argumento `--todas` na solicitação.

### Como skill do Codex

Crie o arquivo `.agents/skills/validar/SKILL.md` no seu projeto e copie para ele **todo o conteúdo** do bloco “Instruções completas da skill”, inclusive o cabeçalho entre `---`. Depois, peça ao Codex para usar a skill `validar` com uma descrição ou o caminho de uma ideia.

A skill funciona sem os diretórios auxiliares deste projeto. Se existirem `interpreters/*.md` e `prompts/*.md` no projeto em que ela for executada, suas definições e seus prompts locais terão precedência sobre as versões embutidas. Instruções de um `AGENTS.md` local também se aplicam.

## Resultado esperado

Para um arquivo `ideia/minha-ideia.md`, a saída é `ideia/minha-ideia.pdf`. O relatório inclui Pitch Madlibs, P.R.O.V.A, as quatro etapas da análise, referências clicáveis, riscos e próximos passos verificáveis. A pesquisa de mercado exige acesso a fontes externas; se não houver pesquisa web ou ferramenta de PDF disponível, a skill deve declarar a limitação e entregar a análise na conversa.

## Instruções completas da skill

Copie apenas o conteúdo dentro do bloco para `SKILL.md`.

```markdown
---
name: validar
description: Valida ideias de negócio em português do Brasil a partir de um arquivo ou de respostas a perguntas sobre mercado, empresa, problema e solução. Entrega o PDF ao lado da ideia e funciona sem prompts ou agentes externos.
---

# Validar ideia de negócio

Conduza a validação em português do Brasil. Este arquivo contém o modelo, os métodos e os quatro prompts necessários para executar o fluxo sozinho. Aceite uma ideia colada na conversa ou um caminho de arquivo. Produza uma análise crítica e um PDF final com dados rastreáveis, hipóteses explícitas e recomendações proporcionais às evidências.

## Entrada e seleção

Se o usuário fornecer texto livre, extraia, sem inventar: **O Mercado**, **A Empresa**, **O Problema**, **A Ideia** e, se houver, **Pitch Madlibs**. Preserve os trechos originais e pergunte pelos campos obrigatórios ausentes. Quando estiverem completos, registre a ideia em um arquivo Markdown, seguindo a mesma regra de local e nome da entrevista abaixo.

**Sem arquivo nem descrição informados, inicie uma entrevista.** Pergunte, em português e de forma clara, pelos quatro campos obrigatórios do modelo: (1) qual é o mercado ou setor de atuação; (2) qual é o nome da empresa ou projeto; (3) qual é o problema, quem sofre com ele e em quais situações; (4) qual é a solução proposta e como a tecnologia será usada. Pergunte também se já existe um Pitch Madlibs, deixando claro que esse quinto campo é opcional. Use `ideia/MODELO.md` como referência se existir; caso contrário, use esses campos embutidos. Aguarde as respostas, faça perguntas complementares apenas sobre lacunas que impedem a análise e não inicie a validação antes de obter mercado, empresa, problema e ideia. Registre as respostas em `ideia/<NOME>.md` se houver pasta `ideia/`; caso contrário, em `<NOME>.md` no diretório de trabalho. Derive `<NOME>` do nome da empresa ou projeto, usando um nome de arquivo seguro, e nunca sobrescreva um arquivo existente sem pedido explícito.

Quando houver arquivo informado, aceite caminho absoluto ou relativo e valide esse arquivo, mesmo fora de um projeto. Em uma pasta `ideia/`, aceite também nomes com ou sem `.md`, ignorando maiúsculas e minúsculas; nunca valide `MODELO.md`. `--todas` valida todas as ideias dessa pasta. Sem nome e sem `--todas`, faça a entrevista acima, mesmo se houver arquivos pendentes. Se um nome não corresponder a um arquivo, mostre as opções.

Em um projeto com `AGENTS.md`, siga as instruções locais, inclusive eventual delegação. Se houver `interpreters/*.md` e `prompts/*.md`, use as definições e prompts ativos do projeto no lugar das versões embutidas abaixo. `interpreters/IGNORE.<NOME>.md` desativa apenas `interpreters/<NOME>.md`; não execute o marcador. PDFs e outros materiais da pasta de métodos são contexto auxiliar. Assim, o skill funciona sozinho e também respeita personalizações locais.

## Método embutido

**Pitch Madlibs.** Preencha, a partir da ideia: `[NOME DO PROJETO]`, `[O QUE É O NEGÓCIO]`, `[PÚBLICO ALVO]`, `[O PROBLEMA]` e `[A FINALIDADE]`. Use a estrutura: “O [NOME DO PROJETO] é um [O QUE É O NEGÓCIO] que ajuda [PÚBLICO ALVO] a resolver [O PROBLEMA] utilizando [A FINALIDADE] de forma única.” Se houver pitch original, compare-o com o problema e a solução descritos, aponte incoerências, redija uma versão coerente e dê nota de clareza de 0 a 10 com motivo.

**P.R.O.V.A.**

- **P — Problema:** formule a hipótese “Acreditamos que [CLIENTE] enfrenta [PROBLEMA] quando [CONTEXTO], causando [IMPACTO]”. Separe hipóteses quando houver clientes ou problemas distintos.
- **R — Research:** busque evidências e números sobre problema, clientes, mercado e alternativas. Separe fatos, estimativas e suposições.
- **O — Organização do cliente:** identifique quem sofre o problema, usa a solução, se beneficia, decide e paga.
- **V — Valor:** descreva tarefas, dores e ganhos do cliente principal, distinguindo respostas observadas de hipóteses.
- **A — Argumento baseado em evidências:** reúna o que os dados sustentam, o que ainda falta provar e a decisão recomendada.

Não troque o significado das letras por outras expansões memorizadas. A nota geral de 0 a 10 deve refletir a qualidade da oportunidade **e a força das evidências disponíveis**; explique a escala aplicada. Uma hipótese plausível sem confirmação não merece nota alta.

## Quatro prompts embutidos

Execute na ordem abaixo. Quando houver prompts locais ativos, execute esses arquivos em ordem lexicográfica e mantenha uma seção no PDF para cada arquivo executado. Preencha campos entre colchetes com dados da ideia e resultados anteriores; quando a resposta for incerta, explicite a hipótese de trabalho e as alternativas.

### 1-QUEM

Para a `[IDEIA]`, identifique os atores envolvidos. Para cada ator, responda: quem sofre o problema; quem usaria a solução; quem se beneficiaria; quem decidiria a compra; quem efetivamente pagaria. Mostre alternativas e hipóteses a validar. Conclua quem parece ser o cliente principal e quem parece ser o pagador, indicando o que ainda precisa de confirmação.

### 2-QUANTO

Para o `[CLIENTE]` escolhido e a `[IDEIA]`, pesquise quantos clientes desse tipo existem no mercado brasileiro. Mostre quantidade aproximada, gasto anual possível por cliente quando estimável, cálculo do mercado, fonte e ano dos números. Diferencie dado encontrado de estimativa; não invente dados. Resuma em **Quantidade de clientes**, **Mercado estimado: R$** e **Fonte principal**. Se for uma melhoria interna de uma única empresa, identifique essa compradora e não apresente o setor inteiro como mercado endereçável da iniciativa; explique quais dados internos seriam necessários para estimar investimento e retorno.

### 3-PORQUE

Para o `[CLIENTE]` e `[PROBLEMA]`, descreva três tarefas importantes que o cliente tenta realizar, três dores relacionadas e três ganhos desejados. Seja específico. Use uma tabela com as três tarefas, dores e ganhos e marque quais respostas são hipóteses que precisam ser validadas com clientes reais.

### 4-CONCLUSAO

Sintetize as etapas anteriores no modelo **C.O.F.R.E**: **Contexto** — o que estamos fazendo; **Objetivo** — o que queremos descobrir; **Fontes** — quais evidências precisamos; **Restrições** — o que a IA não deve inventar; **Entrega** — como apresentar a resposta. Feche com veredito, justificativa, riscos decisivos e próximos passos verificáveis.

## Pesquisa e qualidade da análise

Quando um prompt exigir dados externos, pesquise fontes atuais e cite URL, título, ano/data e alcance. Para pesquisa técnica, prefira documentação oficial; para números de mercado, órgãos oficiais e levantamentos com metodologia explícita. Use links que sustentem a afirmação específica. Mostre contas e premissas; não transforme número setorial em receita endereçável sem conexão demonstrada com cliente e preço. Se a pesquisa web não estiver disponível, declare a limitação e não apresente suposições como dados.

## PDF e resposta

Grave um PDF por ideia **no mesmo diretório do arquivo da ideia**, com o mesmo nome-base: `/caminho/<NOME>.md` gera `/caminho/<NOME>.pdf`. Para ideia criada pela entrevista, grave o PDF ao lado do novo Markdown. Não crie uma pasta de relatórios. Substitua um PDF existente somente quando essa ideia tiver sido selecionada explicitamente; mantenha intermediários fora do diretório de entrega e remova-os ao concluir.

O PDF deve conter título, origem e data; resumo com veredito e nota geral; Pitch Madlibs; aplicação de P.R.O.V.A; seções `1-QUEM`, `2-QUANTO`, `3-PORQUE` e `4-CONCLUSAO` (ou os nomes dos prompts locais executados); lacunas e premissas; referências com links clicáveis. Gere texto pesquisável, acentos legíveis, paginação e tabelas sem cortes. Use uma ferramenta de PDF disponível no ambiente, renderize as páginas e confira a legibilidade, as seções, as contas e os links antes de entregar. Se faltar ferramenta de PDF, informe precisamente a dependência e forneça a análise completa na conversa.

Responda com veredito, nota geral e link para cada PDF. Para múltiplas ideias, use uma tabela curta.
```
