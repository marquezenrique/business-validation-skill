---
name: validar
description: >
  Valida ideias de negócio em português do Brasil com pesquisa, Pitch Madlibs,
  método P.R.O.V.A. e tamanho de mercado em R$. Use when user says
  "validar minha ideia", "avaliar uma ideia de negócio", "analisar a
  viabilidade", "estimar o mercado da ideia" ou "usar validar", com texto,
  arquivo Markdown ou entrevista. Entrega um PDF ao lado da ideia.
---

# Validar ideia de negócio

Conduza a validação em português do Brasil. Este arquivo contém o modelo, os métodos e os quatro prompts necessários para executar o fluxo sozinho. Aceite uma ideia colada na conversa ou um caminho de arquivo. Produza uma análise crítica e um PDF final com dados rastreáveis, hipóteses explícitas e recomendações proporcionais às evidências.

## Entrada e seleção

Se o usuário fornecer texto livre, extraia, sem inventar: **O Mercado**, **A Empresa**, **O Problema**, **A Ideia** e, se houver, **Pitch Madlibs**. Preserve os trechos originais e pergunte pelos campos obrigatórios ausentes. Quando estiverem completos, registre a ideia em um arquivo Markdown, seguindo a mesma regra de local e nome da entrevista abaixo.

**Sem arquivo nem descrição informados, inicie uma entrevista.** Pergunte, em português e de forma clara, pelos quatro campos obrigatórios do modelo: (1) qual é o mercado ou setor de atuação; (2) qual é o nome da empresa ou projeto; (3) qual é o problema, quem sofre com ele e em quais situações; (4) qual é a solução proposta e como a tecnologia será usada. Pergunte também se já existe um Pitch Madlibs, deixando claro que esse quinto campo é opcional. Use `ideia/MODELO.md` como referência se existir; caso contrário, use esses campos embutidos. Aguarde as respostas, faça perguntas complementares apenas sobre lacunas que impedem a análise e não inicie a validação antes de obter mercado, empresa, problema e ideia. Registre as respostas em `ideia/<NOME>.md` se houver pasta `ideia/`; caso contrário, em `<NOME>.md` no diretório de trabalho. Derive `<NOME>` do nome da empresa ou projeto, usando um nome de arquivo seguro, e nunca sobrescreva um arquivo existente sem pedido explícito.

Quando houver arquivo informado, aceite caminho absoluto ou relativo e valide esse arquivo, mesmo fora de um projeto. Em uma pasta `ideia/`, aceite também nomes com ou sem `.md`, ignorando maiúsculas e minúsculas; se houver mais de uma correspondência, mostre as opções. Nunca valide `MODELO.md` nem outro arquivo que contenha apenas lacunas de modelo. `--todas` valida todas as ideias dessa pasta, exceto modelos. Sem nome e sem `--todas`, faça a entrevista acima, mesmo se houver arquivos pendentes. Se um nome não corresponder a um arquivo, mostre as opções. Preserve o arquivo de entrada.

Em um projeto com `AGENTS.md`, siga as instruções locais, inclusive eventual delegação. Se houver `interpreters/*.md`, use cada definição Markdown ativa como fonte de verdade para o método correspondente; use o método embutido apenas quando não houver definição ativa desse método. `interpreters/IGNORE.<NOME>.md` desativa apenas `interpreters/<NOME>.md`; não execute o marcador. PDFs e outros materiais da pasta de métodos são contexto auxiliar. Se houver `prompts/*.md`, execute **todos** os prompts Markdown ativos em ordem lexicográfica, preenchendo campos entre colchetes com os dados da ideia e saídas anteriores; use os quatro prompts embutidos apenas quando não houver prompts locais. Não misture versões locais divergentes com instruções embutidas.

## Método embutido

**Pitch Madlibs.** Preencha, a partir da ideia: `[NOME DO PROJETO]`, `[O QUE É O NEGÓCIO]`, `[PÚBLICO ALVO]`, `[O PROBLEMA]` e `[A FINALIDADE]`. Use a estrutura: “O [NOME DO PROJETO] é um [O QUE É O NEGÓCIO] que ajuda [PÚBLICO ALVO] a resolver [O PROBLEMA] utilizando [A FINALIDADE] de forma única.” Se houver pitch original, compare-o com o problema e a solução descritos, aponte incoerências, redija uma versão coerente e dê nota de clareza de 0 a 10 com motivo.

**P.R.O.V.A., quando não houver definição local.**

- **P — Problem/Problema:** formule a hipótese “Acreditamos que [CLIENTE] enfrenta [PROBLEMA] quando [CONTEXTO], causando [IMPACTO]”. Separe hipóteses quando houver clientes ou problemas distintos.
- **R — Research:** busque evidências e números sobre problema, clientes, mercado e alternativas. Separe fatos, estimativas e suposições.
- **O — Organização do cliente:** identifique quem sofre o problema, usa a solução, se beneficia, decide e paga.
- **V — Valor:** descreva tarefas, dores e ganhos do cliente principal, distinguindo respostas observadas de hipóteses.
- **A — Argumento baseado em evidências:** reúna o que os dados sustentam, o que ainda falta provar e a decisão recomendada.

Não troque o significado das letras por outras expansões memorizadas. A nota geral de 0 a 10 deve refletir a qualidade da oportunidade **e a força das evidências disponíveis**; explique a escala aplicada. Uma hipótese plausível sem confirmação não merece nota alta.

## Quatro prompts embutidos

Execute na ordem abaixo **somente quando não houver prompts locais**. Mantenha uma seção no PDF para cada prompt executado. Preencha campos entre colchetes com dados da ideia e resultados anteriores; quando a resposta for incerta, explicite a hipótese de trabalho e as alternativas.

### 1-QUEM

Para a `[IDEIA]`, identifique os atores envolvidos. Para cada ator, responda: quem sofre o problema; quem usaria a solução; quem se beneficiaria; quem decidiria a compra; quem efetivamente pagaria. Mostre alternativas e hipóteses a validar. Conclua quem parece ser o cliente principal e quem parece ser o pagador, indicando o que ainda precisa de confirmação.

### 2-QUANTO

Para o `[CLIENTE]` escolhido e a `[IDEIA]`, pesquise quantos clientes desse tipo existem no mercado brasileiro. Mostre quantidade aproximada, gasto anual possível por cliente, cálculo do mercado (quantidade × gasto anual), fonte e ano dos números. Diferencie dado encontrado de estimativa; não invente dados.

Resuma sempre em:

```text
Quantidade de clientes: <número ou faixa> (<dado encontrado | estimativa | empresa compradora única>)
Mercado estimado: R$ <valor> por ano (faixa R$ <mínimo> – R$ <máximo>)
Confiança: <alta | média | baixa> — <premissa que mais pesa no valor>
Fonte principal: <título, ano, URL> ou “nenhuma fonte externa verificada” + premissas usadas
```

**O mercado estimado deve ser sempre um valor monetário em reais (R$)**, anual e com a conta visível. Nunca responda “não estimável”, “N/D” ou apenas texto. Quando faltar quantidade ou preço, construa a estimativa com premissas explícitas e rotuladas como hipótese (por exemplo, preço de soluções comparáveis, ticket médio do setor ou proxy de gasto atual), apresente uma faixa conservadora–otimista e indique o grau de confiança (alto, médio ou baixo). Converta valores em outra moeda para reais informando câmbio e data. Se for uma melhoria interna de uma única empresa, o valor em R$ é o impacto anual estimado para essa compradora (economia ou receita adicional), não o setor inteiro; liste os dados internos que tornariam o número confiável.

### 3-PORQUE

Para o `[CLIENTE]` e `[PROBLEMA]`, descreva três tarefas importantes que o cliente tenta realizar, três dores relacionadas e três ganhos desejados. Seja específico. Use uma tabela com as três tarefas, dores e ganhos e marque quais respostas são hipóteses que precisam ser validadas com clientes reais.

### 4-CONCLUSAO

Sintetize as etapas anteriores no modelo **C.O.F.R.E**: **Contexto** — o que estamos fazendo; **Objetivo** — o que queremos descobrir; **Fontes** — quais evidências precisamos; **Restrições** — o que a IA não deve inventar; **Entrega** — como apresentar a resposta. Feche com veredito, justificativa, riscos decisivos e próximos passos verificáveis.

## Pesquisa e qualidade da análise

Quando um prompt exigir dados externos, pesquise fontes atuais e cite URL, título, ano/data e alcance. Para pesquisa técnica, prefira documentação oficial; para números de mercado, órgãos oficiais e levantamentos com metodologia explícita. Use links que sustentem a afirmação específica. Mostre contas e premissas; o **Mercado estimado** da etapa de tamanho de mercado (`2-QUANTO` ou prompt local equivalente) é sempre um valor anual em R$ com faixa, mesmo quando um prompt local não exigir isso explicitamente. Não transforme número setorial em receita endereçável sem conexão demonstrada com cliente e preço. Se a pesquisa web não estiver disponível, declare a limitação e não apresente suposições como dados; ainda assim, entregue o mercado estimado em R$ a partir de premissas rotuladas como hipótese e com confiança baixa. Não invente concorrentes, entrevistas nem validação com clientes. Confira a coerência entre cliente, pagador, problema, tamanho de mercado e veredito.

## PDF e resposta

Grave um PDF por ideia **no mesmo diretório do arquivo da ideia**, com o mesmo nome-base: `ideia/MinhaIdeia.md` gera `ideia/MinhaIdeia.pdf`. Para ideia criada pela entrevista, grave o PDF ao lado do novo Markdown. Não crie uma pasta de relatórios. Substitua um PDF existente somente quando essa ideia tiver sido selecionada explicitamente; mantenha intermediários fora do diretório de entrega e remova-os ao concluir.

O PDF deve conter título, origem e data; resumo com veredito, nota geral e mercado estimado em R$; Pitch Madlibs; aplicação de P.R.O.V.A; seções `1-QUEM`, `2-QUANTO`, `3-PORQUE` e `4-CONCLUSAO` (ou os nomes dos prompts locais executados); lacunas e premissas; referências com links clicáveis. Gere texto pesquisável, acentos legíveis, paginação e tabelas sem cortes. Use uma ferramenta de PDF disponível no ambiente, renderize as páginas e confira a legibilidade, as seções, as contas e os links antes de entregar. Se faltar ferramenta de PDF, informe precisamente a dependência e forneça a análise completa na conversa.

Responda com veredito, nota geral, mercado estimado em R$ e link para cada PDF. Para múltiplas ideias, use uma tabela curta.
